local widget = require( "widget" )
local composer = require ( "composer" )

--Create a composer scene for this module
local scene = composer.newScene()

local previousScene

--Create the scene
function scene:create( event )
	local sceneGroup = self.view

	print( "Tela 1 Misterio: event created" )
end

--Show the scene
function scene:show( event )
	local sceneGroup = self.view

	local phase = event.phase
	if  phase == "did"  then
		print( "Tela 1 Misterio: show event, phase did" )
		previousScene = composer.getSceneName( "previous" )
		composer.removeScene( "tela2" )
		print( "Tela 2: destroy" )
		local background = display.newImage("misterio1.png", display.contentCenterX, display.contentCenterY)

		local button2Misterio = widget.newButton
		{
			id = "button2Misterio",
			defaultFile = "button2misterio.png",
			overFile = "button2misterioover.png",
			onRelease = function() composer.gotoScene( "misterio2" )
			end
		}
		button2Misterio.x = display.contentCenterX + 110
		button2Misterio.y = display.contentCenterY + 210

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
			onRelease = function() composer.gotoScene( "tela2" )
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
		print( "Tela 1 Misterio: hide event, phase will" )
	end
end

--Destroy the scene
function scene:destroy( event )
	print( "((destroying Tela 1 Misterio view))" )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene