
require 'rails_helper'

feature "As Admin User I want to search through feedbacks" do
  given!(:feedback_JS) { create(:feedback, text: "Hello", email: "john@example.com", name: "John Smith") }
  given!(:feedback_MB) { create(:feedback, text: "Help", email: "misha@example.com", name: "Michael Brown") }
  given(:admin) { create(:user, admin: true, email: "admin@example.com", full_name: "Admin") }

  describe "Given I am authenticated as Admin (admin@example.com)\n
    And there are feedback with text 'Hello' from John Smith (john@example.com) in database\n
    And there are feedback with text 'Help' from Michael Brown (misha@example.com) in database" do
    background { login_as(admin) }

    describe 'When I open Feedbacks page' do
      background { visit admin_feedbacks_path }

      scenario 'Then I see Search Form with text input and submit button' do
        expect(page).to have_field 'search'
        expect(page).to have_button 'Search'
      end
      describe 'When I fill search input with "john"' do
        background do
          fill_in 'search', with: 'john'
          click_on 'Search'
        end

        scenario 'Then I see feedback from John Smith' do
          expect(page).to have_content 'Name: John Smith'
        end
        scenario 'And I do not see feedback from Michael' do
          expect(page).to_not have_content 'Michael'
        end
      end
      describe ' When I fill search input with "Help"' do
        background do
          fill_in 'search', with: 'Help'
          click_on 'Search'
        end

        scenario 'Then I see feedback from Michael' do
          expect(page).to have_content 'Name: Michael'
        end
        scenario 'And I do not see feedback from John Smith' do
          expect(page).to_not have_content 'John Smith'
        end
      end
    end
  end
end
