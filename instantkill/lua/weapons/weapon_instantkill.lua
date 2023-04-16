SWEP.PrintName			= "ReelCrowbar" -- This will be shown in the spawn menu, and in the weapon selection menu
SWEP.Author			= "GManTheMarioGuy" -- These two options will be shown when you have the weapon highlighted in the weapon selection menu
SWEP.Instructions		= "instantkill"

SWEP.Spawnable				= true
SWEP.AdminOnly 				= false

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= -1
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "none"

SWEP.Weight					= 5
SWEP.AutoSwitchTo			= false
SWEP.AutoSwitchFrom			= false

SWEP.Slot					= 1
SWEP.SlotPos				= 2
SWEP.DrawAmmo				= false
SWEP.DrawCrosshair			= true

SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip = -1
SWEP.Secondary.Automatic = true
SWEP.Secondary.Ammo = "none"

SWEP.ViewModel				= "models/weapons/v_357.mdl"
SWEP.WorldModel				= "models/weapons/w_crowbar.mdl"

function SWEP:PrimaryAttack() --This function is run when the player left clicks.
	if ( CLIENT ) then return end --If the code is being run on the client then don't bother doing this stuff since the client (i.e. players computer) isn't allowed to decide who is dead.

	local owner = self:GetOwner()
	local eyetrace = owner:GetEyeTrace() --Draw a line from the user's eyes to where they're pointing the gun.
	local traceTarget = eyetrace.Entity --This is the entity the kill ray is hitting.

	if ( traceTarget:IsValid() ) then --Check if the entity exists.
		if ( traceTarget:IsPlayer() ) then --Check if the entity is a player.
			traceTarget:Kill() --Kill the target.
		else
			traceTarget:TakeDamage( traceTarget:Health(), owner, self ) --Destroy the entity.
		end
    end
end

function SWEP:SecondaryAttack() --This function is run when the player right clicks.

	self:PrimaryAttack( true ) --Secondary attack has the same effect as the primary attack.

end

--[[function aimbot() --Starting the function
	local owner = self:GetOwner() --Getting ourselves
	local trace = util.GetPlayerTrace( owner ) --Player Trace part 1.
	local traceRes = util.TraceLine( trace ) --Player Trace part 2.
	if traceRes.HitNonWorld then -- If the aimbot aims at something that isn't the map.
		local target = traceRes.Entity -- It's obviously an entity.
		if ( target:IsPlayer() or target:IsNPC() ) then -- But it must be a player or NPC.
			local targethead = target:LookupBone("ValveBiped.Bip01_Head1") --In this aimbot we only aim for the head.
			local targetheadpos,targetheadang = target:GetBonePosition(targethead) --Get the position/angle of the head.
			owner:SetEyeAngles((targetheadpos - owner:GetShootPos()):Angle()) --And finally, we snap our aim to the head of the target.
		end
	end
end
hook.Add("Think","aimbot",aimbot) --The hook will spam "aimbot" until it finds a target.]]

--[[function aimbot() --Starting the function
	local ply = LocalPlayer() --Getting ourselves
	local trace = util.GetPlayerTrace( ply ) --Player Trace part 1.
	local traceRes = util.TraceLine( trace ) --Player Trace part 2.
	if traceRes.HitNonWorld then -- If the aimbot aims at something that isn't the map.
		local target = traceRes.Entity -- It's obviously an entity.
		if target:IsPlayer() then -- But it must be a player.
			local targethead = target:LookupBone("ValveBiped.Bip01_Head1") --In this aimbot we only aim for the head.
			local targetheadpos,targetheadang = target:GetBonePosition(targethead) --Get the position/angle of the head.
			ply:SetEyeAngles((targetheadpos - ply:GetShootPos()):Angle()) --And finally, we snap our aim to the head of the target.
		end
	end
end
hook.Add("Think","aimbot",aimbot) --The hook will spam "aimbot" until it finds a target.]]