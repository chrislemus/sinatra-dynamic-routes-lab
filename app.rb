require_relative 'config/environment'

class App < Sinatra::Base
  # Write your code here!
  get('/reversename/:name') {
    params[:name].reverse
  }

  get('/square/:number') {
    @number = params[:number].to_i
    (@number*@number).to_s
  }

  get('/say/:number/:phrase') {
    @number = params[:number].to_i
    @repeated_phrase = []
    @number.times { @repeated_phrase << params[:phrase] }
    @repeated_phrase.join
  }

  get('/say/:word1/:word2/:word3/:word4/:word5') {
    @words = params.map {|k,v| params["#{k}"]}.join(" ")
    "#{@words}."
  }
  
  get('/:operation/:number1/:number2') {
    @n1 = params[:number1].to_i
    @n2 = params[:number2].to_i
    case params[:operation]
    when 'add'; (@n1 + @n2).to_s
    when 'subtract'; (@n2 - @n1).to_s
    when 'multiply'; (@n1 * @n2).to_s
    when 'divide'; (@n1 / @n2).to_s
    end
  }
end