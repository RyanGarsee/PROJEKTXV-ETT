-- previews the current settings. has an arrow going up, with judgments happening
local gameToArrow = {
	dance  = "Up",
	pump   = "Center",
	kb7    = "Key",
	ez2    = "",	--?
	para   = "Up",	--up
	ds3ddx = "",	--?
	beat   = "White",
	popn   = "",	--red popkun
	maniax = "",	--red note idk which one it's for
	techno = "Center",
	guitar = "Fret3",
};

local receptorX = SCREEN_CENTER_X*0.5082;
local receptorY = SCREEN_CENTER_Y*0.8;

local t = Def.ActorFrame{
	Def.ActorFrame{
		Name="ArrowFrame";
		InitCommand=function(self)
			self:x(receptorX*1.1825)
		end;
		-- receptor
		NOTESKIN:LoadActorForNoteSkin( gameToArrow[GAMESTATE:GetCurrentGame():GetName()], "Receptor", "default" )..{
			InitCommand=function(self)
				self:y(receptorY)
			end;
		};
		-- note
		NOTESKIN:LoadActorForNoteSkin( gameToArrow[GAMESTATE:GetCurrentGame():GetName()], "Tap Note", "default" )..{
			InitCommand=function(self)
				self:y(SCREEN_BOTTOM+64)
			end;
			OnCommand=function(self)
				self:queuecommand("Scroll")
			end;
			ScrollCommand=function(self)
				self:rotationy(0):y(SCREEN_BOTTOM+64):linear(1):y(receptorY):sleep(0.1):rotationy(90):sleep(0.9):queuecommand("Scroll")
			end;
		};
		-- explosion
		NOTESKIN:LoadActorForNoteSkin( gameToArrow[GAMESTATE:GetCurrentGame():GetName()], "Tap Explosion Bright", "default" )..{
			InitCommand=function(self)
				self:y(receptorY)
			end;
			OnCommand=function(self)
				self:queuecommand("Boom")
			end;
			BoomCommand=function(self)
				--NOTESKIN:GetMetricAForNoteSkin("GhostArrowBright", "W1Command", "default")(self);
				self:diffusealpha(0);
				self:sleep(1);
				-- xxx: yeah it's not working the proper way; gotta bootleg!
				self:diffuse(color("1,1,1,1")):sleep(.1):decelerate(.4):diffusealpha(0)
				self:sleep(0.5);
				self:queuecommand("Boom");
			end;
		};
		-- judgment
		Def.Sprite{
			InitCommand=function(self)
				self:y(receptorY+80):animate(false)
			end;
			BeginCommand=function(self)
				self:Load(THEME:GetPathG("Player","judgment/"..string.format("%02i",tonumber(ThemePrefs.Get("Judgment"))) ));
			end;
			OnCommand=function(self)
				self:queuecommand("Anim")
			end;
			AnimCommand=function(self)
				self:diffusealpha(0);
				self:sleep(1);
				self:diffusealpha(0.5);
				self:glowshift();
				self:effectclock('bgm');
				self:effectperiod(.5);
				self:effectcolor1(color("1,1,0.9,0"));
				self:effectcolor2(color("1,1,1,0.6"));
				self:zoomx(2);
				self:zoomy(0.2);
				self:linear(0.1);
				self:diffusealpha(1);
				self:zoom(.85);
				self:sleep(0.8);
				self:linear(0.1);
				self:diffusealpha(0);
				self:zoom(1.4)
				self:queuecommand("Anim");
			end;
			JudgmentChangedMessageCommand=function(self,param)
				self:Load(THEME:GetPathG("Player","judgment/"..param.NewJudgment));
			end;
		};
	};
	-----------
	-- life frame
	Def.Sprite{
		InitCommand=function(self)
			self:x(receptorX*2):y(receptorY-64):animate(false):cropright(0.5333333)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathG("ScreenGameplay","LifeFrame/".. string.format("%02i",tonumber(ThemePrefs.Get("LifeFrame"))) ));
		end;
		--[[
		OnCommand=function(self)
			self:queuecommand("GainFocus")
		end;
		MainMenuFocusChangedMessageCommand=function(self,param)
			if param.Gain == "LifeFrame" then
				self:playcommand("GainFocus");
			elseif param.Lose == "LifeFrame" then
				self:playcommand("LoseFocus");
			end;
		end;
		GainFocusCommand=function(self)
			self:stoptweening():glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect()
		end;
		--]]
		LifeFrameChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathG("ScreenGameplay","LifeFrame/"..param.NewLifeFrame));
		end;
	};
	LoadActor(THEME:GetPathG("StreamDisplay","Normal"))..{
		InitCommand=function(self)
			self:x(receptorX+WideScale(-138,-84)):y(receptorY-66):halign(0):texcoordvelocity(-1,0)
		end;
	};
	-- meter bar ova
	Def.Sprite{
		InitCommand=function(self)
			self:x(receptorX+WideScale(-4,48)):y(receptorY-67)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathG("LifeMeterBar","Over/".. ThemePrefs.Get("LifeMeterBarOver")));
		end;
		--[[
		MainMenuFocusChangedMessageCommand=function(self,param)
			if param.Gain == "LifeMeterBarOver" then
				self:playcommand("GainFocus");
			elseif param.Lose == "LifeMeterBarOver" then
				self:playcommand("LoseFocus");
			end;
		end;
		GainFocusCommand=function(self)
			self:stoptweening():glowshift():effectperiod(0.5):effectcolor1(color("1,1,1,0.375")):effectcolor2(color("1,1,1,0"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():stopeffect()
		end;
		--]]
		LifeMeterBarOverChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathG("LifeMeterBar","Over/"..param.NewLifeMeterBarOver));
		end;
	};
	-- score frame too, why not
	Def.Sprite{
		InitCommand=function(self)
			self:x(receptorX):y(receptorY+SCREEN_CENTER_Y):animate(false)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathG("ScreenGameplay","ScoreFrame/".. string.format("%02i",tonumber(ThemePrefs.Get("LifeFrame"))) ));
			self:setstate(6);
		end;
		LifeFrameChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathG("ScreenGameplay","ScoreFrame/"..param.NewLifeFrame))
		end;
	};
};

return t;