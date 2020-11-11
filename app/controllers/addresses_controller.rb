require 'pp'

class AddressesController < ApplicationController
  def index
    @address = Address.includes(:province).find(current_user.address_id)
  end

  def new
    @provinces = Province.all
  end

  def create
    address = Address.create(first_line:  params[:address][:first_line],
                             second_line: params[:address][:second_line],
                             city:        params[:address][:city],
                             zipcode:     params[:address][:zipcode],
                             province_id: params[:address][:province].to_i)
    return unless address.save!

    user = User.find(current_user.id)
    user.update(address_id: address.id)
    redirect_to "/cart"
  end
end
