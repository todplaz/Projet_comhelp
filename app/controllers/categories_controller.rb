class CategoriesController < ApplicationController

    def show
        @category = Category.find_by_id(params[:id])
        @post = Post.where(:category_id => @category.id)  
    end

end
