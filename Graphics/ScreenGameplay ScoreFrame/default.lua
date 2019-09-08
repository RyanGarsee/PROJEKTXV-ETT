-- todo: elementals
local difficultyFrames = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 2,
	Difficulty_Medium = 4,
	Difficulty_Hard = 6,
	Difficulty_Challenge = 8,
	Difficulty_Edit = 10,
};

local framePref = string.format("%02i",tonumber(ThemePrefs.Get("LifeFrame")));

local function GetSteps(pn) return GAMESTATE:GetCurrentSteps(pn) end

return Def.ActorFrame{
	LoadActor(framePref)..{
		Name="ScoreFrameP1";
		InitCommand=function(self)
			self:x(-208):animate(false):zoom(1.1):glow(color("1,1,1,1")):diffuse(color("0.5,1,0.5,0"))
		end;
		BeginCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1))
			if not GAMESTATE:IsHumanPlayer(PLAYER_1) then return; end;
			local Steps = GetSteps(PLAYER_1);
			if Steps then
				local difficulty = Steps:GetDifficulty();
				self:setstate(difficultyFrames[difficulty]);
			end;
		end;
		OnCommand=function(self)
			self:decelerate(0.25):diffuse(color("1,1,1,1")):glow(color("0.9,1,0.9,0")):zoom(1)
		end;
	};
	LoadActor(framePref)..{
		Name="ScoreFrameP2";
		InitCommand=function(self)
			self:x(188):animate(false):zoom(1.1):glow(color("1,1,1,1")):diffuse(color("0.5,1,0.5,0"))
		end;
		BeginCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2))
			if not GAMESTATE:IsHumanPlayer(PLAYER_2) then return; end;
			-- then check difficulty
			local Steps = GetSteps(PLAYER_2);
			if Steps then
				local difficulty = Steps:GetDifficulty();
				self:setstate(difficultyFrames[difficulty]+1);
			end;
		end;
		OnCommand=function(self)
			self:decelerate(0.25):diffuse(color("1,1,1,1")):glow(color("0.9,1,0.9,0")):zoom(1)
		end;
	};
};