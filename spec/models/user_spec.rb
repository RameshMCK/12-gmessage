# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  color                  :string
#  photo                  :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
    describe '.new' do
    it 'instantiates a User object' do
      c = User.new
      #  binding.pry
      expect(c.is_a?(User)).to be true
      #check if uses table has 15 columns
      expect(c.attributes.keys.count).to eql(15)
      expect(c.attributes.key?("color")).to eql(true)
      expect(c.attributes.key?("photo")).to eql(true)
    end
  end
  
    context 'happy path' do
      it 'saves a user' do
        c = User.new(email: 'bob3@aol.com', password: 'abc123', color: '#FCF3CF', photo: 'https://www.jamf.com/jamf-nation/img/default-avatars/generic-user.png')
        c.save
        #binding.pry
        expect(c.id).to_not be_nil
        expect(c.photo).to_not be_nil
        expect(c.color).to_not be_nil
      end
    end

end
