# frozen_string_literal: true

require 'rails_helper'

RSpec.describe StepsController, type: :controller do
  board = Board.create! name: 'Board1' 

  let(:valid_attributes) {
    { name: 'Step1',
      board_id: board.id }
  }

  let(:invalid_attributes) {
    { name: nil,
      board_id: board.id }
  }

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: { board_id: board.id }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      step = Step.create! valid_attributes
      get :edit, params: { id: step.to_param }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Step' do
        expect {
          post :create, params: { step: valid_attributes }
        }.to change(Step, :count).by(1)
      end

      it "redirects to the step's board" do
        post :create, params: { step: valid_attributes }
        expect(response).to redirect_to(Step.last.board)
      end
    end

    context 'with invalid params' do
      it "redirects to the step's board" do
        post :create, params: { step: invalid_attributes }
        expect(response).to redirect_to board_path(invalid_attributes[:board_id])
      end
    end
  end

  describe 'PATCH #sort' do
    it 'updates the steps order' do
      step1 = Step.create! valid_attributes
      step2 = Step.create! valid_attributes
      patch :sort, params: { step: [step2.id, step1.id] }
      step1.reload
      step2.reload
      expect(step1.position).to eq(1)
      expect(step2.position).to eq(0)
    end

    it 'returns a success response' do
      step1 = Step.create! valid_attributes
      step2 = Step.create! valid_attributes
      patch :sort, params: { step: [step2.id, step1.id] }
      expect(response).to be_successful
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'Step2' }
      }

      it 'updates the requested step' do
        step = Step.create! valid_attributes
        put :update, params: {id: step.to_param, step: new_attributes}
        step.reload
        new_attributes.each_pair do |key, value|
          expect(step[key]).to eq(value)
        end
      end

      it "redirects to the step's board" do
        step = Step.create! valid_attributes
        put :update, params: { id: step.to_param, step: valid_attributes }
        expect(response).to redirect_to(step.board)
      end
    end

    context 'with invalid params' do
      it "redirects to the step's board" do
        step = Step.create! valid_attributes
        put :update, params: {id: step.to_param, step: invalid_attributes}
        expect(response).to redirect_to(step.board)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested step' do
      step = Step.create! valid_attributes
      expect {
        delete :destroy, params: { id: step.to_param }
      }.to change(Step, :count).by(-1)
    end

    it "redirects to the step's board" do
      step = Step.create! valid_attributes
      delete :destroy, params: { id: step.to_param }
      expect(response).to redirect_to(step.board)
    end
  end
end
