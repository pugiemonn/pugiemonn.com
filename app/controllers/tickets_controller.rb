class TicketsController < ApplicationController
  before_action :authenticate

  def new
    #raise ActionController::RoutingError, 'ログイン状態でakusesu'
    @event = Event.find(params[:event_id])
  end

  def create

    # 上限に達していたらチケットは購入できない
    if Event.find(params[:event_id]).limit <= Ticket.where(event_id: params[:event_id]).count
      flash[:notice] = 'イベントの空き枠がありません。'
    else
      ticket = current_user.tickets.build do |t|
        t.event_id = params[:event_id]
        t.comment  = params[:ticket][:comment]
      end

      if ticket.save
        flash[:notice] = 'イベントに参加します'
      end
    end
    redirect_to event_path(params[:event_id])
  end

  def destroy
    ticket = current_user.tickets.find_by!(event_id: params[:event_id])
    ticket.destroy!
    redirect_to event_path(params[:event_id]), notice: 'このイベントキャンセルしました'
  end
end
