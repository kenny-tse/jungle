class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['NAME'], password: ENV['PASSWORD']

  def show
    @count_products = Product.count
    @count_categories = Category.count
  end
end
