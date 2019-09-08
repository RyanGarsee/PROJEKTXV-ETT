return Def.ActorFrame{
	Def.Actor {
		BeginCommand=function(self)
			if SCREENMAN:GetTopScreen():HaveProfileToLoad() then
				self:sleep(0.01);
			end;
			self:queuecommand("Load");
		end;
		LoadCommand=function() SCREENMAN:GetTopScreen():Continue(); end;
	};

	LoadActor( THEME:GetPathB("","space") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo swipe alternate") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-20)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/_logo main") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-20)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenTitleMenu", "background/info") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+20):y(SCREEN_CENTER_Y+53)
		end;
	};

	LoadActor( THEME:GetPathB("","space") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):diffuse(color("0,0,0,0"))
		end;
	};

	LoadActor( THEME:GetPathB("","up") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP-SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):diffusealpha(0):glow(color("1,1,1,1"))
		end;
	};

	LoadActor( THEME:GetPathB("","down") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_HEIGHT+100):zoomtowidth(SCREEN_WIDTH):diffusealpha(0):glow(color("1,1,1,1"))
		end;
	};
};