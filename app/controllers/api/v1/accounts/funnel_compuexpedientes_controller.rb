class Api::V1::Accounts::FunnelCompuexpedientesController < Api::V1::Accounts::BaseController
  skip_around_action :switch_locale_using_account_locale
  skip_around_action :switch_locale
  before_action :current_account
  before_action :fetch_funnel, except: [:index, :create]

  def index
    funnels = Current.account.funnel_compuexpedientes
    data = []
    funnels.each do |funnel|
      data << funnel_details(funnel)
    end
    render json: { data: data }, status: :ok
  end

  def show
    render json: { data: funnel_details(@funnel) }, status: :ok
  end

  def create
    @funnel = Current.account.funnel_compuexpedientes.new(permitted_params)
    if @funnel.save
      render json: { message: 'Funnel created successfully', data: funnel_details(@funnel) }, status: :created
    else
      render json: { error: @funnel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @funnel.update(permitted_params)
      render json: { message: 'Funnel updated successfully', data: funnel_details(@funnel) }, status: :ok
    else
      render json: { error: @funnel.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @funnel.destroy
      render json: { message: 'Funnel deleted successfully' }, status: :ok
    else
      render json: { error: 'Failed to delete the funnel' }, status: :unprocessable_entity
    end
  end

  private

  def fetch_funnel
    @funnel = Current.account.funnel_compuexpedientes.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Funnel not found' }, status: :not_found
  end

  def permitted_params
    params.require(:funnel_compuexpediente).permit(:funnel_url)
  end

  def funnel_details(funnel)
    {
      id: funnel.id,
      account_id: funnel.account_id,
      account_name: funnel.account&.name,
      funnel_url: funnel.funnel_url,
      created_at: funnel.created_at,
      updated_at: funnel.updated_at
    }
  end
end
