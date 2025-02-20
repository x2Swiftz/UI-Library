local Library = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/L3nyFromV3rm/Leny-UI/refs/heads/main/Library.lua", true))()

Library.new({
	sizeX = 770,
	sizeY = 600,
	title = "yo",
	tabWidth = 200, -- (72 for icons only)
	PrimaryBackgroundColor = Library.Theme.PrimaryBackgroundColor,
	SecondaryBackgroundColor = Library.Theme.SecondaryBackgroundColor,
	TertiaryBackgroundColor = Library.Theme.TertiaryBackgroundColor,
	TabBackgroundColor = Library.Theme.TabBackgroundColor,
	PrimaryTextColor = Library.Theme.PrimaryTextColor,
	SecondaryTextColor = Library.Theme.SecondaryTextColor,
	PrimaryColor = Library.Theme.PrimaryColor,
	ScrollingBarImageColor = Library.Theme.ScrollingBarImageColor,
	Line = Library.Theme.Line,
})

Library:notify({
	title = "Notification",
	text = "Hello world",
	maxSizeX = 300,
	scaleX = 0.165,
	sizeY = 200,
})

local Main = Library:createLabel({text = "Main"})

local Tab = Library:createTab({
	text = "Exploits",
	icon = "124718082122263", -- 20x20 icon you want here
})

local Page1 = Tab:createSubTab({
	text = "Page 1",
	sectionStyle = "Double", -- Make the page a single section style or double, "Single", "Double"
})

local Section = Page1:createSection({
	text = "Section",
	position = "Left",
})

Section:createToggle({
	text = "Toggle 1",
	state = false,
	callback = function(state)
		print(state)
	end
}) -- :getState(), :updateState({state = true})

Section:createKeybind({
	onHeld = false,
	text = "Keybind 1",
	default = "RightBracket",
	callback = function(keyName)
		print(keyName)
	end
}) -- :getKeybind(), :updateKeybind({bind = "LeftShift"})

Section:createSlider({
	text = "Slider 1",
	min = 0,
	max = 100,
	step = 1,
	callback = function(value)
		print(value)
	end
}) -- :getValue(), :updateValue({value = 100})

Section:createPicker({
	text = "ColorPicker 1",
	default = Color3.fromRGB(255, 255, 255),
	callback = function(color)
		print(color)
	end
}) -- :getColor(), :updateColor({color = Color3.fromRGB(255, 255, 0)})

Section:createDropdown({
	text = "Dropdown 1",
	list = {"Hello", "World!"},
	default = {"Hello"},
	multiple = false, -- choose multiple from list, makes callback value return a table now
	callback = function(value)
		print(value)
	end
}) -- :getList() (returns the list you provided, not the value), :getValue(), :updateList({list = {1,2,3}, default = {1, 2}})

Section:createDropdown({
	text = "Multiselect Dropdown",
	list = {1,2,3,4,5},
	default = {1,2},
	multiple = true,
	callback = function(value)
		print(unpack(value))
	end
})

Section:createButton({
	text = "Button 1",
	callback = function()
		print("this is a button")
	end
})

Section:createTextBox({
	text = "TextBox 1",
	default = "hi",
	callback = function(text)
		print(text)
	end,
}) -- :getText(), :updateText({text = "bro"})


-- Addon example
local Toggle = Section:createToggle({
	text = "Toggle 2",
	state = false,
	callback = function(state)
		print(state)
	end
})

-- Takes in same parameters/arguments as above
Toggle:createPicker({})
Toggle:createSlider({})
Toggle:createDropdown({})
Toggle:createToggle({})

-- Flags example
print(shared.Flags.Toggle["Toggle 1"]:getState()) -- refers to the {text = "Toggle 1"} you set for the element

-- Creates the theme changer, config manager, etc
Library:createManager({
	folderName = "brah",
	icon = "124718082122263", -- 20x20 icon you want here
})