class ComunicatorsController < ApplicationController
  def new
    @comunicator = Comunicator.new
  end

  def create
    params[:comunicator][:emails] = Ong.all_emails_text if params[:comunicator][:emails] == 'all'
    @comunicator = Comunicator.new(params[:comunicator])
    @comunicator.ong = Ong.find(Ong.find params[:ong_id])

    @comunicator.request = request
    if @comunicator.deliver
      flash.now[:notice] = 'Obrigado pelo seu Feedback :)'
    else
      flash.now[:error] = 'Mensagem não pode ser entregue :/'
      render :new
    end
  end
end
