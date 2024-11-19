
export def "decode jwt" [] {
    let decode = { decode base64 --nopad --url | decode | from json };

    $in
    | split column '.' header payload signature
    | first
    | update header $decode
    | update payload $decode
    | update signature { decode base64 --nopad --url }
}
