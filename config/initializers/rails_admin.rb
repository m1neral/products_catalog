RailsAdmin.config do |config|
  config.current_user_method(&:current_user)
  config.authorize_with :pundit

  config.included_models = %w[User Category Product Review Action Role]

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app
  end
end
