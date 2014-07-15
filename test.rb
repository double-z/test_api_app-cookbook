require 'octokit'
user = Octokit.user 'double-z'
client = Octokit::Client.new :access_token => '23d05f65bd694c2ab64f23d5ca581d6116dd6569'
if File.exists?('VERSION')
  new_version=`cat VERSION`
end
#  :login    => 'double-z',
#  :password => 'Florida100'
# Get the repos rel, returned from the API
# as repos_url in the resource
#user.rels[:releases].href
#user.rels[:repos].href
# => "https://api.github.com/users/technoweenie/repos"
#repo = Octokit.repo 'double'
#rel = repo.rels[:issues]
puts "Creating Release #{new_version}"
client.create_release("double-z/test_api_app-cookbook", new_version.to_s.chomp) #, {"target_commitish" => "master", "name" => "#{new_version.to_s}"})
#puts b.inspect
#repos = user.rels[:repos].get.data
#puts repos.last.name
# => "faraday-zeromq"

