require 'spec_helper'

describe Users::Commands::User::List do
  is_required :application_id
  is_optional :account_id, :email, :include, :page, :page_size

  pending
end
