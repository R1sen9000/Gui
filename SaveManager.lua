local SaveManager = {}

local HttpService = game:GetService("HttpService")

SaveManager.Library = nil
SaveManager.Folder = "MyUILibrary/configs"
SaveManager.IgnoreIndexes = {}

function SaveManager:SetLibrary(lib)
    self.Library = lib
end

function SaveManager:SetFolder(folder)
    self.Folder = folder
    if makefolder and not isfolder(folder) then
        makefolder(folder)
    end
end

function SaveManager:IgnoreThemeSettings()
    self.IgnoreIndexes["ThemeDropdown"] = true
end

function SaveManager:SetIgnoreIndexes(indexes)
    for _, idx in ipairs(indexes) do
        self.IgnoreIndexes[idx] = true
    end
end

function SaveManager:Save(name)
    local data = {Toggles = {}, Options = {}}
    
    for idx, toggle in pairs(getgenv().Toggles) do
        if not self.IgnoreIndexes[idx] then
            data.Toggles[idx] = toggle.Value
        end
    end
    
    for idx, option in pairs(getgenv().Options) do
        if not self.IgnoreIndexes[idx] then
            if option.Type == "Slider" then
                data.Options[idx] = option.Value
            elseif option.Type == "Input" then
                data.Options[idx] = option.Value
            elseif option.Type == "Dropdown" then
                data.Options[idx] = option.Value
            elseif option.Type == "ColorPicker" then
                data.Options[idx] = {option.Value.R, option.Value.G, option.Value.B}
            elseif option.Type == "KeyPicker" then
                local val = option.Value
                local keyName = "None"
                if typeof(val) == "EnumItem" then
                    if val.EnumType == Enum.KeyCode then
                        keyName = val.Name
                    elseif val == Enum.UserInputType.MouseButton1 then
                        keyName = "MB1"
                    elseif val == Enum.UserInputType.MouseButton2 then
                        keyName = "MB2"
                    end
                end
                data.Options[idx] = {keyName, option.Mode}
            end
        end
    end
    
    local json = HttpService:JSONEncode(data)
    
    if writefile then
        local path = self.Folder .. "/" .. name .. ".json"
        writefile(path, json)
        return true
    end
    return false
end

function SaveManager:Load(name)
    if not readfile then return false end
    
    local path = self.Folder .. "/" .. name .. ".json"
    
    if not isfile(path) then return false end
    
    local success, json = pcall(readfile, path)
    if not success then return false end
    
    local success2, data = pcall(HttpService.JSONDecode, HttpService, json)
    if not success2 then return false end
    
    for idx, value in pairs(data.Toggles or {}) do
        if getgenv().Toggles[idx] then
            getgenv().Toggles[idx]:SetValue(value)
        end
    end
    
    for idx, value in pairs(data.Options or {}) do
        local option = getgenv().Options[idx]
        if option then
            if option.Type == "ColorPicker" then
                option:SetValueRGB(Color3.new(value[1], value[2], value[3]))
            elseif option.Type == "KeyPicker" then
                option:SetValue(value)
            else
                option:SetValue(value)
            end
        end
    end
    
    return true
end

function SaveManager:Delete(name)
    if delfile then
        local path = self.Folder .. "/" .. name .. ".json"
        if isfile(path) then
            delfile(path)
            return true
        end
    end
    return false
end

function SaveManager:GetConfigs()
    local configs = {}
    if isfolder and listfiles and isfolder(self.Folder) then
        for _, file in pairs(listfiles(self.Folder)) do
            local name = file:match("([^/\\]+)%.json$")
            if name then
                table.insert(configs, name)
            end
        end
    end
    return configs
end

function SaveManager:BuildConfigSection(tab)
    local Box = tab:AddRightGroupbox("Configuration")
    
    Box:AddInput("ConfigName", {
        Text = "Config Name",
        Default = "",
        Placeholder = "Enter config name...",
        Finished = true
    })
    
    Box:AddDropdown("ConfigList", {
        Text = "Saved Configs",
        Values = self:GetConfigs(),
        Default = 1,
        Callback = function(value)
            if getgenv().Options.ConfigName then
                getgenv().Options.ConfigName:SetValue(value)
            end
        end
    })
    
    Box:AddButton({
        Text = "Save Config",
        Func = function()
            local name = getgenv().Options.ConfigName.Value
            if name and name ~= "" then
                if self:Save(name) then
                    if self.Library then
                        self.Library:Notify("Config saved: " .. name, 3)
                    end
                    if getgenv().Options.ConfigList then
                        getgenv().Options.ConfigList:Refresh(self:GetConfigs())
                    end
                end
            else
                if self.Library then
                    self.Library:Notify("Enter a config name!", 3)
                end
            end
        end
    }):AddButton({
        Text = "Load Config",
        Func = function()
            local name = getgenv().Options.ConfigName.Value
            if name and name ~= "" then
                if self:Load(name) then
                    if self.Library then
                        self.Library:Notify("Config loaded: " .. name, 3)
                    end
                else
                    if self.Library then
                        self.Library:Notify("Config not found!", 3)
                    end
                end
            end
        end
    })
    
    Box:AddButton({
        Text = "Refresh List",
        Func = function()
            if getgenv().Options.ConfigList then
                getgenv().Options.ConfigList:Refresh(self:GetConfigs())
            end
            if self.Library then
                self.Library:Notify("Config list refreshed!", 2)
            end
        end
    }):AddButton({
        Text = "Delete Config",
        DoubleClick = true,
        Func = function()
            local name = getgenv().Options.ConfigName.Value
            if name and name ~= "" then
                if self:Delete(name) then
                    if self.Library then
                        self.Library:Notify("Config deleted: " .. name, 3)
                    end
                    if getgenv().Options.ConfigList then
                        getgenv().Options.ConfigList:Refresh(self:GetConfigs())
                    end
                end
            end
        end
    })
end

function SaveManager:LoadAutoloadConfig()
    if isfile and isfile(self.Folder .. "/autoload.txt") then
        local name = readfile(self.Folder .. "/autoload.txt")
        if name and name ~= "" then
            self:Load(name)
        end
    end
end

function SaveManager:SetAutoload(name)
    if writefile then
        writefile(self.Folder .. "/autoload.txt", name)
    end
end

return SaveManager
