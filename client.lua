-- CONFIG --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1800

-- CODE --

secondsLeft = secondsUntilKick

AddEventHandler("empire_afk:PlayerNotAfk", function()
	secondsLeft = secondsUntilKick
end)

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = PlayerPedId()
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if secondsLeft > 0 then
					secondsLeft = secondsLeft - 1
				else
					TriggerEvent('PlayerKick_SaveState')
					Wait(5000) -- wait 5 seconds so that active scripts can save their state before the player is kicked
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				secondsLeft = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)