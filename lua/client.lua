local display = false

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

RegisterNUICallback("exit", function ()
    SetDisplay(false)
end)

RegisterCommand("ff", function()
    SetDisplay(true)
end)

RegisterKeyMapping("ff", "ff", "Keyboard", "o")