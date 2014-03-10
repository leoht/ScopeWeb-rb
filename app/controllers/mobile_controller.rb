class MobileController < ApplicationController
  def watch
    render 'mobile/watch', layout: 'mobile'
  end
end
