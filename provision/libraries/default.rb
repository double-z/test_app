require 'json'
def ssh_options(cnt, context)
p = JSON.parse(File.read("/Users/zzondlo/chef/code/apps/cd_api/policy_files/test_app/provision/libraries/#{cnt}.json"))
p.delete("convergence_options")
p[:convergence_options] = context.convergence_options
puts ENV.inspect
puts ENV['ENVTEST']
puts "LOCK"
puts p
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
#puts JSON.pretty_generate(options)
#options
p
end
