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
end
