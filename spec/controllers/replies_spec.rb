# spec/controllers/replies_controller_spec.rb
require 'rails_helper'

RSpec.describe RepliesController, type: :controller do
  let(:contact) { create(:contact) }
  let(:reply) { create(:reply, contact: contact) }

  describe 'GET #show' do
    it 'assigns the requested reply to @reply' do
      get :show, params: { contact_id: contact.id, id: reply.id }
      expect(assigns(:reply)).to eq(reply)
    end

    it 'renders the show template' do
      get :show, params: { contact_id: contact.id, id: reply.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested reply to @reply' do
      get :edit, params: { contact_id: contact.id, id: reply.id }
      expect(assigns(:reply)).to eq(reply)
    end

    it 'renders the edit template' do
      get :edit, params: { contact_id: contact.id, id: reply.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:update_params) { { reply: { content: 'Updated content' }, contact_id: contact.id, id: reply.id } }

    context 'with valid parameters' do
      it 'updates the reply' do
        patch :update, params: update_params
        reply.reload
        expect(reply.content).to eq('Updated content')
      end

      it 'redirects to the updated reply' do
        patch :update, params: update_params
        expect(response).to redirect_to(reply)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { reply: { content: nil }, contact_id: contact.id, id: reply.id } }

      it 'does not update the reply' do
        original_content = reply.content
        patch :update, params: invalid_params
        reply.reload
        expect(reply.content).to eq(original_content)
      end

      it 'renders the edit template' do
        patch :update, params: invalid_params
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the reply' do
      expect {
        delete :destroy, params: { contact_id: contact.id, id: reply.id }
      }.to change(Reply, :count).by(-1)
    end

    it 'redirects to the contacts index' do
      delete :destroy, params: { contact_id: contact.id, id: reply.id }
      expect(response).to redirect_to(contact_replies_path(contact))
    end
  end
end
