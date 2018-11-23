local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage( "background.png" )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	sceneGroup:insert( background )

	local tituloinicial = display.newImage( "tituloinicial.png" )
	tituloinicial.x = display.contentCenterX
	tituloinicial.y = display.contentCenterY - 100

	sceneGroup:insert ( tituloinicial )

	local botaoInicial = widget.newButton
		{
			id = "botaoInicial",
			defaultFile = "botaoInicial.png",
			overFile = "botaoInicialover.png",
			onRelease = function() composer.gotoScene( "telaOracoes", "fade", 100 )
			end
		}
		botaoInicial.x = display.contentCenterX
		botaoInicial.y = tituloinicial.y + 200

	sceneGroup:insert( botaoInicial )
		
	local botaoVersao = widget.newButton
		{
			id = "botaoVersao",
			defaultFile = "botaoVersao.png",
			onRelease = function() composer.gotoScene( "telaVersao", "fade", 100 )		
			end
		}
		botaoVersao.x = display.contentCenterX + 110
		botaoVersao.y = display.contentCenterY + 220

	sceneGroup:insert( botaoVersao )
	
	print( "Tela Inicial: criada!" )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "did" then
		print( "Tela Inicial: mostrada!" )
		composer.removeScene( "telaOracoes" )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	print( "Tela Inicial: destruida!" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene