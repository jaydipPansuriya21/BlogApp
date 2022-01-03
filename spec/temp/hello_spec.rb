require 'rails_helper'

RSpec.describe 'Example of comman rspec helper methods' do
    it '10 should be positive' do 
        expect(10).to be_positive
    end
    it '5 should be greater then 4' do 
        expect(5).to be > 4
    end
    it '-10 should be less then 0' do 
        expect(-10).to be < 0
    end
    it 'equal to 10' do
        expect(10).to be == 10
    end
    it '-10 not equal to 0' do
        expect(-10).not_to be == 0
    end

    it 'name should be equal to jaydip' do
        name = 'Jaydip'
        expect(name).to eq('Jaydip')
    end

    it 'name should not be equal to Jaydip' do
        name = 'jaydip'
        expect(name).not_to eq('Jaydip')
    end
end