local name = Var("GameCommand"):GetName();

return Def.ActorFrame{
	LoadActor("_"..name)..{
		InitCommand=function(self)
			self:Center():zoomx(1.1):diffusealpha(0):glow(color("1,.9,.5,0"))
		end;
		OffCommand=function(self)
			self:linear(0.3):diffusealpha(0):glow(color("1,1,.5,0"))
		end;
		GainFocusCommand=function(self)
			self:decelerate(0.1):zoom(1):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:accelerate(0.1):zoomx(0.5):zoomy(0.35):diffuse(color("1,1,1,0.5"))
		end;
		EnabledCommand=function(self)
			self:diffuse(color("1,1,1,0.5"))
		end;
		DisabledCommand=function(self)
			self:diffuse(color("0.5,0.5,0.5,1"))
		end;
	};
};