-----------------------------------------------------------------------------------------
-- Touch And React
-- Dante Beltran
-- ICS3C
-- This Program has a button that changes when you click on it.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background color
display.setDefault ("background", 153/255, 204/255, 255/255)

--create mario happy
local marioHappy = display.newImageRect("Images/Happy Mario.png",200, 200)
marioHappy.x = display.contentWidth/2
marioHappy.y = display.contentHeight/4*3
marioHappy.isVisible = false

-- create mario sad
local marioSad = display.newImageRect("Images/Sad Mario.png",200, 200)
marioSad.x = display.contentWidth/2
marioSad.y = display.contentHeight/4*3
marioSad.isVisible = true

-- create blue button, set its position and make it visable
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png",198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentHeight/2
blueButton.isVisible = true

-- create red button, set its position and make it invisible
local redButton = display.newImageRect("Images/Fast Button Active@2x.png",198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentHeight/2
redButton.isVisible = false

-- create text object, set its position and make it invisible
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentHeight/3
textObject:setTextColor (1, 1, 0)
textObject.isVisible = false

-- load sounds
local correctAnswer =audio.loadSound("Sound Effects/Correct Answer Sound Effect.mp3")
local wrongAnswer =audio.loadSound("Sound Effects/Wrong Buzzer Sound Effect.mp3")

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: when blue button is clicked, it will make the text appear with the red button,
-- and make the blue button disappear
local function BlueButtonListener(touch)

	if (touch.phase == "began") then
		blueButton.isVisible = false
		marioSad.isVisible = false
		marioHappy.isVisible = true
		redButton.isVisible = true
		textObject.isVisible = true
		audio.play(correctAnswer)
	end
end 

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: when red button is released, it will make the text disappear and red button disappear,
-- and the blue button reappear
local function RedButtonListener(touch)

	if (touch.phase == "ended") then
		blueButton.isVisible = true
		marioHappy.isVisible = false
		marioSad.isVisible = true
		redButton.isVisible = false
		textObject.isVisible = false
		audio.play(wrongAnswer)
	end
end

-- add the respective listeners to each object 
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)

	