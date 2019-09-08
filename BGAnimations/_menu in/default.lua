return Def.ActorFrame {
	OnCommand=function(self)
		self:sleep(0.4)
	end;

	LoadActor( THEME:GetPathB("","space") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:sleep(.2):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo swipe alternate") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-20)
		end;
		OnCommand=function(self)
			self:sleep(.2):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo main") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-20)
		end;
		OnCommand=function(self)
			self:sleep(.2):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/info") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+20):y(SCREEN_CENTER_Y+53)
		end;
		OnCommand=function(self)
			self:sleep(.2):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("","space") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):diffuse(color("0,0,0,0"))
		end;
		OnCommand=function(self)
			self:accelerate(.2):diffuse(color("0,0,0,1")):sleep(.05):diffusealpha(0):glow(color("1,1,1,1")):linear(.15):glow(color("1,1,1,0"))
		end;
	};

	LoadActor( THEME:GetPathB("","up") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP-SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):diffusealpha(0):glow(color("1,1,1,1"))
		end;
		OnCommand=function(self)
			self:decelerate(0.25):y(240):sleep(0):glow(color("0,0,0,0"))
		end;
	};

	LoadActor( THEME:GetPathB("","down") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_HEIGHT+80):zoomtowidth(SCREEN_WIDTH):diffusealpha(0):glow(color("1,1,1,1"))
		end;
		OnCommand=function(self)
			self:decelerate(0.25):y(SCREEN_CENTER_Y):sleep(0):glow(color("0,0,0,0"))
		end;
	};
}