require 'net/http'
require 'faraday'
require 'faraday_middleware'
require 'json'
require 'httparty'
require 'pry'

# Net::HTTP.get(URI.parse('http://lacedeamon.spartaglobal.com/todos'))

url = "http://lacedeamon.spartaglobal.com/todos"

describe "To-Dos API" do

  it "should give us a 201 message when we send a post request" do
    res = HTTParty.post("http://lacedeamon.spartaglobal.com/todos",
    query: { "title" => "Karan and Katie", "due" => "2017-07-01" } )
    expect(res.code).to eq(201)
  end

  it "should give us a json representation of our post request" do
    # response = HTTParty.get(url)
    # response.parsed_response
  end

  it "should not allow us to make a post without a due date" do
    res = HTTParty.post("http://lacedeamon.spartaglobal.com/todos",
    query: { "title" => "Karan and Katie"} )
    expect(res.code).to eq(422)
  end

  it "should only accept valid characters" do

  end

  it "should allow us to delete a post" do

    newTodo = HTTParty.post("http://lacedeamon.spartaglobal.com/todos",
    query: { "title" => "Karan and Katie", "due" => "1991-12-28"} )
    res = HTTParty.delete("http://lacedeamon.spartaglobal.com/todos/#{newTodo['id']}")
    expect(res.code).to eq(204)
  end

  it "should not accept dates outside a certain range" do
    es = HTTParty.post("http://lacedeamon.spartaglobal.com/todos",
    query: { "title" => "Karan and Katie", "due" => "8017-07-01" } )
    expect(res.code).to eq(422)
  end

  it "should not accept past dates" do
    res = HTTParty.post("http://lacedeamon.spartaglobal.com/todos",
    query: { "title" => "Karan and Katie", "due" => "2015-07-01" } )
    expect(res.code).to eq(422)
  end

end
