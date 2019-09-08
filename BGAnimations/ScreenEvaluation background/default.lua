local t = Def.ActorFrame{};
local BestGrade = Grade[STATSMAN:GetBestGrade()];

-- static elements
t[#t+1] = Def.ActorFrame{
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
	-- shine particle layers go here later
	Def.ActorFrame{
		BeginCommand=function(self)
			self:visible(BestGrade <= 'Grade_Tier03')
		end;
		LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/_spin1"))..{
			InitCommand=function(self)
				self:Center():blend(Blend.Add)
			end;
			OnCommand=function(self)
				self:spin():effectmagnitude(0,0,40)
			end;
		};

		LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/_spin2"))..{
			InitCommand=function(self)
				self:Center():blend(Blend.Add)
			end;
			OnCommand=function(self)
				self:spin():effectmagnitude(0,0,-50)
			end;
		};
	};
	LoadActor( THEME:GetPathB("ScreenOptionsMenu","background/cover") )..{
		InitCommand=function(self)
			self:Center():zoomtowidth(SCREEN_WIDTH)
		end;
	};
	LoadActor(THEME:GetPathB("ScreenWithMenuElements","background/tunnel"))..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-60,y,SCREEN_CENTER_Y-45)
		end;
		BeginCommand=function(self)
			self:visible(BestGrade <= 'Grade_Tier03')
		end;
		OnCommand=function(self)
			self:texcoordvelocity(-.5,0):zoomx(0.617):fadeleft(1):faderight(1)
		end;
	};
};

-- grade conditional bgs
local gradeBG;

if BestGrade <= 'Grade_Tier03' then
	-- color
	local possibleFiles = { "color2", "color1", "color3", "color4" };
	local bgFile;
	local _ = math.mod(Minute(),5);
	if _ < 2 then bgFile = possibleFiles[1];
	elseif _ == 2 then bgFile = possibleFiles[2];
	elseif _ == 3 then bgFile = possibleFiles[3];
	elseif _ == 4 then bgFile = possibleFiles[4];
	end;

	gradeBG = Def.ActorFrame{
		LoadActor(bgFile)..{
			InitCommand=function(self)
				self:Center():diffusealpha(0)
			end;
			OnCommand=function(self)
				self:linear(0.2):diffusealpha(1)
			end;
		};
	};
	-- omes and ex
	local stage = GAMESTATE:GetCurrentStage();
	if stage == 'Stage_Final' then
		gradeBG[#gradeBG+1] = LoadActor("exbg")..{ InitCommand=function(self)
			self:Center()
		end;
	elseif stage == 'Stage_Extra1' then
		gradeBG[#gradeBG+1] = LoadActor("omesbg")..{ InitCommand=function(self)
			self:Center()
		end;
	end;
elseif BestGrade == 'Grade_Tier04' then
	-- mono
	local possibleFiles = { "mono4", "mono3", "mono1", "mono2" };
	local bgFile;
	local _ = math.mod(Minute(),5);
	if _ < 2 then bgFile = possibleFiles[1];
	elseif _ == 2 then bgFile = possibleFiles[2];
	elseif _ == 3 then bgFile = possibleFiles[3];
	elseif _ == 4 then bgFile = possibleFiles[4];
	end;
	gradeBG = Def.ActorFrame{
		LoadActor(bgFile)..{
			InitCommand=function(self)
				self:Center():diffusealpha(0)
			end;
			OnCommand=function(self)
				self:linear(0.2):diffusealpha(1)
			end;
		};
	};
else
	-- april fools
	if MonthOfYear() == 4 and DayOfMonth() == 1 then
		gradeBG = Def.ActorFrame{
			LoadActor("unic")..{
				InitCommand=function(self)
					self:Center():diffusealpha(0)
				end;
				OnCommand=function(self)
					self:linear(0.2):diffusealpha(1)
				end;
			};
		};
	else
		gradeBG = Def.ActorFrame{};
	end;
end;

t[#t+1] = gradeBG;

return t;