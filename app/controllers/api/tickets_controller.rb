class Api::TicketsController < ApiController
  def show
    @ticket = Ticket.find(params[:id])

    render json: @ticket
  end
end
