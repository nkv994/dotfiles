
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

local external_monitor_present = false

for _, monitor in ipairs(hl.get_monitors()) do
    if monitor.description ~= "Sharp Corporation LQ133M1JW62A" then
        external_monitor_present = true
        break
    end
end

-- Home monitor (Compaq)
hl.monitor({
    output = "HDMI-A-1",
    mode = "1366x768@60.00",
    position = "0x0",
    scale = 1,
})

-- Fujitsu UH-X laptop's screen
-- Laptop's screen is disabled if external monitor display is attached
if external_monitor_present then
    hl.monitor({
        output = "desc:Sharp Corporation LQ133M1JW62A",
        disabled = true,
    })
else
    hl.monitor({
        output = "desc:Sharp Corporation LQ133M1JW62A",
        mode = "1920x1080@60.05",
        position = "1366x0",
        scale = 1.50,
    })
end
-- OR
-- hl.monitor({
--     output = "desc:Sharp Corporation LQ133M1JW62A",
--     mode = "1920x1080@60.05",
--     position = "1366x0",
--     scale = 1.50,
-- })

-- Institute's monitor
-- TBD

-- Fallback rule
hl.monitor({
    output = "",
    mode = "preferred",
    position = "auto",
    scale = "auto",
})


