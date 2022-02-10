# frozen_string_literal: true

class GuitarsController < ApplicationController
  def index
    @guitars = Guitar.all
  end

  def new
    @guitar = Guitar.new
  end

  def show
    @guitar = Guitar.find(params[:id])
  end

  def create
    @guitar = Guitar.new(guitar_params)

    @guitar.valid?
    @guitar.errors.full_messages
    respond_to do |format|
      if @guitar.save
        format.html do
          redirect_to guitars_url,
                      notice: 'Guitar was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    guitar = Guitar.find(params[:id])
    guitar.destroy

    respond_to do |format|
      format.html { redirect_to guitars_url, notice: 'Guitar was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def guitar_params
    params.require(:guitar).permit(:model, :year, :is_available, :stolen)
  end
end
