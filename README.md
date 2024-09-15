# GleamStore
GleamStore is a easy to use and powerful ROBLOX datastore!

# Features
- Easy to set & get values
- Replicate to client with ease

# Server Documentation
## GleamStore.new()
This will create a new DataStore Class using the name, scope & template passed.
```lua
local storeOptions = {name = 'UserData', scope = 'scope'}
local profileTemplate = {['Gold'] = 0, ['Inventory'] = {['Item1'] = 5}}
local ProfileStore = GleamStore.new(storeOptions, profileTemplate)
```

## GleamStore:GetPlayerProfile()
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
