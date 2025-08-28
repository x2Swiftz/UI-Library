--[[
		Example Compkiller UI
	
	Author: 4lpaca
	
	Press Left Alt to open / close
]]

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))();

-- Create Notification --
local Notifier = Compkiller.newNotify();

-- Create Config Mamager --
local ConfigManager = Compkiller:ConfigManager({
	Directory = "Compkiller-UI",
	Config = "Example-Configs"
});

-- Loading UI (Icon <string> , Duration <number>) --
Compkiller:Loader("rbxassetid://120245531583106" , 2.5).yield();

-- Creating Window --
local Window = Compkiller.new({
	Name = "COMPKILLER",
	Keybind = "LeftAlt",
	Logo = "rbxassetid://120245531583106",
	Scale = Compkiller.Scale.Window, -- Leave blank if you want automatic scale [PC, Mobile].
	TextSize = 15,
});

-- Notification --

Notifier.new({
	Title = "Notification",
	Content = "Thank you for use this script!",
	Duration = 10,
	Icon = "rbxassetid://120245531583106"
});

-- Watermark --
local Watermark = Window:Watermark();

Watermark:AddText({
	Icon = "user",
	Text = "4lpaca",
});

Watermark:AddText({
	Icon = "clock",
	Text = Compkiller:GetDate(),
});

local Time = Watermark:AddText({
	Icon = "timer",
	Text = "TIME",
});

task.spawn(function()
	while true do task.wait()
		Time:SetText(Compkiller:GetTimeNow());
	end
end)

Watermark:AddText({
	Icon = "server",
	Text = Compkiller.Version,
});

-- Creating Tab Category --
Window:DrawCategory({
	Name = "Example"
});

-- Creating Tab --
local NormalTab = Window:DrawTab({
	Name = "Example Tab",
	Icon = "apple",
	EnableScrolling = true
});

-- Creating Section --
local NormalSection = NormalTab:DrawSection({
	Name = "Section",
	Position = 'left'	
});

local Toggle = NormalSection:AddToggle({
	Name = "Toggle",
	Flag = "Toggle_Example", -- Leave it blank will not save to config
	Default = false,
	Callback = print,
});

-- Add Keybind To Toggle --
local Keybind = Toggle.Link:AddKeybind({
	Default = "E",
	Flag = "Option_Keybind",
	Callback = print
});

-- Helper --
Toggle.Link:AddHelper({
	Text = "Very cool toggle!"
})

-- Add Option To Toggle --
local Toggle2 = NormalSection:AddToggle({
	Name = "Toggle",
	Flag = "Toggle_Example2", -- Leave it blank will not save to config
	Default = false,
	Callback = print,
});

local Option = Toggle2.Link:AddOption()

Option:AddToggle({
	Name= "Example",
	Flag = "Toggle_Example3",
	Callback = print
});

do
	local Toggle2 = NormalSection:AddToggle({
		Name = "Risky Feature",
		Flag = "Toggle_Example5", -- Leave it blank will not save to config
		Default = false,
		Risky = true,
		Callback = print,
	});

	local Option = Toggle2.Link:AddOption()

	Option:AddToggle({
		Risky = true,
		Name= "Risky Feature",
		Flag = "Toggle_Example6",
		Callback = print
	});
end

NormalSection:AddKeybind({
	Name = "Keybind",
	Default = "LeftAlt",
	Flag = "Keybind_Example",
	Callback = print,
});

NormalSection:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 100,
	Default = 50,
	Round = 0,
	Flag = "Slider_Example",
	Callback = print
});

NormalSection:AddColorPicker({
	Name = "ColorPicker",
	Default = Color3.fromRGB(0, 255, 140),
	Flag = "Color_Picker_Example",
	Callback = print
})

NormalSection:AddDropdown({
	Name = "Single Dropdown",
	Default = "Head",
	Flag = "Single_Dropdown",
	Values = {"Head","Body","Arms","Legs"},
	Callback = print
})

NormalSection:AddDropdown({
	Name = "Multi Dropdown",
	Default = {"Head"},
	Multi = true,
	Flag = "Multi_Dropdown",
	Values = {"Head","Body","Arms","Legs"},
	Callback = print
})

NormalSection:AddButton({
	Name = "Button",
	Callback = function()
		print('PRINT!')
	end,
})

NormalSection:AddParagraph({
	Title = "Paragraph",
	Content = "Very cool paragraph\nAll element in this scrtion\nwill be saved to the config!"
})

NormalSection:AddTextBox({
	Name = "Textbox",
	Placeholder = "Placeholder",
	Default = "Hello, World",
	Callback = print
})

local DrawElements = function(Tab,Position)
	do
		local NormalSectionRight = Tab:DrawSection({
			Name = "Section",
			Position = Position
		});

		local Toggle = NormalSectionRight:AddToggle({
			Name = "Toggle",
			Default = false,
			Callback = print,
		});

		-- Add Keybind To Toggle --
		local Keybind = Toggle.Link:AddKeybind({
			Default = "E",
			Callback = print
		});

		-- Add Option To Toggle --
		local Toggle2 = NormalSectionRight:AddToggle({
			Name = "Toggle",
			Default = false,
			Callback = print,
		});

		local Option = Toggle2.Link:AddOption()

		Option:AddToggle({
			Name= "Example",
			Callback = print
		});

		NormalSectionRight:AddKeybind({
			Name = "Keybind",
			Default = "LeftAlt",
			Callback = print,
		});

		NormalSectionRight:AddSlider({
			Name = "Slider",
			Min = 0,
			Max = 100,
			Default = 50,
			Round = 0,
			Callback = print
		});

		NormalSectionRight:AddColorPicker({
			Name = "ColorPicker",
			Default = Color3.fromRGB(0, 255, 140),
			Callback = print
		})

		NormalSectionRight:AddDropdown({
			Name = "Single Dropdown",
			Default = "Head",
			Values = {"Head","Body","Arms","Legs"},
			Callback = print
		})

		NormalSectionRight:AddDropdown({
			Name = "Multi Dropdown",
			Default = {"Head"},
			Multi = true,
			Values = {"Head","Body","Arms","Legs"},
			Callback = print
		})

		NormalSectionRight:AddButton({
			Name = "Button",
			Callback = function()
				print('PRINT!')
			end,
		})

		NormalSectionRight:AddParagraph({
			Title = "Paragraph",
			Content = "Very cool paragraph\nAll elements in this section\nwill not be save to the config"
		})
	end;
end;

DrawElements(NormalTab,'right')

-- Single Tab --
local SingleTab = Window:DrawTab({
	Name = "Single Tab",
	Icon = "banana",
	Type = "Single"
});

DrawElements(SingleTab,'left')

-- Container Tab --
local ContainerTab = Window:DrawContainerTab({
	Name = "Extract Tabs",
	Icon = "contact",
});

local ExtractTab = ContainerTab:DrawTab({
	Name = "Tab 1",
	Type = "Double"
});

local SingleExtractTab = ContainerTab:DrawTab({
	Name = "Tab 2",
	Type = "Single",
	EnableScrolling = true, -- this will make tab can scrolling (recommend)
});

DrawElements(ExtractTab,"left");
DrawElements(ExtractTab,"right");

DrawElements(SingleExtractTab,"left");
DrawElements(SingleExtractTab,"right");

Window:DrawCategory({
	Name = "Misc"
});

local SettingTab = Window:DrawTab({
	Icon = "settings-3",
	Name = "Settings",
	Type = "Single",
	EnableScrolling = true
});

local ThemeTab = Window:DrawTab({
	Icon = "paintbrush",
	Name = "Themes",
	Type = "Single"
});

local Settings = SettingTab:DrawSection({
	Name = "UI Settings",
});

Settings:AddToggle({
	Name = "Alway Show Frame",
	Default = false,
	Callback = function(v)
		Window.AlwayShowTab = v;
	end,
});

Settings:AddColorPicker({
	Name = "Highlight",
	Default = Compkiller.Colors.Highlight,
	Callback = function(v)
		Compkiller.Colors.Highlight = v;
		Compkiller:RefreshCurrentColor();
	end,
});

Settings:AddColorPicker({
	Name = "Toggle Color",
	Default = Compkiller.Colors.Toggle,
	Callback = function(v)
		Compkiller.Colors.Toggle = v;
		
		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Drop Color",
	Default = Compkiller.Colors.DropColor,
	Callback = function(v)
		Compkiller.Colors.DropColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Risky",
	Default = Compkiller.Colors.Risky,
	Callback = function(v)
		Compkiller.Colors.Risky = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Mouse Enter",
	Default = Compkiller.Colors.MouseEnter,
	Callback = function(v)
		Compkiller.Colors.MouseEnter = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Block Color",
	Default = Compkiller.Colors.BlockColor,
	Callback = function(v)
		Compkiller.Colors.BlockColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Background Color",
	Default = Compkiller.Colors.BGDBColor,
	Callback = function(v)
		Compkiller.Colors.BGDBColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Block Background Color",
	Default = Compkiller.Colors.BlockBackground,
	Callback = function(v)
		Compkiller.Colors.BlockBackground = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Stroke Color",
	Default = Compkiller.Colors.StrokeColor,
	Callback = function(v)
		Compkiller.Colors.StrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "High Stroke Color",
	Default = Compkiller.Colors.HighStrokeColor,
	Callback = function(v)
		Compkiller.Colors.HighStrokeColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Switch Color",
	Default = Compkiller.Colors.SwitchColor,
	Callback = function(v)
		Compkiller.Colors.SwitchColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddColorPicker({
	Name = "Line Color",
	Default = Compkiller.Colors.LineColor,
	Callback = function(v)
		Compkiller.Colors.LineColor = v;

		Compkiller:RefreshCurrentColor(v);
	end,
});

Settings:AddButton({
	Name = "Get Theme",
	Callback = function()
		print(Compkiller:GetTheme())
		
		Notifier.new({
			Title = "Notification",
			Content = "Copied Them Color to your clipboard",
			Duration = 5,
			Icon = "rbxassetid://120245531583106"
		});
	end,
});

ThemeTab:DrawSection({
	Name = "UI Themes"
}):AddDropdown({
	Name = "Select Theme",
	Default = "Default",
	Values = {
		"Default",
		"Dark Green",
		"Dark Blue",
		"Purple Rose",
		"Skeet"
	},
	Callback = function(v)
		Compkiller:SetTheme(v)
	end,
})

-- Creating Config Tab --
local ConfigUI = Window:DrawConfig({
	Name = "Config",
	Icon = "folder",
	Config = ConfigManager
});

ConfigUI:Init();