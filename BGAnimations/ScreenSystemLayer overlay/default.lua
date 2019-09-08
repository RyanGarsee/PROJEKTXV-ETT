local function CreditsFrame(pn)
	local filename = "here"
	filename = filename..(pn == PLAYER_1 and "1" or "2");
	-- housekeeping and stuff (stolen from the danfordz)
	function update(self)
		local str = ScreenSystemLayerHelpers.GetCreditsMessage(pn);
		self:settext(str);
	end;

	function UpdateVisible(self)
		local screen = SCREENMAN:GetTopScreen();
		local bShow = true;
		if screen then
			local sClass = screen:GetName();
			bShow = THEME:GetMetric( sClass, "ShowCoinsAndCredits" );
		end

		self:visible( bShow );
	end;

	local ret = Def.ActorFrame{
		-- frame
		--[[
		LoadActor(filename)..{
			SetCommand=function(self)
				self:hide_if(not GAMESTATE:IsHumanPlayer(pn))
			end;
			ScreenChangedMessageCommand=function(self)
				self:playcommand("Set")
			end;
			PlayerJoinedMessageCommand=function(self)
				self:playcommand("Set")
			end;
		};
		--]]
		-- text
		LoadFont(Var "LoadingScreen","credits") .. {
			InitCommand=THEME:GetMetric(Var "LoadingScreen","CreditsInitCommand");
			BeginCommand=function(self)
				self:halign(pn == PLAYER_1 and 0 or 1);
			end;
			RefreshCreditTextMessageCommand=update;
			CoinInsertedMessageCommand=update;
			PlayerJoinedMessageCommand=update;
			ScreenChangedMessageCommand=UpdateVisible;
		};
	};
	return ret;
end;

local t = Def.ActorFrame{
	Def.ActorFrame {
		Name="SystemMessageFrame";
		Def.Quad {
			InitCommand=function(self)
				self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(30):horizalign(left):vertalign(top):y(SCREEN_TOP):diffusetopedge(color("#FFFFFF")):diffusebottomedge(color("#000000")):diffusealpha(0)
			end;
			OnCommand=function(self)
				self:finishtweening():x(SCREEN_LEFT):diffusealpha(0.3):addx(-SCREEN_WIDTH):linear(0.5):addx(SCREEN_WIDTH)
			end;
			OffCommand=function(self)
				self:sleep(3):linear(0.5):diffusealpha(0)
			end;
		};
		LoadFont(Var "LoadingScreen","SystemMessage") .. {
			Name="Text";
			InitCommand=function(self)
				self:maxwidth(750):horizalign(left):vertalign(top):y(SCREEN_TOP+10):strokecolor(color("#000000")):shadowlength(0):diffusealpha(0)
			end;
			OnCommand=function(self)
				self:finishtweening():x(SCREEN_LEFT+10):diffusealpha(1):addx(-SCREEN_WIDTH):linear(0.5):addx(SCREEN_WIDTH)
			end;
			OffCommand=function(self)
				self:sleep(3):linear(0.5):diffusealpha(0)
			end;
		};
		SystemMessageMessageCommand = function(self, params)
			self:GetChild("Text"):settext( params.Message );
			self:playcommand( "On" );
			if params.NoAnimate then
				self:finishtweening();
			end
			self:playcommand( "Off" );
		end;
		HideSystemMessageMessageCommand = function(self)
			self:finishtweening()
		end;
	};

	CreditsFrame( PLAYER_1 ) .. {
		InitCommand=function(self)
			self:x(THEME:GetMetric(Var "LoadingScreen","CreditsP1X")):y(THEME:GetMetric(Var "LoadingScreen","CreditsP1Y"))
		end;
		OnCommand=function(self)
			self:hibernate(0.5):diffusealpha(0):linear(0.2):diffusealpha(1):shadowlength(1)
		end;
	};
	CreditsFrame( PLAYER_2 ) .. {
		InitCommand=function(self)
			self:x(THEME:GetMetric(Var "LoadingScreen","CreditsP2X")):y(THEME:GetMetric(Var "LoadingScreen","CreditsP2Y"))
		end;
		OnCommand=function(self)
			self:hibernate(0.5):diffusealpha(0):linear(0.2):diffusealpha(1):shadowlength(1)
		end;
	};
};

return t;