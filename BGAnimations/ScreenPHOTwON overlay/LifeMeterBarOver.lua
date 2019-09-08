-- this one only has two items.
local framePref = ThemePrefs.Get("LifeMeterBarOver");

local curIndex;
if framePref == "norm" then curIndex = 1;
elseif framePref == "shrink" then curIndex = 2;
else curIndex = 2;
end;

local frames = {
	"norm",
	"shrink"
};

local frameBGPref = string.format("%02i",tonumber(ThemePrefs.Get("LifeFrame")));

local t = Def.ActorFrame{
	InitCommand=function(self)
		self:x(SCREEN_WIDTH+SCREEN_CENTER_X):y((SCREEN_CENTER_Y*0.5)+8)
	end;
	ShowCommand=function(self)
		self:stoptweening():bounceend(0.5):x(math.floor(WideScale(SCREEN_CENTER_X*1.425,SCREEN_CENTER_X*1.35)))
	end;
	HideCommand=function(self)
		self:stoptweening():bouncebegin(0.5):x(SCREEN_WIDTH+SCREEN_CENTER_X)
	end;
	MenuStateChangedMessageCommand=function(self,param)
		if param.NewState == "MenuState_LifeMeterBarOver" then
			self:playcommand("Show")
		elseif param.NewState == "MenuState_Main" then
			self:playcommand("Hide")
		end;
	end;
	Def.Actor{
		Name="LifeMeterBarOverController";
		PlayerMenuInputMessageCommand=function(self,param)
			if param.MenuState == "MenuState_LifeMeterBarOver" then
				if param.Input == "Start" then
					ThemePrefs.Set("LifeMeterBarOver",frames[curIndex]);
					-- okay time to go back to the main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				elseif param.Input == "Back" then
					-- go back to main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				else
					if param.Input == "Left" or param.Input == "Up" then
						MESSAGEMAN:Broadcast("PreviousLifeMeterBarOver");
					elseif param.Input == "Right" or param.Input == "Down" then
						MESSAGEMAN:Broadcast("NextLifeMeterBarOver");
					end;
				end;
			end;
		end;
		NextLifeMeterBarOverMessageCommand=function(self)
			local prevIndex = curIndex;
			if curIndex == 1 then curIndex = 2;
			elseif curIndex == 2 then curIndex = 1;
			end;
			MESSAGEMAN:Broadcast("LifeMeterBarOverChanged",{NewLifeMeterBarOver = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
		PreviousLifeMeterBarOverMessageCommand=function(self)
			local prevIndex = curIndex;
			if curIndex == 1 then curIndex = 2;
			elseif curIndex == 2 then curIndex = 1;
			end;
			MESSAGEMAN:Broadcast("LifeMeterBarOverChanged",{NewLifeMeterBarOver = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
	};

	LoadActor( "_lifeframe "..frameBGPref )..{
		InitCommand=function(self)
			self:x(4):y(52)
		end;
		BeginCommand=function(self)
			self:playcommand( curIndex == 1 and "GainFocus" or "LoseFocus" );
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeMeterBarOverChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			self:Load( THEME:GetPathB("ScreenPHOTwON","overlay/_lifeframe "..param.NewLifeFrame) );
		end;
	};
	LoadActor(THEME:GetPathG("LifeMeterBar","Over/norm"))..{
		InitCommand=function(self)
			self:x(-8):y(50)
		end;
		BeginCommand=function(self)
			self:playcommand( curIndex == 1 and "GainFocus" or "LoseFocus" );
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeMeterBarOverChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor( "_lifeframe "..frameBGPref )..{
		InitCommand=function(self)
			self:x(4):y(224)
		end;
		BeginCommand=function(self)
			self:playcommand( curIndex == 2 and "GainFocus" or "LoseFocus" );
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeMeterBarOverChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			self:Load( THEME:GetPathB("ScreenPHOTwON","overlay/_lifeframe "..param.NewLifeFrame) );
		end;
	};
	LoadActor(THEME:GetPathG("LifeMeterBar","Over/shrink"))..{
		InitCommand=function(self)
			self:x(-8):y(222)
		end;
		BeginCommand=function(self)
			self:playcommand( curIndex == 2 and "GainFocus" or "LoseFocus" );
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		LifeMeterBarOverChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
	};
};

return t;