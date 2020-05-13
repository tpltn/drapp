Drapp.boot(:db) do
  start do
    # init dependency with env variables
    Drapp.register(:db, Drapp.env)
  end
end
