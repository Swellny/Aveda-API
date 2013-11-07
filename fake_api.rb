require 'sinatra'
require 'json'

set :bind, '0.0.0.0'

get '/' do
	 content_type :json
  { :SWELLdev => 'thebest'}.to_json
end

get '/check_status_for_user' do
		statusParam = "invalid, please pass val between 0 and 3 in the status param"
		giver = 'null'
		case params[:status]
			when '0' 
				statusParam = 'contest_eligible'
			when '1'
				statusParam = 'contest_ineligible'
			when '2'
				statusParam = 'contest_ineligible_winner'
			when '3'
				statusParam = 'redeem_state'
				giver = '432432'
		end

	content_type :json
  { :status_obj => {:user=> params[:user], :status=>statusParam, :giver_id=>giver}}.to_json

end

get '/' do
	 content_type :json
  { :SWELLdev => 'thebest'}.to_json
end

get '/' do
	 content_type :json
  { :SWELLdev => 'thebest'}.to_json
end

get '/' do
	 content_type :json
  { :SWELLdev => 'thebest'}.to_json
end

