class Api::V1::BudgetsController < ApplicationController
  before_action :set_budget, only: [:update, :show, :destroy]

  def index
    @budgets = Budget.all
  end

  def show
    render json: @budget
  end

  def create
    debugger
    @budget = Budget.new(budget_params)
    if @budget.save
      render status: :created, json: { message: "Budget created!"}
    else
      render status: :unprocessable_entity, json: { message: @budget.errors.full_messages }
    end
  end

  def update
    if @budget.update(budget_params)
      render status: :ok, json: { message: "Budget successfully updated" }
    else
      render status: :unprocessable_entity, json: { message: @budget.errors.full_messages }
    end
  end

  def destroy
    if @budget.destroy
      render status: :ok, json: { message: "Budget successfully deleted" }
    else
      render status: :unprocessable_entity, json: { message: @budget.errors.full_messages }
    end
  end

  private
    def budget_params
      # params.require(:data)
      #    .require(:attributes)
      #    .permit(:title, :description)
      params.require(:budget).permit(:month_id, :amount, :user_id).require(:expense).permit(:id, :title, :description)
    end

    def set_budget
      @budget = Budget.find(params[:id])
    end
end
