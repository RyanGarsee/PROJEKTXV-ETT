local t = LoadFallbackB();

-- graph display
local function GraphDisplay( pn )
	local t = Def.ActorFrame {
		Def.GraphDisplay {
			InitCommand=function(self)
				self:Load("GraphDisplay")
			end;
			BeginCommand=function(self)
				local ss = SCREENMAN:GetTopScreen():GetStageStats();
				self:Set( ss, ss:GetPlayerStageStats(pn) );
				self:player( pn );
			end
		};
	};
	return t;
end

if ShowStandardDecoration("GraphDisplay") then
	for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
		t[#t+1] = StandardDecorationFromTable( "GraphDisplay" .. ToEnumShortString(pn), GraphDisplay(pn) );
	end
end

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	local MetricsName = "DifficultyIcon"..PlayerNumberToString(pn);
	t[#t+1] = StandardDecorationFromFile(MetricsName,MetricsName);
end;

-- record text
for pn in ivalues(PlayerNumber) do
	local MetricsName = "RecordText" .. PlayerNumberToString(pn);
	t[#t+1] = LoadActor( THEME:GetPathG(Var "LoadingScreen", "RecordText"), pn ) .. {
		InitCommand=function(self) 
			self:player(pn); 
			self:name(MetricsName); 
			ActorUtil.LoadAllCommandsAndSetXY(self,Var "LoadingScreen"); 
		end;
	};
end

return t;