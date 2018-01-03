require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  let(:item) { FactoryBot.create(:item) }
  describe 'GET index' do
    it 'should response with a 200 status' do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "assigns @items" do
      items = FactoryBot.create_list(:item, 3)
      get :index, format: :json
      expect(assigns(:items)).to match_array(Item.all)
    end

    it "should response format json" do
      get :index, format: :json
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "GET show" do
    it "should assigns @item" do
      get :show, params: { id: item.to_param }, format: :json
      expect(assigns(:item)).to eq item
    end

    it "should response with json format" do
      get :show, params: { id: item.to_param }, format: :json
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'PUT update' do
    let(:new_attributes) { FactoryBot.attributes_for(:item) }
    context 'when update was successfully' do
      it 'should update the resource' do
        put :update, params: { id: item.to_param, item: new_attributes }
        item.reload
        expect(response).to have_http_status(200)
        expect(item.amount).to eq new_attributes[:amount].to_f
        expect(item.budget_id).to eq new_attributes[:budget_id]
        expect(item.description).to eq new_attributes[:description]
      end
    end
    context 'when update was unsuccessful' do
      it 'should not update the resource' do
        allow_any_instance_of(Item).to receive(:update).and_return(false)
        put :update, params: { id: item.to_param, item: new_attributes }
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

  describe 'POST create' do
    let(:new_item) { FactoryBot.attributes_for(:item) }

    context 'when create was successfully' do
      it 'should create item and return a 201 http status code ' do
        expect { post :create, params: { item: new_item } }.to change(Item, :count).by(1)
        expect(response).to have_http_status(201) #create
      end
    end
    context 'when create was unsuccessful' do
      it 'should not create item' do
        allow_any_instance_of(Item).to receive(:save).and_return(false)
        post :create, params: { item: new_item }, format: :json
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when destroy was successfully' do
      it 'should delete item' do
        delete :destroy, params: { id: item.to_param }, format: :json
        expect(response).to have_http_status(200)
      end
    end
    context 'when update was unsuccessful' do
      it 'should not update the resource' do
        allow_any_instance_of(Item).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: item.to_param }, format: :json
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

end
