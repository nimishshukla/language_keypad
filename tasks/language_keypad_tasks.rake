desc "Create keypads directory"
task(:generate_keypad) do
  require "ftools"
  # Check to see if it exists
  #if File.exists?("#{RAILS_ROOT}/config/key_pads")
  #puts "#{folder} exists"
  #else
  Dir.mkdir "#{RAILS_ROOT}/config/key_pads" unless File.exists?("#{RAILS_ROOT}/config/key_pads")
  Dir.mkdir "#{RAILS_ROOT}/public/images/keypads" unless File.exists?("#{RAILS_ROOT}/public/images/keypads")
  File.copy("#{RAILS_ROOT}/vendor/plugins/language_keypad/lib/key_pads/hindi.yml","#{RAILS_ROOT}/config/key_pads/hindi.yml")
  File.copy("#{RAILS_ROOT}/vendor/plugins/language_keypad/lib/public/images/keypads/key01.png","#{RAILS_ROOT}/public/images/keypads/key01.png")
  File.copy("#{RAILS_ROOT}/vendor/plugins/language_keypad/lib/public/images/keypads/key02.png","#{RAILS_ROOT}/public/images/keypads/key02.png")
  File.copy("#{RAILS_ROOT}/vendor/plugins/language_keypad/lib/public/images/keypads/key03.png","#{RAILS_ROOT}/public/images/keypads/key03.png")
  f = File.new("#{RAILS_ROOT}/app/helpers/language_keypad_helper.rb", "w")
  f.write(" module LanguageKeypadHelper \n  require \"\#\{RAILS_ROOT\}/vendor/plugins/language_keypad/lib/app/helpers/language_keypad_helper.rb\" \n end")
  f.close
  File.copy("#{RAILS_ROOT}/vendor/plugins/language_keypad/lib/public/stylesheets/keypad.css","#{RAILS_ROOT}/public/stylesheets/keypad.css")
end