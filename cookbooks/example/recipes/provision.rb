puts "B"
puts "B"
puts "B"
puts node['cvopts']
puts "B"
puts node['cvnn']
puts "B"
puts node['cva']
puts "E"
puts "E"
puts "E"
puts "E"

with_driver 'ssh'
options = {
  :transport_options => {
    :ip_address => '192.168.33.123',
    :username => 'vagrant',
    :ssh_options => {
      :password => 'vagrant'
    }
  },
  :convergence_options => node['cvopts']
}
machine node['cvnn'] do
  machine_options options
  action node['cva']
  converge true
end
