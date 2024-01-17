# spec/controllers/contacts_controller_spec.rb
require 'rails_helper'

RSpec.describe ContactsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all contacts to @contacts' do
      contact = create(:contact)
      get :index
      expect(assigns(:contacts)).to eq([contact])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    let(:contact) { create(:contact) }

    it 'assigns the requested contact to @contact' do
      get :show, params: { id: contact.id }
      expect(assigns(:contact)).to eq(contact)
    end

    it 'renders the show template' do
      get :show, params: { id: contact.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns a new contact to @contact' do
      get :new
      expect(assigns(:contact)).to be_a_new(Contact)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { contact: attributes_for(:contact) } }

    context 'with valid parameters' do
      it 'creates a new contact' do
        expect {
          post :create, params: valid_params
        }.to change(Contact, :count).by(1)
      end

      it 'redirects to the created contact' do
        post :create, params: valid_params
        expect(response).to redirect_to(Contact.last)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { contact: { email: nil } } }

      it 'does not create a new contact' do
        expect {
          post :create, params: invalid_params
        }.not_to change(Contact, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    let(:contact) { create(:contact) }

    it 'assigns the requested contact to @contact' do
      get :edit, params: { id: contact.id }
      expect(assigns(:contact)).to eq(contact)
    end

    it 'renders the edit template' do
      get :edit, params: { id: contact.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:contact) { create(:contact) }
    let(:update_params) { { id: contact.id, contact: { description: 'Updated description' } } }

    context 'with valid parameters' do
      it 'updates the contact' do
        patch :update, params: update_params
        contact.reload
        expect(contact.description).to eq('Updated description')
      end

      it 'redirects to the updated contact' do
        patch :update, params: update_params
        expect(response).to redirect_to(contact)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_params) { { id: contact.id, contact: { email: nil } } }

      it 'does not update the contact' do
        original_description = contact.description
        patch :update, params: invalid_params
        contact.reload
        expect(contact.description).to eq(original_description)
      end

      it 'renders the edit template' do
        patch :update, params: invalid_params
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    let(:contact) { create(:contact) }

    it 'destroys the contact' do
      expect {
        delete :destroy, params: { id: contact.id }
      }.to change(Contact, :count).by(-1)
    end

    it 'redirects to the contacts index' do
      delete :destroy, params: { id: contact.id }
      expect(response).to redirect_to(contacts_path)
    end
  end
end
