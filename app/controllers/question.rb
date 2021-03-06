get '/questions' do
	@questions = Question.all
	erb :'index'
end

get '/questions/new' do
  erb :'questions/new'
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  erb :'questions/show'
end

post '/questions/new' do
  @question = Question.new(title: params[:title], content: params[:content], user_id: current_user.id)
  if @question.save

    redirect '/questions'
  else
    @errors = @question.errors.full_messages

    erb :'questions/new'
  end
end

delete '/questions/:question_id' do
  question = Question.find_by(id: params[:question_id])
  user_id = question.user_id
  question.destroy

  redirect "/users/#{user_id}"
end



