local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")
vRP = Proxy.getInterface("vRP")

configtablet = {}
Proxy.addInterface("tabletpolicial_v2", configtablet)


function SendWebhookMessage(webhook,message)
	if webhook ~= nil and webhook ~= "" then
		PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
	end
end
 
 


--## Configurações basicas ##--

configtablet.comando = "tpolice" -- Comando que ira abrir o tablet policial.
configtablet.tecla = "" -- sé "configtablet.abrirportecla" for true, qual tecla vc vai usar? ex: "f9"
configtablet.permissao = "waitpolice" -- Permissão no qual podera abrir o tablet.
configtablet.excluirfixa = "ntw" -- Permissão no qual podera excluir a fixa do cidadão.
configtablet.tabletcreative = true -- Sua base é creative? true | false.
configtablet.creativedatabasemodificada = true -- Sua base é creative com a database modificada "ex: summerz_acconts"? true | false
configtablet.tempomaximo = nil -- Quantidade maxima de meses, que poderá ser aplicada. (caso queira que seja ilimitada, deixe em 'nil').
configtablet.multamaxima = nil -- Quantidade maxima de multa, que poderá ser aplicada. (caso queira que seja ilimitada, deixe em 'nil').
configtablet.fianca = false -- Sua tablet terá a função de fiança (o cidadão podera pagar fiança para sair da prisão)? true | false.
configtablet.fiancavalor = 0 -- Valor de fiança por pena/meses, *obrigatorio*, ex: 100 meses = 100 mil para fiança.
configtablet.penapersonaliza = true --[[ Sua tablet terá a função de pena personalizada (o policial podera alterar o meses personalizadamente,
excerto caso tenha o 'configtablet.multamaxima' ativado)? true | false. --]]

--## Configurar todos crimes ##-- 

configtablet.crimes = {
    [1] = {
        nome = "Colocar aeronave em Situação de Risco.", -- Não pode ter o mesmo nome
        titulo = "Colocar aeronave em Situação de Risco.",
        meses = "80",
        multa = "15000",
        descricao = "N/A",
    },
    [2] = {
        nome = "Disputas de corridas ilegais.", -- Não pode ter o mesmo nome
        titulo = "Disputas de corridas ilegais.",
        meses = "30",
        multa = "20000",
        descricao = "N/A",
    },
    [3] = {
        nome = "Fuga de Abordagem Policial.", -- Não pode ter o mesmo nome
        titulo = "Fuga de Abordagem Policial.",
        meses = "30",
        multa = "10000",
        descricao = "N/A",
    },
    [4] = {
        nome = "Omissão de socorro.", -- Não pode ter o mesmo nome
        titulo = "Omissão de socorro.",
        meses = "50",
        multa = "5000",
        descricao = "N/A",
    },
    [5] = {
        nome = "Ameaça.", -- Não pode ter o mesmo nome
        titulo = "Ameaça.",
        meses = "40",
        multa = "10000",
        descricao = "N/A",
    },
    [6] = {
        nome = "Atentado ao Pudor.", -- Não pode ter o mesmo nome
        titulo = "Atentado ao Pudor.",
        meses = "90",
        multa = "80000",
        descricao = "N/A",
    },
    [7] = {
        nome = "Roubo a Registradora.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Registradora.",
        meses = "20",
        multa = "20000",
        descricao = "N/A"
    },
    [8] = {
        nome = "Roubo a Caixa Eletrônico.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Caixa Eletrônico.",
        meses = "30",
        multa = "20000",
        descricao = "N/A"
    },
    [9] = {
        nome = "Roubo a Loja de Departamento.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Loja de Departamento.",
        meses = "30",
        multa = "75000",
        descricao = "N/A"
    },
    [10] = {
        nome = "Roubo a lojas de armas.", -- Não pode ter o mesmo nome
        titulo = "Roubo a lojas de armas.",
        meses = "30",
        multa = "50000",
        descricao = "N/A"
    },
    [11] = {
        nome = "Roubo a Joalheiria.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Joalheiria.",
        meses = "65",
        multa = "120000",
        descricao = "N/A"
    },
	[12] = {
        nome = "Roubo a Banco Flecca.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Banco Flecca.",
        meses = "75",
        multa = "120000",
        descricao = "N/A"
    },
	[13] = {
        nome = "Roubo a Banco central e Paleto.", -- Não pode ter o mesmo nome
        titulo = "Roubo a Banco central e Paleto.",
        meses = "100",
        multa = "150000",
        descricao = "N/A"
    },
	[14] = {
        nome = "Tentativa de Roubo.", -- Não pode ter o mesmo nome
        titulo = "Tentativa de Roubo.",
        meses = "25",
        multa = "10000",
        descricao = "N/A"
    },
	[15] = {
        nome = "Roubo à residência.", -- Não pode ter o mesmo nome
        titulo = "Roubo à residência.",
        meses = "20",
        multa = "15000",
        descricao = "N/A"
    },
	[16] = {
        nome = "Calunia, Injúria & Difamação.", -- Não pode ter o mesmo nome
        titulo = "Calunia, Injúria & Difamação.",
        meses = "50",
        multa = "70000",
        descricao = "N/A"
    },
	[17] = {
        nome = "Desacato.", -- Não pode ter o mesmo nome
        titulo = "Desacato.",
        meses = "60",
        multa = "30000",
        descricao = "N/A"
    },
	[18] = {
        nome = "Desobediência.", -- Não pode ter o mesmo nome
        titulo = "Desobediência.",
        meses = "30",
        multa = "15000",
        descricao = "N/A"
    },
	[19] = {
        nome = "Resistencia.", -- Não pode ter o mesmo nome
        titulo = "Resistencia.",
        meses = "20",
        multa = "10000",
        descricao = "N/A"
    },
	[20] = {
        nome = "Suborno.", -- Não pode ter o mesmo nome
        titulo = "Suborno.",
        meses = "30",
        multa = "50000",
        descricao = "N/A"
    },
	[21] = {
        nome = "Estelionato.", -- Não pode ter o mesmo nome
        titulo = "Estelionato.",
        meses = "40",
        multa = "70000",
        descricao = "N/A"
    },
	[22] = {
        nome = "Extorsão.", -- Não pode ter o mesmo nome
        titulo = "Extorsão.",
        meses = "30",
        multa = "40000",
        descricao = "N/A"
    },
	[23] = {
        nome = "Falsidade Ideológica.", -- Não pode ter o mesmo nome
        titulo = "Falsidade Ideológica.",
        meses = "50",
        multa = "45000",
        descricao = "N/A"
    },
	[24] = {
        nome = "Falso Testemunho.", -- Não pode ter o mesmo nome
        titulo = "Falso Testemunho.",
        meses = "30",
        multa = "50000",
        descricao = "N/A"
    },
	[25] = {
        nome = "Formação de Quadrilha.", -- Não pode ter o mesmo nome
        titulo = "Formação de Quadrilha.",
        meses = "150",
        multa = "60000",
        descricao = "N/A"
    },
	[26] = {
        nome = "Furto.", -- Não pode ter o mesmo nome
        titulo = "Furto.",
        meses = "35",
        multa = "10000",
        descricao = "N/A"
    },
	[27] = {
        nome = "Homicídio Doloso.", -- Não pode ter o mesmo nome
        titulo = "Homicídio Doloso.",
        meses = "70",
        multa = "50000",
        descricao = "N/A"
    },
	[28] = {
        nome = "Tentativa de Homicidio.", -- Não pode ter o mesmo nome
        titulo = "Tentativa de Homicidio.",
        meses = "40",
        multa = "50000",
        descricao = "N/A"
    },
	[29] = {
        nome = "Homicídio Culposo.", -- Não pode ter o mesmo nome
        titulo = "Homicídio Culposo.",
        meses = "70",
        multa = "50000",
        descricao = "N/A"
    },
	[30] = {
        nome = "Homicídio a Servidor Público.", -- Não pode ter o mesmo nome
        titulo = "Homicídio a Servidor Público.",
        meses = "100",
        multa = "80000",
        descricao = "N/A"
    },
	[31] = {
        nome = "Porte Ilegal De Dinheiro Sujo.", -- Não pode ter o mesmo nome
        titulo = "Porte Ilegal De Dinheiro Sujo.",
        meses = "10",
        multa = "2000",
        descricao = "N/A"
    },
	[32] = {
        nome = "Porte Ilegal de Armas Classe 1.", -- Não pode ter o mesmo nome
        titulo = "Porte Ilegal de Armas Classe 1.",
        meses = "50",
        multa = "10000",
        descricao = "N/A"
    },
	[33] = {
        nome = "Porte Ilegal de Armas Classe 2.", -- Não pode ter o mesmo nome
        titulo = "Porte Ilegal de Armas Classe 2.",
        meses = "70",
        multa = "15000",
        descricao = "N/A"
    },
	[34] = {
        nome = "Porte Ilegal de Armas Classe 3.", -- Não pode ter o mesmo nome
        titulo = "Porte Ilegal de Armas Classe 3.",
        meses = "90",
        multa = "25000",
        descricao = "N/A"
    },
	[35] = {
        nome = "Porte De Itens Ilegais.", -- Não pode ter o mesmo nome
        titulo = "Porte De Itens Ilegais.",
        meses = "15",
        multa = "10000",
        descricao = "N/A"
    },
	[36] = {
        nome = "Porte Ilegal de Munições.", -- Não pode ter o mesmo nome
        titulo = "Porte Ilegal de Munições.",
        meses = "30",
        multa = "15000",
        descricao = "N/A"
    },
	[37] = {
        nome = "Propagação de Ódio.", -- Não pode ter o mesmo nome
        titulo = "Propagação de Ódio.",
        meses = "20",
        multa = "100000",
        descricao = "N/A"
    },
	[38] = {
        nome = "Receptação.", -- Não pode ter o mesmo nome
        titulo = "Receptação.",
        meses = "30",
        multa = "5000",
        descricao = "N/A"
    },
	[39] = {
        nome = "Sequestro.", -- Não pode ter o mesmo nome
        titulo = "Sequestro.",
        meses = "100",
        multa = "90000",
        descricao = "N/A"
    },
	[40] = {
        nome = "Trafico de Drogas.", -- Não pode ter o mesmo nome
        titulo = "Trafico de Drogas.",
        meses = "20",
        multa = "15000",
        descricao = "N/A"
    },
    [41] = {
        nome = "Trafico de Armas.", -- Não pode ter o mesmo nome
        titulo = "Trafico de Armas.",
        meses = "70",
        multa = "20000",
        descricao = "N/A"
    },
    [42] = {
        nome = "Dano ao Patrimônio.", -- Não pode ter o mesmo nome
        titulo = "Dano ao Patrimônio.",
        meses = "30",
        multa = "10000",
        descricao = "N/A"
    },
    [43] = {
        nome = "Falta de conduta Polícial.", -- Não pode ter o mesmo nome
        titulo = "Falta de conduta Polícial.",
        meses = "80",
        multa = "20000",
        descricao = "N/A"
    },
    [44] = {
        nome = "Corrupção Passiva.", -- Não pode ter o mesmo nome
        titulo = "Corrupção Passiva.",
        meses = "150",
        multa = "150000",
        descricao = "N/A"
    },
    [45] = {
        nome = "Abandono de Posto/Função.", -- Não pode ter o mesmo nome
        titulo = "Abandono de Posto/Função.",
        meses = "50",
        multa = "10000",
        descricao = "N/A"
    },
    [46] = {
        nome = "Uniformização fora do padrão.", -- Não pode ter o mesmo nome
        titulo = "Uniformização fora do padrão.",
        meses = "80",
        multa = "10000",
        descricao = "N/A"
    },
    [47] = {
        nome = "Insubordinação.", -- Não pode ter o mesmo nome
        titulo = "Insubordinação.",
        meses = "60",
        multa = "120000",
        descricao = "N/A"
    },
    [48] = {
        nome = "Desrespeito a Hierarquia.", -- Não pode ter o mesmo nome
        titulo = "Desrespeito a Hierarquia.",
        meses = "100",
        multa = "10000",
        descricao = "N/A"
    },
    [49] = {
        nome = "Vazamento de informações confidências.", -- Não pode ter o mesmo nome
        titulo = "Vazamento de informações confidências.",
        meses = "150",
        multa = "120000",
        descricao = "N/A"
    },
    [50] = {
        nome = "Portar armamento fora de sua Patente.", -- Não pode ter o mesmo nome
        titulo = "Portar armamento fora de sua Patente.",
        meses = "60",
        multa = "120000",
        descricao = "N/A"
    },
    [51] = {
        nome = "Obstrução de Justiça.", -- Não pode ter o mesmo nome
        titulo = "Obstrução de Justiça.",
        meses = "60",
        multa = "70000",
        descricao = "N/A"
    },
    [52] = {
        nome = "Prevaricação (MILITAR).", -- Não pode ter o mesmo nome
        titulo = "Prevaricação (MILITAR).",
        meses = "60",
        multa = "100000",
        descricao = "N/A"
    },
    [53] = {
        nome = "Procedimento Incorreto (MILITAR).", -- Não pode ter o mesmo nome
        titulo = "Procedimento Incorreto (MILITAR).",
        meses = "100",
        descricao = "N/A"
    },
    [54] = {
        nome = "Mal manuseio do armamento e sair de Serviço com armamento da Polícia.", -- Não pode ter o mesmo nome
        titulo = "Mal manuseio do armamento e sair de Serviço com armamento da Polícia.",
        meses = "150",
        multa = "80000",
        descricao = "N/A"
    },
    [55] = {
        nome = "Falsificação de documentos.", -- Não pode ter o mesmo nome
        titulo = "Falsificação de documentos.",
        meses = "60",
        multa = "20000",
        descricao = "N/A"
    },
    [56] = {
        nome = "Sonegação.", -- Não pode ter o mesmo nome
        titulo = "Sonegação.",
        meses = "30",
        multa = "7000",
        descricao = "N/A"
    },
    [57] = {
        nome = "Abandono de Incapaz.", -- Não pode ter o mesmo nome
        titulo = "Abandono de Incapaz.",
        meses = "100",
        multa = "250000",
        descricao = "N/A"
    },
    [58] = {
        nome = "Porte de Equipamentos Explosivos.", -- Não pode ter o mesmo nome
        titulo = "Porte de Equipamentos Explosivos.",
        meses = "40",
        multa = "10000",
        descricao = "N/A"
    },
    [59] = {
        nome = "Corrupção de Menores.", -- Não pode ter o mesmo nome
        titulo = "Corrupção de Menores.",
        meses = "150",
        multa = "50000",
        descricao = "N/A"
    },
    [60] = {
        nome = "Fuga do Presidio de Segurança Maxima.", -- Não pode ter o mesmo nome
        titulo = "Fuga do Presidio de Segurança Maxima.",
        meses = "60",
        multa = "0",
        descricao = "N/A"
    },
    [61] = {
        nome = "Falso Testemunho.", -- Não pode ter o mesmo nome
        titulo = "Falso Testemunho.",
        meses = "50",
        multa = "50000",
        descricao = "N/A"
    },
    [62] = {
        nome = "Roubo a VTR.", -- Não pode ter o mesmo nome
        titulo = "Roubo a VTR.",
        meses = "60",
        multa = "10000",
        descricao = "N/A"
    },
    [63] = {
        nome = "Invasão de Propriedade Privada.", -- Não pode ter o mesmo nome
        titulo = "Invasão de Propriedade Privada.",
        meses = "100",
        multa = "15000",
        descricao = "N/A"
    },
    [64] = {
        nome = "Agressão.", -- Não pode ter o mesmo nome
        titulo = "Agressão.",
        meses = "30",
        multa = "15000",
        descricao = "N/A"
    },
    [65] = {
        nome = "Roubo de Veículo.", -- Não pode ter o mesmo nome
        titulo = "Roubo de Veículo.",
        meses = "35",
        multa = "25000",
        descricao = "N/A"
    },
    [66] = {
        nome = "Tentativa e Resgate ou Resgate.", -- Não pode ter o mesmo nome
        titulo = "Tentativa e Resgate ou Resgate.",
        meses = "40",
        multa = "25000",
        descricao = "N/A"
    },
}

--## Configurar todas multas ##--

configtablet.multas = {
    [1] = {
        nome = "MultasAbandono", -- Não pode ter o mesmo nome
        titulo = "Abandono de Aeronave.",
        multa = "40000",
        descricao = "N/A"
    },
    [2] = {
        nome = "MultasLocaisPriobidos", -- Não pode ter o mesmo nome
        titulo = "Pousar Em Locais Proibidos como Praças,telhados e no meio de vias públicas.",
        multa = "15000",
        descricao = "N/A"
    },
    [3] = {
        nome = "MultasFormaçao de Quadrilha", -- Não pode ter o mesmo nome
        titulo = "Voar em Baixa Altitude.",
        multa = "20000",
        descricao = "N/A"
    },
    [4] = {
        nome = "MultasConducao", -- Não pode ter o mesmo nome
        titulo = "Condução Perigosa / Veiculo Irregular.",
        multa = "10000",
        descricao = "N/A"
    },
    [5] = {
        nome = "MultasAltavelocidade", -- Não pode ter o mesmo nome
        titulo = "Conduzir Veículo Acima da Velocidade Permitida.",
        multa = "5000",
        descricao = "N/A"
    },
    [6] = {
        nome = "MultasEstacionar", -- Não pode ter o mesmo nome
        titulo = "Estacionar em Local Proibido parar na contramão de direção e abandonar veículo em via pública.",
        multa = "20000",
        descricao = "N/A"
    },
    [7] = {
        nome = "MultasContramao", -- Não pode ter o mesmo nome
        titulo = "Transitar na contra mão, na pista de via Única.",
        multa = "2000",
        descricao = "N/A"
    },
    [8] = {
        nome = "MultasSonegador", -- Não pode ter o mesmo nome
        titulo = "Sonegação de Imposto.",
        multa = "15000",
        descricao = "N/A"
    },
    [9] = {
        nome = "MultasEquipamentos", -- Não pode ter o mesmo nome
        titulo = "Uso de equipamentos Milítares.",
        multa = "10000",
        descricao = "N/A"
    },
    [10] = {
        nome = "MultasOcultacao", -- Não pode ter o mesmo nome
        titulo = "Ocultação facial.",
        multa = "10000",
        descricao = "N/A"
    },
    [11] = {
        nome = "MultasAlvara", -- Não pode ter o mesmo nome
        titulo = "Funcionar Sem Alvará.",
        multa = "10000",
        descricao = "N/A"
    },
	[12] = {
        nome = "MultasMei", -- Não pode ter o mesmo nome
        titulo = "Funcionar Sem MEI.",
        multa = "12000",
        descricao = "N/A"
    },
	[13] = {
        nome = "MultasVeiculoruim", -- Não pode ter o mesmo nome
        titulo = "Transitar com veículo irregular.",
        multa = "25000",
        descricao = "N/A"
    },
}

--## Configurações creative ##--

configtablet.prison = "prison" --alterar para a pastar do prison ela pode estar: "vrp_prison" ou "prison"

configtablet.player = "player" --alterar para a pastar do player ela pode estar: "vrp_player" ou "player"

--## Configurações avançadas ##--

-- #Setar Multar vrpex

function configtablet.SetarMulta(user,valor,desc)
    local source = source
    local user_id = vRP.getUserId(source)
   
    if user then
        local value = vRP.getUData(parseInt(user),"vRP:multas")
        local multas = json.decode(value) or 0
        local oficialid = vRP.getUserIdentity(user_id)
        local identity = vRP.getUserIdentity(parseInt(user))
        local nplayer = vRP.getUserSource(parseInt(user))
       
        vRP.setUData(parseInt(user),"vRP:multas",json.encode(parseInt(multas)+parseInt(valor)))
       
        TriggerClientEvent("Notify",source,"sucesso","Multa aplicada com sucesso.",8000)
        TriggerClientEvent("Notify",nplayer,"importante","Você recebeu <b>R$"..vRP.format(parseInt(valor)).."</b> de multa.",8000)
       
		--SendWebhookMessage(webhookmultar, "value "..value.."")
		--SendWebhookMessage(webhookmultar, "multas "..multas.."")
		--SendWebhookMessage(webhookmultar, "oficialid "..oficialid.."")
		--SendWebhookMessage(webhookmultar, "identity "..identity.."")
		--SendWebhookMessage(webhookmultar, "nplayer "..nplayer.."")

        vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
      
        local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
        vRP.execute('felipeex/insert_fixa', {user_id = user, penalidade = "Multa", descricao = desc, oficial = ""..identidade.name.." "..identidade.firstname.." #"..user_id.."", valordapenalidade = "R$"..value.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
    end
end


-- #Setar Multar creative

function configtablet.SetarMultaCreative(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
	local oficialid = vRP.getUserIdentity(user_id)
	local identity = vRP.getUserIdentity(parseInt(user))
	if user then
		vRP.setUData(parseInt(user),"vRP:multas",json.encode(parseInt(multas)+parseInt(value)))
		local valor = vRP.getUData(parseInt(user),"vRP:multas")
		local multas = json.decode(valor) or 0

		vRP.setFines(parseInt(user),parseInt(value),parseInt( vRP.getUserId(source)),tostring(info))
		TriggerClientEvent("Notify",source,"verde","Multa aplicada com sucesso.",8000)
		TriggerClientEvent("Notify",user,"verde","Você foi multado em R$"..value..",00",8000)
		
		local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
        vRP.execute('felipeex/insert_fixa', {user_id = user, penalidade = "Multa", descricao = desc, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = "R$"..value.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
	end
end

function configtablet.SetarMultaCreativeOficial(nuser_id,fines,text)
	local source = source
	local user_id = vRP.getUserId(source)

	TriggerClientEvent("Notify",source,"verde","Multa aplicada.",5000)
	vRP.addFines(nuser_id,fines)

	local identidade = vRP.userIdentity(parseInt(user_id)) or 0
    vRP.execute('felipeex/insert_fixa', {user_id = nuser_id, penalidade = "Multa", descricao = text, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = "R$"..fines.." Multa", data = os.date("%d/%m/%Y,<br> %X %p") })
end

-- #Prisão creative

function configtablet.SetarPrisaoCreative(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
	if user then
		local player = vRP.getUserSource(parseInt(user))
		if player then
			local nuser_id = user
			--[[ local nplayer = vRP.getUserSource(parseInt(nuser_id)) ]]

			local nplayer
			if configtablet.creativedatabasemodificada then
				nplayer = vRP.userSource(parseInt(nuser_id))
			else
				nplayer = vRP.getUserSource(parseInt(nuser_id))
			end
			local locate = 2
			if nplayer then
				vCLIENT.startPrison(nplayer,1)

				if parseInt(locate) == 2 then
					TriggerClientEvent('removealgemas',nplayer)
					TriggerClientEvent("vrp_sound:source",nplayer,"uncuff",0.5)
					vRPclient.teleport(nplayer,1677.72,2509.68,45.57)
				end
			end

			vRP.updateThirst(nuser_id,100)
			vRP.updateHunger(nuser_id,100)
			TriggerClientEvent("resetBleeding",nuser_id)
			TriggerClientEvent("resetDiagnostic",nuser_id)
			local nplayer
			if configtablet.creativedatabasemodificada then
				nplayer = vRP.userSource(parseInt(user))
			else
				nplayer = vRP.getUserSource(parseInt(user))
			end
			vRP.execute("vRP/set_prison",{ user_id = parseInt(nuser_id), prison = parseInt(value), locate = 1 })
			TriggerClientEvent("Notify",source,"locked","Prisão aplicada com "..value.." serviço(s).",8000)
			TriggerClientEvent("Notify",nplayer,"locked","Você foi condenado a "..value.." serviço(s).",8000)

			local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
            vRP.execute('felipeex/insert_fixa', {user_id = user, penalidade = "Prisão", descricao = desc, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = ""..value.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })
		end
	end
end


function configtablet.SetarPrisaoCreativeOficial(nuser_id,services,text)
	local source = source
	local user_id = vRP.getUserId(source)

	local identity = vRP.userIdentity(user_id)
	local otherPlayer = vRP.userSource(nuser_id)
	if otherPlayer then
		vCLIENT.syncPrison(otherPlayer,true,false)
		TriggerClientEvent("radio:outServers",otherPlayer)
	end

	vRP.execute("characters/setPrison",{ user_id = parseInt(nuser_id), prison = parseInt(services) })
	TriggerClientEvent("Notify",source,"verde","Prisão efetuada.",5000)
	TriggerClientEvent("Notify",source,"verde","Você foi condenado a "..services.." serviços",5000)
	local identidade = vRP.userIdentity(parseInt(user_id)) or 0
	vRP.execute('felipeex/insert_fixa', {user_id = nuser_id, penalidade = "Prisão", descricao = text, oficial = ""..identidade.name.." "..identidade.name2.." #"..user_id.."", valordapenalidade = ""..services.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })
end

-- #Prisão vrpex

function configtablet.SetarPrisao(user,value,desc)
	local source = source
	local user_id = vRP.getUserId(source)
	if user then
		local player
		if configtablet.creativedatabasemodificada then
			player = vRP.userSource(parseInt(user))
		else
			player = vRP.getUserSource(parseInt(user))
		end
		if player then
			TriggerClientEvent("Notify",player,"importante","Você foi preso por <b>"..value.." meses</b>.")
			vRP.setUData(user, "vRP:prisao", json.encode(parseInt(value)))
			vRPclient.setHandcuffed(player,false)
			TriggerClientEvent('prisioneiro',player,true)
			vRPclient.teleport(player,1680.1,2513.0,45.5)
			
            prison_lock(parseInt(user))
			
            TriggerClientEvent('removealgemas',player)
			TriggerClientEvent("vrp_sound:source",player,'jaildoor',0.7)
			TriggerClientEvent("vrp_sound:source",source,'jaildoor',0.7)
			TriggerClientEvent("Notify",source,"sucesso","Prisão do passaporte <b>"..user.."</b> por <b>"..value.." meses</b> efetuada com sucesso.")
			
            SendWebhookMessage(webhookprender,"```prolog\n[OFICIAL]: "..user_id.." "..oficialid.name.." "..oficialid.firstname.." \n[==============PRENDEU==============] \n[PASSAPORTE]: "..(args[1]).." "..identity.name.." "..identity.firstname.." \n[TEMPO]: "..vRP.format(parseInt(args[2])).." Meses \n[CRIMES]: "..crimes.." "..os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S").." \r```")
 

            vRPclient.playSound(source,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			vRPclient.playSound(nplayer,"Hack_Success","DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS")
			
            local identidade = vRP.getUserIdentity(parseInt(user_id)) or 0
            vRP.execute('felipeex/insert_fixa', {user_id = user, penalidade = "Prisão", descricao = desc, oficial = ""..identidade.name.." "..identidade.firstname.." #"..user_id.."", valordapenalidade = ""..value.." Meses", data = os.date("%d/%m/%Y,<br> %X %p") })
		end
	end
end

function prison_lock(target_id)
	local player
		if configtablet.creativedatabasemodificada then
			player = vRP.userSource(tonumber(target_id))
		else
			player = vRP.getUserSource(tonumber(target_id))
		end
	if player then
		SetTimeout(60000,function()
			local value = vRP.getUData(parseInt(target_id),"vRP:prisao")
			local tempo = json.decode(value) or 0
			if parseInt(tempo) >= 1 then
				TriggerClientEvent("Notify",player,"importante","Ainda vai passar <b>"..parseInt(tempo).." meses</b> preso.")
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(parseInt(tempo)-1))
				prison_lock(parseInt(target_id))
			elseif parseInt(tempo) == 0 then
				TriggerClientEvent('prisioneiro',player,false)
				vRPclient.teleport(player,1850.5,2604.0,45.5)
				vRP.setUData(parseInt(target_id),"vRP:prisao",json.encode(-1))
				TriggerClientEvent("Notify",player,"importante","Sua sentença terminou, esperamos não ve-lo novamente.")
			end
			vRPclient.PrisionGod(player)
		end)
	end
end