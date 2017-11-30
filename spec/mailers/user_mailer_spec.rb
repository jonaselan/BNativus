require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "welcome" do
    let(:user) { create(:user, email: 'email@email.com') }
    let(:mail) { UserMailer.welcome(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Sign Up Confirmation")
      expect(mail.to).to eq(["email@email.com"])
      expect(mail.from).to eq(["bnativusoficial@gmail.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end
end
