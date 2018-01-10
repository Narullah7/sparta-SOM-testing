require_relative 'services/dad_jokes_api'

class DadJokesWebsite

  def get_dad_jokes_by_search
    DadApi.new
  end


end
