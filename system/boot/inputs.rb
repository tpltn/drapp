Drapp.boot(:inputs) do
  init do
    Dir["#{Drapp.root}/core/inputs/**/*.rb"].sort.each { |file| require file }
  end
end
