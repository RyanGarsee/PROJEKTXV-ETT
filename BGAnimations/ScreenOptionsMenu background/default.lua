return Def.ActorFrame {
	LoadActor( THEME:GetPathB("ScreenWithMenuElements","background/clouds") )..{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-0.07,0)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenWithMenuElements","background/clouds") )..{
		InitCommand=function(self)
			self:Center():zoomtowidth(-SCREEN_WIDTH)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-0.14,0):diffusealpha(.4)
		end;
	};

	-- particle layers
	--[[
	LoadActor( THEME:GetPathB("","shineget/shine") )..{
		InitCommand=function(self)
			self:Center()
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,120)
		end;
	};

	LoadActor( THEME:GetPathB("","shineget/shine") )..{
		InitCommand=function(self)
			self:Center()
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-110)
		end;
	};
	--]]

	LoadActor( THEME:GetPathB("ScreenWithMenuElements","background/_spin1") )..{
		InitCommand=function(self)
			self:Center():blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,40)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenWithMenuElements","background/_spin2") )..{
		InitCommand=function(self)
			self:Center():blend(Blend.Add)
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,-50)
		end;
	};

	LoadActor( "cover" )..{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH)
		end;
	};

	LoadActor( THEME:GetPathB("ScreenWithMenuElements","background/tunnel") )..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-60):y(SCREEN_CENTER_Y-45):texcoordvelocity(-.4,0):zoomx(0.8):fadeleft(1):faderight(1)
		end;
	};

	LoadActor(THEME:GetPathG("Player","Status"));

	LoadActor( "stuff" )..{
		InitCommand=function(self)
			self:Center()
		end;
	};
}