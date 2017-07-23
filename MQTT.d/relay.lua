return function (data)
    print(data.action)
    if data.action == 'on' then
        gpio.write(config.relay,gpio.HIGH)
        gpio.write(config.led,gpio.HIGH)
    elseif data.action == 'off' then
        gpio.write(config.relay,gpio.LOW)
        gpio.write(config.led,gpio.LOW)
    elseif data.action == 'toggle' then
        if  gpio.read(config.relay) == 1 then
            gpio.write(config.relay,gpio.LOW)
            gpio.write(config.led,gpio.LOW)
        else
            gpio.write(config.relay,gpio.HIGH)
            gpio.write(config.led,gpio.HIGH)
        end
    end
end
