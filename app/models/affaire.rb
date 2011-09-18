class Affaire < ActiveRecord::Base
  belongs_to :phase
  has_many :notes
  has_one :contact, :as => :contactable 
  accepts_nested_attributes_for :contact

  validates :reference, :presence => true

  def contact_attributes=(attributes)
      build_contact attributes
  end 

end



