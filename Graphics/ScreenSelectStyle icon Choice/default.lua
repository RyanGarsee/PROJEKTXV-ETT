local name = Var("GameCommand"):GetName();

return Def.ActorFrame{
	LoadActor("_"..name.." info")..{
		InitCommand=function(self)
			self:Center():diffusealpha(0):zoomy(0):glow(color("1,.9,.5,0"))
		end;
		OnCommand=function(self)
			if name == "Single-Normal" then
				self:linear(0.1):zoomy(1):diffusealpha(1):glow(color("1,1,1,.7")):linear(0.1):glow(color("1,.9,.5,0"))
			end;
		end;
		OffCommand=function(self)
			self:linear(0.3):diffusealpha(0):glow(color("1,1,.5,0"))
		end;
		GainFocusCommand=function(self)
			self:linear(0.1):diffusealpha(1):zoomy(1):glow(color("1,1,1,.7")):decelerate(0.1):diffuse(color("1,1,1,1")):glow(color("1,.9,.5,0"))
		end;
		LoseFocusCommand=function(self)
			self:accelerate(0.1):diffusealpha(0):zoomy(0)
		end;
		EnabledCommand=function(self)
			self:visible(true)
		end;
		DisabledCommand=function(self)
			self:visible(false)
		end;
	};
};