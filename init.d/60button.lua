function debounce (func)
    local last = 0
    local delay = 50000 -- 50ms * 1000 as tmr.now() has μs resolution

    return function (...)
        local now = tmr.now()
        local delta = now - last
--        if delta < 0 then delta = delta + 2147483647 end; -- proposed because of delta rolling over, https://github.com/hackhitchin/esp8266-co-uk/issues/2
        if delta < delay then return end;

        last = now
        return func(...)
    end
end

function onChange ()
    print('The pin value has changed to '..gpio.read(config.button))
    if  gpio.read(config.button) == 1 then
        gpio.write(config.relay,gpio.LOW)
        gpio.write(config.led,gpio.LOW)
        client:publish(config.topic.publish,'off',0,0)
    else
        gpio.write(config.relay,gpio.HIGH)
        gpio.write(config.led,gpio.HIGH)
        client:publish(config.topic.publish,'on',0,0)
    end
    
end

gpio.mode(config.button, gpio.INT, gpio.PULLUP) -- see https://github.com/hackhitchin/esp8266-co-uk/pull/1
gpio.trig(config.button, 'both', debounce(onChange))