local ThemeManager = {}

ThemeManager.Themes = {
    Default = {
        Primary = Color3.fromRGB(60, 60, 255),
        Background = Color3.fromRGB(20, 20, 25),
        Secondary = Color3.fromRGB(28, 28, 35),
        Accent = Color3.fromRGB(80, 200, 120)
    },
    Dark = {
        Primary = Color3.fromRGB(80, 80, 255),
        Background = Color3.fromRGB(15, 15, 18),
        Secondary = Color3.fromRGB(22, 22, 28),
        Accent = Color3.fromRGB(100, 220, 140)
    },
    Purple = {
        Primary = Color3.fromRGB(150, 80, 255),
        Background = Color3.fromRGB(25, 20, 30),
        Secondary = Color3.fromRGB(35, 28, 45),
        Accent = Color3.fromRGB(200, 100, 255)
    },
    Ocean = {
        Primary = Color3.fromRGB(0, 180, 255),
        Background = Color3.fromRGB(15, 25, 35),
        Secondary = Color3.fromRGB(20, 35, 50),
        Accent = Color3.fromRGB(0, 255, 200)
    },
    Red = {
        Primary = Color3.fromRGB(255, 80, 80),
        Background = Color3.fromRGB(25, 18, 18),
        Secondary = Color3.fromRGB(40, 25, 25),
        Accent = Color3.fromRGB(255, 120, 120)
    },
    Green = {
        Primary = Color3.fromRGB(80, 255, 120),
        Background = Color3.fromRGB(18, 25, 18),
        Secondary = Color3.fromRGB(25, 40, 25),
        Accent = Color3.fromRGB(120, 255, 150)
    }
}

ThemeManager.Library = nil
ThemeManager.Folder = "MyUILibrary"

function ThemeManager:SetLibrary(lib)
    self.Library = lib
end

function ThemeManager:SetFolder(folder)
    self.Folder = folder
end

function ThemeManager:ApplyTheme(name)
    if self.Themes[name] and self.Library then
        self.Library.Theme = self.Themes[name]
    end
end

function ThemeManager:ApplyToTab(tab)
    local Box = tab:AddLeftGroupbox("Themes")
    
    local themes = {}
    for name in pairs(self.Themes) do
        table.insert(themes, name)
    end
    
    Box:AddDropdown("ThemeDropdown", {
        Text = "Select Theme",
        Values = themes,
        Default = 1,
        Callback = function(value)
            self:ApplyTheme(value)
        end
    })
end

function ThemeManager:ApplyToGroupbox(groupbox)
    local themes = {}
    for name in pairs(self.Themes) do
        table.insert(themes, name)
    end
    
    groupbox:AddDropdown("ThemeDropdown", {
        Text = "Select Theme",
        Values = themes,
        Default = 1,
        Callback = function(value)
            self:ApplyTheme(value)
        end
    })
end

return ThemeManager
