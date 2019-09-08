return Def.ActorFrame{
	LoadFont("ScreenSelectMusic", "TotalTime")..{
		Name="TotalTime";
		InitCommand=function(self)
			self:shadowlength(1)
		end;
		SetCommand=function(self)
			local song, seltime;

			if GAMESTATE:IsCourseMode() then
				if GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber()) then
					local trail = GAMESTATE:GetCurrentTrail(GAMESTATE:GetMasterPlayerNumber());
					seltime = TrailUtil.GetTotalSeconds( trail );
				end;
			else
				song = GAMESTATE:GetCurrentSong();
				if song then
					seltime = song:MusicLengthSeconds();
				end;
			end;

			if seltime then
				self:settext( (seltime == 105.0) and " :  .  " or SecondsToMSSMsMs(seltime) );
			else
				self:settext( "0:00.00" );
			end;
		end;
		CurrentSongChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentTrailP1ChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		CurrentTrailP2ChangedMessageCommand=function(self)
			self:playcommand("Set")
		end;
	};
};