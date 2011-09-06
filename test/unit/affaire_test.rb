require 'test_helper'

class AffaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  
  test "save new affaire should fail" do
      affaire = Affaire.new
      assert !affaire.save
  end
  
  
  
end
