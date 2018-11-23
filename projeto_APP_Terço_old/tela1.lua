local widget = require( "widget" )
local composer = require ( "composer" )

--Create a composer scene for this module
local scene = composer.newScene()

local previousScene	

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	print( "Tela 1: event created" )
end

--Show the scene
function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if  phase == "did"  then
		print( "Tela 1: show event, phase did" )
		local background = display.newImage("background.png", display.contentCenterX, display.contentCenterY)
		local fonteInicial = display.newImage("font_inicial.png", display.contentCenterX, display.contentCenterY - 100)

		local button1 = widget.newButton
		{
			id = "button1",
			defaultFile = "button1.png",
			overFile = "button1over.png",
			onRelease = function() composer.gotoScene( "tela2" )
			end
		}
		button1.x = display.contentCenterX
		button1.y = fonteInicial.y + 200

		local buttonVersion = widget.newButton
		{
			id = "buttonVersion",
			defaultFile = "version.png",
			onRelease = function() composer.gotoScene( "telaversion" )
			end
		}
		buttonVersion.x = display.contentCenterX + 110
		buttonVersion.y = fonteInicial.y + 320
	end	
end

--Hide the scene
function scene:hide( event )
	local phase = event.phase
	if phase == "will" then
		print( "Tela 1: hide event, phase will" )
	end
end

--Destroy the scene
function scene:destroy( event )
	print( "((destroying Tela 1's view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy",scene )

return scene