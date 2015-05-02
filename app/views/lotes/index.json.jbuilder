json.array!(@lotes) do |lote|
  json.extract! lote, :id, :numero, :superficie, :memorial, :coord
  json.url lote_url(lote, format: :json)
end
