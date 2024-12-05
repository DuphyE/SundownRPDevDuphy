Config = {}
--------------------------------
-- [Date Format]

Config.DateFormat = '%H:%M' -- To change the date format check this website - https://www.lua.org/pil/22.1.html

-- [Staff Groups]

Config.StaffGroups = {
    'god',
    'admin'
}

Config.EnableReportCommand = true
Config.ReportCommand = 'report'

-- [Clear Player Chat]
Config.AllowPlayersToClearTheirChat = true
Config.ClearChatCommand = 'clear'

-- [Staff]
Config.EnableStaffCommand = true
Config.StaffCommand = 'announce'
Config.AllowStaffsToClearEveryonesChat = true
Config.ClearEveryonesChatCommand = 'clearall'

-- [Staff Only Chat]
Config.EnableStaffOnlyCommand = true
Config.StaffOnlyCommand = 'adminchat'

-- [Advertisements]
Config.EnableAdvertisementCommand = true
Config.AdvertisementCommand = 'advert'
Config.AdvertisementPrice = 5
Config.AdvertisementCooldown = 5 -- in minutes

-- [valentine]
Config.EnableValentineCommand = false
Config.ValentineCommand = 'valentine'
Config.ValentineJobName = 'valentine'

-- [Rhodes]
Config.EnableRhodesCommand = false
Config.RhodesCommand = 'rhodes'
Config.RhodesJobName = 'rhodes'

-- [reply]
Config.EnablereplyCommand = true
Config.replyCommand = 'reply'

-- [gossip]
Config.EnablegossipCommand = true
Config.gossipCommand = 'gossip'

-- [auxilio]
Config.EnableauxilioCommand = true
Config.auxilioCommand = 'auxilio'

-- [respuesta]
Config.EnablrespuestaCommand = true
Config.respuestaCommand = 'respuesta'

-- [testigo]
Config.EnabletestigoCommand = true
Config.testigoCommand = 'testigo'

-- [rumor]
Config.EnablerumorCommand = true
Config.rumorCommand = 'rumor'

-- [mp]
Config.EnablempCommand = true
Config.mpCommand = 'mp'

-------------------------
-- EXTRA Webhooks / RANKING
-----------------------
Config.Webhooks = {
    ["chatreport"] = "",
    ["chatooc"] = "",
    ["chatme"] = "",
    ["chatdo"] = "",
    ["chatrumor"] = "",
    ["chatrumoric"] = "",
}
