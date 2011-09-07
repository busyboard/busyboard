require 'digest/sha1'
require 'rexml/document'

include REXML

#
# => Class Sitemap
# => The class siteamp load and manage the sitemap.xml
# => file that show the structure of the site
#
class Sitemap
  attr_accessor :sitemap
  attr_accessor :currentMenuId
  
  #
  # => Default constructor
  # => xml: Can be a file to load or a xml string
  # => generateId: by default true will generate automatically the ids. 
  # => If false the id will not be generated
  def initialize(xml, generateIds = true)     
      load(xml, generateIds)
  end
  
  
  def currentMenuId=(value)
    @currentMenuId = value
  end

   
  #
  # => This method will go through each child element of the
  # => the root element exucte a block of code on each 
  # => element.
  # 
  def each_element
     @sitemap.root.each_element{ |node|
        yield node
     }
  end
   
  #
  # => Return the elements below the root element
  # 
  def top_elements
     @sitemap.root.elements
  end
  
  #
  # => Return the first element
  #
  def first
    @sitemap.root.elements[1]
  end
  
  #
  # => Return the field id of a sitenode
  #
  def id(node)
      node.attributes.get_attribute("id").value
  end
  
  #
  # => Get all children of the element corresponding to the given id
  #
  def children(uid)
    node = find(uid)
    node.elements
  end
  
  #
  # => Return the element with the given id
  #
  def find(uid)
    XPath.first(@sitemap, "//sitenode[@id='%s']" % uid)
  end
  
  #
  # => This method will return an array
  # => cotaining the list of element from the
  # => the root to the selected menu
  #
  def sitemap(uid)
      siteMapNodes = []
      node = XPath.first(@sitemap, "//sitenode[@id='%s']" % uid)
      siteMapNodes << node
      
      while node = node.parent
         siteMapNodes << node
      end
      
      siteMapNodes.reverse
  end
  
  #
  # => Return the structure in a string
  # 
  def to_string
       @sitemap.root.to_s
  end 
   
  #
  # => The load methos will load the xml sitemap
  # => end will give to each element a unique id.
  # => This id will help to identify in the menu
  # => that has been selected in the client side
  #
  def load(xml, generateIds = true) 
    
    if File.file?(xml)
      file = File.new(xml) 
     else
       file = xml 
    end
      
    @sitemap = Document.new(file)
    
    update_id(@sitemap.root) if generateIds                      
  end
  
  
  private
  
  #
  # => Recursive methos that goes through all children of the
  # => xml file and add a unique id
  #
  def update_id(elem)
       
      elem.each_element{ |node|               
        #set a unique id to all  menu that will be used by the 
        #client to link the menu to the id
        uid = Digest::SHA1.hexdigest Time.now.to_s + rand(rand(1000000000)).to_s     
        node.add_attribute('id', uid)
      
        if node.has_elements?
           update_id(node)
        end
      }
        
  end 
   
end
