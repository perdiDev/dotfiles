#!/usr/bin/env bash

THEME="$HOME/.config/rofi/themes/wifi.rasi"
# Gunakan /dev/null jika state file tidak benar-benar dipakai
# STATE_FILE="/tmp/rofi_wifi_loading.$$" 

WIFI_DEVICE=$(nmcli -t -f DEVICE,TYPE device status | awk -F: '$2 == "wifi" {print $1; exit}')

if [[ -z "$WIFI_DEVICE" ]]; then
    printf "No Wi-Fi adapter found" | rofi -dmenu -p "Wi-Fi" -theme "$THEME"
    exit 0
fi

# 1. Tampilkan loading dan scan jika dipanggil tanpa argumen
if [[ "$1" != "--list" ]]; then
    # Tampilkan menu loading di background dan simpan PID-nya ($!)
    echo "󰁅  Memindai jaringan..." | rofi -dmenu -p "Wi-Fi" -mesg "Harap tunggu, mencari jaringan..." -theme "$THEME" >/dev/null 2>&1 &
    LOADING_PID=$!

    # Pastikan Wi-Fi nyala dulu sebelum rescan (penting untuk laptop yang baru bangun tidur)
    WIFI_STATUS=$(nmcli radio wifi)
    if [[ "$WIFI_STATUS" != "enabled" ]]; then
        nmcli radio wifi on
        sleep 2 # Beri waktu adapter untuk hidup setelah resume
    fi

    # Lakukan scan (perintah ini akan menahan skrip sampai scan selesai)
    nmcli device wifi rescan ifname "$WIFI_DEVICE" >/dev/null 2>&1

    # Matikan jendela loading Rofi
    kill $LOADING_PID >/dev/null 2>&1

    # Panggil ulang skrip untuk menampilkan daftar
    exec "$0" --list
fi

# 2. Bagian menampilkan daftar Wi-Fi
WIFI_STATUS=$(nmcli radio wifi)
if [[ "$WIFI_STATUS" != "enabled" ]]; then
    choice=$(printf "󰤨  Nyalakan Wi-Fi" | rofi \
        -dmenu \
        -p "Wi-Fi" \
        -mesg "Wi-Fi sedang dimatikan" \
        -theme "$THEME")

    if [[ "$choice" == "󰤨  Nyalakan Wi-Fi" ]]; then
        nmcli radio wifi on
        sleep 2
        exec "$0"
    fi
    exit 0
fi

ACTIVE_SSID=$(nmcli -t -f ACTIVE,SSID device wifi | awk -F: '$1=="yes" {print $2; exit}')

NETWORKS=$(
    nmcli -t -f ACTIVE,SSID,SIGNAL,SECURITY device wifi list | \
    awk -F: '
    $2 != "" {
        if ($1 == "yes")
            printf "󰤨  %-30s %10s\n", $2, "Terhubung"
        else
            printf "󰤨  %-30s %10s\n", $2, $3 "%"
    }'
)

if [[ -z "$NETWORKS" ]]; then
    NETWORKS="󰤭  Tidak ada jaringan ditemukan"
fi

CHOICE=$(printf "%s\n" "$NETWORKS" | rofi \
    -dmenu \
    -i \
    -p "Wi-Fi" \
    -mesg "Pilih jaringan untuk terhubung" \
    -theme "$THEME")

[[ -z "$CHOICE" ]] && exit 0
[[ "$CHOICE" == "󰤭  Tidak ada jaringan ditemukan" ]] && exit 0

# Ekstrak nama SSID dengan menghapus ikon dan status di belakangnya
SSID=$(printf "%s" "$CHOICE" | sed -E 's/^󰤨  //' | sed -E 's/[[:space:]]+(Terhubung|[0-9]+%)$//' | sed 's/ *$//')

if [[ "$SSID" == "$ACTIVE_SSID" ]]; then
    exit 0
fi

SECURITY=$(nmcli -t -f SSID,SECURITY device wifi list | awk -F: -v target="$SSID" '$1 == target {print $2; exit}')

if [[ -z "$SECURITY" || "$SECURITY" == "--" ]]; then
    nmcli device wifi connect "$SSID" ifname "$WIFI_DEVICE"
    exit 0
fi

PASSWORD=$(rofi -dmenu -password -p "Password" -theme "$THEME")
[[ -z "$PASSWORD" ]] && exit 0

nmcli device wifi connect "$SSID" password "$PASSWORD" ifname "$WIFI_DEVICE"
