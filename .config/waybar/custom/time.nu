#!/usr/bin/env nu

def pad [amount] {
    fill -a right -c 0 -w $amount
}

def span [color: string] {
    $'<span color="($color)">($in)</span>'
}

loop {
    let now = date now
    let datetime = (
          $now
        | into record
        # | update year { }
        | update month { pad 2 | span '#F8F' }
        | update day { pad 2 | span '#FF8' }
        | update hour { pad 2 | span '#F88' }
        | update minute { pad 2 | span '#8F8' }
        | update second { pad 2 | span '#88f' }
        | upsert week { $now | format date '%U' }
        | upsert h_day { $now | format date '%A' | span '#F8F' }
        | upsert h_month { $now | format date '%B' | span '#8FF' }
    )

    let pattern = $'   ⌚ {hour}:{minute}:{second}    🗓️ {h_day}, {day}. {h_month} {year}'
    let json = {
        text: ($datetime | format pattern $pattern),
        tooltip: ($now | format date '%Y-%m-%d')
    } | to json --raw

    print $json
    sleep 2sec
}
