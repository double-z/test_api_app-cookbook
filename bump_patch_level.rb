#!/opt/chef/embedded/bin/ruby

def bump_patch_level(versionfile)
  File.open(versionfile, 'r+') do |f|
    lines = f.readlines
    lines.each do |line|
       major = $1
        minor = $2
        patch = $3
        new_patch = patch.to_i + 1
        puts "Incrementing #{metadatarb} version from #{major}.#{minor}.#{patch} to #{major}.#{minor}.#{new_patch}"
        line.replace("#{major}.#{minor}.#{new_patch}")
    end
    f.pos = 0
    lines.each do |line|
      f.print line
    end
    f.truncate(f.pos)
  end
end

updated = false

if !system("git checkout master")
  raise "Failed to checkout master"
end

if !system("git pull")
  raise "Failed to git pull master"
end

if File.exists?('VERSION')
  version_file = File.expand_path("VERSION")
  bump_patch_level(version_file)
  if !system("git add #{version_file}")
    raise "Failed to git add #{version_file}: #{$?}"
  end
  updated = true
end

if updated
  if !system("git commit -m 'Updated patch level for deploy repo'")
    raise "Failed to git commit"
  end

  if !system("git push origin master")
    raise "Failed to git push"
  end
end