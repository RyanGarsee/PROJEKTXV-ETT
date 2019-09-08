-- judgments
local judgePref = ThemePrefs.Get("Judgment");
local curIndex = 1; -- was 1

if judgePref then
	local _ = { "01","02","03","04" };
	for i,v in ipairs(_) do
		if v == judgePref then curIndex = i; end;
	end;
end;

local frames = {
	Basic = "01",
	Tech2 = "02",
	Gothic = "03",
	Minus = "04"
};
local numFrames = 4;

local t = Def.ActorFrame{
	InitCommand=function(self)
		self:x(SCREEN_WIDTH+SCREEN_CENTER_X):y((SCREEN_CENTER_Y*0.5)+8)
	end;
	ShowCommand=function(self)
		self:stoptweening():bounceend(0.5):x(SCREEN_CENTER_X*1.5)
	end;
	HideCommand=function(self)
		self:stoptweening():bouncebegin(0.5):x(SCREEN_WIDTH+SCREEN_CENTER_X)
	end;
	MenuStateChangedMessageCommand=function(self,param)
		if param.NewState == "MenuState_Judgment" then
			self:playcommand("Show")
		elseif param.NewState == "MenuState_Main" then
			self:playcommand("Hide")
		end;
	end;

	Def.Actor{
		Name="JudgmentController";
		PlayerMenuInputMessageCommand=function(self,param)
			if param.MenuState == "MenuState_Judgment" then
				if param.Input == "Start" then
					ThemePrefs.Set("Judgment",string.format("%02i",curIndex));
					-- okay time to go back to the main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				elseif param.Input == "Back" then
					-- go back to main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				else
					-- left and right switch frames.
					if param.Input == "Left" or param.Input == "Up" then
						MESSAGEMAN:Broadcast("PreviousJudgment");
					elseif param.Input == "Right" or param.Input == "Down" then
						MESSAGEMAN:Broadcast("NextJudgment");
					end;
				end;
			end;
		end;
		NextJudgmentMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex + 1;
			if curIndex > numFrames then curIndex = 1; end;

			local newFrame;
			for k,v in pairs(frames) do
				if tonumber(v) == curIndex then
					newFrame = k;
				end;
			end;
			MESSAGEMAN:Broadcast("JudgmentChanged",{NewJudgment = frames[newFrame], NewIndex = curIndex, OldIndex = prevIndex});
		end;
		PreviousJudgmentMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex - 1;
			if curIndex < 1 then curIndex = numFrames; end;

			local newFrame;
			for k,v in pairs(frames) do
				if tonumber(v) == curIndex then
					newFrame = k;
				end;
			end;
			MESSAGEMAN:Broadcast("JudgmentChanged",{NewJudgment = frames[newFrame], NewIndex = curIndex, OldIndex = prevIndex});
		end;
	};

	LoadActor(THEME:GetPathG("Player","judgment/01"))..{
		InitCommand=function(self)
			self:y(48):animate(false)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 1 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		JudgmentChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor(THEME:GetPathG("Player","judgment/02"))..{
		InitCommand=function(self)
			self:y(108):animate(false)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 2 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		JudgmentChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor(THEME:GetPathG("Player","judgment/03"))..{
		InitCommand=function(self)
			self:y(168):animate(false)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 3 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		JudgmentChangedMessageCommand=function(self,param)
			if param.OldIndex == 3 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 3 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor(THEME:GetPathG("Player","judgment/04"))..{
		InitCommand=function(self)
			self:y(228):animate(false)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 4 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		JudgmentChangedMessageCommand=function(self,param)
			if param.OldIndex == 4 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 4 then
				self:playcommand("GainFocus");
			end;
		end;
	};
};

return t;