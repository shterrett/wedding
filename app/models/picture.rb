class Picture
  include ActiveModel::Validations
  include ActiveModel::Conversion
  
  attr_accessor :url, :title
  
  def initialize(entry)
    @url = entry.content.src
    @title = entry.title    
  end
end