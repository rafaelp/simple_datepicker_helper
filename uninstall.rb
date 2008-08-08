# Uninstall hook code here

require 'fileutils'
PLUGIN_ROOT = File.dirname(__FILE__)
RAILS_ROOT = File.join(PLUGIN_ROOT, '..','..','..')

# Workaround a problem with script/plugin and http-based repos.
# See http://dev.rubyonrails.org/ticket/8189
Dir.chdir(Dir.getwd.sub(/vendor.*/, '')) do

  FileUtils.rm File.join(RAILS_ROOT,"public","javascripts","simple_datepicker.js")
  FileUtils.rm File.join(RAILS_ROOT,"public","stylesheets","simple_datepicker.css")

end
