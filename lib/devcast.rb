require 'lotus/model'
Dir["#{ __dir__ }/devcast/**/*.rb"].each { |file| require_relative file }

Lotus::Model.configure do
  ##
  # Database adapter
  #
  # Available options:
  #
  #  * Memory adapter
  #    adapter type: :memory, uri: 'memory://localhost/devcast_development'
  #
  #  * SQL adapter
  #    adapter type: :sql, uri: 'sqlite://db/devcast_development.sqlite3'
  #    adapter type: :sql, uri: 'postgres://localhost/devcast_development'
  #    adapter type: :sql, uri: 'mysql://localhost/devcast_development'
  #
  adapter type: :sql, uri: ENV['DEVCAST_DATABASE_URL']

  ##
  # Migrations
  #
  migrations 'db/migrations'
  schema     'db/schema.sql'

  ##
  # Database mapping
  #
  # Intended for specifying application wide mappings.
  #
  # You can specify mapping file to load with:
  #
  # mapping "#{__dir__}/config/mapping"
  #
  # Alternatively, you can use a block syntax like the following:
  #
  mapping do
    collection :devcasts do
      entity     Devcast
      repository DevcastRepository

      attribute :id,   Integer
      attribute :title, String
      attribute :url, String
      attribute :description, String
      attribute :published, Boolean
      attribute :created_at, DateTime
      attribute :updated_at, DateTime
    end
  end
end.load!
