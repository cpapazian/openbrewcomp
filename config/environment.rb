# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.2.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.
  # See Rails::Configuration for more options.

  # Skip frameworks you're not going to use. To use Rails without a database
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Specify gems that this application depends on. 
  # They can then be installed with "rake gems:install" on new installations.
  # You have to specify the :lib option for libraries, where the Gem name (sqlite3-ruby) differs from the file itself (sqlite3)
  config.gem 'fastercsv', :version => '>=1.4.0'
  config.gem 'andre-geokit', :version => '>=1.2.5', :lib => 'geokit',
               :source => 'http://gems.github.com'
  # The hpricot gem is now available from rubyforge and github, but the version
  # on github is, as of 2009-04-15, an older version than the one on rubyforge.
  config.gem 'hpricot', :version => '>=0.7'
  #config.gem 'why-hpricot', :version => '>=0.7',
  #             :source => 'http://gems.github.com'
  # Using rtex as a plugin instead until bugs are fixed, presumably in 2.1.2
  config.gem 'rdiscount', :version => '>=1.3.4'
  #config.gem 'rtex', :version => '>=2.1.2',
  #             :source => 'http://gems.github.com'
  config.gem 'ruby-openid', :version => '>2.1', :lib => 'openid'
  config.gem 'rubyzip', :version => '>=0.9.1', :lib => 'zip/zip'
  config.gem 'tzinfo', :version => '>=0.3.12'
  config.gem 'mislav-will_paginate', :version => '>=2.3.8',
               :source => 'http://gems.github.com'

  # Only load the plugins named here, in the order given. By default, all plugins 
  # in vendor/plugins are loaded in alphabetical order.
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Add additional load paths for your own custom dirs
  config.load_paths += %W( #{RAILS_ROOT}/app/sweepers )

  # Force all environments to use the same logger level
  # (by default production uses :info, the others :debug)
  # config.log_level = :debug

  # Make Time.zone default to the specified zone, and make Active Record store time values
  # in the database in UTC, and return them converted to the specified local zone.
  # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
  config.time_zone = 'UTC'

  # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
  # All files from config/locales/*.rb,yml are added automatically.
  # config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  # Verify that the session_store config file exists
  unless File.exists?(File.join(File.dirname(__FILE__), 'initializers', 'session_store.rb')) || File.basename($0) == 'rake'
    raise <<-EOD
The session store config file file is missing.
Run 'rake setup:session_store' to create it.
    EOD
  end

  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # Please note that observers generated using script/generate observer need to have an _observer suffix
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
end
