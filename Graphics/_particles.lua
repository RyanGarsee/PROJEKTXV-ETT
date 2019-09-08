local args = ...
assert(args)
assert( type(args) == "table" )

-- args:
-- num particles
-- min/max X/Y velocity
-- *min/max zoom
-- *rotation z for spin (specific to XV)
local vXMin = args.VelocityXMin
local vXMax = args.VelocityXMax

local vYMin = args.VelocityYMin
local vYMax = args.VelocityYMax

local zoomMin = args.ZoomMin or 0.5
local zoomMax = args.ZoomMax or 1.5

local t = Def.ActorFrame{};

local pVel = {}

for i=1,args.NumParticles do
	pVel[i] = {
		X = math.random(vXMin, vXMax),
		Y = math.random(vYMin, vYMax),
	};

	-- produce integers for math.random
	local zoomMin2 = math.floor(zoomMin*10)
	local zoomMax2 = math.floor(zoomMax*10)
	-- then undo my wanton multiplication
	local pZoom = math.random(zoomMin2,zoomMax2)/10

	t[#t+1] = LoadActor(THEME:GetPathB("","shineget/shine"))..{
		Name="Particle"..i;
		InitCommand=function(self)
			self:zoom(pZoom);
			self:x(math.random(SCREEN_LEFT+(self:GetWidth()/2),SCREEN_RIGHT-(self:GetWidth()/2)));
			self:y(math.random(SCREEN_TOP+(self:GetHeight()/2),SCREEN_BOTTOM-(self:GetHeight()/2)));
		end;
		OnCommand=function(self)
			self:spin():effectmagnitude(0,0,args.SpinZ)
		end;
	};
end

local function UpdateParticles(self,deltatime)
	particles = self:GetChildren();
	for i=1, args.NumParticles do
		local p = particles["Particle"..i]
		local vX = pVel[i].X
		local vY = pVel[i].Y
		p:x(p:GetX() + (vX * deltatime))
		p:y(p:GetY() + (vY * deltatime))

		if p:GetX() > SCREEN_RIGHT + (p:GetWidth()/2) then
			p:x(SCREEN_LEFT - (p:GetWidth()/2))
		elseif p:GetX() < SCREEN_LEFT - (p:GetWidth()/2) then
			p:x(SCREEN_RIGHT + (p:GetWidth()/2))
		end
		if p:GetY() > SCREEN_BOTTOM + (p:GetHeight()/2) then
			p:y(SCREEN_TOP - (p:GetHeight()/2))
		elseif p:GetY() < SCREEN_TOP - (p:GetHeight()/2) then
			p:y(SCREEN_BOTTOM + (p:GetHeight()/2))
		end
	end;
end;

t.InitCommand = function(self)
	self:SetUpdateFunction(UpdateParticles)
end;

return t;