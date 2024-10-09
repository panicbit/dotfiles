module dotenv {
    export def list [file?: path] {
        let data = (if $file == null {
            dotenv list
        } else {
            ^dotenv -f $file list
        })

        $data | lines | parse "{key}={value}" | transpose -r | first
    }

    export def --env load [file?: path] {
        list $file | load-env
    }
}

use dotenv