class PostsController < ApplicationController
  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      expires_on: params[:expires_on],
      board_id: params[:board_id]
    )

    if @post.valid?
      @post.save
      redirect_to("/boards/#{@post.board_id}", notice: "Post created successfully.")
    else
      redirect_to("/boards/#{@post.board_id}", alert: @post.errors.full_messages.to_sentence)
    end
  end
end
