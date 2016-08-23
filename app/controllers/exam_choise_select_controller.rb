class ExamChoiseSelectController < ApplicationController
  def new
    respond_to do |format|
      format.json {
        render :json => {:result => 'success'}.to_json
      }
    end
  end

  def update
  end
end
