class WidgetController < ApplicationController

  def index
    item = Widget.get_widgets
    @item = ENV['API_KEY']
  end

  def show
  end
end
