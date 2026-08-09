--
-- Autostart
--

hl.on("hyprland.start", function ()
    hl.exec_cmd("dbus-update-activation-environment")
    hl.exec_cmd("hyprpaper & waybar & hypridle & ghostty")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
    hl.exec_cmd("wayland-pipewire-idle-inhibit")
end)

