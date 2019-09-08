local c;
local player = Var "Player";
local ShowComboAt = THEME:GetMetric("Combo", "ShowComboAt");

local NumberMinZoom = THEME:GetMetric("Combo", "NumberMinZoom");
local NumberMaxZoom = THEME:GetMetric("Combo", "NumberMaxZoom");
local NumberMaxZoomAt = THEME:GetMetric("Combo", "NumberMaxZoomAt");

return Def.ActorFrame {
	LoadFont("Combo","numbers") .. {
		Name="Number";
		InitCommand=function(self)
			self:halign(0)
		end;
	};

	InitCommand = function(self)
		self:draworder(101);
		c = self:GetChildren();
		c.Number:visible(false);
	end;

	ComboCommand=function(self, param)
		local iCombo = param.Misses or param.Combo;
		if not iCombo or iCombo < ShowComboAt then
			c.Number:visible(false);
			return;
		end

		local Label = c.ComboLabel;
		local bComboOrMiss = false;
		local bMiss = false;

		if param.Combo then
			bComboOrMiss = true;
			bMiss = false;
		elseif param.Misses then
			bComboOrMiss = true;
			bMiss = true;
		end

		param.Zoom = scale( iCombo, 0, NumberMaxZoomAt, NumberMinZoom, NumberMaxZoom );
		param.Zoom = clamp( param.Zoom, NumberMinZoom, NumberMaxZoom );

		if bComboOrMiss then
			c.Number:visible(true);
		end;

		c.Number:settext( string.format("%i", iCombo) );

		-- this function glows the combo number.
		local Pulse = function(self, param)
			self:stoptweening();

			local GlowStart;
			local GlowEnd;
			local StartAlpha = 0.5;
			if param.Combo then
				GlowColor = color("1,1,1,"..StartAlpha);
				GlowEnd = color("1,1,1,0");
			else
				GlowColor = color("1,0,0,"..StartAlpha);
				GlowEnd = color("1,0,0,0");
			end;

			local rotZ;
			if param.FullComboW1 then
				rotZ = -13
			elseif param.FullComboW2 then
				rotZ = -12
			elseif param.FullComboW3 then
				rotZ = -11
			else
				rotZ = -9
			end;

			self:rotationz(rotZ)
			self:glow(GlowColor);
			self:zoomy(0.7);
			self:linear(0.1);
			self:glow(GlowEnd);
			self:zoom(1.0);
			self:rotationz(0);
			self:diffusealpha(1);
			self:sleep(0.7);
			self:linear(0.1);
			self:zoom(1.5);
			self:diffusealpha(0);
		end;

		Pulse( c.Number, param );
	end;
};