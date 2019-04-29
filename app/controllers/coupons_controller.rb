class CouponsController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index 
    @coupons = Coupon.all 
  end 

  def new
  end 

  def show
    @coupon = Coupon.find(params[:id])
  end 

  def create
  	@coupon = Coupon.create(coupon_code: params[:coupon][:coupon_code],
  		store: params[:coupon][:store])
  	redirect_to coupon_path(@coupon)
  end

end
