require 'rails_helper'

describe 'rails_admin access by different roles', type: :request do
  admin_actions = Action.admin_actions
  admin_actions.each do |action|
    describe "admin_who_can_#{action}" do
      let(:user) { FactoryGirl.create(:user, role: FactoryGirl.create(:role, actions: [action])) }
      let(:controller_action) { action.split('_').first }
      let(:resource_name) { action.split('_').last.singularize }
      let(:resource) { FactoryGirl.create(resource_name) }
      
      before(:each) { sign_in user }
      after(:each) { sign_out user }

      it 'should get admin route' do
        attributes = (user.role.actions + rand(0..admin_actions.count).times.map { admin_actions.sample }).uniq
        user.role.tap { |r| r.update_attributes(actions: attributes) }

        case controller_action
          when 'create'
            get "/admin/#{resource_name}/new"
          when 'edit'
            get "/admin/#{resource_name}/#{resource.id}/edit"
          when 'destroy'
            get "/admin/#{resource_name}/#{resource.id}/delete"
        end

        expect(response).to have_http_status(:success)
      end

      it 'shouldn\'t get admin route' do
        attributes = (rand(0..admin_actions.count).times.map { admin_actions.sample } - user.role.actions).uniq
        user.role.tap { |r| r.update_attributes(actions: attributes) }

        case controller_action
          when 'create'
            expect { get "/admin/#{resource_name}/new" }.to raise_error(Pundit::NotAuthorizedError)
          when 'edit'
            expect { get "/admin/#{resource_name}/#{resource.id}/edit" }.to raise_error(Pundit::NotAuthorizedError)
          when 'destroy'
            expect { get "/admin/#{resource_name}/#{resource.id}/delete" }.to raise_error(Pundit::NotAuthorizedError)
        end
      end
    end
  end
end

