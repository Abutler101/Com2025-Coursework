require 'rails_helper'

RSpec.describe "Admins", type: :request do
  it "accesses the dashboard" do
    User.create(
        firstName: "Admin",
        lastName: "Account",
        email: "admin@testacc.com",
        password_digest: "$2a$10$IE3kVPTtIOUhEN.QqgYeW.TM7/bQrWY78i.0J1frN0xvg5yhb0x4q",
        )

    visit root_path
    click_link 'Login'
    fill_in 'email', with: 'admin@testacc.com'
    fill_in 'password', with: 'secret'
    click_button 'Submit'

    current_path.should eq admin_path
    within 'h1' do
      pahe.should have_content 'Admin Dash'
    end
    page.should have_content 'Manage Sections'
    page.should have_content 'Manage Orders'
    page.should have_content 'Manage Products'
    page.should have_content 'Manage Users'
  end
end
