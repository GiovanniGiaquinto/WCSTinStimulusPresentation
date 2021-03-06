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
text{caption = "Welcome to this experiment, and thank you for your participation!

					Press the W-button to go to the instruction screen";} welc_text;
					
picture{text welc_text; x = 0; y = 0;} welc_pic;

#Instruction pages
text{caption = "In this task, you need to match a card to one of four cards presented at the top of the screen.
					Press one of the four buttons corresponding to the letter next to the cards to select to 
					which card you want to match the card at the bottom to. Following your selection, you will 
					get feedback. If your match was not correct, you need to try a different rule


					Press the W-button to go to the next screen";} inst1_text;

text{ caption = "The three possible rules of matching are that the cards have the same backgroundcolor,
					the cards have the same number of objects on the card, or the object on the cards is the same.
					Look at the example below:
					If you match according to backgroundcolor, you would choose card 3 corresponding to the letter U
					If you match according to object, you would choose card 4 corresponding to the letter P
					If you match according to number of objects, you would choose card 1 corresponding to the letter W
					Press the W-button to go to the next screen";} inst2_text;

text{ caption = "
					You will need to find out whether to match according to color,
					object, or number of object. Once you have figure out what rule to use,
					you can relax for a while. But that is not all. The matching rules changes now and then!
					You therefore need to carefully monitor the feedback. Mistakes are inevitable,
					but try to make as few mistakes as possible. That is all! Good luck!
					
					Press the W-button to start the experiment
					";} inst3_text;
					


picture{ text inst1_text; x = 0; y = 0;} inst1_pic;
picture{ text inst3_text; x = 0; y = 0;} inst3_pic;

#instruction page example of experiment
bitmap{ filename = "options.bmp";} qoptions;
bitmap{ filename = "b1g.bmp"; } qb1g;
picture{ text inst2_text ; x = 0; y = 350; bitmap qoptions; x = 0; y = 0; bitmap qb1g; x = 0; y = -300; } inst2_pic;


# Coding of all stimuli

bitmap{ filename = "b1y.bmp";} bb1g;
bitmap{ filename = "b1g.bmp";} bb1gr;
bitmap{ filename = "b2y.bmp";} bb2g;
bitmap{ filename = "b2r.bmp";} bb2r;
bitmap{ filename = "b3g.bmp";} bb3gr;
bitmap{ filename = "b3r.bmp";} bb3r;

bitmap{ filename = "j1b.bmp";} bj1b;
bitmap{ filename = "j1y.bmp";} bj1g;
bitmap{ filename = "j3r.bmp";} bj3r;
bitmap{ filename = "j3b.bmp";} bj3b;
bitmap{ filename = "j4y.bmp";} bj4g;
bitmap{ filename = "j4r.bmp";} bj4r;

bitmap{ filename = "s1b.bmp";} bs1b;
bitmap{ filename = "s1g.bmp";} bs1gr;
bitmap{ filename = "s2b.bmp";} bs2b;
bitmap{ filename = "s2r.bmp";} bs2r;
bitmap{ filename = "s4g.bmp";} bs4gr;
bitmap{ filename = "s4r.bmp";} bs4r;

bitmap{ filename = "sch2b.bmp";} bsch2b;
bitmap{ filename = "sch2y.bmp";} bsch2g;
bitmap{ filename = "sch3b.bmp";} bsch3b;
bitmap{ filename = "sch3g.bmp";} bsch3gr;
bitmap{ filename = "sch4y.bmp";} bsch4g;
bitmap{ filename = "sch4g.bmp";} bsch4gr;

bitmap{ filename = "options.bmp";} boptions;

# Every picture consists of the 4 options the participants can select and the stimulus they have to sort.
picture{ bitmap boptions; x = 0; y = 300; bitmap bb1g; x = 0; y = -300;} b1g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bb1gr; x = 0; y = -300;} b1gr;
picture{ bitmap boptions; x = 0; y = 300; bitmap bb2g; x = 0; y = -300;} b2g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bb2r; x = 0; y = -300;} b2r;
picture{ bitmap boptions; x = 0; y = 300; bitmap bb3gr; x = 0; y = -300;} b3gr;
picture{ bitmap boptions; x = 0; y = 300; bitmap bb3r; x = 0; y = -300;} b3r;

picture{ bitmap boptions; x = 0; y = 300; bitmap bj1b; x = 0; y = -300;} j1b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bj1g; x = 0; y = -300;} j1g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bj3r; x = 0; y = -300;} j3r;
picture{ bitmap boptions; x = 0; y = 300; bitmap bj3b; x = 0; y = -300;} j3b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bj4g; x = 0; y = -300;} j4g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bj4r; x = 0; y = -300;} j4r;

picture{ bitmap boptions; x = 0; y = 300; bitmap bs1b; x = 0; y = -300;} s1b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bs1gr; x = 0; y = -300;} s1gr;
picture{ bitmap boptions; x = 0; y = 300; bitmap bs2b; x = 0; y = -300;} s2b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bs2r; x = 0; y = -300;} s2r;
picture{ bitmap boptions; x = 0; y = 300; bitmap bs4gr; x = 0; y = -300;} s4gr;
picture{ bitmap boptions; x = 0; y = 300; bitmap bs4r; x = 0; y = -300;} s4r;

picture{ bitmap boptions; x = 0; y = 300; bitmap bsch2b; x = 0; y = -300;} sch2b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bsch2g; x = 0; y = -300;} sch2g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bsch3b; x = 0; y = -300;} sch3b;
picture{ bitmap boptions; x = 0; y = 300; bitmap bsch3gr; x = 0; y = -300;} sch3gr;
picture{ bitmap boptions; x = 0; y = 300; bitmap bsch4g; x = 0; y = -300;} sch4g;
picture{ bitmap boptions; x = 0; y = 300; bitmap bsch4gr; x = 0; y = -300;} sch4gr;


# Now that all stimuli have been put in a picture element next the feedback will be coded
# I decided to go with only auditory feedback. The feedback that a participant hears after giving a wrong answer is a buzzer
# When a correct answer is given the line 'You got it' will be played.

#Wrong Answer Feedback
sound{ wavefile { filename = "wrong_sound.wav" ;}; } wrong;

#Right Answer Feedback
sound{ wavefile {filename = "correct_sound.wav"; }; } correct;

# Now that all stimuli are ready to be used the beginning of the experiment will be coded in the following section.
# All trials will be named, so that we can control the flow of the experiment using pcl.


#Welcome page & Instruction Page trials
#Delta_time is set to 0 because the screen only has to change when the participant presses a button
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

#Correct and wrong sound trial. This needs to be made so we can call this trial everytime a correct or wrong answer is given
# and the auditory feedback can be given.

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

# In the following section three arrays are made. Each array contains 24 trials (one for each stimulus) for each rule. 
# The trials are put in an array so that we can randomize the order the trials are presented in.

# Trials where the rule is match on background color
array{

#Ball pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1gr;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2r;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3gr;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3r;
		target_button = 1;
	};

#Joint pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3r;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4r;
		target_button = 1;
	};
	
# Screw pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1gr;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2r;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4gr;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4r;
		target_button = 1;
	};		

#Shoe pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3b;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3gr;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4g;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4gr;
		target_button = 4;
	};	
}color;



# Rule is shape

array{
#Ball pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1g;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1gr;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2g;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2r;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3gr;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3r;
		target_button = 4;
	};

#Joint pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1b;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1g;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3b;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3r;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4g;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4r;
		target_button = 2;
	};
	
# Screw pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1b;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1gr;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2b;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2r;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4gr;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4r;
		target_button = 3;
	};		

#Shoe pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2b;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2g;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3b;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3gr;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4g;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4gr;
		target_button = 1;
	};
}shape;

#Rule is number of objects
array{
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1g;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b1gr;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2g;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b2r;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3gr;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture b3r;
		target_button = 3;
	};

#Joint pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1b;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j1g;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3b;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j3r;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4g;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture j4r;
		target_button = 4;
	};
	
# Screw pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1b;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s1gr;
		target_button = 1;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2b;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s2r;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4gr;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture s4r;
		target_button = 4;
	};		

#Shoe pictures
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2b;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch2g;
		target_button = 2;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3b;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch3gr;
		target_button = 3;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4g;
		target_button = 4;
	};
	trial {
		correct_feedback = correct_t;
		incorrect_feedback = wrong_t;
		picture sch4gr;
		target_button = 4;
	};
}number;


#Begin PCL to control flow of experiment
begin_pcl;


# These two objects are created in order to get a more informative output file 
int lastresponse;
stimulus_data last;
double percentagemistakes;

#This creates a custom output file
output_file wcst = new output_file;
wcst.open (logfile.subject() + "wcst_data.txt");
wcst.print("trialnr\tresponse\ttotalcorrect\treactiontime\tpercentagemistakes\n");

#To begin the instruction screens need to be presented
start_screen.present();

# Using a loop we will present 4 stimuli for a rule until moving on to the next rule
# I use until i > 24 because there are a total of 24 stimuli in each rule array. Going further than that would
# result in an error.
# This loop is repeated three times using the loop that contains all code underneath in order to present a total of 72 trials

loop int j = 1 until j > 3
begin
		
#Next for each rule trials have been made for all stimuli. To minimize noise the trials within each rule are
#randomized using the .shuffle function before going through the next loop
	color.shuffle();
	shape.shuffle();
	number.shuffle();

	loop int i=1 until i > 24
	begin
		if i < 5 then
			color[i].present();
		elseif i >4 && i < 9 then
			shape[i].present();
		elseif i > 8 && i < 13 then
			number[i].present();
		elseif i > 12 && i < 17 then
			shape[i].present();
		elseif i > 16 && i < 21 then
			color[i].present();
		elseif i > 20 then
			number[i].present();
		end;
		# The following lines of code are used to put results in the custom output file
		last = stimulus_manager.last_stimulus_data();
		lastresponse = last.button();
		percentagemistakes = (response_manager.total_hits()/72.0)*100.0;
		
		wcst.print(i); wcst.print("\t");
		wcst.print(lastresponse); wcst.print("\t");
		wcst.print(response_manager.total_hits());wcst.print("\t");
		wcst.print(last.reaction_time());wcst.print("\t");;
		wcst.print(percentagemistakes);wcst.print("\n");
		i = i + 1
	end;
	j = j + 1;
end;


