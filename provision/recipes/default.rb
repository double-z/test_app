
context = ChefDK::ProvisioningData.context
with_driver 'ssh'
puts "B"
puts "B"
puts context.convergence_options.inspect
puts "B"
puts "B"
#puts node['at']['val']
puts context.inspect
puts "B"
puts context.instance_variables
puts "B"
puts "B"
puts "B"
ENV.to_hash.each do |k,v|
#	puts "k #{k}"
#	puts "v #{v}"
end
puts "B"
puts "B"
puts "B"
puts "B"



['2', '3'].each do |cnt|

options = {
  :transport_options => {
    :ip_address => "192.168.33.12#{cnt}",
    :username => 'vagrant',
    :ssh_options => {
      :password => 'vagrant'
    }
  },
  :convergence_options => context.convergence_options
}

machine "context.node_name#{cnt}" do
#  machine_options  :transport_options => {
#	              :ip_address => "192.168.33.12#{cnt}",
#	              :username => 'vagrant',
#		      :ssh_options => {
#	                :password => 'vagrant'
#		      }
#		    },
 #                  :convergence_options => context.convergence_options

  machine_options ssh_options(cnt, context)
  #machine_options options
  action context.action
  converge true
end
end
