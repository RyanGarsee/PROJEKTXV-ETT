-- stuff that was originally in the BG but makes more sense here
local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("Player","Status"));
};

-- if someone passed, show cleared stage
t[#t+1] = Def.ActorFrame{
	BeginCommand=function(self)
		self:visible(STATSMAN:GetCurStageStats():OnePassed());
	end;
	LoadActor( THEME:GetPathB("ScreenGameplay","out/ready") )..{
		InitCommand=function(self)
			self:Center()
		end;
		OnCommand=function(self)
			self:sleep(.2):decelerate(.2):addy(20):zoomx(2.5):zoomy(0):diffusealpha(0)
		end;
	};
	LoadActor( THEME:GetPathB("ScreenGameplay","out/ready") )..{
		InitCommand=function(self)
			self:Center():zoomy(10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:linear(.2):zoomy(1):glow(color("1,1,1,1")):diffusealpha(1):decelerate(.2):zoomx(2.5):zoomy(0):addy(20)
		end;
	};
};

return t;