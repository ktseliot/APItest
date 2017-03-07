require 'rest-client'

module Todo

  def all_todos
    begin
      return RestClient.get 'http://lacedeamon.spartaglobal.com'
    rescue => e
      return e.response
    end
  end

  def specific_todo(id, accept)
    begin
      return RestClient.get 'http://lacedeamon.spartaglobal.com' + id.to_s, :accept => accept
    rescue => e
      return e.response
    end
  end

end
