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

get '/run_contest_for_user' do
		winParam = "invalid, please pass val between 0 and 3 in the win param"
		case params[:win]
			when '0' 
				winParam = 'user_win'
			when '1'
				winParam = 'user_coupon'
			when '2'
				winParam = 'gather_email'
			when '3'
				winParam = 'user_did_not_win'
		end

	content_type :json
  { :contest_obj => {:user=> params[:user], :outcome=>winParam}.to_json

end

get '/re_enter_contest_with_email' do
		winParam = "invalid, please pass val between 0 and 2 in the win param"
		case params[:win]
			when '0' 
				winParam = 'user_win'
			when '1'
				winParam = 'user_coupon'
			when '2'
				winParam = 'user_did_not_win'
		end

	content_type :json
  { :contest_obj => {:user=> params[:user], :outcome=>winParam}.to_json

end

get '/give_and_get_from_product_win' do
	 content_type :json
  { :give_and_get_win => {:user=> params[:user], :recipient=>453945234}.to_json
end

get '/redeem_sample_for_user' do
	error = nil
	outcome = 'success'
	error = "ERROR DOES NOT COMPUTE" && outcome = "error" unless params[:error] == nil
	 content_type :json
  { :give_and_get_win => {:user=> params[:user], :outcome=>outcome, :error=>error}.to_json
end

