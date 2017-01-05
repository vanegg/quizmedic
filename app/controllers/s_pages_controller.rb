class SPagesController < ApplicationController
	def home		
	end

	def game
		do_questions
		@s_questions = selected_questions(@questions)
	end

	def another_question
		do_questions
		@hit = params[:hit]
		@s_question = {}
		loop do
			@s_question = choose_question(@questions)
		break if @s_question[:id] != params[:num_q].to_i
		end
		@s_question
		@player = params[:player]
	end

	private
		def do_questions
			@questions = []
			3.times do |n| 
				@questions[n] = {}
				@questions[n][:id] = n
			end
			@questions[0][:question] = "¿Cual es1?"
			@questions[0][:image] = "image0.jpg"
			@questions[0][:answer] = true
			@questions[1][:question] = "¿Cual es2?"
			@questions[1][:image] = "image0.jpg"
			@questions[1][:answer] = false
			@questions[2][:question] = "¿Cual es3?"
			@questions[2][:image] = "image0.jpg"
			@questions[2][:answer] = true
		end

		def question_rand(questions)
			random = Random.new
			@num = random.rand(questions.length)			
		end

		def selected_questions(questions)
			nj1 = question_rand(questions)
			nj2 = 0

			loop do
				nj2 = question_rand(questions)
			break if nj1 != nj2
			end

			@selected_questions = [questions[nj1], questions[nj2]]
		end

		def choose_question(questions)
			@question = questions[question_rand(questions)]
		end
end
