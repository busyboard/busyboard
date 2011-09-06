class Note < ActiveRecord::Base
  belongs_to :affaire
  
  validates :note, :presence => true
  
end
