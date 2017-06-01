#headers
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_font = "cambria";
default_font_size = 28;

active_buttons = 4;
response_matching = simple_matching;
default_trial_type = first_response;
default_picture_duration = response;


#######################################################################################################
#																SDL																	#
#######################################################################################################
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
					get feedback. If your match was not correct, you need to try a different rule.
					
					
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
					
					Press the W-button to start the experiment!
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
	bitmap{ filename = "b1y.bmp";}first;
	bitmap{ filename = "b1g.bmp";};
	bitmap{ filename = "b2y.bmp";};
	bitmap{ filename = "b2r.bmp";};
	bitmap{ filename = "b3g.bmp";};
	bitmap{ filename = "b3r.bmp";};

	bitmap{ filename = "j1b.bmp";};
	bitmap{ filename = "j1y.bmp";};
	bitmap{ filename = "j3r.bmp";};
	bitmap{ filename = "j3b.bmp";};
	bitmap{ filename = "j4y.bmp";};
	bitmap{ filename = "j4r.bmp";};

	bitmap{ filename = "s1b.bmp";};
	bitmap{ filename = "s1g.bmp";};
	bitmap{ filename = "s2b.bmp";};
	bitmap{ filename = "s2r.bmp";};
	bitmap{ filename = "s4g.bmp";};
	bitmap{ filename = "s4r.bmp";};

	bitmap{ filename = "c2b.bmp";};
	bitmap{ filename = "c2y.bmp";};
	bitmap{ filename = "c3b.bmp";};
	bitmap{ filename = "c3g.bmp";};
	bitmap{ filename = "c4y.bmp";};
	bitmap{ filename = "c4g.bmp";};
} stimuli;

#This one is not placed in the array because it has to be presented on every page of the experiment
bitmap{ filename = "options.bmp";}options; 

#Wrong Answer Feedback both auditory and visually
sound{ 
	wavefile{ 
		filename = "wrong_sound.wav";
	}; 
}wrong_s;

text{ 
	caption ="WRONG!";
	font_size = 55;
	background_color = 202, 0, 42;
}wrong_t;

#Right Answer Feedback both auditory and visually
sound{ 
	wavefile{
	filename = "correct_sound.wav";
	}; 
}correct_s;

text { 
	caption = "CORRECT!";
	font_size = 55;
	background_color = 174, 217, 167;
} correct_t;

#Trials are created presenting both the auditory and visual feedback at the same time. The trials are named so
#they can be used in the actual experimental trial as feedback using the built-in
#correct_feedback & incorrect_feedback functions.
trial{
	sound correct_s;
	picture{
		background_color = 174, 217, 167;
		text correct_t;
		x = 0; y = 0;
	};
	duration = 600;
	time = 0;
} correctfeedback;
	
trial{
	sound wrong_s;
	picture{
		background_color = 202, 0, 42;
		text wrong_t;
		x = 0; y = 0;
	};
	duration = 600;
	time = 0;
} wrongfeedback;

#This is the actual experimental trial. The trial uses the built-in functions correct_feedback & incorrect_feedback
#in order to present the correct feedback based on the input that is given by the participant. The function target_button
#is the button that should be pressed.
trial{
	trial_duration = stimuli_length;
	correct_feedback = correctfeedback;
	incorrect_feedback = wrongfeedback;
	stimulus_event{
		picture{
			bitmap first;
			x = 0; y = -350;
			bitmap options;
			x = 0 ; y = 350;
		} pics;
	}main_event;	
}main_trial;

#######################################################################################################
#																PCL																	#
#######################################################################################################
begin_pcl;

#A string object is created to use later on to create the three sorting rules
string fn;

# These five objects are created and will be use later on to get a more informative custom output file 
int lastresponse;
int trialnum = 1;
int reqresp = 0;
stimulus_data last;
double percentagemistakes;
string rule;
#This creates the custom output file
output_file wcst = new output_file;
wcst.open (logfile.subject() + "wcst_data.txt");
wcst.print("Trialnumber\tFilename\tRule\tResponse\tTotalCorrect\tReactiontime\tPercentagemistakes\n");

#The following subroutine asks for the filename of a stimulus and removes the pathway that is given when the .filename function is used. 
# This way only the actual filename remains, which later on will be used to create the three sorting rules.
sub string removepath (string path_and_file) begin
	int pathlength = stimulus_directory.count();
	string file_no_path = path_and_file.substring(pathlength+1, path_and_file.count()-pathlength);
	return file_no_path;
end;

#######################################################################################################
#										Actual coding of Experimental flow													#
#														starts here																	#
#######################################################################################################

#The experiment start with presenting the instruction screen. .present() is the built in function to present a trial
start_screen.present();

#The first loop will be repeated three times, this is done in order to present a total of 72 stimuli to the participant.
loop
	int j = 1 
until 
	j > 3
begin
	stimuli.shuffle();#The stimuli order is randomized. This is placed within the loop so that the order of the stimuli
							#is randomized three times.
	loop
		int i = 1 
	until
		i > 24 	#This loop is repeated 24 times. This is done because the array containing the stimuli contains 24 stimuli.
					#The value of i is used to call an object in the array containing all bitmaps created in the SDL part. Going beyond 24 would result in an error
	begin
		pics.set_part (1, stimuli[i]); 			#This part in the loop uses the value of i to call one of the objects in the array containing all stimuli.
		fn = removepath(stimuli[i].filename());#Here the subroutine created above stores the filename in the string object fn
		string fc = fn.substring(1, 1);			#Using .substring the first letter of the filename stored in fn is called and stored in fc (first charachter)
		string sc = fn.substring(2, 1);			#Using .substring the second letter of the filename stored in fn is called and stored in sc (second charachter)
		string tc = fn.substring(3, 1);			#Using .substring the third letter of the filename stored in fn is called and stored in tc (third character)
		
		#An if then elseif statement is used to create the different rules. 
		#Using the value of i and the characters stored in fc, sc, and tc, we can create the rules
		#for each stimulus.
		# The first rule is the color rule. After 4 stimuli the rule changes. A nested if else statement
		# is used to keep the code more readable. Moreover, the amount of code is also reduced by doing so.
		if i < 5 then
			if tc == "r" then								#If color is red then
				main_event.set_target_button(1);
			elseif tc == "g" then						#If color is green then
				main_event.set_target_button(2);
			elseif tc == "y" then						#If color is yellow then
				main_event.set_target_button(3);
			elseif tc == "b" then						#If color is blue then
				main_event.set_target_button(4);
			end;
		#Next rule is implemented. This time its the shape rule.	
		elseif i > 4 && i < 9 then
			if fc == "c" then								#If shape is shoe then
				main_event.set_target_button(1);
			elseif fc == "j" then						#If shape is joint then
				main_event.set_target_button(2);
			elseif fc == "s" then						#If shape is screw then
				main_event.set_target_button(3);
			elseif fc == "b" then						#If shape is ball then
				main_event.set_target_button(4);
			end;
		#Next rule is implemented. This time its the number rule
		elseif i > 8 && i < 13 then
			if sc == "1" then								#If number is 1 then
				main_event.set_target_button(1);
			elseif sc == "2" then						#If number is 2 then
				main_event.set_target_button(2);
			elseif sc == "3" then						#If number is 3 then
				main_event.set_target_button(3);
			elseif sc == "4" then						#If number is 4 then
				main_event.set_target_button(4);
			end;
		#Shape Rule
		elseif i > 12 && i < 17 then
			if fc == "c" then
				main_event.set_target_button(1);
			elseif fc == "j" then
				main_event.set_target_button(2);
			elseif fc == "s" then
				main_event.set_target_button(3);
			elseif fc == "b" then
				main_event.set_target_button(4);
			end;
		#Color Rule
		elseif i > 16 && i < 21 then
			if tc == "r" then
				main_event.set_target_button(1);
			elseif tc == "g" then
				main_event.set_target_button(2);
			elseif tc == "y" then
				main_event.set_target_button(3);
			elseif tc == "b" then
				main_event.set_target_button(4);
			end;
		#Number Rule
		elseif i > 20 then
			if sc == "1" then
				main_event.set_target_button(1);
			elseif sc == "2" then
				main_event.set_target_button(2);
			elseif sc == "3" then
				main_event.set_target_button(3);
			elseif sc == "4" then
				main_event.set_target_button(4);
			end;			
		end;
		#Now that the rules are in place the actual trial can be presented.
		main_trial.present();
		# The following lines of code are used to put results in the custom output file.
		last = stimulus_manager.last_stimulus_data();
		lastresponse = last.button();																					#Store the last pressed button response in the object lastresponse
		percentagemistakes = (response_manager.total_incorrects()/double(trialnum))*100.0;			#This equation calculates the percentage of mistakes that is made 
		
		wcst.print(trialnum); wcst.print("\t");																	#Actually prints trialnum in custom output and then puts in a tab
		trialnum = trialnum+1;																							#This is used to count the amount of trials which can then be printed in the custom output	
	
		wcst.print(fc);wcst.print(sc);wcst.print(tc);wcst.print("\t");										#Print filename in custom output
		
		if i < 5 then																										#This if statement is used to store the active rule in the rule object
			rule = "Color";
		elseif i > 4 && i < 9 then
			rule = "Shape";
		elseif i > 8 && i < 13 then
			rule = "Number";
		elseif i > 12 && i < 17 then
			rule = "Shape";
		elseif i > 16 && i < 21 then
			rule = "Color";
		elseif i > 20 then
			rule = "Number";
		end;
		wcst.print(rule); wcst.print("\t");																			#Prints the active rule in the output			
			
			
		wcst.print(lastresponse); wcst.print("\t");																#Prints response given in custom output
		wcst.print(response_manager.total_hits());wcst.print("\t");											#Print total correct answers uptill that point in custom output
		wcst.print(last.reaction_time());wcst.print("\t");														#Prints the Reactiontime for that response
		wcst.print(percentagemistakes);wcst.print("\n");														#Prints the percantageof mistakes uptill that point
		
		i = i + 1;
	end;
	j = j + 1
end;