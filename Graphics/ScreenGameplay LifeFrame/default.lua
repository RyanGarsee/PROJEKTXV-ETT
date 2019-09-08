-- todo: aj's frame ("custom")
local framePref = string.format("%02i", tonumber(ThemePrefs.Get("LifeFrame")));
local t = Def.ActorFrame{};

local frameZoom = 1.1

if framePref == "custom" then
	-- diffuse part v
	local customColor = ThemePrefs.Get("LifeFrameCustomColor");
	t[#t+1] = LoadActor("part v")..{
		OnCommand=function(self)
			self:zoom(frameZoom):glow(color("1,1,1,1")):diffuse(color("0.5,1,0.5,0")):decelerate(0.25):diffuse(color(customColor)):glow(color("0.9,1,0.9,0")):zoom(1)
		end;
	};
	t[#t+1] = LoadActor("part a")..{
		OnCommand=function(self)
			self:zoom(frameZoom):glow(color("1,1,1,1")):diffuse(color("0.5,1,0.5,0")):decelerate(0.25):diffuse(color("1,1,1,1")):glow(color("0.9,1,0.9,0")):zoom(1)
		end;
	};
else
	t[#t+1] = LoadActor(framePref)..{
		OnCommand=function(self)
			self:zoom(frameZoom):glow(color("1,1,1,1")):diffuse(color("0.5,1,0.5,0")):decelerate(0.25):diffuse(color("1,1,1,1")):glow(color("0.9,1,0.9,0")):zoom(1)
		end;
	};
end

return t;