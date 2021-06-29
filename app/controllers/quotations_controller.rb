class QuotationsController < ApplicationController
  before_action :set_quotation, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  helper_method :current_user
  include Rails.application.routes.url_helpers


  # GET /quotations or /quotations.json
  def index
    @quotations = Quotation.all
  end

  # GET /quotations/1 or /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
  end

  # GET /quotations/1/edit
  def edit
  end

  # POST /quotations or /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)
    @quotation.user_id = current_user.id
    @quotation.url_tattoo = Rails.application.routes.url_helpers.rails_blob_path(@quotation.tattoo_image, only_path: true)
    @quotation.url_body = Rails.application.routes.url_helpers.rails_blob_path(@quotation.body_image, only_path: true)
    respond_to do |format|
      if @quotation.save
        format.html { redirect_to @quotation, notice: "Quotation was successfully created." }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1 or /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to @quotation, notice: "Quotation was successfully updated." }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1 or /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: "Quotation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quotation
      @quotation = Quotation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def quotation_params
      params.require(:quotation).permit(:detail_tattoo, :user_id, :detail_body, :centimeter, :approved, :amount, 
      :tattoo_image, :url_tattoo,
      :body_image, :url_body)
    end
end
