return Def.ActorFrame{
	LoadActor( THEME:GetPathG("","_here1") )..{
		InitCommand=function(self)
			self:Center()
		end;
		OnCommand=function(self)
			self:playcommand("Set")
		end;
		PlayerJoinedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1))
		end;
	};

	LoadActor( THEME:GetPathG("","_here2") )..{
		InitCommand=function(self)
			self:Center()
		end;
		OnCommand=function(self)
			self:playcommand("Set")
		end;
		PlayerJoinedMessageCommand=function(self)
			self:playcommand("Set")
		end;
		SetCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2))
		end;
	};
};