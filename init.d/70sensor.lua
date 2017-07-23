-- encoder module is needed only for debug output; lines can be removed if no
-- debug output is needed and/or encoder module is missing

t = require("ds18b20")

function readout(temp)
  for addr, temp in pairs(temp) do
    client:publish(config.topic.publish,sjson.encode({ address = encoder.toHex(addr), temp = temp }),0,1)
  end

end

sensor = tmr:create()
sensor:register(1000, tmr.ALARM_AUTO, 
    function()
        t:readTemp(readout, config.sensor)
    end)