local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:Center():zoomto(SCREEN_WIDTH,4):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:linear(0.1):diffusealpha(1):accelerate(0.1):zoomy(SCREEN_HEIGHT)
		end;
	};
};

return t;