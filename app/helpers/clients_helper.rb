module ClientsHelper
  def display_client(product)
    product.client.nil? ? link_to("Edit Product", edit_product_path(product)) : link_to(product.client_name, client_path(product.client))
  end
end
