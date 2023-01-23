local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vSERVER = Tunnel.getInterface("tabletpolicial_v2")
vRPclient = Tunnel.getInterface("vRP")

function Open()
    if vSERVER.checkPermission() then
		SetNuiFocus(true,true)
        local horario = vSERVER.Horario()
        vRP.removeObjects()
        vRP.createObjects("amb@code_human_in_bus_passenger_idles@female@tablet@base","base","prop_cs_tablet",50,28422)
		SendNUIMessage({ action = "openSystem" , horario = horario
    })
    end
end

function Close()
    SetNuiFocus(false,false)
    SendNUIMessage({ action = "closeSystem" })
    vRP.removeObjects()
end

Citizen.CreateThread(function()
	SetNuiFocus(false,false)
end)

function closeNui()
	SetNuiFocus(false,false)
    vRP.removeObjects()
	SendNUIMessage({ action = "closeSystem" })
end

RegisterCommand(configtablet.comando,function(source,args)
	Open()
end)

RegisterNUICallback("closeSystem",function(data)
    vRP.removeObjects()
	Close()
end)

RegisterNUICallback("VerificarIdentificacao", function(data,cb)
	local name,sobrenome,phone,identidade,idade,imagem,fixa,oab,port = vSERVER.VerificarIdentificacao(data.user)
	cb({ name = name , sobrenome = sobrenome, phone = phone, identidade = identidade, idade = idade, imagem = imagem, fixa = fixa, oab = oab, port = port })
end)

RegisterNUICallback("VerificarRelatorios", function(data,cb)
	local relatorio,data = vSERVER.VerificarRelatorio()
	cb({ relatorio = relatorio, data = data })
end)

RegisterNUICallback("GerarCrimes", function(data,cb)
	local crimes = vSERVER.GerarCrimes()
	cb({ crimes = crimes })
end)

RegisterNUICallback("GerarMultas", function(data,cb)
	local multas = vSERVER.GerarMultas()
	cb({ multas = multas })
end)

RegisterNUICallback("GerarConfig", function(data,cb)
	local tempomaximo = vSERVER.GerarConfig()
	cb({ tempomaximo = tempomaximo })
end)

RegisterNUICallback("GerarConfigMulta", function(data,cb)
	local multamaxima = vSERVER.GerarConfigMulta()
	cb({ multamaxima = multamaxima })
end)

RegisterNUICallback("Prender", function(data,cb)
	local prender = vSERVER.Prender(data.user,data.servicos,data.descript)
	cb({ prender = prender })
end)

RegisterNUICallback("Multar", function(data,cb)
	local multar = vSERVER.Multar(data.user,data.valor,data.desc)
	cb({ multar = multar })
end)


RegisterNUICallback("Relatorio", function(data,cb)
	local relatorio = vSERVER.relatorio(data.desc)
	cb({ relatorio = relatorio })
end)

RegisterNUICallback("AlterarImagem", function(data,cb)
    if data.url then
		vSERVER.AlterarImagem(data.user,data.url)
    end
end)

RegisterNUICallback("DeleteFixa", function(data,cb)
	local permissao = vSERVER.DeleteFixa(data.data)
    cb({ permissao = permissao })
end)

-- CreateThread(function ()
--     while true do
--         Wait(1)
--         local horario = vSERVER.Horario()
--         SendNUIMessage({ horario = horario })
--     end
-- end)

phone = false
phoneId = 0
RegisterNetEvent('camera:open')
AddEventHandler('camera:open', function()
    CreateMobilePhone(1)
	CellCamActivate(true, true)
	phone = true
    PhonePlayOut()
end)

frontCam = false

function CellFrontCamActivate(activate)
	return Citizen.InvokeNative(0x2491A93618B7D838, activate)
end

RegisterNUICallback('PostNewImage', function(data, cb)
    SetNuiFocus(false, false)
    CreateMobilePhone(1)
    CellCamActivate(true, true)
    takePhoto = true
    Citizen.Wait(4)

    while takePhoto do
        Citizen.Wait(4)

        if IsControlJustPressed(1, 27) then -- Toogle Mode
            frontCam = not frontCam
            CellFrontCamActivate(frontCam)
        elseif IsControlJustPressed(1, 177) then -- CANCEL
            DestroyMobilePhone()
            CellCamActivate(false, false)
            cb(nil)     
            takePhoto = false
            break
        elseif IsControlJustPressed(1, 176) then -- TAKE.. PIC
            exports['screenshot-basic']:requestScreenshotUpload('https://discord.com/api/webhooks/1057635757478649949/KCsks_Nleyq9Mz_fOozpWnDDF7ruc9d_XO5-9gt0YendtPmfK8IKDJoVtWXMV2Tj_D5O', 'files[]', function(data)
                local resp = json.decode(data)
                cb({resp.attachments[1].proxy_url})
                DestroyMobilePhone()
                CellCamActivate(false, false)
            end)
            takePhoto = false
        end

        

        HideHudComponentThisFrame(7)
        HideHudComponentThisFrame(8)
        HideHudComponentThisFrame(9)
        HideHudComponentThisFrame(6)
        HideHudComponentThisFrame(19)
        HideHudAndRadarThisFrame()
    end
    Citizen.Wait(800)
    Open()
end)