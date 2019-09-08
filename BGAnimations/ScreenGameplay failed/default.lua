-- todo: cleanup
return Def.ActorFrame {
	OnCommand=function(self)
		self:sleep(1.5)
	end;

	LoadActor( "center" )..{
		InitCommand=function(self)
			self:FullScreen()
		end;
		OnCommand=function(self)
			self:diffusealpha(0):decelerate(0.15):glow(color("1,1,1,1"))
		end;
	};

	LoadActor( "center" )..{
		InitCommand=function(self)
			self:FullScreen()
		end;
		OnCommand=function(self)
			self:diffusealpha(0):decelerate(0.25):diffusealpha(1)
		end;
	};

	LoadActor( "in" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(-96):bounceend(0.3):addy(192)
		end;
	};

	LoadActor( "in" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(576):zoomy(-1):bounceend(0.3):addy(-192)
		end;
	};

	LoadActor( "mid" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(-96):bounceend(0.25):addy(192)
		end;
	};

	LoadActor( "mid" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(576):zoomy(-1):bounceend(0.25):addy(-192)
		end;
	};

	LoadActor( "out" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(-96):decelerate(0.2):addy(192)
		end;
	};

	LoadActor( "out" )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:y(576):zoomy(-1):decelerate(0.2):addy(-192)
		end;
	};
}