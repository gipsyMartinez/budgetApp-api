require 'rails_helper'

RSpec.describe Api::V1::BudgetsController, type: :controller do
  let(:budget) { FactoryBot.create(:budget) }

  describe 'GET index' do
    it 'should response with a 200 status' do
      get :index, format: :json
      expect(response).to have_http_status(200)
    end

    it "assigns @budgets" do
      budgets = FactoryBot.create_list(:budget, 3)
      get :index, format: :json
      expect(assigns(:budgets)).to match_array(Budget.all)
    end

    it "should response format json" do
      get :index, format: :json
      expect(response.content_type).to eq("application/json")
    end
  end

  describe "GET show" do
    it "should assigns @budget" do
      get :show, params: { id: budget.to_param }, format: :json
      expect(assigns(:budget)).to eq budget
    end

    it "should response with json format" do
      get :show, params: { id: budget.to_param }, format: :json
      expect(response.content_type).to eq("application/json")
    end
  end

  describe 'PUT update' do
    let(:new_attributes) { FactoryBot.attributes_for(:budget) }
    context 'when update was successfully' do
      it 'should update the resource' do
        put :update, params: { id: budget.to_param, budget: new_attributes }, format: :json
        budget.reload
        expect(response).to have_http_status(200)
        expect(budget.amount).to eq new_attributes[:amount].to_f
        expect(budget.month_id).to eq new_attributes[:month_id]
        expect(budget.expense_id).to eq new_attributes[:expense][:expense_id]
      end
    end
    context 'when update was unsuccessful' do
      it 'should not update the resource' do
        allow_any_instance_of(Budget).to receive(:update).and_return(false)
        put :update, params: { id: budget.to_param, budget: new_attributes }, format: :json
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

  describe 'POST create' do
    let(:new_budget) { FactoryBot.attributes_for(:budget) }
    context 'when create was successfullyt' do
      it 'should create budget and return a 201 http status code ' do
        #debugger
        #attributes = JSON.parse(new_budget.to_json)
        expect { post :create, params: { budget: attributes }, format: :json }.to change(Budget, :count).by(1)
        expect(response).to have_http_status(201) #create
      end
    end
    context 'when create was unsuccessful' do
      it 'should not create budget' do
        allow_any_instance_of(Budget).to receive(:save).and_return(false)
        post :create, params: { budget: new_budget }, format: :json
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

  describe 'DELETE destroy' do
    context 'when destroy was successfully' do
      it 'should delete budget' do
        delete :destroy, params: { id: budget.to_param }, format: :json
        expect(response).to have_http_status(200)
      end
    end
    context 'when update was unsuccessful' do
      it 'should not update the resource' do
        allow_any_instance_of(Budget).to receive(:destroy).and_return(false)
        delete :destroy, params: { id: budget.to_param }, format: :json
        expect(response).to have_http_status(422) #unprocessable_entity
      end
    end
  end

end
