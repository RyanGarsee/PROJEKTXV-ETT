local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:Center():FullScreen():diffusealpha(1)
		end;
		OnCommand=function(self)
			self:linear(.2):diffusealpha(0)
		end;
	};
};

return t;