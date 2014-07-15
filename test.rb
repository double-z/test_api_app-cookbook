require 'octokit'
client = Octokit::Client.new :access_token => '23d05f65bd694c2ab64f23d5ca581d6116dd6569'
if File.exists?('VERSION')
  new_version=`cat VERSION`
end
puts "Creating Release #{new_version}"
client.create_release("double-z/test_api_app-cookbook", new_version.to_s.chomp, {"target_commitish" => "master", "name" => "#{new_version.to_s.chomp}"})
