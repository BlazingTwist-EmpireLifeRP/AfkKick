RegisterServerEvent("kickForBeingAnAFKDouchebag")
AddEventHandler("kickForBeingAnAFKDouchebag", function()
	DropPlayer(source, "Empire Life AFK System | Du wurdest wegen Inaktivität gekickt!")
end)