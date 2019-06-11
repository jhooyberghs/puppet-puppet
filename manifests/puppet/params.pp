class puppet::puppet::params {

  include puppet::settings
  $server_suffix = $puppet::settings::server_suffix

  $version   = 'installed'
  $ca_server = "p5ca${server_suffix}.${facts['domain']}"
  $puppet_server = "p5m${server_suffix}.${facts['domain']}"
  $report_server = $puppet_server
  $puppetdb_server = "p5db${server_suffix}.${facts['domain']}"
  $environment = 'production'
  $dns_alt_names = "p5m${server_suffix}.${facts['domain']},p5m1${server_suffix}.${facts['domain']},p5m2${server_suffix}.${facts['domain']},p5m3${server_suffix}.${facts['domain']},p5m4${server_suffix}.${facts['domain']},p5m5${server_suffix}.${facts['domain']},p5m6${server_suffix}.${facts['domain']},p5m7${server_suffix}.${facts['domain']},p5m8${server_suffix}.${facts['domain']},p5m9${server_suffix}.${facts['domain']}"

  # calculating java default settings
  # defauts are based on puppetlabs recommendations

  $runinterval = '30m'
  $jruby_instances = $facts['processors']['count'] -1
  $jruby_max_active_instances = $facts['processors']['count']
  $jruby_max_requests_per_instance = '100000'
  $environment_timeout = '10s'
  $start_timeout       = '300'
  $reload_timeout       = '150'
  $java_heap_size = 512 + ( $jruby_max_active_instances * 512 )
  ## we should check if there is enough memory available

  $java_args = "-Xms${java_heap_size}m -Xmx${java_heap_size}m"

  # Puppet agent specific settings

  $agent_version = 'installed'
  $agent_splay = true
  $agent_environment = 'production'
  $agent_usecacheonfailure = false
}
