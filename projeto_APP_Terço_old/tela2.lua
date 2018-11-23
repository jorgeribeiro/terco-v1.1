local widget = require( "widget" )
local composer = require ( "composer" )

--Create a composer scene for this module
local scene = composer.newScene()

local previousScene

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	print( "Tela 2: event created" )
end

--Show the scene
function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if ( phase == "did" ) then
		print( "Tela 2: show event, phase did" )
		previousScene = composer.getSceneName( "previous" )
		composer.removeScene( previousScene )
		composer.removeScene( "tela1" )
		print( "Tela 1: destroy" )
		local tela2 = display.newImage("tela2.png", display.contentCenterX, display.contentCenterY)

		local button1Misterio = widget.newButton
		{
			id = "button1Misterio",
			defaultFile = "button1misterio.png",
			overFile = "button1misterioover.png",
			onRelease = function() composer.gotoScene( "misterio1" )
			end
		}	
		button1Misterio.x = display.contentCenterX + 110
		button1Misterio.y = display.contentCenterY + 210

		local buttonPaiNosso = widget.newButton
		{
			id = "buttonPaiNosso",
			defaultFile = "painosso.png",
			onRelease = function() composer.gotoScene( "telapainosso" )				
			end
		}
		buttonPaiNosso.x = display.contentCenterX
		buttonPaiNosso.y = display.contentCenterY - 90

		local buttonAveMaria = widget.newButton
		{
			id = "buttonAveMaria",
			defaultFile = "avemaria.png",
			onRelease = function() composer.gotoScene( "telaavemaria" )				
			end
		}
		buttonAveMaria.x = display.contentCenterX
		buttonAveMaria.y = display.contentCenterY - 70	

		local buttonCreio = widget.newButton
		{
			id = "buttonCreio",
			defaultFile = "creio.png",
			onRelease = function() composer.gotoScene( "telacreio" )				
			end
		}
		buttonCreio.x = display.contentCenterX
		buttonCreio.y = display.contentCenterY - 50

		local arrow1 = widget.newButton
		{
			id = "arrow1",
			defaultFile = "backbutton.png",
			overFile = "backbuttonover.png",
			onRelease = function() composer.gotoScene( "tela1" )
			end
		}
		arrow1.x = display.contentCenterX - 110
		arrow1.y = display.contentCenterY + 210
	end
end

--Hide the scene
function scene:hide( event )
	local phase = event.phase
	if phase == "will" then
		print( "Tela 2: hide event, phase will" )
	end
end

--Destroy the scene
function scene:destroy( event )
	print( "((destroying Tela 2's view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy",scene )

return scene