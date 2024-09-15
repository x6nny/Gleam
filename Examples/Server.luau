local Players = game:GetService('Players')

local Gleam = require(<path-to-Gleam>)
local profileTemplate = require(<path-to-template>)
local GleamStore = Gleam.new({name = 'Test1', scope = 'Test1'}, profileTemplate)


local Profiles = {}

local function PlayerAdded(player : Player)
	local profile = GleamStore:GetPlayerProfile(player)
	
	Profiles[player] = profile
	
	local _gold = Profiles[player].Data:Grab('Gold')
	
	local leaderstats = Instance.new('Folder')
	leaderstats.Name = 'leaderstats'
	
	local gold = Instance.new('NumberValue')
	gold.Name = 'Gold'
	
	gold.Parent = leaderstats
	leaderstats.Parent = player
	
	gold.Value = _gold:Get()
	
	_gold:Listen(function(new_value)
		gold.Value = new_value
		if Profiles[player] == nil then return end
		Profiles[player]:SendUpdate('Gold')
	end)
	
	Profiles[player].Data:Grab({'Inventory', 'Boosts', 'Speed'}):Set(1)
	Profiles[player]:SendUpdate({'Inventory', 'Boosts', 'Speed'})
	
	print(Profiles[player].Data:Get())
	
	while task.wait(1) do
		_gold:Increment(1)
	end
end

local function PlayerRemoving(player : Player)
	Profiles[player]:Release()
	Profiles[player] = nil
end

for _, v in pairs(Players:GetPlayers()) do
	PlayerAdded(v)
end

Players.PlayerAdded:Connect(PlayerAdded)
Players.PlayerRemoving:Connect(PlayerRemoving)