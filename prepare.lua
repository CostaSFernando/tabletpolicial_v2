vRP.prepare('felipeex/createimg', [[CREATE TABLE IF NOT EXISTS felipeex_tablet_img(
	`user_id` int(11) NOT NULL,
	`img` varchar(255) DEFAULT NULL,
	PRIMARY KEY (`user_id`)
)]])

vRP.prepare('felipeex/createfixa', [[CREATE TABLE IF NOT EXISTS felipeex_tablet_fixa(
	`user_id` int(11) NOT NULL,
	`penalidade` varchar(255) DEFAULT NULL,
	`descricao` varchar(255) DEFAULT NULL,
	`oficial` varchar(255) DEFAULT NULL,
	`valordapenalidade` varchar(255) DEFAULT NULL,
	`data` varchar(255) DEFAULT NULL
)]])

vRP.prepare('felipeex/createforagido', [[CREATE TABLE IF NOT EXISTS felipeex_tablet_insert_foragido(
	`user_id` int(11) NOT NULL,
	`foragido` varchar(255) DEFAULT NULL,
	`data` varchar(255) DEFAULT NULL
)]])

vRP.prepare('felipeex/createrelatorio', [[CREATE TABLE IF NOT EXISTS felipeex_tablet_insert_relatorio(
	`user_id` int(11) NOT NULL,
	`descricao` varchar(255) DEFAULT NULL,
	`data` varchar(255) DEFAULT NULL
)]])

vRP.prepare("felipeex/getall","REPLACE INTO felipeex_tablet_img(user_id,img)VALUES(@user_id,@img)")
vRP.prepare("felipeex/select","SELECT img FROM felipeex_tablet_img WHERE user_id = @user_id")
vRP.prepare("felipeex/get_img","SELECT * FROM felipeex_tablet_img WHERE user_id = @user_id")
vRP.prepare("felipeex/get_fixa","SELECT * FROM felipeex_tablet_fixa WHERE user_id = @user_id ORDER BY data DESC")
vRP.prepare("felipeex/update_img","UPDATE felipeex_tablet_img SET img = @img WHERE user_id = @user_id")
vRP.prepare("felipeex/insert_fixa","INSERT INTO felipeex_tablet_fixa(user_id,penalidade,descricao,oficial,valordapenalidade,data) VALUES(@user_id,@penalidade,@descricao,@oficial,@valordapenalidade,@data)")
vRP.prepare("felipeex/insert_relatorio","INSERT INTO felipeex_tablet_insert_relatorio(user_id,descricao,data) VALUES(@user_id,@descricao,@data)")
vRP.prepare("felipeex/get_relatorios","SELECT characters.name,ftir.descricao,ftir.data FROM felipeex_tablet_insert_relatorio AS ftir INNER JOIN characters ON ftir.user_id = characters.id ORDER BY ftir.data DESC ")
vRP.prepare("felipeex/img_get","SELECT user_id FROM felipeex_tablet_img WHERE user_id = @user_id")
vRP.prepare("felipeex/delete_fixa","DELETE FROM felipeex_tablet_fixa WHERE data = @data")

CreateThread(function ()
	vRP.execute('felipeex/createforagido')
	vRP.execute('felipeex/createrelatorio')
	vRP.execute('felipeex/createimg')
	vRP.execute('felipeex/createfixa')
end)

if configtablet.tabletcreative then
	if configtablet.creativedatabasemodificada then
		vRP.prepare("felipeex/search_get",'SELECT id FROM characters WHERE id = @user_id')
	else
		vRP.prepare("felipeex/search_get",'SELECT id FROM characters WHERE id = @user_id')
	end
else
	vRP.prepare("felipeex/search_get","SELECT id FROM characters WHERE id = @user_id")
end