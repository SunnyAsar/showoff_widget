class Widget < ApplicationRecord
  require 'rest-client'
  require 'json'

  def self.get_widgets
    # response = RestClient.get 'https://showoff-rails-react-production.herokuapp.com/api/v1/widgets'
    response = RestClient.get('https://jsonplaceholder.typicode.com/todos/1')
    return JSON.parse(response)

    # return 'hello widget'
  end

end
