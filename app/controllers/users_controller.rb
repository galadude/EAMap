class UsersController < ApplicationController
    def index
        @users = User.all
        
    end
    
    def make_admin
        
    end
end
