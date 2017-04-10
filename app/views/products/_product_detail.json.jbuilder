json.extract! product_detail, :id, :category_id, :name, :seller, :best_before_date, :manufacture_date, :details, :brand, :status, :rate, :avialable_quantity, :discount, :product_code, :created_at, :updated_at
json.url product_detail_url(product_detail, format: :json)
