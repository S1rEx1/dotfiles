# $env.PROMPT_COMMAND = {
#     let path = (pwd | str replace $env.HOME "~")
#     $"(ansi cyan)($path)(ansi reset)\n(ansi white)❯ (ansi reset)"
# }
# $env.PROMPT_COMMAND_RIGHT = { "" }
# $env.PROMPT_INDICATOR = ""
$env.config.buffer_editor = "nvim"
#
$env.QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"
$env.LANG = "en_US.UTF-8"
$env.LC_ALL = "en_US.UTF-8"

$env.XCURSOR_THEME = "GoogleDot-Black"
$env.XCURSOR_SIZE = "20"

if (tty | str contains "/dev/tty1") {
    exec mango
}

