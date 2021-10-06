class ParticipationsController < ApplicationController

    before_action :authenticate_user!, only: [:create]

    def new
        participation = Participation.new
        @post = Post.find(params[:post_id])
    end

    def show
        @participation = Participation.find(params[:id])        
    end

    def create
        @post = Post.find(params[:post_id])
        @participation = Participation.new(user_id: current_user.id, post_id: @post.id)

        if @participation.save
            flash[:notice] = "Vous êtes bien inscrit"
            redirect_to post_path(@post) 
        else
            redirect_to post_path(@post) 
        end
    end

    def destroy
        @post = Post.find(params[:post_id])
        @participation = Participation.find_by(user_id: current_user.id, post_id: @post)
        @participation.destroy

        if @participation.delete
            flash[:success] = "Vote participation a bien été supprimé"
            redirect_to post_path(@post) 
        else
            flash[:danger] = "Votre participation n'a pas pu être supprimé, veuillez rééssayer ultérieurement"
            redirect_to root_path
        end
    end      
end
