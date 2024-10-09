
module npm-completions {
    def "nu-complete npm run" [] {
        open ./package.json | get scripts | columns | sort
    }

    export extern "npm run" [
        script: string@"nu-complete npm run",
        ...args: string,
    ]
}

use npm-completions *

