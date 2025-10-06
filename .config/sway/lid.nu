#!/usr/bin/env nu

def main [laptop_output: string] {
    let lid_state_file = "/proc/acpi/button/lid/LID0/state"
    let lid_state = try { open $lid_state_file | parse -r 'state:\s*(?P<state>\w+)' | get 0.state }
    let has_active_external_outputs = (
        swaymsg -t get_outputs
        | from json
        | where active and name != $laptop_output
        | length
        | $in > 0
    )

    if $lid_state == "closed" and not $has_active_external_outputs {
        systemctl standby
        return
    }

    match $lid_state {
        "open" => { swaymsg output $laptop_output enable },
        "closed" => { swaymsg output $laptop_output disable },
        _ => {
            print "Could not get lid state"
            exit 1
        }
    }
}
