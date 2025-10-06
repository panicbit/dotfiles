$env.config.show_banner = false
$env.config.hooks.display_output = "table -e"

use ~/.cache/starship/init.nu
source ~/.cache/carapace/init.nu

use ~/.config/dotfiles/nu/git.nu *
use ~/.config/dotfiles/nu/cargo.nu *

alias vim = nvim

~/.config/dotfiles/nu/holidays.nu


