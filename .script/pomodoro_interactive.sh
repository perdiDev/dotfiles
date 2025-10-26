#!/usr/bin/env bash
set -euo pipefail

# Default config
FOCUS_MIN=25
SHORT_MIN=5
LONG_MIN=15
ROUNDS=4
STEP_SEC=60              # interval update progress (detik) – ganti 1 untuk per-detik
ICON="${HOME}/.local/share/icons/pomodoro.png"
TAG="pomodoro"           # ID notifikasi supaya replace (tidak numpuk)
SOUND=""                 # contoh: SOUND="/usr/share/sounds/freedesktop/stereo/complete.oga"

usage() {
  cat <<EOF
Pomodoro notifier for mako (real-time progress)

Options:
  -f  Fokus menit (default: 25)
  -s  Short break menit (default: 5)
  -l  Long break menit (default: 15)
  -n  Jumlah round total (default: 4)
  -p  Interval update dalam detik (default: 60; pakai 1 untuk per-detik)
  -i  Path ikon (default: ~/.local/share/icons/pomodoro.png)
  -t  Tag notifikasi sync (default: pomodoro)

Contoh:
  ${0##*/} -f 25 -s 5 -l 15 -n 4 -p 60
EOF
}

while getopts ":f:s:l:n:p:i:t:h" opt; do
  case "$opt" in
    f) FOCUS_MIN="$OPTARG" ;;
    s) SHORT_MIN="$OPTARG" ;;
    l) LONG_MIN="$OPTARG" ;;
    n) ROUNDS="$OPTARG" ;;
    p) STEP_SEC="$OPTARG" ;;
    i) ICON="$OPTARG" ;;
    t) TAG="$OPTARG" ;;
    h) usage; exit 0 ;;
    *) usage; exit 1 ;;
  esac
done

have_icon=0
[ -f "$ICON" ] && have_icon=1

send_note() {
  local title="$1"
  local body="$2"
  local value="$3"   # 0..100 progress
  if [ "$have_icon" -eq 1 ]; then
    notify-send -i "$ICON" "$title" "$body" \
      -h string:x-canonical-private-synchronous:"$TAG" \
      -h int:value:"$value"
  else
    notify-send "$title" "$body" \
      -h string:x-canonical-private-synchronous:"$TAG" \
      -h int:value:"$value"
  fi
}

play_sound() {
  # Pakai paplay atau canberra-gtk-play kalau mau suara
  [ -n "${SOUND}" ] && command -v paplay >/dev/null 2>&1 && paplay "$SOUND" || true
}

pretty_time() {
  local secs="$1"
  printf "%d:%02d" $((secs/60)) $((secs%60))
}

trap 'send_note "⏹️ Pomodoro dibatalkan" "Sesi dihentikan." 0; exit 130' INT TERM

run_phase() {
  local minutes="$1"
  local label="$2"
  local round_idx="$3"
  local total_secs=$((minutes*60))
  local elapsed=0

  # Start ping
  send_note "🍅 ${label} dimulai" "Round ${round_idx}/${ROUNDS} • Durasi ${minutes} menit" 0

  while [ "$elapsed" -lt "$total_secs" ]; do
    local remain=$((total_secs - elapsed))
    local pct=$(( (elapsed * 100) / total_secs ))
    local t_left
    t_left=$(pretty_time "$remain")
    send_note "🍅 ${label} — sisa ${t_left}" "Round ${round_idx}/${ROUNDS}" "$pct"
    sleep "$STEP_SEC" || true
    elapsed=$((elapsed + STEP_SEC))
    [ "$elapsed" -gt "$total_secs" ] && elapsed="$total_secs"
  done

  send_note "✅ ${label} selesai" "Round ${round_idx}/${ROUNDS}" 100
  play_sound
}

# Jalankan siklus Pomodoro
for (( r=1; r<=ROUNDS; r++ )); do
  run_phase "$FOCUS_MIN" "Fokus" "$r"
  # Tentukan break: long break tiap akhir cycle, selain itu short
  if [ "$r" -lt "$ROUNDS" ]; then
    run_phase "$SHORT_MIN" "Istirahat Singkat" "$r"
  else
    run_phase "$LONG_MIN" "Istirahat Panjang" "$r"
  fi
done

send_note "🎉 Semua sesi selesai" "Mantap! Saatnya rehat." 100
