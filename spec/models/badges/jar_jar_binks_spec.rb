require 'spec_helper'

describe Badge::JarJarBinks do

  describe ".allocate_to_user?" do
    let(:user) { create(:user) }

    subject { Badge::JarJarBinks.allocate_to_user?(user) }

    context "user did not attend any classes" do
      it { should eq(false) }
    end

    context "user attended one class" do
      before { create(:attendance, user: user) }
      it { should eq(true) }
    end

    context "user attended more than one class" do
      before { 2.times { create(:attendance, user: user) } }
      it { should eq(false) }
    end
  end
end

