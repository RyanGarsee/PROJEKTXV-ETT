local t = Def.ActorFrame{
	-- background
	--LoadActor("back")..{ InitCommand=cmd(Center;setsize,SCREEN_WIDTH,SCREEN_HEIGHT); };
	-- use quads instead
	Def.Quad{
		Name="TopPart";
		InitCommand=function(self)
			self:valign(0):x(SCREEN_CENTER_X):y(SCREEN_TOP):zoomto(SCREEN_WIDTH,SCREEN_CENTER_Y):diffusetopedge(color("#C7D7E6"))
		end;
	};
	Def.Quad{
		Name="BottomPart";
		InitCommand=function(self)
			self:valign(1):x(SCREEN_CENTER_X):y(SCREEN_BOTTOM):zoomto(SCREEN_WIDTH,SCREEN_CENTER_Y):diffusebottomedge(color("#C7D7E6"))
		end;
	};
	LoadFont("_eurostile lt std ext two Bold 24px")..{
		Name="Website";
		Text="theme ported to etterna 0.66 by br1mst0ne | RIP k//eternal";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM-20):shadowlength(0):diffuse(color("0.4,0.4,0.4,0.425")):strokecolor(color("0.8,0.9,1,1")):zoom(0.425)
		end;
	};

	Def.ActorFrame{
		InitCommand=function(self)
			self:visible(true)
		end;
		LoadActor("sphere")..{
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
			end;
			OnCommand=function(self)
				self:spin():effectmagnitude(0,30,0):zoom(17.5)
			end;
		};
		LoadActor("sphere")..{
			-- x = 580
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X+260):y(SCREEN_CENTER_Y)
			end;
			OnCommand=function(self)
				self:spin():effectmagnitude(0,-20,0):zoom(17.5)
			end;
		};
		LoadActor("sphere")..{
			-- x = 580
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-260):y(SCREEN_CENTER_Y)
			end;
			OnCommand=function(self)
				self:spin():effectmagnitude(0,-20,0):zoom(17.5)
			end;
		};
	};

	LoadActor("scan")..{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH):addy(1)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(0.25,0)
		end;
	};
	LoadActor("scan")..{
		InitCommand=function(self)
			self:Center():diffusealpha(0.6):zoomtowidth(SCREEN_WIDTH)
		end;
	};


	LoadActor("tile1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-0.25,0):diffusealpha(0.15)
		end;
	};
	--[[
	[Layer7]
	File=tile1.gif
	Type=3
	TilesStartY=240
	TileVelocityX=-50
	Command=diffusealpha,.15
	--]]

	LoadActor("tile1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):rotationz(180):zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(0.3,0):diffusealpha(0.15)
		end;
	};
	--[[
	[Layer8]
	File=tile1.gif
	Type=3
	TilesStartY=240
	TileVelocityX=60
	Command=rotationz,180;diffusealpha,.15
	--]]

	LoadActor("_logo swipe normal")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*0.604167):zoom(0):rotationz(-90)
		end;
		OnCommand=function(self)
			self:decelerate(0.3):rotationz(0):zoom(1):linear(0.2):addy(-10)
		end;
	};

	LoadActor("_logo main")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*0.604167):diffusealpha(0):zoomy(2)
		end;
		OnCommand=function(self)
			self:decelerate(0.3):diffusealpha(1):zoom(1):linear(0.2):addy(-10)
		end;
	};

	LoadActor("info")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X*1.0625):y(SCREEN_CENTER_Y*0.8666667):diffusealpha(0):zoomy(0)
		end;
		OnCommand=function(self)
			self:sleep(0.3):linear(0.2):diffusealpha(1):zoom(1):linear(0.2)
		end;
	};

	LoadActor("ring")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.34167)
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,60)
		end;
	};

	LoadActor("arrows")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y*1.34167)
		end;
		OnCommand=function(self)
			self:queuecommand("Animate")
		end;
		AnimateCommand=function(self)
			self:zoomx(1.03):linear(0.827):zoomx(.97):linear(0.827):zoomx(1.03):sleep(0.0011):queuecommand("Animate")
		end;
	};
};

return t;
