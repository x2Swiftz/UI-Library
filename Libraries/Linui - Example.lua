--========================== LinUI Library Example --==========================--
local Library = loadstring(game:HttpGet("https://reallinen.github.io/Files/Scripts/Linui.lua"))()
local Section = Library:Section("Example") -- Creates a section

local Label = Section:Label({
	Text = "I am a Label", -- Text/Name of the label
})

local Button = Section:Button({
	
	Text = "Click me", -- Text/Name of the button

	Callback = function() -- What will be fired when the button is clicked [ optional ] | Default: function() end
		print("Button was clicked!")
	end
})

local MagicButton = Section:Button({
	
	Text = "Magic Button", -- Text/Name of the button

	Callback = function() -- What will be fired when the button is clicked [ optional ] | Default: function() end
		Button:Text("Click Me V"..math.random(10, 50))
		Label:Text("I am magic label "..math.random(1, 50))
	end
})

local Keybind = Section:Keybind({

	Text = "Keybind", -- Text of the keybind
	Value = "K", -- string/Enum values are allowed

	Callback = function( key: string --[[ The key that was triggerd ]] ) -- Callback that will fire when the keybind is pressed [ optional ] | default: function() end
		print("Keybind", key)
	end,

	OnChange = function( key: string --[[ new key]], old_key: string --[[ the old key ]] ) -- This will fire when the keybind was changed to another key [ optional ]
		print("New Keybind Key:", key, "|", "Old Keybind Key:", old_key)
	end
})

local Slider1 = Section:Slider({

	Text = "Walkspeed", -- Text/Name of the button

	Min = 1,  -- Minimum Value of the slider [ optional ]  | Default: math.random
	Value = 16, -- Value of the slider [ optional ] | Default: math.random(Min, Max)
	Max = 100, -- Maximum value of the slider [ optional ] | Default: math.random

	Callback = function(value --[[ New value of the slider ]], prevalue --[[ Previous value of the slider ]]) -- Callback is what will be fired when the slider value changes ( WaitForMouse ) or when the slider value is being changed ( Without WaitForMouse ) [ optional ] | Default: function() end
		if value ~= prevalue then
			if Humanoid then
				Humanoid.WalkSpeed = value
			end
		end
	end
})

local Slider2 = Section:Slider({

	Text = "Walkspeed 2", -- Text/Name of the button
	WaitForMouse = true, -- Wait for the mouse to be done moving the slider [ optional ] | Default: nil/false

	Min = 1,  -- Minimum Value of the slider [ optional ]  | Default: math.random
	Value = 16, -- Value of the slider [ optional ] | Default: math.random(Min, Max)
	Max = 100, -- Maximum value of the slider [ optional ] | Default: math.random

	Callback = function(value --[[ New value of the slider ]], prevalue --[[ Previous value of the slider ]]) -- Callback is what will be fired when the slider value changes ( WaitForMouse ) or when the slider value is being changed ( Without WaitForMouse ) [ optional ] | Default: function() end
		if value ~= prevalue then
			if Humanoid then
				Humanoid.WalkSpeed = value
			end
		end
	end
})

local Toggle = Section:Toggle({

	Text = "Toggle", -- Text of the slider
	Value = false, -- value of the slider [ optional ] | default: false

	Callback = function(value: boolean --[[ current value of the slider ]]) -- Callback of the Toggle [optional]
		print("Toggle #1:", value)
	end
})

local Toggle2 = Section:Toggle({

	Text = "Toggle 2", -- Text of the slider
	Value = true, -- value of the slider [ optional ] | default: false

	Callback = function(value: boolean --[[ current value of the slider ]]) -- Callback of the Toggle [optional]
		print("Toggle #2:", value)
	end
})

local Dropdown = Section:Dropdown({

	Text = "Dropdown",
	Data = { "This", "Will", "Be", "In", "The", "Dropdown" }, -- The values that will be in the dropdown. Seperated by a ","

	Callback = function(value) -- Callback of the Dropdown, will fire when a new option has been selected in the dropdown [optional] | default: function() end
		print("Dropdown Option:", value)
	end
})

local Dropdown2 = Section:Dropdown({

	Text = "Dropdown 2",
	Data = { "test", "fee", "fi", "foe" }, -- The values that will be in the dropdown. Seperated by a ","
	KeepText = true, -- when an element is selected, it will keep the "Dropdown 2" text

	Callback = function(value) -- Callback of the Dropdown, will fire when a new option has been selected in the dropdown [optional] | default: function() end
		print("Dropdown Option:", value)
	end
})

local ColorPicker = Library:Color({ -- Adds on the Right panel since we used Library and not a section
        Text = "Color Picker",
        Color = Color3.fromRGB(255, 255, 255), -- set a custom color [ optional ] | default: White/Color3.fromRGB(255, 255, 255)
        Callback = function(color: Color3) -- color is a RGB color [ Color3.fromHSV ]
	    print("Color:", color.R, color.G, color.B) -- will print out in HSV
	    local r, g, b = color.R * 255, color.G * 255, color.B * 255
	    print(r, g, b) -- will print out in RGB color format instead of HSV
        end
})

-- Slider 2:
Slider2:Set(80) -- Setting Slider 2 Value to 80
Slider2:Set(80, true) -- Setting Slider 2 Value to 80, except it will not call the 'Callback' function with the new value

print(Slider2:Get()) -- will print '80'
Slider2:Text("Speed V2") -- Setting Slider 2 Text to "Speed V2"
print("----------------------- Toggle:")

-- Button:
Button:Change(function() -- When the button is clicked, it will fire this function instead of the Callback. Basically changing the Callback of/in the button to this function
	print("New button callback")	
end)

task.delay(5, function() -- use task.delay to not yeild the current script context
	Button:Text("Click me V2!") -- Changes the button text to this after 5 seconds
end)

-- Toggle 2:
print(Toggle2:Get()) -- prints true, this gets the value of Toggle2
Toggle2:Toggle() -- This switches the value of toggle 2 to the opposit of what it currently is

print(Toggle2:Get()) -- prints false, since we just switched the value of Toggle 2

Toggle2:Set(true) -- Sets the value of Toggle 2 to true 
Toggle2:Set(false, true) -- Sets the value of Toggle 2 to false, but doesn't call the 'Callback' 

print("----------------------- Dropdown:")

-- Dropdown:
Dropdown:Add("Extra")
print(Dropdown:Get("Extra")) -- Object

task.wait(2)

Dropdown:Remove("Extra") -- Removes "Extra" from the dropdown
print(Dropdown:Get("Extra")) -- nil

Section:Button({
	Text = "Add to dropdown",
	Callback = function() 
		Dropdown:Add("New "..math.random(1, 9)) -- Adding a value to the dropdown
	end
})

Section:Button({
	Text = "Clear dropdown",
	Callback = function() 
		Dropdown:Remove() -- Since we didn't specify a value to remove from the dropdown, it removes all the elements inside
	end
})