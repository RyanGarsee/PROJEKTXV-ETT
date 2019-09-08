local t = LoadFallbackB();

t[#t+1] = StandardDecorationFromFile("StageDisplay", "StageDisplay");
t[#t+1] = StandardDecorationFromFile("LifeFrame", "LifeFrame");
t[#t+1] = StandardDecorationFromFile("StageFrame", "StageFrame");
t[#t+1] = StandardDecorationFromFile("ScoreFrame", "ScoreFrame");
t[#t+1] = StandardDecorationFromFile("TimeDisplay","TimeDisplay");

-- todo: move player life meters into their own file
-- sizes:
-- 268x20 = full
-- 212x20 = normal
-- 56x20 = 80%+

local normalZone = 212
local redZone = 56 -- speed rave (todo: have this work with passtype)

-- player 1
t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		self:x((SCREEN_CENTER_X-167)):y(SCREEN_TOP+27):draworder(5)
	end;
	LoadActor("b4mIX")..{
		Name="Swipe";
		InitCommand=function(self)
			self:halign(0):x(-132):zoomto(0,20):texcoordvelocity(-2,0)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				self:zoomto((life * (normalZone+redZone))-3,20);
			end;
		end;
	};
	Def.Quad{
		Name="BlueLife";
		InitCommand=function(self)
			self:halign(0):x(-133):zoomto(0,20):diffuse(color("#309BFFCC")):diffuserightedge(color("#0168C9CC"))
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				if life >= 0.80 then life = 1;
				else life = scale(life,0,0.8,0,1);
				end;
				self:zoomx(life * normalZone);
			end;
		end;
	};
	-- todo: have this change based on passmark
	Def.Quad{
		Name="RedLife";
		InitCommand=function(self)
			self:halign(0):x(78):zoomto(0,20):diffuse(color("#FF3636CC")):diffuserightedge(color("#A10101CC"))
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				if life <= 0.80 then life = 0;
				else life = scale(life,0.8,1.0,0,1);
				end;
				self:zoomx(life * redZone);
			end;
		end;
	};
};

-- player 2
t[#t+1] = Def.ActorFrame{
	InitCommand=function(self)
		self:x((SCREEN_CENTER_X+167)):y(SCREEN_TOP+27):draworder(5)
	end;
	LoadActor("b4mIX")..{
		Name="Swipe";
		InitCommand=function(self)
			self:halign(1):x(132):zoomto(0,20):texcoordvelocity(2,0)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_2 then
				local life = param.LifeMeter:GetLife();
				self:zoomto((life * (normalZone+redZone))-3,20);
			end;
		end;
	};
	Def.Quad{
		Name="BlueLife";
		InitCommand=function(self)
			self:halign(1):x(134):zoomto(0,20):diffuse(color("#309BFFCC")):diffuserightedge(color("#0168C9CC"))
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_2 then
				local life = param.LifeMeter:GetLife();
				if life >= 0.80 then life = 1;
				else life = scale(life,0,0.8,0,1);
				end;
				self:zoomx(life * normalZone);
			end;
		end;
	};
	Def.Quad{
		Name="RedLife";
		InitCommand=function(self)
			self:halign(1):x(-78):zoomto(0,20):diffuse(color("#FF3636CC")):diffuserightedge(color("#A10101CC"))
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_2 then
				local life = param.LifeMeter:GetLife();
				if life <= 0.80 then life = 0;
				else life = scale(life,0.8,1.0,0,1);
				end;
				self:zoomx(life * redZone);
			end;
		end;
	};
};

return t;