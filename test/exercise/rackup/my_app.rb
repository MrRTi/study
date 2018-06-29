Inatra.routes do
  get '/hello' do
    [200, {}, ['GET Hello World']]
  end

  post '/hello' do
    [200, {}, ['POST Hello World']]
  end
end
