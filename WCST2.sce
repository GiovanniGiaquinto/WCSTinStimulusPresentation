#headers
default_background_color = 255, 255, 255;
default_text_color = 0, 0, 0;
default_font = "cambria";
default_font_size = 28;

active_buttons = 5;
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


# Coding of all stimuli
array{
	bitmap{ filename = "b1g.bmp";} bb1g;
	bitmap{ filename = "b1gr.bmp";} bb1gr;
	bitmap{ filename = "b2g.bmp";} bb2g;
	bitmap{ filename = "b2r.bmp";} bb2r;
	bitmap{ filename = "b3gr.bmp";} bb3gr;
	bitmap{ filename = "b3r.bmp";} bb3r;

	bitmap{ filename = "j1b.bmp";} bj1b;
	bitmap{ filename = "j1g.bmp";} bj1g;
	bitmap{ filename = "j3r.bmp";} bj3r;
	bitmap{ filename = "j3b.bmp";} bj3b;
	bitmap{ filename = "j4g.bmp";} bj4g;
	bitmap{ filename = "j4r.bmp";} bj4r;

	bitmap{ filename = "s1b.bmp";} bs1b;
	bitmap{ filename = "s1gr.bmp";} bs1gr;
	bitmap{ filename = "s2b.bmp";} bs2b;
	bitmap{ filename = "s2r.bmp";} bs2r;
	bitmap{ filename = "s4gr.bmp";} bs4gr;
	bitmap{ filename = "s4r.bmp";} bs4r;

	bitmap{ filename = "sch2b.bmp";} bsch2b;
	bitmap{ filename = "sch2g.bmp";} bsch2g;
	bitmap{ filename = "sch3b.bmp";} bsch3b;
	bitmap{ filename = "sch3gr.bmp";} bsch3gr;
	bitmap{ filename = "sch4g.bmp";} bsch4g;
	bitmap{ filename = "sch4gr.bmp";} bsch4gr;

	bitmap{ filename = "options.bmp";} boptions;
} stimuli;

text {caption = "O";} pointer;
trial{
	trial_type = first_response;
	trial_duration = stimuli_length;
	picture