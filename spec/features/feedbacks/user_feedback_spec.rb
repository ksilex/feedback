require 'rails_helper'

feature "As User I want to see pre-filled name and email in feedback form" do
  given(:user) { create(:user, email: "john@example.com", full_name: "John Smith") }

  describe ' Given I am authenticated as John Smith (john@example.com)' do
    background { login_as(user) }

    describe 'When I open New Feedback page' do
      background { visit new_feedback_path }
      scenario 'Then I should see name field pre-filled with "John Smith" and email field pre-filled with "john@example.com"' do
        expect(page).to have_field('feedback_name', with: 'John Smith')
        expect(page).to have_field('feedback_email', with: 'john@example.com')
      end
    end
  end
end
