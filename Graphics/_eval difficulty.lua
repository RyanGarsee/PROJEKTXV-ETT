local Player = ...
assert(Player,"Needs a Player")

local DifficultyToFrame = {
	Difficulty_Beginner	 = 0,
	Difficulty_Easy		 = 1,
	Difficulty_Medium	 = 2,
	Difficulty_Hard		 = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit		 = 5,
};
return LoadActor("ScreenEvaluation DifficultyIcons")..{
	InitCommand=function(self)
		self:animate(false):setstate(0)
	end;
	BeginCommand=function(self)
		self:player(Player):playcommand("Set")
	end;
	SetCommand=function(self)
		if GAMESTATE:GetCurrentSong() then
			local StepsOrTrail;
			if GAMESTATE:IsCourseMode() then
				StepsOrTrail = GAMESTATE:GetCurrentTrail(Player);
			else
				StepsOrTrail = GAMESTATE:GetCurrentSteps(Player);
			end;
			if StepsOrTrail then
				self:setstate(DifficultyToFrame[StepsOrTrail:GetDifficulty()]);
				self:visible(true)
			else
				self:visible(false)
			end;
		else
			self:visible(false)
		end;
	end;
};