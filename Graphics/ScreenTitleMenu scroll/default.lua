local gc = Var("GameCommand");
local idx = gc:GetIndex()+1;

local kanji = {
	"game",
	"edit",
	"option",
	"photwon",
	"quit",
};

local sideTexts = {
	Game	= { Left = "Quit", Right = "Edit" };
	Edit	= { Left = "Game", Right = "Opts" };
	Option	= { Left = "Edit", Right = "Pho2" };
	PHOTwON	= { Left = "Opts", Right = "Quit" };
	Quit	= { Left = "Pho2", Right = "Game" };
}

return Def.ActorFrame {
	LoadActor("_kanji "..kanji[idx])..{
		InitCommand=function(self)
			self:diffusealpha(0)
		end;
		GainFocusCommand=function(self)
			self:stoptweening():zoomx(1.1):linear(0.2):diffusealpha(0.3):zoomx(1)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.2):zoomx(1):diffusealpha(0)
		end;
	};
	LoadFont("_eurostile lt std ext two Bold 24px") .. {
		Name="Left";
		InitCommand=function(self)
			self:x(-88):y(-28):zoom(0.583333):diffuse(color("0,0,0,0.5")):strokecolor(color("1,1,1,0.5")):uppercase(true):halign(1)
		end;
		GainFocusCommand=function(self)
			self:settext(sideTexts[gc:GetName()].Left):addx(-20):accelerate(0.1):diffusealpha(0.5):addx(20)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():accelerate(0.1):diffusealpha(0)
		end;
	};
	LoadFont("_eurostile lt std ext two Bold 24px") .. {
		Name="Right";
		InitCommand=function(self)
			self:x(88):y(-28):zoom(0.583333):diffuse(color("0,0,0,0.5")):strokecolor(color("1,1,1,0.5")):uppercase(true):halign(0)
		end;
		GainFocusCommand=function(self)
			self:settext(sideTexts[gc:GetName()].Right):addx(20):accelerate(0.1):diffusealpha(0.5):addx(-20)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():accelerate(0.1):diffusealpha(0)
		end;
	};
	LoadFont("_eurostile lt std ext two Bold 24px") .. {
		Name="Main";
		Text=gc:GetText();
		InitCommand=function(self)
			self:y(-10):diffusecolor(color("0,0,0,0")):strokecolor(color("1,1,1,1"))
		end;
		GainFocusCommand=function(self)
			self:zoomx(1.1):accelerate(0.1):diffusealpha(1):zoomx(1)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():accelerate(0.1):diffusealpha(0)
		end;
	};
	LoadFont("_eurostile lt std ext two Bold 24px") .. {
		Name="Explain";
		Text=THEME:GetString("ScreenTitleMenu","Explain"..gc:GetText());
		InitCommand=function(self)
			self:uppercase(true):zoom(0.4):y(10):diffusealpha(0)
		end;
		OnCommand=function(self)
			self:diffusecolor(color("1,1,1,1")):strokecolor(color("0,0,0,1"))
		end;
		GainFocusCommand=function(self)
			self:zoomx(0.5):accelerate(0.1):diffusealpha(1):zoomx(0.4)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():accelerate(0.1):diffusealpha(0)
		end;
	};
};