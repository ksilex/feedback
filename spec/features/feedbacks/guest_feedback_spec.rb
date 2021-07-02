
require 'rails_helper'

feature "As Visitor I want to leave feedback" do
  describe 'When I open New Feedback page' do
    background { visit new_feedback_path }

    scenario 'Then I see form with required fields: name, email, text' do
      expect(page).to have_field 'feedback_name'
      expect(page).to have_field 'feedback_email'
      expect(page).to have_field 'feedback_text'
    end
    describe 'When I fill all 3 fields and click "Submit feedback"' do
      background do
        fill_in 'feedback_name', with: 'John'
        fill_in 'feedback_email', with: 'John@mail.com'
        fill_in 'feedback_text', with: 'John'
        click_on 'Create Feedback'
      end

      scenario 'I should see message "Feedback was successfully send!"' do
        expect(page).to have_content 'Feedback was successfully send!'
      end
      scenario 'And email with feedback sent to admin@example.com' do
        open_email('admin@example.com')
        expect(current_email).to have_content 'John@mail.com'
      end
    end
  end
end
