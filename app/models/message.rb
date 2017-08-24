# == Schema Information
#
# Table name: messages
#
#  id      :integer          not null, primary key
#  from_id :integer          not null
#  to_id   :integer          not null
#  subject :string           not null
#  body    :text
#

class Message < ApplicationRecord
    
    #when multiple FKs are pointing to same PK, use alias in the belongs_to and foreigm key stuff as below
    belongs_to :sender, foreign_key: 'from_id', class_name: "User"
    belongs_to :receiver, foreign_key: 'to_id', class_name: "User"    
end
