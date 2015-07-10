
context = ChefDK::ProvisioningData.context
with_driver 'vagrant'
puts context.convergence_options.inspect
puts context.inspect
puts context.instance_variables


# Set Machine Options
options = {
       vagrant_options: { 'vm.box' => 'opscode-ubuntu-14.04' },
       # Set all machine options to the defaults provided by `chef provision`
       convergence_options: context.convergence_options
       }

machine context.node_name do
  machine_options options
  action context.action
  converge true
end
