# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:valid_attributes) {
    { name: 'Board Teste' }
  }

  let(:invalid_attributes) {
    { name: nil }
  }

  describe 'GET #index' do
    it 'returns a success response' do
      Board.create! valid_attributes
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      board = Board.create! valid_attributes
      get :show, params: { id: board.to_param }
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      board = Board.create! valid_attributes
      get :edit, params: { id: board.to_param }, xhr: true
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Board' do
        expect {
          post :create, params: { board: valid_attributes }
        }.to change(Board, :count).by(1)
      end

      it 'redirects to the created board' do
        post :create, params: { board: valid_attributes }
        expect(response).to redirect_to(Board.last)
      end
    end

    context 'with invalid params' do
      it 'redirects to the boards list' do
        post :create, params: { board: invalid_attributes }
        expect(response).to redirect_to(boards_url)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) {
        { name: 'Updated Board' }
      }

      it 'updates the requested board' do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: new_attributes }
        board.reload
        new_attributes.each_pair do |key, value|
          expect(board[key]).to eq(value)
        end
      end

      it 'redirects to the board' do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: valid_attributes }
        expect(response).to redirect_to(board)
      end
    end

    context 'with invalid params' do
      it 'redirects to the board' do
        board = Board.create! valid_attributes
        put :update, params: { id: board.to_param, board: invalid_attributes }
        expect(response).to redirect_to(board)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested board' do
      board = Board.create! valid_attributes
      expect {
        delete :destroy, params: { id: board.to_param }
      }.to change(Board, :count).by(-1)
    end

    it 'redirects to the boards list' do
      board = Board.create! valid_attributes
      delete :destroy, params: { id: board.to_param }
      expect(response).to redirect_to(boards_url)
    end
  end
end
