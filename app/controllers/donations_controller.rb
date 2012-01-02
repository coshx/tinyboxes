require 'activemerchant'
require 'money'

class DonationsController < ApplicationController

  include ActiveMerchant::Billing::Integrations

  # Present donate button/form, optionally showing details of fund raiser user
  def donate
    @original_user = User.find_by_donate_token(params[:token])
  end
  
  def create

    ActiveMerchant::Billing::Base.mode = :test

    notify = Paypal::Notification.new(request.raw_post)

    if notify.acknowledge

         begin

          if notify.complete?

            Donation.create!(:amount=> params[:amount].to_f,
                 :user => User.find_by_donate_token(params[:custom]),
                 :fundraiser => User.find_by_donate_token(params[:custom]))

          else
            p "Failed to verify Paypal's notification, please investigate"
          end

        rescue => e
          p "Exception: "+e.message

        ensure
          # what needs to happen if exception?
        end
    else
      p "notify.acknowledge: "+notify.acknowledge
    end

  render :nothing => true
  end

  # Dummy code to add a donation - this works, check donate.html.haml
  def fake_donation
    if params[:donate_token]
      Donation.create!(:amount => params[:amount].to_f, 
                       :user => current_user, 
                       :fundraiser => User.find_by_donate_token(params[:donate_token]))
    end
    render :action => 'thanks'
  end
  
  def thanks
  end
  
end
