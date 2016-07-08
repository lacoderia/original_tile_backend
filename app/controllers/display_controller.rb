class DisplayController < ApplicationController

  def index
    test = {test: "ok"}
    render json: TestSerializer.serialize(test)
  end

end
