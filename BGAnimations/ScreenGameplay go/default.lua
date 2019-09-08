local t = Def.ActorFrame{
	LoadActor("streakmania")..{
		InitCommand=function(self)
			self:Center():zoomx(2):diffusealpha(0):blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:linear(0.5):zoomx(1.5):diffusealpha(1):linear(0.5):zoomx(1):diffusealpha(0)
		end;
	};

	LoadActor("streakmania")..{
		InitCommand=function(self)
			self:Center():glow(color("0.7,0.7,1,0")):zoomx(3):zoomy(0.5):diffusealpha(0):blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:linear(.5):zoomx(2):glow(color("0.7,0.7,1,0.2")):diffusealpha(1):linear(0.5):zoomx(1):glow(color("1,1,1,0")):diffusealpha(0)
		end;
	};

	Def.Quad{
		InitCommand=function(self)
			self:Center():diffuse(color("0,0,0,1")):hide_if(not GAMESTATE:IsCourseMode())
		end;
		OnCommand=function(self)
			self:linear(0.5):diffusealpha(0)
		end;
	};

	LoadActor("ready")..{
		InitCommand=function(self)
			self:Center():hibernate(0.2):diffusealpha(0.4)
		end;
		OnCommand=function(self)
			self:linear(0.9):zoomx(1.5):zoomy(2.3):diffusealpha(0)
		end;
	};

	LoadActor("ready")..{
		InitCommand=function(self)
			self:Center():hibernate(0.2):diffusealpha(0.5)
		end;
		OnCommand=function(self)
			self:linear(0.8):zoomx(1.3):zoomy(1.75):diffusealpha(0)
		end;
	};

	LoadActor("streakmania")..{
		InitCommand=function(self)
			self:Center():glow(color("0.7,0.7,1,0")):zoomx(3):zoomy(0.5):diffusealpha(0):blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:linear(.5):zoomx(2):glow(color("0.7,0.7,1,0.2")):diffusealpha(0.5):linear(0.5):zoomx(1):diffusealpha(0):glow(color("1,1,1,0"))
		end;
	};

	LoadActor("ready")..{
		InitCommand=function(self)
			self:Center():diffusealpha(0):zoomx(3)
		end;
		OnCommand=function(self)
			self:decelerate(0.2):zoom(1):diffusealpha(1):glow(color("1,1,1,0.7")):linear(0.2):glow(color("1,1,1,0")):sleep(.3):linear(0.4):zoom(1.3):diffusealpha(0)
		end;
	};
};

return t;