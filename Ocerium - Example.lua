-- Library Core Loadstring
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/slf0Dev/Goat-poop/main/Windows%2010%20UI%20Library"))()

-- Creating Gui
local MainWindow = Library.Main("GuiName","KeyBind")

-- Creating Categories
local Category = MainWindow.Category("Your Text","ImageId","ImageScaleType",Image Transparency)


--[[
ImageScaleTypes : "Crop" , "Fit" , "Slice" , "Stretch"
]]

-- Creating Folders
local Folder = Category.Folder("TemplateFolder")

-- Creating Components

-- Creating Labels
local Label = Folder.Label("Your Text")

-- Creating Buttons
local Button = Folder.Button("Your Text",function()
print("Pressed")
end)

-- Creating Toggles
local Toggle = Folder.Toggle("Your Text",function(bool)
print(bool)
end,DefaultBoolValue)

-- Creating Sliders
local Slider = Folder.Slider("Your Text",min,max,function(value)
print(value)
end,DefaultValue,isFloat) --isFloat is boolean