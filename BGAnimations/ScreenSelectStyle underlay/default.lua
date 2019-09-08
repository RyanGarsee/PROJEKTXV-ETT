local t = Def.ActorFrame{
	LoadActor("stuff")..{
		InitCommand=function(self)
			self:Center():diffusealpha(0):zoomy(0)
		end;
		OnCommand=function(self)
			self:linear(0.1):zoomy(1):diffusealpha(1)
		end;
	};
	LoadActor(THEME:GetPathG("Player","Status"));
};

return t;