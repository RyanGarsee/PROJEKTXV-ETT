local t = Def.ActorFrame{
	-- tile layers
	--[[
	[Layer1]
	File=clouds.jpg
	Type=3
	TilesStartY=240
	TileVelocityX=-70
	Command=

	[Layer2]
	File=clouds.jpg
	Type=3
	TilesStartY=240
	TileVelocityX=-140
	Command=diffusealpha,.4;zoomx,-1
	--]]
	LoadActor("clouds")..{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-0.07,0)
		end;
	};
	LoadActor("clouds")..{
		InitCommand=function(self)
			self:Center():zoomtowidth(-SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-0.14,0):diffusealpha(.4)
		end;
	};
	-- particle layers
	--[[
	[Layer3]
	File=../shineget/shine.png
	Type=2
	ZoomMin=.3
	ZoomMax=.6
	VelocityXMin=400
	VelocityXMax=200
	VelocityYMin=-50
	VelocityYMax=50
	NumParticles=10
	Command=spin;effectmagnitude,0,0,120
	--]]
	LoadActor(THEME:GetPathG("","_particles"),{
		NumParticles=10,
		ZoomMin = 0.3,
		ZoomMax = 0.6,
		VelocityXMin = 200,
		VelocityXMax = 400,
		VelocityYMin = -50,
		VelocityYMax = 50,
		SpinZ = 120,
	});

	--[[
	[Layer4]
	File=../shineget/shine.png
	Type=2
	ZoomMin=.4
	ZoomMax=.5
	VelocityXMin=500
	VelocityXMax=300
	VelocityYMin=-75
	VelocityYMax=75
	NumParticles=9
	Command=spin;effectmagnitude,0,0,-110
	--]]
	LoadActor(THEME:GetPathG("","_particles"),{
		NumParticles=9,
		ZoomMin = 0.40,
		ZoomMax = 0.51,
		VelocityXMin = 300,
		VelocityXMax = 500,
		VelocityYMin = -75,
		VelocityYMax = 75,
		SpinZ = -110,
	});

	LoadActor("_spin1")..{
		InitCommand=function(self)
			self:Center():blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,40)
		end;
	};

	LoadActor("_spin2")..{
		InitCommand=function(self)
			self:Center():blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-50)
		end;
	};

	LoadActor("cover")..{ InitCommand=function(self)
		self:Center():zoomtowidth(SCREEN_WIDTH)
	end;

	LoadActor("tunnel")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-60,y,SCREEN_CENTER_Y-45)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-.4,0):zoomx(.8):fadeleft(1):faderight(1)
		end;
	};
};

return t;