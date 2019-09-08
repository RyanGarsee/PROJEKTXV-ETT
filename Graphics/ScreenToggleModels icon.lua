local gc = Var "GameCommand"
local name = gc:GetName();
local labelText = gc:GetText()

local t = Def.ActorFrame{
	LoadFont("Common normal")..{
		InitCommand=function(self)
			self:settext(THEME:GetString("ScreenToggleModels",labelText)):y(20)
		end;
		GainFocusCommand=function(self)
			self:accelerate(0.25):zoom(1):diffuse(color("#FFFFFFCC"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():decelerate(0.25):zoom(0.75):diffuse(color("#888888CC"))
		end;
		OffFocusedCommand=function(self)
			if name == "Yes" then
				ThemePrefs.Set("Use3DModels",true);
			elseif name == "No" then
				ThemePrefs.Set("Use3DModels",false);
			end
		end;
	};
};

return t;