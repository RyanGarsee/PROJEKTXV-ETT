local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:Center():FullScreen():diffusealpha(0)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(.4):linear(0.2):diffusealpha(1)
		end;
	};
};

return t;