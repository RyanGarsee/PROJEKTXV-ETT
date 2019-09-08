return Def.ActorFrame {
	OnCommand=function(self)
		self:sleep(0.9)
	end;

	LoadActor( THEME:GetPathB("","space") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):diffusealpha(0):glow(color("1,1,1,0"))
		end;
		OnCommand=function(self)
			self:linear(.2):glow(color("1,1,1,1")):sleep(.25):diffusealpha(1):glow(color("1,1,1,0"))
		end;
	};

	LoadActor( THEME:GetPathB("","up") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP-SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:sleep(.2):decelerate(0.25):y(SCREEN_CENTER_Y):linear(.15):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("","down") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM+80):zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:sleep(.2):decelerate(0.25):y(SCREEN_CENTER_Y):linear(.15):diffusealpha(0)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo swipe alternate") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-10):zoom(0)
		end;
		OnCommand=function(self)
			self:sleep(.2):rotationz(-90):decelerate(.3):rotationz(0):zoom(1):linear(.2):addy(-10)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo main") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:sleep(.2):zoomy(2):decelerate(.3):diffusealpha(1):zoom(1):linear(.2):addy(-10)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/info") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+20):y(SCREEN_CENTER_Y+53):diffusealpha(0):zoomy(0)
		end;
		OnCommand=function(self)
			self:sleep(.5):linear(.2):diffusealpha(1):zoom(1):linear(.2)
		end;
	};
}