require 'rails_helper'

RSpec.describe '/article routes' do
    it 'routes for articles request' do
        aggregate_failures do
            expect(get '/articles').to route_to(controller: 'articles', action: 'index')
            expect(get '/articles').to route_to('articles#index')
            expect(get '/articles?pages=3').to route_to('articles#index', pages: '3')
        end
    end

    it 'show page for articles request' do
        aggregate_failures do
            expect(get '/articles/1').to route_to(controller: 'articles', action: 'show', id: '1')
            expect(get '/articles/1').to route_to('articles#show', id: '1')
        end
    end
end