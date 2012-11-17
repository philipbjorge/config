#!/usr/bin/env ruby

# from http://errtheblog.com/posts/89-huba-huba

home = File.expand_path('~')

Dir['*'].each do |file|
  next if file =~ /install|README/
  target = File.join(home, ".#{file}")
  puts "symlinking #{file}"
  filename = File.expand_path file
  # Without the extra /, OS X creates a recursive symlink
  # inside of directories.
  if File.directory? filename then filename << "/" end
  `ln -s #{filename} #{target}`
end

# git push on commit
`echo 'git push' > .git/hooks/post-commit`
`chmod 755 .git/hooks/post-commit`
