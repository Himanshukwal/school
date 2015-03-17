require 'spec_helper'

describe User do
  subject { create(:user) }

  describe "attributes" do
    it { should respond_to(:bridge_troll_user_id) }
    it { should respond_to(:rails_bridge_class_count) }
  end

  describe "#generate_unsubscribe_token" do
    context "user already has unsubscribe token" do
      it "doesn't change the existing token" do
        existing_token = subject.unsubscribe_token
        expect(existing_token).to be_present

        subject.generate_unsubscribe_token
        expect(existing_token).to eq(subject.unsubscribe_token)
      end
    end
  end
end
