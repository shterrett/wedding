class StaticPagesController < ApplicationController
  require 'rss'
  
  before_filter :authenticate, only: :admin
  
  def home
  end
  
  def music
  end
  
  def menu
  end
  
  def dress
  end
  
  def admin
  end
  
  def us
  end
  
  def program
    render "program", layout: "program_layout"
  end
  
  def references 
    render "references", layout: "program_layout"
  end
  
  def pictures
    @pictures = []
    url = URI.encode "https://picasaweb.google.com/data/feed/base/user/103984822489723291603/albumid/5869248863185754529"
    feed = open(url) { |rss| RSS::Parser.parse rss }
    feed.entries.each do |entry| 
      @pictures << Picture.new(entry) 
    end
  end
  
end
