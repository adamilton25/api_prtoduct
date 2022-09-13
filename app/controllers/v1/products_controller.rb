module V1
    class ProductsController < ApplicationController

        before_action :set_product, only: %i[update show destroy]

        def index
            @products = Product.all.limit(1000).order('created_at DESC')
            render json: {products: @products}
        end

        def show 
            render json: {product: @product}
        end

        def create
            @product = Product.create(product_params) 
            render json: {product: @product}
        end

        def update
            @product.update(product_params)
            render json: {product: @product}
        end

        def destroy
            @product.destroy

            render json: {success: "Product deleted with Success"}
        end

        private

        def product_params
            params.require(:product).permit(:name,:description, :value, :quantity)
        end

        def set_product
            @product = Product.find(params[:product_id])

            return render json: {error: 'product not found'}, status: 404 if @product.nil?
        end
    end 
end