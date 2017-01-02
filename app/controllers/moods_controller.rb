class MoodsController < ApplicationController
  def index
    @q = Mood.ransack(params[:q])
    @moods = @q.result(:distinct => true).includes(:devotional_quote).page(params[:page]).per(10)

    render("moods/index.html.erb")
  end

  def show
    @mood = Mood.find(params[:id])

    render("moods/show.html.erb")
  end

  def new
    @mood = Mood.new

    render("moods/new.html.erb")
  end

  def create
    @mood = Mood.new

    @mood.mood_choice = params[:mood_choice]

    save_status = @mood.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/moods/new", "/create_mood"
        redirect_to("/moods")
      else
        redirect_back(:fallback_location => "/", :notice => "Mood created successfully.")
      end
    else
      render("moods/new.html.erb")
    end
  end

  def edit
    @mood = Mood.find(params[:id])

    render("moods/edit.html.erb")
  end

  def update
    @mood = Mood.find(params[:id])

    @mood.mood_choice = params[:mood_choice]

    save_status = @mood.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/moods/#{@mood.id}/edit", "/update_mood"
        redirect_to("/moods/#{@mood.id}", :notice => "Mood updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Mood updated successfully.")
      end
    else
      render("moods/edit.html.erb")
    end
  end

  def destroy
    @mood = Mood.find(params[:id])

    @mood.destroy

    if URI(request.referer).path == "/moods/#{@mood.id}"
      redirect_to("/", :notice => "Mood deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Mood deleted.")
    end
  end
end
