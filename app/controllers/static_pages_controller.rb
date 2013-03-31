class StaticPagesController < ApplicationController
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
  
end
