class ExamsController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def list
    respond_to do |format|
      format.json {
        render :json => Exam.all.to_json
      }
    end
  end
end
