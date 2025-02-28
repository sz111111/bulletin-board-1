class BoardsController < ApplicationController
  def index
    @boards = Board.all
    render(template: "boards/index")
  end

  def create
    @board = Board.new(name: params[:name])
    if @board.save
      redirect_to("/boards", notice: "Board created successfully.")
    else
      redirect_to("/boards", alert: @board.errors.full_messages.to_sentence)
    end

    def show
      @board = Board.find_by(id: params[:id])
    
      if @board.nil?
        redirect_to("/boards", alert: "Board not found.")
      else
        render(template: "boards/show")
      end
    end
    
  end

