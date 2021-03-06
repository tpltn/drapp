Drapp.boot(:presenters) do
  init do
    Dir["#{Drapp.root}/core/presenters/**/*.rb"].sort.each { |file| require file }
  end

  start do
    Blueprinter.configure do |config|
      config.datetime_format = '%FT%T.%6N%:z'
    end
  end
end
