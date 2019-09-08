local particles1 = {
	Texture=THEME:GetPathB("","shineget/shine");
	NumParticles	= 10;
	ZoomMin			= 0.3;
	ZoomMax			= 0.6;
	VelocityXMin	= 200;
	VelocityXMax	= 400;
	VelocityYMin	= -50;
	VelocityYMax	= 50;
};

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("","_particles"), particles1)..{
		--InitCommand=cmd(x,SCREEN_LEFT-(SCREEN_CENTER_X/2));
	};
};

return t;