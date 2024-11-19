#!/usr/bin/env nu
let country = "DE"
let county = "DE-NW"
let time_range = 4wk
let time_range = 8wk
#let time_range = 365day
let max_cache_age = 1day

def main [] {
    let data = (
        | cached_next_public_holidays $country
        | insert when {|it| ($it.date | into datetime) + 12hr}
        | where when - (date now) <= $time_range
        | where global == true or $county == "" or $county in $it.counties
    );

    if ($data | length) > 0 {
        let output = (
            | $data
            | insert day {|it| $it.when | format date %A}
            | update counties {|it| $it.counties | str join ", "}
            | select when day date localName name counties
        )

        print "Upcoming holidays:"
        $output | table --index false
    }
}

def cached_next_public_holidays [country: string] {
    let dir = $"($nu.home-path)/.cache/nager_holidays"
    let path = $"($dir)/($country).json"

    mkdir $dir

    if ($path | path exists) and (date now) - (ls $path | get 0.modified) < $max_cache_age {
        open $path
    } else {
        let data = next_public_holidays $country

        $data | save -f $path

        $data
    }
}

def next_public_holidays [country: string] {
    let url = $"https://date.nager.at/api/v3/NextPublicHolidays/($country)"

    | http get $url
    | default [] counties
}
