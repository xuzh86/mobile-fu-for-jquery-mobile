require 'bundler/gem_tasks'
require 'rake/testtask'
require 'json'
require 'httparty'

MOBILE_DETECT_JSON = 'https://raw.github.com/serbanghita/Mobile-Detect/master/Mobile_Detect.json'
TABLET_FILE        = 'lib/mobile-fu/tablet.rb'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs.push 'lib'
  t.test_files = FileList['spec/*_spec.rb', 'spec/mobile-fu/*_spec.rb']
  t.verbose = true
end

desc "Pull in data from Mobile Detect"
task :pull_mobile_detect_data do
  
  # call out to Mobile Detect to get the data
  content = HTTParty.get(MOBILE_DETECT_JSON).body

  # build a new tablet regex
  data      = JSON.parse content
  regexes   = data['uaMatch']['tablets'].each.map { |_, v| v }
  new_regex = regexes.join('|').downcase

  # rewrite the tablet regex in our file
  new_content = File.read(TABLET_FILE).gsub!(/TABLET_USER_AGENTS = \/.*\//, "TABLET_USER_AGENTS = \/#{new_regex}\/")
  File.open(TABLET_FILE, 'w') { |f| f.write new_content }

end


# desc 'Generate documentation for the mobile_fu plugin.'
# Rake::RDocTask.new(:rdoc) do |rdoc|
#   rdoc.rdoc_dir = 'rdoc'
#   rdoc.title    = 'MobileFu'
#   rdoc.options << '--line-numbers' << '--inline-source'
#   rdoc.rdoc_files.include('README')
#   rdoc.rdoc_files.include('lib/**/*.rb')
# end

desc "Update asset files for Rails"
task :update_assets do

  Dir.glob(File.join('app/assets/stylesheets', '*.css')).each do |css_file_name|
    # rename css file
    css_file_name_out = css_file_name.split('-').first + '.css.scss'
    File.rename(css_file_name, css_file_name_out)
    # update image reference
    file_content = ''
    File.open(css_file_name_out, "r:UTF-8") do |file|
      file_content = file.read
    end
    file_content.gsub! /url\(images\/icons-png\/([A-Za-z0-9_-]*\.)(png|gif)\)/ do
      "image-url(\"jquery-mobile/icons-png/#{$1}#{$2}\")"
    end
    file_content.gsub! /url\(images\/([A-Za-z0-9_-]*\.)(png|gif)\)/ do
      "image-url(\"jquery-mobile/#{$1}#{$2}\")"
    end
    File.open(css_file_name_out, 'w') do |file|
      file << file_content
    end
    puts "Renamed and updated #{css_file_name_out}"
  end

  Dir.glob(File.join('app/assets/javascripts', '*.js')).each do |js_file_name|
    # rename js file
    if js_file_name.include? "-"
      js_file_name_out = js_file_name.split('-').first + '.js'
      File.rename(js_file_name, js_file_name_out)
      puts "Renamed #{js_file_name_out}"
    end
  end

end