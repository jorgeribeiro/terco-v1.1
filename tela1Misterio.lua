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

local telaPrevia = composer.getSceneName( "previous" )

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage( "tela1Misterio.png" )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	sceneGroup:insert( background )

	local botaoEternopai = display.newImage( "botaoEternopai.png" )
	botaoEternopai.x = display.contentCenterX
	botaoEternopai.y = display.contentCenterY + 135

	sceneGroup:insert( botaoEternopai )
	
	function botaoEternopai:tap( event )
		local alert = native.showAlert( "Eterno Pai", "Eterno Pai, eu vos ofereço, o Corpo e o Sangue, a Alma e a Divindade, do Vosso Diletíssimo Filho, Nosso Senhor Jesus Cristo, em expiação dos nossos pecados e os do mundo inteiro.", { "OK" }, onTap ) 
	end
	botaoEternopai:addEventListener( "tap", botaoEternopai )

	local botaoPaixao = display.newImage( "botaoPaixao.png" )
	botaoPaixao.x = display.contentCenterX
	botaoPaixao.y = display.contentCenterY + 160

	sceneGroup:insert( botaoPaixao )
	
	function botaoPaixao:tap( event )
		local alert = native.showAlert( "Pela Sua Dolorosa Paixão", "Pela Sua Dolorosa Paixão, tende misericórdia de nós e do mundo inteiro. (10 vezes)", { "OK" }, onTap ) 
	end
	botaoPaixao:addEventListener( "tap", botaoPaixao )

	local botaoSangue = display.newImage( "botaoSangue.png" )
	botaoSangue.x = display.contentCenterX
	botaoSangue.y = display.contentCenterY + 185

	sceneGroup:insert( botaoSangue )
	
	function botaoSangue:tap( event )
		local alert = native.showAlert( "Ó Sangue e Água", "Ó Sangue e Água que jorraste do Coração de Jesus como fonte de misericórdia para nós, nós confiamos em Vós.", { "OK" }, onTap ) 
	end
	botaoSangue:addEventListener( "tap", botaoSangue )

	local botaoVolta = widget.newButton
		{
			id = "botaoVolta",
			defaultFile = "botaoVolta.png",
			overFile = "botaoVoltaover.png",
			onRelease = function() composer.gotoScene( "telaOracoes", "fade", 100 )		
			end
		}
		botaoVolta.x = display.contentCenterX - 115
		botaoVolta.y = display.contentCenterY + 215

	sceneGroup:insert( botaoVolta )

	local botao2Misterio = widget.newButton
		{
			id = "botao2Misterio",
			defaultFile = "botao2Misterio.png",
			overFile = "botao2Misterioover.png",
			onRelease = function() composer.gotoScene( "tela2Misterio", "fade", 100 )
			end
		}
		botao2Misterio.x = display.contentCenterX + 115
		botao2Misterio.y = display.contentCenterY + 215

	sceneGroup:insert( botao2Misterio )
	
	print( "Tela 1o Misterio: criada!" )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "did" then
		print( "Tela 1o Misterio: mostrada!" )
		composer.removeScene( telaPrevia )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	print( "Tela 1o Misterio: destruida!" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene