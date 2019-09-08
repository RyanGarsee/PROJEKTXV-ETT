return Def.CourseContentsList {
	MaxSongs = 20;
    NumItemsToDraw = 10;
	InitCommand=function(self)
		self:zbuffer(true):ztest(true):z(150)
	end;
	SetCommand=function(self)
		self:SetFromGameState();
		self:finishtweening();
		self:PositionItems();
		self:SetTransformFromHeight(44);
		self:SetCurrentAndDestinationItem(0);
		self:SetMask(270,0);
	end;
	CurrentTrailP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentTrailP2ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;

	Display = Def.ActorFrame{ 
		LoadActor(THEME:GetPathG("CourseEntryDisplay","bar"))..{
			SetSongCommand=function(self, params)
				self:finishtweening():zoomx(1.05):diffusealpha(0):sleep(0.125*params.Number):linear(0.125):diffusealpha(1):linear(0.05):glow(color("1,1,1,0.5")):decelerate(0.1):glow(color("1,1,1,0"));
			end;
		};

		Def.TextBanner{
			InitCommand=function(self)
				self:x(-98):y(-2):Load("TextBanner"):SetFromString("", "", "", "", "", "")
			end;
			SetSongCommand=function(self, params)
				if params.Song then
					self:SetFromSong( params.Song );
				else
					self:SetFromString( "??????????", "??????????", "", "", "", "" );
				end
				self:diffuse( color("#FFFFFF") );
			end;
		};

 		LoadFont("Common","normal")..{
			InitCommand=function(self)
				self:x(124):shadowlength(0)
			end;
			SetSongCommand=function(self,params)
				if params.Song then
					self:settext( params.Meter );
					local cd = ToEnumShortString(params.Difficulty)
					self:diffuse( CustomDifficultyToColor(cd) );
				end;
			end;
		};
	};
};