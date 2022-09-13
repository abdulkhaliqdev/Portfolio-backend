require 'swagger_helper'

RSpec.describe 'api/projects', type: :request do
  path '/projects' do

    get 'Get all Ptojects' do
      tags 'Blogs'
      consumes 'application/json'
      parameter name: :blog, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string }
        },
        required: [ 'title', 'content' ]
      }

      response '200', 'Projects' do
        let(:blog) { { title: 'foo', content: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:blog) { { title: 'foo' } }
        run_test!
      end
    end
  end
end
