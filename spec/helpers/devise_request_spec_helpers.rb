# frozen_string_literal: true

module DeviseRequestSpecHelpers
  include Warden::Spec::Helpers

  def sign_in
    before do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      sign_in FactoryBot.create(:user, email: 'test@e-dot.uk')
    end
  end

  def sign_out(resource_or_scope)
    scope = Devise::Mapping.find_scope!(resource_or_scope)
    logout(scope)
  end
end
