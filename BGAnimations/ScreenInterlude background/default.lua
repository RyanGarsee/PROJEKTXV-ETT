local t = Def.ActorFrame{
	LoadActor("back")..{ InitCommand=function(self)
		self:Center():zoomtowidth(SCREEN_WIDTH)
	end;
	LoadActor("title")..{
		InitCommand=function(self)
			self:Center():addy(-10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:decelerate(0.9):addy(10):diffusealpha(1)
		end;
	};
	LoadActor("text")..{
		InitCommand=function(self)
			self:Center():addy(10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:decelerate(0.9):addy(-10):diffusealpha(1)
		end;
	};
	LoadActor("triangle")..{
		InitCommand=function(self)
			self:Center():addy(10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:decelerate(0.9):addy(-10):diffusealpha(1)
		end;
	};

	LoadActor("zoom")..{
		InitCommand=function(self)
			self:Center():zoom(2):diffusealpha(0):blend(Blend.Add):addx(-1000)
		end;
		OnCommand=function(self)
			self:linear(0.4):addx(1000):diffusealpha(1):linear(0.4):diffusealpha(0):addx(1000)
		end;
	};
	LoadActor("zoom")..{
		InitCommand=function(self)
			self:Center():zoom(-2):diffusealpha(0):blend(Blend.Add):addx(1000)
		end;
		OnCommand=function(self)
			self:linear(0.6):addx(-1000):diffusealpha(1):linear(0.6):diffusealpha(0):addx(-1000)
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH,SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:decelerate(0.2):zoomy(4):linear(.2):diffusealpha(0)
		end;
	};
};

return t;