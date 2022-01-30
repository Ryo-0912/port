require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  let!(:user) { FactoryBot.create(:user ) }

  before do
    session_params = { session: { email: user.email, password: user.password } }
    post "/login", params: session_params
  end
end
