
export def "decode jwt" [] {
    let decode = { decode base64 -c standard-no-padding | from json };

    $in
    | split column '.' header payload signature
    | first
    | update header $decode
    | update payload $decode
}
