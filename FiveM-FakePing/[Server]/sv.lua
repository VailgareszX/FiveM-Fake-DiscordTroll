-- Feel free to modify this script as you want.
-- This script is made by: K3YOM@Github
-- If you have any questions, please contact me on Discord: Kiyomi#9081
-- Please do note that everything is NetEvent Secure. Basically can't be abused by modders so don't worry about it. :D (It is Server=>Client Afterall)

__SimpleConfigurations__ = {
    AcePermissionType = "FiveM-FakePing.Allowist" -- The type of permission system to use. [Steam, Discord, Live, XBL, ForumID, License, License2]
}



function __isAcePermissionsAllowed(source) -- Returns true if the player is allowed to use the permission system.
    if IsPlayerAceAllowed(source, __SimpleConfigurations__['AcePermissionType']) then
        return true
    end
    return false
end


RegisterCommand("fakeping_player", function(source, arg) -- Fake ping a player.
    if __isAcePermissionsAllowed(source) then 
        __target__ = tonumber(arg[1])
        TriggerClientEvent("__fakeDiscordPing__", __target__) -- Fake discord ping. [Server=>Client]
    else 
        print(GetPlayerName(source), 'attempted to run command "fakeping_player" without permission.') -- Logs the player who attempted to run the command.
    end
end)

RegisterCommand("fakecall_player", function(source, arg) -- Fake call a player.
    if __isAcePermissionsAllowed(source) then 
        __target__ = tonumber(arg[1])
        TriggerClientEvent("__fakeDiscordCall__", __target__) -- Fake discord call. [Server=>Client]
    else 
        print(GetPlayerName(source), 'attempted to run command "fakecall_player" without permission.') -- Logs the player who attempted to run the command.
    end
end)