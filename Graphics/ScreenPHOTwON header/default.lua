return Def.ActorFrame{
	LoadActor("cover")..{ InitCommand=function(self)
		self:Center():zoomtowidth(SCREEN_WIDTH)
	end;
	LoadActor("stuff")..{ InitCommand=function(self)
		self:Center()
	end;
	LoadActor(THEME:GetPathG("_PHOTwON","icon"))..{
		InitCommand=function(self)
			self:xy(SCREEN_CENTER_X-44,SCREEN_CENTER_Y-176)
		end;
	}
};