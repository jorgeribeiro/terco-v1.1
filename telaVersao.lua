local composer = require( "composer" )
local widget = require( "widget" )

local scene = composer.newScene()

---------------------------------------------------------------------------------

function scene:create( event )
	local sceneGroup = self.view
	
	local background = display.newImage( "telaVersion.png" )
	background.x = display.contentCenterX
	background.y = display.contentCenterY
	
	sceneGroup:insert( background )

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
	
	print( "Tela de Versao: criada!" )
end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase
	
	if phase == "did" then
		print( "Tela de Versao: mostrada!" )
		composer.removeScene( "telaInicial" )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
	print( "Tela de Versao: destruida!" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "destroy", scene )

return scene