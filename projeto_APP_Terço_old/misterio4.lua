local widget = require( "widget" )
local composer = require ( "composer" )

--Create a composer scene for this module
local scene = composer.newScene()

local previousScene

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	print( "Tela 4 Misterio: event created" )
end

--Show the scene
function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if  phase == "did"  then
		print( "Tela 4 Misterio: show event, phase did" )
		previousScene = composer.getSceneName( "previous" )
		composer.removeScene( "previousScene" )
		print( "Tela 4 Misterio: Previous Scene: destroy" )
		local background = display.newImage("misterio4.png", display.contentCenterX, display.contentCenterY)

		local button5Misterio = widget.newButton
		{
			id = "button5Misterio",
			defaultFile = "button5misterio.png",
			overFile = "button5misterioover.png",
			onRelease = function() composer.gotoScene( "misterio5" )
			end
		}
		button5Misterio.x = display.contentCenterX + 110
		button5Misterio.y = display.contentCenterY + 210

		local buttonEternoPai = widget.newButton
		{
			id = "buttonEternoPai",
			defaultFile = "eternopai.png",
			onRelease = function() composer.gotoScene( "telaeternopai" )				
			end
		}
		buttonEternoPai.x = display.contentCenterX
		buttonEternoPai.y = display.contentCenterY + 135

		local buttonPaixao = widget.newButton
		{
			id = "buttonPaixao",
			defaultFile = "paixao.png",
			onRelease = function() composer.gotoScene( "telapaixao" )				
			end
		}
		buttonPaixao.x = display.contentCenterX
		buttonPaixao.y = display.contentCenterY + 150

		local buttonSangue = widget.newButton
		{
			id = "buttonSangue",
			defaultFile = "sangue.png",
			onRelease = function() composer.gotoScene( "telasangue" )				
			end
		}
		buttonSangue.x = display.contentCenterX
		buttonSangue.y = display.contentCenterY + 165

		local arrow1 = widget.newButton
		{
			id = "arrow1",
			defaultFile = "backbutton.png",
			overFile = "backbuttonover.png",
			onRelease = function() composer.gotoScene( "misterio3" )
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
		print( "Tela 4 Misterio: hide event, phase will" )
	end
end

--Destroy the scene
function scene:destroy( event )
	print( "((destroying Tela 4 Misterio view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy",scene )

return scene