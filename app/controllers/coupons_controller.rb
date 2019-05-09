class CouponsController < ApplicationController


  def index
        @coupons = Coupon.all
      end

      def show
        @coupon = Coupon.find(params[:id])
        # @coupons = @coupon.coupons
      end

      def new
        @coupon = Coupon.new()
      end


      def create
        @coupon = Coupon.new(coupon_params)
          if @coupon.save
            redirect_to coupons_path
          else
            render "new"
          end
      end


      def edit
        @coupon = Coupon.find(params[:id])
      end

      def update
        @coupon = Coupon.find(params[:id])
        @coupon.update(coupon_params)
        @coupon.save
        redirect_to @coupon
      end


      def destroy
        Coupon.find(params[:id]).destroy
        redirect_to coupons_path
      end


      private

      def coupon_params
        params.require(:coupon).permit(:coupon_code, :store)
      end


end
