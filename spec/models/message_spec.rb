# == Schema Information
#
# Table name: messages
#
#  id          :integer          not null, primary key
#  from_id     :integer          not null
#  to_id       :integer          not null
#  subject     :string           not null
#  body        :text
#  is_favorite :boolean          default(TRUE)
#

require 'rails_helper'

RSpec.describe Message, type: :model do
    describe '.new' do
    it 'instantiates a Message object' do
      c = Message.new
      #  binding.pry
      expect(c.is_a?(Message)).to be true
      #check if uses table has 5 columns
      expect(c.attributes.keys.count).to eql(5)
    end
  end
  
   context 'happy path' do
      it 'saves a message' do
        # binding.pry
        users = User.all
        userid1 =  users.where(email: 'bob@aol.com').first.id
        userid2 =  users.where(email: 'bob2@aol.com').first.id #users.second.id
        #binding.pry        
        c = Message.new(from_id: userid1 , to_id: userid2, subject: 'helloooooo', body: 'this is my body')
        #c = Message.new(from_id: 123)
        c.save

        expect(c.id).to_not be_nil
        expect(c.from_id).to_not be_nil
        expect(c.to_id).to_not be_nil
        expect(c.subject).to eql('helloooooo')
        #binding.pry
        expect(c.sender.email).to eql('bob@aol.com')
        
        #binding.pry
        
        
      end

    end



    
end
