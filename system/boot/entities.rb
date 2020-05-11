Drapp.boot(:entities) do
  init do
    Dir["#{Drapp.root}/core/entities/**/*.rb"].sort.each { |file| require file }
  end
end
