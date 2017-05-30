#headers
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_font = "cambria";
default_font_size = 28;

active_buttons = 4;
response_matching = simple_matching;
default_trial_type = first_response;
default_picture_duration = response;

field_of_view = 20;
front_clip_distance = 1;
back_clip_distance = 100;


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

# Coding of all stimuli


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

bitmap{ filename = "options.bmp";}options;

#Wrong Answer Feedback
sound{ wavefile { filename = "wrong_sound.wav" ;}; } wrong;

#Right Answer Feedback
sound{ wavefile {filename = "correct_sound.wav"; }; } correct;

trial{
	sound correct;
	duration = 300;
	time = 0;
} correct_t;
	
trial{
	sound wrong;
	duration = 300;
	time = 0;
} wrong_t;


trial{
	trial_type = first_response;
	trial_duration = stimuli_length;
	stimulus_event{
		picture{
			bitmap first;
			x = 0; y = -300;
			bitmap options;
			x = 0 ; y = 300;
		} pics;
	}event;
}main_trial;


begin_pcl;

int desc_int;
loop int j = 1 until j > 3 begin
	stimuli.shuffle();
	loop int i = 1 until i > 24 begin
		pics.set_part (1, stimuli[i]);
		desc_int = int(stimuli[i].description());
		main_trial.present();
		i = i + 1;
	end;
	j = j + 1
end;