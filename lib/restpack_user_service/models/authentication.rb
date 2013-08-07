
module RestPack::User::Service::Models
  class Authentication < Base
    restpack_table_name :authentications

    attr_accessible :application_id, :oauth, :provider, :uid, :user_id, :omniauth
    serialize :oauth, JSON

    validates_presence_of :application_id, :omniauth, :provider, :uid, :user_id
    validates :provider, :length => { :maximum => 128 }
    validates :uid, :length => { :maximum => 1024 }

    belongs_to :user

    def self.create_from_omniauth(application_id, omniauth)
      Authentication.new(
        application_id: application_id,
        provider: omniauth['provider'],
        uid: omniauth['uid'],
        omniauth: omniauth
      )
    end

    def self.get_by_omniauth(application_id, omniauth)
      Authentication.where(
        application_id: application_id,
        provider: omniauth['provider'],
        uid: omniauth['uid']
      ).first
    end
  end
end
