fdf_falldamage= CreateClientConVar("fdf_falldamage", 10)

-- totally unnecessary
SWEP.PrintName = "FDF"
SWEP.Author = "TheAndrew61"
SWEP.Category = "TheAndrew61's SWEPs"
SWEP.Spawnable = false
SWEP.AdminOnly = false
SWEP.DrawWeaponInfoBox = false
-- primary click
SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "none"
-- secondary click
SWEP.Secondary.ClipSize = -1
SWEP.Secondary.DefaultClip  = -1
SWEP.Secondary.Automatic = false
SWEP.Secondary.Ammo = "none"
-- attributes
SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

-- INIT
local initDone = false
hook.Add("Initialize","FDF_Init", function()
  if initDone == false then
    MsgC(Color(255, 0, 255), "! FallDamageFixer loaded !\n")
    initDone = true
  end
end)

-- PLAYER falls
hook.Add("GetFallDamage", "PlyrFallDmg", function(plyr, speed)
  return fdf_falldamage:GetInt()
end)

-- OPTIONS
hook.Add("PopulateToolMenu", "fdf_menu", function()
  spawnmenu.AddToolMenuOption("Options", "TheAndrew61", "fdf", "FallDamageFixer", "", "", function(Panel)
    Panel:ClearControls()
    Panel:AddControl("Slider", {
      Label = "Damage received",
      Command = "fdf_falldamage",
      Type = "Int",
      Minimum = 0,
      Maximum = 100,
      Value = 10
    })
    Panel:AddControl("Label", {
      Text = "CREDITS:",
      Description = ""
    })
    Panel:AddControl("Label", {
      Text = "Scripting: TheAndrew61",
      Description = ""
    })
  end)
end)