local GleamClientProfile = require(<path-to-GleamClientProfile>)

local Profile = GleamClientProfile.new()

Profile:ListenToChange('Gold', function(new_value)
	print('New Gold: ', new_value)
end)