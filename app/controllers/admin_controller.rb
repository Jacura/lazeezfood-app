class AdminController < ApplicationController
     
        def login
          if request.post?
             puts "==========================#{params}"
             if params[:username]=="admin" && params[:password]=="pass"
              session[:admin] = "admin"
              redirect_to :controller => "stores"  
             else
               flash[:notice] = "Invalid username/password"
               render :action => :login
             end
          end
        end
      
        def logout 
          session[:admin] = nil
          flash[:notice] = "U are logout"
          redirect_to :action=>"login"
        end
    
      
end


