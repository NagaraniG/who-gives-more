class MainsController < ApplicationController
 # skip_before_action :require_login? ,only:[:index]

  def index
    @donations=Donation.all
    @total_amount=Donation.sum(:amount)
  end

  def show
  end
end
