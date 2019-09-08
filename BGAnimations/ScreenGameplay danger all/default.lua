local t = Def.ActorFrame{
	LoadSongBackground()..{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("1,0,0,1"))
		end;
	};
	LoadSongBackground()..{
		InitCommand=function(self)
			self:zoomtowidth(SCREEN_WIDTH*1.375):zoomtoheight(SCREEN_HEIGHT*1.375):diffuse(color("0,0,0,0"))
		end;
		OnCommand=function(self)
			self:playcommand("Danger")
		end;
		DangerCommand=function(self)
			self:decelerate(1.5):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(("1,0,0,1")):sleep(13.5):queuecommand("Danger")
		end;
	};
};

return t;