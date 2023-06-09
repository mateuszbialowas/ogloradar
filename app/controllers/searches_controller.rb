# frozen_string_literal: true

class SearchesController < AuthenticatedController
  add_breadcrumb 'Dashboard', :root_path, options: { icon: :dashboard }
  add_breadcrumb 'Wyszukiwania', :searches_path, only: %i[index new show edit]

  def index
    q = policy_scope(Search).ransack(params[:q])
    q.sorts = 'created_at desc' if q.sorts.empty?
    pagy, searches = pagy(q.result(distinct: true))
    render 'searches/index', locals: { searches:, pagy:, q: }
  end

  def show
    search = policy_scope(Search).find(params[:id])
    add_breadcrumb "Wyszukiwanie: #{search.name}"

    render 'searches/show', locals: { search: }
  end

  def new
    add_breadcrumb 'Nowe wyszukiwanie'

    search = Search.new
    render 'searches/new', locals: { search: }
  end

  def edit
    search = policy_scope(Search).find(params[:id])
    add_breadcrumb "Edycja wyszukiwania: #{search.name}"

    render 'searches/edit', locals: { search: }
  end

  def create # rubocop:disable Metrics/AbcSize
    result = Searches::Create.new(current_user:, params: search_params).call
    if result.success?
      redirect_to search_url(result.success[:search]), notice: 'Wyszukiwanie zostało utworzone.'
    else
      flash.now[:error] = result.failure[:message]
      render 'searches/update', locals: { search: result.failure[:search] }
    end
  end

  def update # rubocop:disable Metrics/AbcSize
    result = Searches::Update.new(current_user:, params: search_params, search_id: params[:id]).call

    if result.success?
      redirect_to search_url(result.success[:search]), notice: 'Wyszukiwanie zostało zaktualizowane.'
    else
      flash.now[:error] = result.failure[:message]
      render 'searches/update', locals: { search: result.failure[:search] }
    end
  end

  def destroy
    result = Searches::Destroy.new(current_user:, search_id: params[:id]).call
    if result.success?
      redirect_to searches_url, notice: 'Wyszukiwanie zostało usunięte.'
    else
      redirect_to searches_url, notice: result.failure[:message]
    end
  end

  private

  def search_params
    params.require(:search).permit(:name, :uri, :status)
  end
end
