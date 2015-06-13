# Policyfile.rb - Describe how you want Chef to build your system.
#
# For more information on the Policyfile feature, visit
# https://github.com/opscode/chef-dk/blob/master/POLICYFILE_README.md

# A name that describes what the system you're building with Chef does.
name "test_app"

# Where to find external cookbooks:
default_source :community

# run_list: chef-client will run these recipes in the order specified.
run_list "apt", "build-essential"

cookbook "apt"
cookbook "build-essential"
# Specify a custom source for a single cookbook:
cookbook "example", path: "./cookbooks/example"
default['at']['val'] = "TeST"
