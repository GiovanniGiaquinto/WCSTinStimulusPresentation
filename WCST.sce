#headers
default_background_color = 0, 0, 0;
default_text_color = 255, 255, 255;
default_font = "cambria";
default_font_size = 28;
active_buttons = 1;
response_matching = simple_matching;

#SDL
begin;
#welcome text
text{caption = "Welcome to this experiment, and thank you for your participation
					press A to go to the instruction screen";} welc_text;
#Instructions
text{caption = "In this experiment you will be presented with 4 card piles on the top of the screen.
					Your task is to figure out the classification rule to sort the card at the bottom of the screen.
					There are three possible ways to sort the card; either based on the background color of the card,
					the number of objects on the card, or the object on the card. You will hear a high pitched sound
					if you chose CORRECTLY. A low pitched sound means you chose the WRONG classification rule.
					To choose a card pile, select the button that corresponds to the letter under it.
					After a while the sorting rule will CHANGE, you will NOT be notified when this happens,
					it is therefore important that you closely listen to the feedback sound. Try to make as few mistakes
					as possible. Good luck!
					
					Press A to start the experiment.";} inst_text;
					
picture{text welc_text; x = 0; y = 0;} welc_pic;
picture{text inst_text; x = 0; y = 0;} inst_pic;

#Welcome page & Instruction Page
trial{
	trial_type = fixed;
	trial_duration = stimuli_length;
	stimulus_event{
		picture welc_pic;
		time = 0;
		duration = response;
		response_active = true;
	}; 
	stimulus_event{
		picture inst_pic;
		delta_time = 0;
		duration = response;
		response_active = true;
	};
};

trial{
	trial_type = fixed;
	trial_duration = stimuli_length;
	
