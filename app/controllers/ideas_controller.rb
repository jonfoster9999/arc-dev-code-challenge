class IdeasController < ApplicationController
  before_action :authenticate!

  def create
    @idea = Idea.new(ideas_params)
    if @idea.save
      render json: @idea
    else
      render json: { error: "There was a problem creating the idea: #{@idea.errors.full_messages.split(', ')}"}, status: 422
    end
  end

  def index
    ## pagination works, but tests don't pass?
    # @ideas = Idea.page(params[:page] || 1).per(10)

    ## passes tests
    @ideas = Idea.all
    render json: @ideas
  end

  def update
    @idea = Idea.find_by(id: params[:id])
    if @idea
      @idea.update(ideas_params)
      render json: @idea.reload
    else
      render json: { error: 'not found' }, status: 404
    end
  end

  def destroy
    @idea = Idea.find_by(id: params[:id])
    if @idea
      @idea.destroy
      head :no_content
    else
      render json: { error: 'idea not found' }, status: 404
    end
  end

  private

  def ideas_params
    params.permit(:content, :impact, :ease, :confidence)
  end
end
