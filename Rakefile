require 'active_record'
require 'require_all'
require 'yaml'

namespace :db do
  env = 'default' || ENV['env']

  db_config       = YAML::load(File.open('config/database.yml'))[env]
  db_config_admin = db_config


  desc "Create the database"
  task :create do
    ActiveRecord::Base.establish_connection(db_config_admin)
    unless db_config_admin['adapter'] == 'sqlite3'
      ActiveRecord::Base.connection.create_database(db_config["database"])
    end
    puts "Database created."
  end

  desc "Seed the database"
  task :seed do
    ActiveRecord::Base.establish_connection(db_config_admin)
    require_all 'models/*.rb'
    require_relative 'db/seeds.rb'
  end

  desc "Migrate the database"
  task :migrate do
    ActiveRecord::Base.establish_connection(db_config)
    ActiveRecord::Migrator.migrate("db/migrate/")

    Rake::Task["db:schema"].invoke
    puts "Database migrated."
  end

  desc "Drop the database"
  task :drop do
    ActiveRecord::Base.establish_connection(db_config_admin)
    ActiveRecord::Base.connection.drop_database(db_config["database"])
    puts "Database deleted."
  end

  desc "Reset the database"
  task :reset => [:drop, :create, :migrate]

  desc 'Create a db/schema.rb file that is portable against any DB supported by AR'
  task :schema do
    ActiveRecord::Base.establish_connection(db_config)
    require 'active_record/schema_dumper'
    filename = "db/schema.rb"
    File.open(filename, "w:utf-8") do |file|
      ActiveRecord::SchemaDumper.dump(ActiveRecord::Base.connection, file)
    end
  end

end

namespace :g do
  desc "Generate migration"
  task :migration do
    name = ARGV[1] || raise("Specify name: rake g:migration your_migration")
    timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    path = File.expand_path("../db/migrate/#{timestamp}_#{name}.rb", __FILE__)
    migration_class = name.split("_").map(&:capitalize).join

    File.open(path, 'w') do |file|
      file.write <<-EOF
class #{migration_class} < ActiveRecord::Migration
  def self.up
  end
  def self.down
  end
end
      EOF
    end

    puts "Migration #{path} created"
    abort # needed stop other tasks
  end
end

