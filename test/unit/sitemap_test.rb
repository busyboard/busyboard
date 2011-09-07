require 'test_helper'
   
class SitemapTest < ActiveSupport::TestCase
  
  def setup
      @sitemap = Sitemap.new("db/test.sitemap.xml") 
  end
  
  test "Should create new sitemap object" do     
      assert @sitemap
  end
  
  test "Set currentMenuId should be 5" do
    @sitemap.currentMenuId = 5
    
    assert @sitemap.currentMenuId == 5
  end
  
  test "Should loop through each top node file" do
      @sitemap.each_element{|node|
        assert node 
       }
  end
  
  test "Should return top element" do
     assert @sitemap.top_elements
  end
  
  test "Should get first child" do
    assert @sitemap.first
  end
  
  test "First child should be equal to affaire" do    
    assert @sitemap.first.attributes.get_attribute("title").value == "affaire"
  end
  
  test "should get child element" do
     xml =<<-eos
         <sitemap>
              <sitenode title='affaire' action='index' id='a3be3d411a3ae096c9e8d987b0ae7a820d0d6817' controller='affaires'>
                    <sitenode title='nouvelle affaire' action='new' id='2c6ab05d9197ff7c671e892e9345ff6484cf102c' controller='affaires'/>
                    <sitenode title='affaire en cours' action='index' id='4e3ee6c5f80d873cc779e08fa5985da5d591e0e8' controller='affaires'/>
                    <sitenode title='mettre jours' action='update' id='1cb460b9a293833fb1d83edcfa352db82784e9c7' controller='affaires'/>
                    <sitenode title='note' action='index' id='c0df735ed47e7efac8b549a65a308461531121a8' controller='notes'>
                      <sitenode title='nouvelle note' action='new' id='c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71' controller='notes'/>
                      <sitenode title='mettre a jour une note' action='update' id='863bbcd94a3e2a3e3c027d771f781a863b945b8e' controller='notes'/>
                    </sitenode>
              </sitenode>
        </sitemap>
      eos

    sitemap = Sitemap.new(xml, false)

    assert sitemap.children("a3be3d411a3ae096c9e8d987b0ae7a820d0d6817")
  end
  
  test "Number of children should be equal to 4" do
     xml =<<-eos
         <sitemap>
              <sitenode title='affaire' action='index' id='a3be3d411a3ae096c9e8d987b0ae7a820d0d6817' controller='affaires'>
                    <sitenode title='nouvelle affaire' action='new' id='2c6ab05d9197ff7c671e892e9345ff6484cf102c' controller='affaires'/>
                    <sitenode title='affaire en cours' action='index' id='4e3ee6c5f80d873cc779e08fa5985da5d591e0e8' controller='affaires'/>
                    <sitenode title='mettre jours' action='update' id='1cb460b9a293833fb1d83edcfa352db82784e9c7' controller='affaires'/>
                    <sitenode title='note' action='index' id='c0df735ed47e7efac8b549a65a308461531121a8' controller='notes'>
                      <sitenode title='nouvelle note' action='new' id='c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71' controller='notes'/>
                      <sitenode title='mettre a jour une note' action='update' id='863bbcd94a3e2a3e3c027d771f781a863b945b8e' controller='notes'/>
                    </sitenode>
              </sitenode>
        </sitemap>
      eos

    sitemap = Sitemap.new(xml, false)
    
    assert sitemap.children("a3be3d411a3ae096c9e8d987b0ae7a820d0d6817").size == 4
  end
  
  test "Should return element with id 4e3ee6c5f80d873cc779e08fa5985da5d591e0e8" do
    
         xml =<<-eos
             <sitemap>
                  <sitenode title='affaire' action='index' id='a3be3d411a3ae096c9e8d987b0ae7a820d0d6817' controller='affaires'>
                        <sitenode title='nouvelle affaire' action='new' id='2c6ab05d9197ff7c671e892e9345ff6484cf102c' controller='affaires'/>
                        <sitenode title='affaire en cours' action='index' id='4e3ee6c5f80d873cc779e08fa5985da5d591e0e8' controller='affaires'/>
                        <sitenode title='mettre jours' action='update' id='1cb460b9a293833fb1d83edcfa352db82784e9c7' controller='affaires'/>
                        <sitenode title='note' action='index' id='c0df735ed47e7efac8b549a65a308461531121a8' controller='notes'>
                          <sitenode title='nouvelle note' action='new' id='c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71' controller='notes'/>
                          <sitenode title='mettre a jour une note' action='update' id='863bbcd94a3e2a3e3c027d771f781a863b945b8e' controller='notes'/>
                        </sitenode>
                  </sitenode>
            </sitemap>
          eos
          
         sitemap = Sitemap.new(xml, false)
         
         node = sitemap.find("4e3ee6c5f80d873cc779e08fa5985da5d591e0e8")
         
         assert node.attributes.get_attribute("title").value == "affaire en cours"
  end
  
  test "Should get sitemap" do
     xml =<<-eos
             <sitemap title="root">
                  <sitenode title='affaire' action='index' id='a3be3d411a3ae096c9e8d987b0ae7a820d0d6817' controller='affaires'>
                        <sitenode title='nouvelle affaire' action='new' id='2c6ab05d9197ff7c671e892e9345ff6484cf102c' controller='affaires'/>
                        <sitenode title='affaire en cours' action='index' id='4e3ee6c5f80d873cc779e08fa5985da5d591e0e8' controller='affaires'/>
                        <sitenode title='mettre jours' action='update' id='1cb460b9a293833fb1d83edcfa352db82784e9c7' controller='affaires'/>
                        <sitenode title='note' action='index' id='c0df735ed47e7efac8b549a65a308461531121a8' controller='notes'>
                          <sitenode title='nouvelle note' action='new' id='c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71' controller='notes'/>
                          <sitenode title='mettre a jour une note' action='update' id='863bbcd94a3e2a3e3c027d771f781a863b945b8e' controller='notes'/>
                        </sitenode>
                  </sitenode>
            </sitemap>
          eos
          
      sitemap = Sitemap.new(xml, false)
      
      nodes = sitemap.sitemap("c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71")
      
      assert nodes[1].attributes.get_attribute("title").value == "root"
      assert nodes[2].attributes.get_attribute("title").value == "affaire"
      assert nodes[3].attributes.get_attribute("title").value == "note"
      assert nodes[4].attributes.get_attribute("title").value == "nouvelle note"
          
  end
  
  test "Should get id" do
         xml =<<-eos
             <sitemap title="root">
                  <sitenode title='affaire' action='index' id='a3be3d411a3ae096c9e8d987b0ae7a820d0d6817' controller='affaires'>
                        <sitenode title='nouvelle affaire' action='new' id='2c6ab05d9197ff7c671e892e9345ff6484cf102c' controller='affaires'/>
                        <sitenode title='affaire en cours' action='index' id='4e3ee6c5f80d873cc779e08fa5985da5d591e0e8' controller='affaires'/>
                        <sitenode title='mettre jours' action='update' id='1cb460b9a293833fb1d83edcfa352db82784e9c7' controller='affaires'/>
                        <sitenode title='note' action='index' id='c0df735ed47e7efac8b549a65a308461531121a8' controller='notes'>
                          <sitenode title='nouvelle note' action='new' id='c7b6d7afc931b3bc0b25cf6a1b96c6351ff8ad71' controller='notes'/>
                          <sitenode title='mettre a jour une note' action='update' id='863bbcd94a3e2a3e3c027d771f781a863b945b8e' controller='notes'/>
                        </sitenode>
                  </sitenode>
            </sitemap>
          eos
  
    sitemap = Sitemap.new(xml, false)
    
    assert sitemap.id(sitemap.first) == "a3be3d411a3ae096c9e8d987b0ae7a820d0d6817"
       
  end
end