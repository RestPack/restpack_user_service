require 'require_all'

require "restpack_service"
require "restpack_serializer"
require "active_support/core_ext"

require "restpack_user_service/version"
require "restpack_user_service/configuration"

require_rel "restpack_user_service/models"
require_rel "restpack_user_service/serializers"

require "restpack_user_service/tasks"

module RestPack::User::Service::Commands

end

require_rel "restpack_user_service/commands"
