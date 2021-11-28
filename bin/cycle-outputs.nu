#!/usr/bin/env nu

let visible_workspaces = (i3-msg -t get_workspaces | from json | where visible)
let next_workspace = (echo $visible_workspaces $visible_workspaces | skip until focused | nth 1)

i3-msg -t command workspace $next_workspace.name
