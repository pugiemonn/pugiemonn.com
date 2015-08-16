class EventsController < ApplicationController
  before_action :authenticate, :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate, except: [:index, :show]

  # GET /events
  # GET /events.json
  def index
    if params[:tag]

    end
    @events = Event.event_lists(params)
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @ticket = current_user && current_user.tickets.find_by(event_id: params[:id])
    #@tickets = @event.tickets.order(:created_at)
    @tickets = @event.tickets.includes(:user).order(:created_at)
  end

  # GET /events/new
  def new
    # 1日に3件までしか作れない
    if Event.where(owner_id: current_user).where("created_at > ?", Time.now - 60 * 60 * 24).count > 2
      redirect_to root_path, notice: "１日に作成できるイベントは３つです。"
    end
    @event = current_user.created_events.build
    @event.service = "pugiemonn"
  end

  # POST /events
  # POST /events.json
  def create
    if Event.where(owner_id: current_user).where("created_at > ?", Time.now - 60 * 60 * 24).count > 2
      redirect_to root_path, notice: "１日に作成できるイベントは３つです。"
    end
    @event = current_user.created_events.build(event_params)

    #binding.pry
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: '作成しました' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /events/1/edit
  def edit
    #binding.pry
    @event = current_user.created_events.find(params[:id])
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = current_user.created_events.find(params[:id])
    respond_to do |format|

      # 参加制限数が、既に発行されているチケット数より少ない場合はエラー
      if event_params["tickets_limit"].to_i < @event.tickets.count
        format.html { redirect_to @event, notice: '参加者の人数以下にイベント上限人数を設定することはできません。' }
        format.json { render json: @event.errors, status: 500 }
      else
        if @event.update(event_params)
          format.html { redirect_to @event, notice: '更新しました' }
          format.json { render :show, status: :ok, location: @event }
        else
          format.html { render :edit }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    #@event = current_user.created_events.find(params[:id])
    #@event.destroy!
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :place, :event_url, :started_at, :ended_at, :catch, :tickets_limit, :tag_list, :service)
    end
end
