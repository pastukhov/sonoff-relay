if file.exists("config.json") then
    file.open("config.json","r")
    config = sjson.decode(file.read())
    file.close()
    if debug then print(sjson.encode(config)) end
else
    print("Upload config.json!")
end

config.topic = 
{
    subscribe   =   'relay/' .. node.chipid() ..'/set',
    publish     =   'relay/' .. node.chipid(),
    status      =   'relay/' .. node.chipid() .. '/status'
}


gpio.mode(config.relay,gpio.OUTPUT)
gpio.mode(config.led,gpio.OUTPUT)