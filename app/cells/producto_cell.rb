class ProductCell < Cell::ViewModel
  def index
    @products = Product.all
    render
  end

  def edit(product)
    @product = product
    render
  end

  def new
    @product = Product.new
    render
  end
end
