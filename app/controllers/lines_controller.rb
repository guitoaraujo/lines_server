class LinesController < ApplicationController
  def show
    result = LinesService.new(line_params[:id]).call

    if result.nil?
      head 413
    else
      render json: result
    end
  end

  private

  def line_params
    params.permit(:id)
  end
end
