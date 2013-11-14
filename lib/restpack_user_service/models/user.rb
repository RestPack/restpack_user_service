module Models::Users
  class User < ActiveRecord::Base
    self.table_name = :restpack_user_users
    attr_accessible :application_id, :description, :email, :image, :location, :name, :nickname

    validates_presence_of :application_id
    validates :name, :length => { :maximum => 128 }
    validates :nickname, :length => { :maximum => 128 }
    validates :email, :length => { :maximum => 512 }
    validates :image, :length => { :maximum => 1024 }
    validates :location, :length => { :maximum => 512 }
    validates :description, :length => { :maximum => 1024 }

    has_many :authentications

    def self.authenticate(user_id, application_id, omniauth)
      authentication = Authentication.get_by_omniauth(application_id, omniauth)
      if authentication
        return authentication.user
      else
        if user_id.blank?
          user = User.new(application_id: application_id)
        else
          user = User.find(user_id)
        end
        [:name, :nickname, :email, :image, :location, :description].each do |attribute|
          user[attribute] ||= omniauth['info'][attribute.to_s]
        end

        user.save!
        user.authentications << Authentication.from_omniauth(application_id, omniauth)
        user
      end
    end
  end
end
