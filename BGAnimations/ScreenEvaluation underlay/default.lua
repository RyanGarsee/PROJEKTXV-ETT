local t = Def.ActorFrame{
	LoadActor("_graph P1")..{
		InitCommand=function(self)
			self:x(THEME:GetMetric(Var "LoadingScreen", "GraphFrameP1X")):y(THEME:GetMetric(Var "LoadingScreen", "GraphFrameP1Y"))
		end;
		BeginCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_1));
		end;
		OnCommand=THEME:GetMetric(Var "LoadingScreen","GraphFrameP1OnCommand")
	};
	LoadActor("_graph P2")..{
		InitCommand=function(self)
			self:x(THEME:GetMetric(Var "LoadingScreen", "GraphFrameP2X")):y(THEME:GetMetric(Var "LoadingScreen", "GraphFrameP2Y"))
		end;
		BeginCommand=function(self)
			self:visible(GAMESTATE:IsHumanPlayer(PLAYER_2));
		end;
		OnCommand=THEME:GetMetric(Var "LoadingScreen","GraphFrameP2OnCommand")
	};
	LoadActor(THEME:GetPathG("Player","Status"));
};
return t;