# frozen_string_literal: true

# Tasks Controller, processes requests and return or redirects the user to the
# corresponding view
class TasksController < ApplicationController
  before_action :set_task, only: %i[edit update destroy]

  # PATCH /tasks/sort/:step_id
  def sort
    params[:task].each_with_index do |id, index|
      Task.find(id).update(position: index, step_id: params[:step_id])
    end

    head :ok
  end

  # GET /tasks/new/:step_id
  def new
    @task = Task.new(step_id: params[:step_id])

    respond_to do |format|
      format.js
    end
  end

  # GET /tasks/1/edit
  def edit
    respond_to do |format|
      format.js
    end
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task.step.board, alert: { success: 'Tarefa adicionada com sucesso.' } }
      else
        format.html { redirect_to @task.step.board, alert: { danger: 'Erro ao adicionar tarefa.' } }
      end
    end
  end

  # PATCH/PUT /tasks/1
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task.step.board, alert: { success: 'Tarefa atualizada com sucesso.' }}
      else
        format.html { redirect_to @task.step.board, alert: { danger: 'Erro ao atualizar tarefa.' } }
      end
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to @task.step.board, alert: { success: 'Tarefa removida com sucesso.' } }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def task_params
    params.require(:task).permit(:content, :step_id)
  end
end
