local display = false

local runtimeTexture = "customPlates"
local vehShare = "vehshare"
local plateTxd = CreateRuntimeTxd(runtimeTexture)

CreateRuntimeTextureFromImage(plateTxd, "yankton_plate", "lua/gray.png")
AddReplaceTexture(vehShare, "yankton_plate", runtimeTexture, "yankton_plate")
AddReplaceTexture(vehShare, "yankton_plate_n", runtimeTexture, "yankton_plate")


function SetDisplay(bool)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "H_pl_nui",
        status = bool,
    })
end

RegisterNUICallback("Send22", function(data)
    local text = data.text
    local Ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(Ped)
    SetVehicleNumberPlateText(vehicle, text)
    SetDisplay(false)
end)

RegisterNUICallback("Hide", function ()
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)
    SetVehicleNumberPlateText(vehicle,"")
    SetVehicleNumberPlateTextIndex(vehicle, 5)
    SetDisplay(false)
end)

RegisterNUICallback("exit", function ()
    SetDisplay(false)
end)

RegisterCommand("ff", function()
    SetDisplay(true)
end)

RegisterKeyMapping("ff", "ff", "Keyboard", "o")