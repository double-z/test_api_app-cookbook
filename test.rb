require 'octokit'
user = Octokit.user 'double-z'
client = Octokit::Client.new :access_token => '23d05f65bd694c2ab64f23d5ca581d6116dd6569'

#  :login    => 'double-z',
#  :password => 'Florida100'
# Get the repos rel, returned from the API
# as repos_url in the resource
#user.rels[:releases].href
#user.rels[:repos].href
# => "https://api.github.com/users/technoweenie/repos"
#repo = Octokit.repo 'double'
#rel = repo.rels[:issues]
client.create_release("double-z/test_api_app-cookbook", "0.0.17", {"target_commitish" => "master", "name" => "0.0.17"})
#puts b.inspect
#repos = user.rels[:repos].get.data
#puts repos.last.name
# => "faraday-zeromq"

