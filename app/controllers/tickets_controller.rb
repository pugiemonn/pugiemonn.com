class TicketsController < ApplicationController
  before_action :authenticate

  def new
    #raise ActionController::RoutingError, 'ログイン状態でakusesu'
    @event = Event.find(params[:event_id])
  end

  def create

    ticket = current_user.tickets.build do |t|
      t.event_id = params[:event_id]
      t.comment  = params[:ticket][:comment]
    end
    if ticket.save
      flash[:notice] = 'イベントに参加します'
      redirect_to event_path(params[:event_id])
    else
      render json: { messages: ticket.errors.full_messages }, status: 422
    end
  end
end
