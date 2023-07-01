-- CONFIG --

-- AFK Kick Time Limit (in seconds)
secondsUntilKick = 1800

-- Warn players if 3/4 of the Time Limit ran up
kickWarning = false

-- CODE --

Citizen.CreateThread(function()
	while true do
		Wait(1000)

		playerPed = PlayerPedId()
		if playerPed then
			currentPos = GetEntityCoords(playerPed, true)

			if currentPos == prevPos then
				if time > 0 then
					if kickWarning and time == math.ceil(secondsUntilKick / 4) then
						--TriggerEvent("chatMessage", "Warnung!", {255, 0, 0}, "^1Du wirst in" .. time .. " Sekunden wegen Inaktivität gekickt!")
					end

					time = time - 1
				else
					TriggerServerEvent("kickForBeingAnAFKDouchebag")
				end
			else
				time = secondsUntilKick
			end

			prevPos = currentPos
		end
	end
end)