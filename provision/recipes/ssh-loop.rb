
context = ChefDK::ProvisioningData.context
with_driver 'ssh'
puts context.convergence_options.inspect
puts context.inspect
puts context.instance_variables

1.upto(2) do |cnt|

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

nodename = "#{context.node_name}#{cnt}"
machine nodename do
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
