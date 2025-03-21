local Players = game:GetService("Players")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

local DefaultFOV = 70
local FOVValue = 100
local FOVEnabled = false
local FOVButton

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui
screenGui.ResetOnSpawn = false

FOVButton = Instance.new("TextButton")
FOVButton.Size = UDim2.new(0, 200, 0, 50)
FOVButton.Position = UDim2.new(0, 0, 0, 225)
FOVButton.Text = "FOV: Off"
FOVButton.Parent = screenGui

local function ToggleFOV()
    if FOVEnabled then
        Camera.FieldOfView = DefaultFOV
        FOVButton.Text = "FOV: Off"
    else
        Camera.FieldOfView = FOVValue
        FOVButton.Text = "FOV: On"
    end
    FOVEnabled = not FOVEnabled
end

FOVButton.MouseButton1Click:Connect(ToggleFOV)

Camera.FieldOfView = DefaultFOV
FOVButton.Text = "FOV: Off"

game:BindToClose(function()
    screenGui:Destroy()
end)