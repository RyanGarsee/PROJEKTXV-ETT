--[[
zoomx,320;zoomy,4;diffusealpha,0;
linear,.1;diffusealpha,1;accelerate,.1;zoomy,240;
--]]

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH):zoomtoheight(4):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:linear(.1):diffusealpha(1):accelerate(.1):zoomy(SCREEN_HEIGHT)
		end;
	};
};

return t;