local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")
vRPclient = Tunnel.getInterface("vRP")
flx = {}
Tunnel.bindInterface("tabletpolicial_v2",flx)

local webhookmultar = "https://discord.com/api/webhooks/1057636064182947911/wLMlTBr2jcImn43iuuzZfAi_NqHRQbX_HemslEJBOZQ-hRnNrqtjM0bHibF4-Ug9uxPJ"
local webhookprender = "https://discord.com/api/webhooks/1057635991453712384/XsrNAwdk0b_XHmwXeTDWGMTxshr7Yr3lppqnoI9V3KZbAKMKtxb4K-dUxINJc_QTAFGF"

cRP = {}
Tunnel.bindInterface("police",cRP)
vCLIENT = Tunnel.getInterface("police")
vPLAYER = Tunnel.getInterface('player')

function flx.GetAll(user_id)
	local rows = vRP.query("felipeex/select",{ user_id = user_id })
	if #rows > 0 then
		return rows[1]
	else
		return ""
	end
end

function flx.Setall(user_id,img)
	vRP.execute("felipeex/getall",{ user_id = user_id, img = img })
end

function flx.getUData(user_id)
	local rows = vRP.query("felipeex/get_img",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

function flx.GetData(user_id)
	local rows = vRP.query("felipeex/search_get",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

local actived = {}
local prisonMarkers = {}

function flx.VerificarIdentificacao(user)
	local search_get = flx.GetData(user)
	if search_get == "" then
		return false
	else
		local identidade
		if configtablet.creativedatabasemodificada then
			identidade = vRP.userIdentity(parseInt(user)) or 0
		else
			identidade = vRP.getUserIdentity(parseInt(user)) or 0
		end
		local img = flx.getUData(parseInt(user))
		local fixa = vRP.query("felipeex/get_fixa",{ user_id = user })
		return identidade.name,identidade.name2,identidade.phone,identidade.serial,""..math.random(18,30).."",img,fixa,identidade.oab,identidade.port
	end
end

function flx.VerificarRelatorio()
	local source = source
	local user_id = vRP.getUserId(source)
	local relatorio = vRP.query("felipeex/get_relatorios",{ id = user_id })
	return relatorio
end

function flx.Prender(nuser_id,servicos,descript)
	local source = source
	local user_id = vRP.getUserId(source)
	--if user_id and exports["common"]:Group().hasPermission(user_id,"police") then
		if actived[user_id] == nil then
			actived[user_id] = true

			local identity = vRP.userIdentity(user_id)
			local identity2 = vRP.userIdentity(nuser_id)
			local otherPlayer = vRP.userSource(nuser_id)
			local reputationValue = math.random(1,3)
			if otherPlayer then
				vCLIENT.syncPrison(otherPlayer,true,false)
				vRPclient.teleport(otherPlayer,1680.1,2513.0,45.5)
				TriggerClientEvent("radio:outServers",otherPlayer)
				vRP.insertReputation(nuser_id,"fugitive",reputationValue)
				vRP.insertReputation(nuser_id,"fugitive",reputationValue)
				vRP.giveInventoryItem(nuser_id,"water",1,false)
				vRP.giveInventoryItem(nuser_id,"sandwich",1,false)
				TriggerClientEvent("Notify",otherPlayer,"default","Você perdeu <b>-"..reputationValue.."</b> de Reputação como Fugitivo.",10000,"bottom","atenção")
			end
			vRP.execute('felipeex/insert_fixa', {user_id = user_id, penalidade = "Prisão", descricao = descript, oficial = ""..identity.name.." "..identity.name2.."", valordapenalidade = ""..servicos.." Meses", data = os.date("%d/%m/%Y").." ás "..os.date("%H:%M") })
			vRP.execute("characters/setPrison",{ user_id = parseInt(nuser_id), prison = servicos })
			vRPclient.playSound(source,"Event_Message_Purple","GTAO_FM_Events_Soundset")
			TriggerClientEvent("police:Update",source,"reloadPrison")

			SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..identity.name.." "..identity.name2.."\n[PASSAPORTE]: "..nuser_id.." "..identity2.name.." "..identity2.name2.." \n[SERVICOS]: "..servicos..""..os.date("\n[DATA]: %d/%m/%Y\n[HORA]: %H:%M:%S").." \r```")

			actived[user_id] = nil
		end
	--end
end

function flx.Multar(nuser_id,value,text)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.userIdentity(user_id)
	local identity2 = vRP.userIdentity(nuser_id)
	if user_id and value > 0 then
		--if exports["common"]:Group().hasPermission(user_id,"police") then
			if actived[user_id] == nil then
				actived[user_id] = true
	
				SendWebhookMessage(webhookmultar,"```prolog\n[OFICIAL]: "..user_id.." "..identity.name.." "..identity.name2.."\n[PASSAPORTE]: "..nuser_id.." "..identity2.name.." "..identity2.name2.." \n[MULTA]: $"..value..""..os.date("\n[DATA]: %d/%m/%Y\n[HORA]: %H:%M:%S").." \r```")
				TriggerClientEvent("Notify",source,"importante","Multa aplicada.",5000)
				TriggerClientEvent("police:Update",source,"reloadFine")
				vRP.addFines(nuser_id,value)
	
				actived[user_id] = nil
			end
		--end
	end
end

function flx.relatorio(desc)
	local source = source
	local user_id = vRP.getUserId(source)
	vRP.execute('felipeex/insert_relatorio', {user_id = user_id, descricao = desc, data = os.date("%d/%m/%Y, %X") })
end

function flx.Data(user_id)
	local rows = vRP.query("felipeex/img_get",{ user_id = user_id })
	if #rows > 0 then
		return rows[1].img
	else
		return ""
	end
end

function flx.AlterarImagem(user,url)
	if flx.Data(user) == "" then
		flx.Setall(user,url[1])
	else
		vRP.execute('felipeex/update_img', { user_id = user, img = url[1]})
	end
end

function flx.DeleteFixa(data)
	local source = source
	local police = vRP.getUserId(source)
	if police == 3 or police == 2 then
		vRP.execute('felipeex/delete_fixa', { data = data })
		return true
	else
		return false
	end
end

function flx.Horario()
	return os.date("%d/%m/%Y as %X %p")
end

function flx.checkPermission()
	local source = source
	local user_id = vRP.getUserId(source)
	return vRP.hasPermission(user_id,configtablet.permissao)
end


function flx.GerarCrimes()
	return configtablet.crimes
end

function flx.GerarMultas()
	return configtablet.multas
end

function flx.GerarConfig()
	return configtablet.tempomaximo
end

function flx.GerarConfigMulta()
	return configtablet.multamaxima
end