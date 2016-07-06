module ControllerMacros
  def login_user(factory)
    before(:each) do
      user = FactoryGirl.create(factory)
      sign_in user
    end
  end
end