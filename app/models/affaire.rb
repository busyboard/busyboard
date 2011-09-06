class Affaire < ActiveRecord::Base
  belongs_to :phase
  has_many :notes
  
  validates :reference, :presence => true
 
end
