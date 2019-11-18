# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  board = Board.create! name: 'Board1'
  step = Step.create! name: 'Step1', board_id: board.id

  let(:valid_attributes) {
    { content: 'Task1', step_id: step.id }
  }

  let(:invalid_attributes) {
    { content: nil, step_id: step.id }
  }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { step_id: step.to_param }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      task = Task.create! valid_attributes
      get :edit, params: { id: task.to_param }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Task' do
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the task's board" do
        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(Task.last.step.board)
      end
    end

    context 'with invalid params' do
      it "redirects to the task's board" do
        post :create, params: { task: invalid_attributes }
        expect(response).to redirect_to step.board
      end
    end
  end

  describe 'PATCH #sort' do
    it 'updates the tasks order' do
      task1 = Task.create! valid_attributes
      task2 = Task.create! valid_attributes
      patch :sort, params: { task: [task2.id, task1.id], step_id: step }
      task1.reload
      task2.reload
      expect(task1.position).to eq(1)
      expect(task2.position).to eq(0)
    end

    it 'updates the tasks step' do
      task1 = Task.create! valid_attributes
      task2 = Task.create! valid_attributes
      step2 = Step.create! name: 'Step2', board: board
      patch :sort, params: { task: [task2.id, task1.id], step_id: step2.id }
      task1.reload
      task2.reload
      expect(task1.position).to eq(1)
      expect(task2.position).to eq(0)
      expect(task1.step_id).to eq(step2.id)
      expect(task2.step_id).to eq(step2.id)
    end

    it 'returns a success response' do
      task1 = Task.create! valid_attributes
      task2 = Task.create! valid_attributes
      patch :sort, params: { task: [task2.id, task1.id], step_id: step.id }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { content: 'Task2', step_id: step.id }
      }

      it 'updates the requested task' do
        task = Task.create! valid_attributes
        put :update, params: {id: task.to_param, task: new_attributes}
        task.reload
        new_attributes.each do |key, value|
          expect(task[key]).to eq(value)
        end
      end

      it "redirects to the task's board" do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: valid_attributes }
        expect(response).to redirect_to(task.step.board)
      end
    end

    context 'with invalid params' do
      it "redirects top the task's board" do
        task = Task.create! valid_attributes
        put :update, params: { id: task.to_param, task: invalid_attributes }
        expect(response).to redirect_to(task.step.board)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested task' do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, params: { id: task.to_param }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the task's board" do
      task = Task.create! valid_attributes
      delete :destroy, params: { id: task.to_param }
      expect(response).to redirect_to(task.step.board)
    end
  end

end
