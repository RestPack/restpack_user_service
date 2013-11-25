module Models::Users
  class Configuration < ActiveRecord::Base
    self.table_name = :restpack_user_configurations

    attr_accessible :application_id, :data
    validates_presence_of :application_id

    after_initialize -> {
      self.data ||= {}
    }
  end
end
