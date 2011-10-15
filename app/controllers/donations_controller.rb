require 'activemerchant'
require 'money'

class DonationsController < ApplicationController
  include ActiveMerchant::Billing::Integrations
  
  # Present donate button/form, optionally showing details of fund raiser user
  def donate
    @original_user = User.find_by_donate_token(params[:token])
  end
  
  # Paypal instant payment notification
  def ipn
    # Create a notify object we must
    notify = Paypal::Notification.new(request.raw_post)

    #we must make sure this transaction id is not already completed

    if notify.acknowledge
        begin
            # if notify.complete?
        end
    else
        # another reason to be suspicious
    end

    render :nothing => true
  end
  
  # Dummy code to add a donation
  def fake_donation
    if params[:donate_token]
      User.transaction do
        @original_user = User.find_by_donate_token(params[:donate_token])
        if @original_user
          @original_user.update_attribute(:money, @original_user.money + params[:amount].to_i)
        end
      end
    end
    render :action => 'thanks'
  end
  
  def thanks
  end
  
end
