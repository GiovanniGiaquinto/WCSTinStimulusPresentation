#headers
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_font = "cambria";
default_font_size = 28;

active_buttons = 4;
response_matching = simple_matching;
default_trial_type = first_response;
default_picture_duration = response;


#SDL
begin;


# The next section will be the coding of all stimuli in picture objects. This includes the welcome and instruction pages
# This makes the scenario clearer. Each subsection will have a comment header to indicate what part is being coded

# Welcome Page
text{caption = "Welcome to this experiment, and thank you for your participation
					press the spacebar to go to the instruction screen";} welc_text;
					
picture{text welc_text; x = 0; y = 0;} welc_pic;

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
					


picture{ text inst1_text; x = 0; y = 0;} inst1_pic;
picture{ text inst3_text; x = 0; y = 0;} inst3_pic;

#instruction page example of experiment
bitmap{ filename = "options.bmp";} qoptions;
bitmap{ filename = "b1g.bmp"; } qb1g;
picture{ text inst2_text ; x = 0; y = 350; bitmap qoptions; x = 0; y = 0; bitmap qb1g; x = 0; y = -300; } inst2_pic;

#Next a trial is created for the instruction pages. Delta_time is set to zero so that the next page is presented
#the moment the participant clicks the button. Moreover, the trial is named so it can be called for using PCL later on.

trial{
	trial_type = fixed;
	trial_duration = stimuli_length;
	stimulus_event{
		picture welc_pic;
		time = 0;
	} welcome_page;
	stimulus_event{
		picture inst1_pic;
		delta_time = 0;
	} instruction_page1;
	stimulus_event{
		picture inst2_pic;
		delta_time = 0;
	} instruction_page2;
	stimulus_event{
		picture inst3_pic;
		delta_time = 0;
	} instruction_page3;
}start_screen;

# Coding of all stimuli. All stimuli are placed in an array. This is done so we only have to create a single trial for the experiment.
# Using PCL we can later on then replace the picture in the one trial with another stimulus in the array.
array{
	bitmap{ filename = "b1g.bmp";		description = "1";}first;
	bitmap{ filename = "b1gr.bmp";	description = "2";};
	bitmap{ filename = "b2g.bmp";		description = "3";};
	bitmap{ filename = "b2r.bmp";		description = "4";};
	bitmap{ filename = "b3gr.bmp";	description = "5";};
	bitmap{ filename = "b3r.bmp";		description = "6";};

	bitmap{ filename = "j1b.bmp";		description = "7";};
	bitmap{ filename = "j1g.bmp";		description = "8";};
	bitmap{ filename = "j3r.bmp";		description = "9";};
	bitmap{ filename = "j3b.bmp";		description = "10";};
	bitmap{ filename = "j4g.bmp";		description = "11";};
	bitmap{ filename = "j4r.bmp";		description = "12";};

	bitmap{ filename = "s1b.bmp";		description = "13";};
	bitmap{ filename = "s1gr.bmp";	description = "14";};
	bitmap{ filename = "s2b.bmp";		description = "15";};
	bitmap{ filename = "s2r.bmp";		description = "16";};
	bitmap{ filename = "s4gr.bmp";	description = "17";};
	bitmap{ filename = "s4r.bmp";		description = "18";};

	bitmap{ filename = "sch2b.bmp";	description = "19";};
	bitmap{ filename = "sch2g.bmp";	description = "20";};
	bitmap{ filename = "sch3b.bmp";	description = "21";};
	bitmap{ filename = "sch3gr.bmp";	description = "22";};
	bitmap{ filename = "sch4g.bmp";	description = "23";};
	bitmap{ filename = "sch4gr.bmp";	description = "24";};
} stimuli;

#This one is not placed in the array because it has to be presented on every page of the experiment
bitmap{ filename = "options.bmp";}options; 

#Wrong Answer Feedback both auditory and visually
sound{ wavefile { filename = "wrong_sound.wav" ;}; } wrong_s;
text{ caption ="WRONG!";}wrong_t;

#Right Answer Feedback both auditory and visually
sound{ wavefile {filename = "correct_sound.wav"; }; } correct_s;
text { caption = "CORRECT!";} correct_t;

#Trials are created presenting both the auditory and visual feedback at the same time. The trials are named so
#they can be used in the actual experimental trial as feedback using the built-in
#correct_feedback & incorrect_feedback functions.
trial{
	sound correct_s;
	picture{
		text correct_t;
		x = 0; y = 0;
	};
	duration = 250;
	time = 0;
} correctfeedback;
	
trial{
	sound wrong_s;
	picture{
		text wrong_t;
		x = 0; y = 0;
	};
	duration = 250;
	time = 0;
} wrongfeedback;

#This is the actual experimental trial. The trial uses the built-in functions correct_feedback & incorrect_feedback
#in order to present the correct feedback based on the input that is given by the participant. The function target_button
#is the button that should be pressed.
trial{
	trial_duration = stimuli_length;
	correct_feedback = correctfeedback;
	incorrect_feedback = wrongfeedback;
	picture{
		bitmap first;
		x = 0; y = -300;
		bitmap options;
		x = 0 ; y = 300;
	} pics;
	target_button = 1;
}main_trial;

#PCL
begin_pcl;

#An integer is created to store the converted descriptions that are given to the bitmaps (the stimuli). This will
#be used to create the different rules (shape, number, color).
int desc_int;

#The first loop will be repeated three times, this is done in order to present a totla of 72 stimuli to the participant
loop
	int j = 1 until j > 3
begin
	stimuli.shuffle();#The stimuli order is randomized. This is placed within the loop so that the order of the stimuli
							#is randomized three times.
	loop
		int i = 1 until i > 24 	#This loop is repeated 24 times. This is done because the array containing the stimuli contains 24 stimuli.
										#The value of i is used to call an object in the array containing all bitmaps. Going beyond 24 would result in an error
	begin
		pics.set_part (1, stimuli[i]);
		desc_int = int(stimuli[i].description());
		main_trial.present();
		i = i + 1;
	end;
	j = j + 1
end;