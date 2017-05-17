#headers
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_font = "cambria";
default_font_size = 28;
active_buttons = 5;
response_matching = simple_matching;
default_trial_type = first_response;


#SDL
begin;


# The next section will be the coding of all stimuli in picture objects. This includes the welcome and instruction pages

# Welcome Page
text{caption = "Welcome to this experiment, and thank you for your participation
					press the spacebar to go to the instruction screen";} welc_text;
#Instruction pages
text{caption = "In this task, you need to match a card to one of four cards presented at the top of the screen.
					Press one of the four buttons corresponding to the letter next to the cards to select to 
					which card you want to match the card at the bottom to. Following your selection, you will 
					get feedback. If your match was not correct, you need to try a different rule


					Press the spacebar to go to the next screen";} inst1_text;

text{ caption = "The three possible rules of matching are that the cards have the same backgroundcolor,
					the cards have the same number of objects on the card, or the object on the cards is the same.
					Look at the example below:
					If you match according to backgroundcolor, you would choose card 3 corresponding to the letter U
					If you match according to object, you would choose card 4 corresponding to the letter P
					If you match according to number of objects, you would choose card 1 corresponding to the letter W
					Press the spacebar to go to the next screen";} inst2_text;

text{ caption = "
					You will need to find out whether to match according to color,
					object, or number of object. Once you have figure out what rule to use,
					you can relax for a while. But that is not all. The matching rules changes now and then!
					You therefore need to carefully monitor the feedback. Mistakes are inevitable,
					but try to make as few mistakes as possible. That is all! Good luck!
					";} inst3_text;
					

picture{text welc_text; x = 0; y = 0;} welc_pic;
picture{text inst1_text; x = 0; y = 0;} inst1_pic;
picture{text inst3_text; x = 0; y = 0;} inst3_pic;

#instruction page example of experiment
bitmap { filename = "options.bmp";} qoptions;
bitmap { filename = "b1g.bmp"; } qb1g;
picture { text inst2_text ; x = 0; y = 350; bitmap qoptions; x = 0; y = 0; bitmap qb1g; x = 0; y = -300; } example;


#Wrong Answer Feedback
sound{ wavefile { filename = "wrong_sound.wav" ;}; } wrong;

#Right Answer Feedback
sound{ wavefile {filename = "correct_sound.wav"; }; } correct;

#Welcome page & Instruction Page trials
trial{
	trial_type = fixed;
	trial_duration = stimuli_length;
	stimulus_event{
		picture welc_pic;
		time = 0;
		duration = response;
	} welcome_page;
	stimulus_event{
		picture inst1_pic;
		delta_time = 0;
		duration = response;
	} instruction_page1;
	stimulus_event{
		picture example;
		delta_time = 0;
		duration = response;
	} instruction_page2;
	stimulus_event{
		picture inst3_pic;
		delta_time = 0;
		duration = response;
	} instruction_page3;
} start_screen;

#correct sound trial
trial{
	sound correct;
	duration = 250;
	time = 0;
	} correct_t;
	
#wrong sound trial
trial{
	sound wrong;
	duration = 250;
	time = 0;
	} wrong_t;
	
	
trial{
	correct_feedback = correct_t;
	incorrect_feedback = wrong_t;
	picture example;
	response_active = true;
	duration = response;
	target_button = 3;
} first_trial;


begin_pcl;
	start_screen.present();
	first_trial.present();
	
