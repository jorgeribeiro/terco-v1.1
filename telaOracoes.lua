local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

---------------------------------------------------------------------------------

local function onTap( event )
    if event.action == "clicked" then
        if event.index == 1 then
            --Fechará
         elseif event.event.index == 2 then
         	--Não fará nada
        end
    end
end

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage( "telaOracoes.png" )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	sceneGroup:insert( background )

	local botao1Misterio = widget.newButton
		{
			id = "botao1Misterio",
			defaultFile = "botao1Misterio.png",
			overFile = "botao1Misterioover.png",
			onRelease = function() composer.gotoScene( "tela1Misterio", "fade", 100 )
			end
		}
		botao1Misterio.x = display.contentCenterX + 115
		botao1Misterio.y = display.contentCenterY + 215

	sceneGroup:insert( botao1Misterio )
	
	local botaoVolta = widget.newButton
		{
			id = "botaoVolta",
			defaultFile = "botaoVolta.png",
			overFile = "botaoVoltaover.png",
			onRelease = function() composer.gotoScene( "telaInicial", "fade", 100 )		
			end
		}
		botaoVolta.x = display.contentCenterX - 115
		botaoVolta.y = display.contentCenterY + 215

	sceneGroup:insert( botaoVolta )

	local botaoSinaldaCruz = display.newImage( "botaoSinaldaCruz.png" )
	botaoSinaldaCruz.x = display.contentCenterX - 4
	botaoSinaldaCruz.y = display.contentCenterY - 223

	sceneGroup:insert( botaoSinaldaCruz )
	
	function botaoSinaldaCruz:tap( event )
		local alert = native.showAlert( "Sinal da Cruz", "Em nome do Pai, do Filho e do Espírito Santo, Amém.", { "OK" }, onTap ) 
	end
	botaoSinaldaCruz:addEventListener( "tap", botaoSinaldaCruz )

	local botaoPaiNosso = display.newImage( "botaoPaiNosso.png" )
	botaoPaiNosso.x = display.contentCenterX
	botaoPaiNosso.y = display.contentCenterY - 45

	sceneGroup:insert( botaoPaiNosso )
	
	function botaoPaiNosso:tap( event )
		local alert = native.showAlert( "Pai Nosso", "Pai Nosso, que estais no Céu, Santificado seja o Vosso Nome, venha a nós o Vosso Reino, seja feita a Vossa Vontade, assim na Terra como no Céu. O Pão-Nosso de cada dia nos daí hoje perdoai-nos as nossas ofensas, assim como nós perdoamos a quem nos tem ofendido. E não nos deixeis cair em tentação, mas livrai-nos do Mal, Amém.", { "OK" }, onTap ) 
	end
	botaoPaiNosso:addEventListener( "tap", botaoPaiNosso )

	local botaoAveMaria = display.newImage( "botaoAveMaria.png" )
	botaoAveMaria.x = display.contentCenterX
	botaoAveMaria.y = display.contentCenterY - 18

	sceneGroup:insert( botaoAveMaria )
	
	function botaoAveMaria:tap( event )
		local alert = native.showAlert( "Ave Maria", "Ave Maria cheia de graça, o Senhor é convosco, bendita sois Vós entre as mulheres, e bendito é o fruto do vosso ventre, Jesus. Santa Maria, Mãe de Deus, rogai por nós pecadores, agora e na hora da nossa morte, Amém.", { "OK" }, onTap ) 
	end
	botaoAveMaria:addEventListener( "tap", botaoAveMaria )

	local botaoCreio = display.newImage( "botaoCreio.png" )
	botaoCreio.x = display.contentCenterX
	botaoCreio.y = display.contentCenterY + 10

	sceneGroup:insert( botaoCreio )
	
	function botaoCreio:tap( event )
		local alert = native.showAlert( "Creio", "Creio em Deus-Pai, todo poderoso, criador do céu e da terra e em Jesus Cristo seu único filho, Nosso Senhor. Que foi concebido pelo poder do Espírito Santo, nasceu da Virgem Maria, padeceu sob Poncio Pilatos. Foi crucificado, morto e sepultado, desceu a mansão dos mortos ressuscitou ao terceiro dia, subiu aos céus, está sentado à direita de Deus Pai, todo poderoso, de onde há de vir a julgar os vivos e os mortos. Creio no Espírito Santo, na Santa Igreja Católica, na comunhão dos Santos, na remissão dos pecados, na ressurreição da carne, na vida eterna, Amém.", { "OK" }, onTap ) 
	end
	botaoCreio:addEventListener( "tap", botaoCreio )
	
	print( "Tela de Oracoes: criada!" )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "did" then
		print( "Tela de Oracoes: mostrada!" )
		composer.removeScene( "telaInicial" )
	end	
end

function scene:destroy( event )
	local sceneGroup = self.view
	print( "Tela de Oracoes: destruida!" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene