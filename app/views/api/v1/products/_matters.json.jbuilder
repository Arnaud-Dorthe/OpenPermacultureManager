json.call(product, :id, :name, :number, :population, :variety, :abilities, :born_at, :dead_at, :derivative_of)

if product.container
  json.container_name product.container.name
end

json.variant_unit_name product.variant.unit_name
