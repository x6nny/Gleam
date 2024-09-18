# Gleam
Gleam is a easy to use and powerful ROBLOX datastore!

> [!WARNING]
> This is still in development, which means it is not meant to be used for final projects yet.

# Get it on marketplace!
Take the model from roblox marketplace to use in studio!
https://create.roblox.com/store/asset/118382162264841/Gleam?externalSource=www&assetType=Model

# Features
- Easy to set & get values
- Replicate to client with ease
- Option to disable saving when play-testing in studio

# Server Documentation
## Gleam.new()
This will create a new DataStore Class using the name, scope & template passed.
```lua
local storeOptions = {name = 'UserData', scope = 'scope', saveInStudio = false}
local profileTemplate = {['Gold'] = 0, ['Inventory'] = {['Item1'] = 5}}
local GleamStore = Gleam.new(storeOptions, profileTemplate)
```

## Gleam:GetPlayerProfile()
This will return a players profile when loaded
```lua
local playerProfile = GleamStore:GetPlayerProfile(player : Player)
```

# Server Profile Documentation
> The profile is what GetPlayerProfile() will return.

## Profile:SendUpdate()
This is a replication function which will send a remote to the client updating their data version on the client.
```lua
Profile:SendUpdate('Gold')
Profile:SendUpdate({'Inventory', 'Item1'})
```
## Profile:Release()
This will save the players data and destroy the profile.
```lua
Profile:Release()
```

## Incrementing / inserting new values
There are multiple ways to add or increment values in the players data!
```lua
Profile.Data:Grab({'Gold'}):Set(500) --> Will set the value to exact 500
Profile.Data:Grab({'Gold'}):Increment(500) --> Will add 500 to the current value
Profile.Data:Grab({'Inventory'}):Insert('Sword', 1) --> Will insert ['Sword'] = 1 to the Inventory key if it is a table
Profile.Data:Grab({'Inventory'}):Remove('Sword') --> Will remove ['Sword'] = 1 from the Inventory key if it is a table
```

# Client Documentation

## GleamClientProfile.new()
This will Invoke a RemoteFunction retrieving the players data once the data is loaded (You should only do this once per player on the client)
```lua
local profile = GleamClientProfile.new()
```

## GleamClientProfile:ListenToChange()
This will listen for any changes in the data and call the function you pass through
```lua
profile:ListenToChange({'Gold'}, function(new_value : any)
  print('New Gold: ', new_value)
end)

profile:ListenToChange({'Inventory', 'Item1'}, function(new_value)
  print('New Item1', new_value)
end)
```
