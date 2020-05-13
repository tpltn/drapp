Drapp.boot(:usecases) do
  use :entities
  use :inputs
  use :presenters

  init do
    Dir["#{Drapp.root}/core/usecases/**/*.rb"].sort.each { |file| require file }
  end
end
