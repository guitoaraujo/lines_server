require 'rails_helper'

RSpec.describe LinesController, type: :request do
  describe 'show' do
    let(:url) { "/lines/#{id}" }

    before do
      get url
    end

    context 'when request has a valid id' do
      let(:id) { 59 }
      let(:expected_result) { 'Neque gravida in fermentum et sollicitudin ac.' }

      it 'returns a http status 200 and content' do
        expect(response.status).to eq(200)
        expect(response.body).to eq(expected_result)
      end
    end

    context 'when request has not a valid id' do
      let(:id) { IO.readlines('lines.txt', chomp: true).size + 1 }

      it 'returns a http status 413 and empty body' do
        expect(response.status).to eq(413)
        expect(response.body).to eq('')
      end
    end
  end
end
