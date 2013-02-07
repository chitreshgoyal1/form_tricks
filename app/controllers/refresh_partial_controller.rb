class RefreshPartialController < ApplicationController
  def index
    @user = User.find_by_id(1)
  end
  
   def load
     @user = User.find_by_id(1)
      render :partial => "dynamic"
   end
   
   def show
     
   end

end