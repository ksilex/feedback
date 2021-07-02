
require 'rails_helper'

feature "As Admin User I want to see list of all Feedbacks" do
  given!(:old_feedbacks) { create_list(:feedback, 6) }
  given!(:new_feedback) { create(:feedback, text: "this one is new") }
  given(:admin) { create(:user, admin: true, email: "admin@example.com", full_name: "Admin") }

  describe 'Given I am authenticated as Admin (admin@example.com) and there are Feedbacks in database' do
    background { login_as(admin) }

    describe 'When I open Feedbacks page' do
      background { visit admin_feedbacks_path }

      scenario 'Then I see table with list of all feedbacks sorted by "newest first"' do
        expect(page).to have_selector "div#results div:nth-child(1)", text: new_feedback.text
      end
      scenario 'And I see pagination under the table' do
        expect(page).to have_selector ".pagination"
      end
    end
  end
end
