# frozen_string_literal: true

# Boards Controller, processes requests and return or redirects the user to the
# corresponding view
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show edit update destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.all
  end

  # GET /boards/1
  # GET /boards/1.json
  def show; end

  # GET /boards/new
  def new
    @board = Board.new
    respond_to do |format|
      format.js
    end
  end

  # POST /boards
  def create
    @board = Board.new(board_params)
    respond_to do |format|
      if @board.save
        format.html { redirect_to @board, alert: { success: 'Board adicionado com sucesso.' } }
      else
        format.html { redirect_to boards_url, alert: { danger: 'Erro ao adicionar Board, tente novamente.' } }
      end
    end
  end

  # GET /boards/1/edit
  def edit; end

  # PATCH/PUT /boards/1
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, alert: { success: 'Board atualizado com sucesso.' } }
      else
        format.html { redirect_to @board, alert: { danger: 'Erro ao atualizar o Board.' } }
      end
    end
  end

  # DELETE /boards/1
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, alert: { success: 'Board removido com sucesso.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:name)
  end
end
