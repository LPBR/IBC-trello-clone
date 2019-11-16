# frozen_string_literal: true

# Steps Controller, processes requests and return or redirects the user to the
# corresponding view
class StepsController < ApplicationController
  before_action :set_step, only: %i[edit update destroy]

  # PATCH /steps/sort
  def sort
    params[:step].each_with_index do |id, index|
      Step.find(id).update(position: index)
    end

    head :ok
  end

  # GET /steps/new/:board_id
  def new
    @step = Step.new(board_id: params[:board_id])

    respond_to do |format|
      format.js
    end
  end

  # GET /steps/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /steps
  def create
    @step = Step.new(step_params)

    respond_to do |format|
      if @step.save
        format.html { redirect_to @step.board, alert: { success: 'Etapa adicionada com sucesso.' } }
      else
        format.html { redirect_to @step.board, alert: { danger: 'Erro ao adiconar etapa.' } }
      end
    end
  end

  # PATCH/PUT /steps/1
  def update
    respond_to do |format|
      if @step.update(step_params)
        format.html { redirect_to @step.board, alert: { success: 'Etapa atualizada com sucesso.' } }
      else
        format.html { redirect_to @step.board, alert: { danger: 'Erro ao atualizar etapa.' } }
      end
    end
  end

  # DELETE /steps/1
  def destroy
    @step.destroy
    respond_to do |format|
      format.html { redirect_to @step.board, alert: { success: 'Etapa removida com sucesso.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_step
    @step = Step.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list
  # through.
  def step_params
    params.require(:step).permit(:name, :board_id)
  end
end
