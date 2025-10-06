#!/usr/bin/env nu

use std-rfc/iter recurse

def get_windows [] {
    print "\u{0}prompt\u{1f}Beckon window"
    
    let active_workspace = swaymsg -t get_workspaces | from json | where focused | get 0?.id

    let workspaces = swaymsg -t get_tree
        | from json
        | recurse
        | get item
        | where ($it | describe -d).type == record and type? == workspace and $it.id? != $active_workspace

    let windows = (
          $workspaces
        | each {|workspace|
            let workspace_name = match $workspace.name {
                "__i3_scratch" => "scratch",
                _ => $workspace.name,
            };

            $workspace
            | recurse
            | get item
            | where ($it | describe -d).type == record and ($it.type? == con or $it.type? == floating_con) and not ($it.name | is-empty)
            | select id name
            | upsert workspace { $workspace_name }
            | sort-by workspace name
        }
        | flatten

    )

    for window in $windows {
        let entry = (
                $window
            | update name { str replace -a "\n" " " | ansi strip }
            | format pattern "[{workspace}] {name}\u{0}info\u{1f}{id}"
            | str join "\n"
        )

        print $entry
    }
}

def move_window [] {
    let id = $env.ROFI_INFO
    let res = swaymsg $'[con_id=($id)] move container to workspace current; [con_id=($id)] focus' | complete
    
    print -e $res

    if $res.exit_code != 0 {
        exit 1
    }
}

def main [selection?] {
    if $selection == null {
        get_windows
    } else {
        move_window
    }
}
