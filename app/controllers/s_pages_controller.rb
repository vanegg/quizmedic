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
			14.times do |n| 
				@questions[n] = {}
				@questions[n][:id] = n
			end
			@questions[0][:question] = "En una taquicardia ventrícular ¿Existe onda P?"
			@questions[0][:image] = ""
			@questions[0][:answer] = false

			@questions[1][:question] = "¿Se le llama ciclo cardíaco a todos los fenómenos ocurridos en el corazón, desde que inicia un latido hasta el inicio del siguiente latido?"
			@questions[1][:image] = "p100.jpg"
			@questions[1][:answer] = true

			@questions[2][:question] = "¿El ciclo cardíaco inicia con el potencial de acción del Nodo S.A?"
			@questions[2][:image] = "p1.jpg" 
			@questions[2][:answer] = true

			@questions[3][:question] = "¿El electrocardiograma es un fenómeno volumétrico?"
			@questions[3][:image] = "p2.jpg"
			@questions[3][:answer] = false
			
			@questions[4][:question] = "¿La onda señalada en la siguiente imagen corresponde a la despolarización ventricular?"
			@questions[4][:image] = "p8.jpg"
			@questions[4][:answer] = false

            @questions[5][:question] = "¿El intervalo QT (coloreado de verde en la imagen) depende de la FC?"
			@questions[5][:image] = "p5.jpg"
			@questions[5][:answer] = true

            @questions[6][:question] = "¿El segmento (coloreado de rosa en la imagen) mide 0.6 mV?"
			@questions[6][:image] = "p6.jpg"
			@questions[6][:answer] = false

            @questions[7][:question] = "¿El ruido cardíaco señalado en la imagen se escucha en atletas de alto rendimiento?"
			@questions[7][:image] = "p7.jpg"
			@questions[7][:answer] = true

            @questions[8][:question] = "¿En la siguiente imagen la flecha nos indica una mala comunicación entre la aurículas y los ventrículos?"
			@questions[8][:image] = "p9.jpg"
			@questions[8][:answer] = true

            @questions[9][:question] = "¿La siguiente imagen representa una fibrilación ventrícular?"
			@questions[9][:image] = "p1000.jpg"
			@questions[9][:answer] = false

            @questions[10][:question] = "¿La precarga es directamente proporcional al retorno vernoso?"
			@questions[10][:image] = ""
			@questions[10][:answer] = true

            @questions[11][:question] = "¿La contracción aurícular se encuentra en la fase I del ciclo cardíaco?"
			@questions[11][:image] = ""
			@questions[11][:answer] = true

            @questions[12][:question] = "¿La flecha señala el volumen telediastolico?"
			@questions[12][:image] = "p140.jpg"
			@questions[12][:answer] = false

            @questions[13][:question] = "¿La onda señalada en la siguiente imagen corresponde a la despolarización aurícular?"
			@questions[13][:image] = "p8.jpg"
			@questions[13][:answer] = true

            

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
