class OracleRecord < ActiveRecord::Base
  self.abstract_class = true

  class << self
    undef :delete_all, :delete, :destroy_all, :destroy
  end

  parsed_erb = ERB.new(File.read(Rails.root.join('config', 'database_oracle.yml'))).result
  databases = YAML.load(parsed_erb)

  # due to activerecord-import not having an oracle adaptor defined, this is necessary
  # to ensure that rails is able to establish a database connection in rake, since
  # the rails stack has a different load order in rake.
  if defined? establish_connection_without_activerecord_import
    establish_connection_without_activerecord_import databases[Rails.env]
  else
    establish_connection databases[Rails.env]
  end
end
