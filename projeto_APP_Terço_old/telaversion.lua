local widget = require( "widget" )
local composer = require ( "composer" )

--Create a composer scene for this module
local scene = composer.newScene()

local previousScene

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	print( "Tela Version: event created" )
end

--Show the scene
function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if  phase == "did"  then
		print( "Tela Version: show event, phase did" )
		previousScene = composer.getSceneName( "previous" )
		composer.removeScene( "previousScene" )
		print( "Tela Version: Previous Scene: destroy" )
		local background = display.newImage("telaversion.png", display.contentCenterX, display.contentCenterY)

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
		print( "Tela Version: hide event, phase will" )
	end
end

--Destroy the scene
function scene:destroy( event )
	print( "((destroying Tela Version's view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy",scene )

return scene