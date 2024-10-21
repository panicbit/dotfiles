let custom_config_name = 'my_config.nu'
let custom_env_name = 'my_env.nu'

###

let config_dir = $nu.default-config-dir

mkdir $config_dir

touch ($config_dir | path join $custom_config_name)
touch ($config_dir | path join $custom_env_name)

config reset --without-backup

$"source ($custom_config_name | to nuon)" | save --append $nu.config-path
$"source ($custom_env_name | to nuon)" | save --append $nu.env-path

