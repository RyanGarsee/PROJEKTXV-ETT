local stages = Def.ActorFrame {
	BeginCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentSongChangedMessageCommand=function(self)
		self:finishtweening():playcommand("Set")
	end;
};

for s in ivalues(Stage) do
	stages[#stages+1] = LoadActor( THEME:GetPathG("ScreenWithMenuElements","StageDisplay/"..s)) .. {
		SetCommand=function(self, params)
			local Stage = GAMESTATE:GetCurrentStage();
			local StageIndex = GAMESTATE:GetCurrentStageIndex();
			local screen = SCREENMAN:GetTopScreen();
			if screen and screen.GetStageStats then
				local ss = screen:GetStageStats();
				Stage = ss:GetStage();
				StageIndex = ss:GetStageIndex();
			end
			self:visible( Stage == s );
		end;
	}
end

return stages;
