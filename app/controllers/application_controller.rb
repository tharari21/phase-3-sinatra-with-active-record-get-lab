class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakeries = Bakery.all 
    bakeries.to_json
  end
  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end
  get '/baked_goods' do
    BakedGood.all.to_json
  end
  get '/baked_goods/by_price' do 
    baked_goods = BakedGood.order(price: :desc)
    baked_goods.to_json
  end
  get '/baked_goods/most_expensive' do
    BakedGood.order(price: :desc).first.to_json

  end

end
