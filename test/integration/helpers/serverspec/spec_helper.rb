require 'serverspec'

set :backend, :exec

# Serverspec v2
# include Serverspec::Helper::DetectOS
# include Serverspec::Helper::Exec

# RSpec.configure do |c|
#   c.before :all do
#     c.os = backend(Serverspec::Commands::Base).check_os
#   end
# end