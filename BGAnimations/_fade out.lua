return Def.Quad{
	InitCommand=function(self)
		self:FullScreen():diffuse(color("0,0,0,0"))
	end;
	OnCommand=function(self)
		self:linear(0.2):diffusealpha(1)
	end;
};