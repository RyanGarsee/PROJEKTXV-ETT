return Def.Quad{
	InitCommand=function(self)
		self:FullScreen():diffuse(color("0,0,0,1"))
	end;
	OnCommand=function(self)
		self:linear(0.3):diffusealpha(0)
	end;
};