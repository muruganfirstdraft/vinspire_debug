class QuotesController < ApplicationController
  def index
    @quotes = Quote.all

    render("quotes/index.html.erb")
  end

  def show
    @quote = Quote.find(params[:id])

    render("quotes/show.html.erb")
  end

  def new
    @quote = Quote.new

    render("quotes/new.html.erb")
  end

  def create
    @quote = Quote.new

    @quote.body = params[:body]
    @quote.author = params[:author]
    @quote.mood_id = params[:mood_id]
    @quote.quote_type = params[:quote_type]

    save_status = @quote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/quotes/new", "/create_quote"
        redirect_to("/quotes")
      else
        redirect_back(:fallback_location => "/", :notice => "Quote created successfully.")
      end
    else
      render("quotes/new.html.erb")
    end
  end

  def edit
    @quote = Quote.find(params[:id])

    render("quotes/edit.html.erb")
  end

  def update
    @quote = Quote.find(params[:id])

    @quote.body = params[:body]
    @quote.author = params[:author]
    @quote.mood_id = params[:mood_id]
    @quote.quote_type = params[:quote_type]

    save_status = @quote.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/quotes/#{@quote.id}/edit", "/update_quote"
        redirect_to("/quotes/#{@quote.id}", :notice => "Quote updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Quote updated successfully.")
      end
    else
      render("quotes/edit.html.erb")
    end
  end

  def destroy
    @quote = Quote.find(params[:id])

    @quote.destroy

    if URI(request.referer).path == "/quotes/#{@quote.id}"
      redirect_to("/", :notice => "Quote deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Quote deleted.")
    end
  end
end
