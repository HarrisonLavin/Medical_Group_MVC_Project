require "bundler/setup"
Bundler.require
require_all "app/"

DB = {:conn => SQLite3::Database.new("db/medical_group.db")}