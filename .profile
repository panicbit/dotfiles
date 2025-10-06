# export MOZ_USE_XINPUT2=1
export EDITOR=vim
export DOTNET_CLI_TELEMETRY_OPTOUT=1
export ADW_DISABLE_PORTAL=1
export XKB_DEFAULT_LAYOUT="de"
export XKB_DEFAULT_VARIANT="neo"
export XKB_DEFAULT_OPTIONS=""
export _JAVA_AWT_WM_NONREPARENTING=1

export PATH=$PATH:~/bin

. "$HOME/.cargo/env"

export PATH="$PATH:~/.local/opt/flutter/bin"
export PATH="$PATH:~/.local/opt/android-sdk/cmdline-tools/latest/bin"
export PATH="$PATH:~/.local/bin"

# if [ $(tty) = "/dev/tty1" ]; then
    # exec startx
# fi

if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" == 1 ]; then
    export XDG_CURRENT_DESKTOP=sway
    echo "Launching Sway..."
    exec sway --unsupported-gpu
fi

#if [ $(tty) = "/dev/tty3" ]; then
#    exec niri-session
#fi
