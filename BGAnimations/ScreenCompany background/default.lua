if not getenv("FirstLoad") then
	--LoadUserPrefs(); -- old
	setenv("FirstLoad",true);
end;

local t = Def.ActorFrame{
	LoadActor("1")..{
		InitCommand=function(self)
			self:Center():diffusealpha(0)
		end;
		OnCommand=function(self)
			self:linear(0.5):diffusealpha(1)
		end;
		OffCommand=function(self)
			self:decelerate(1):diffusealpha(0)
		end;
	};
};

return t;