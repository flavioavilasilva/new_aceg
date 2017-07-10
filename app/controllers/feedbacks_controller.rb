class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])
    @feedback.request = request
    if @feedback.deliver
      flash.now[:notice] = 'Obrigado pelo seu Feedback :)'
    else
      flash.now[:error] = 'Mensagem não pode ser entregue :/'
      render :new
    end
  end
end
