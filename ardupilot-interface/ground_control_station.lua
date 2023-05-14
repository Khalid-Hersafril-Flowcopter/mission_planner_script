GroundControlStation = {}

function GroundControlStation.send_text(self, severity, message)
    assert(type(severity) == "number", string.format("Message needs to be a number instead of %s", type(severity)))
    assert(type(message) == "string", string.format("Message needs to be a string instead of %s", type(message)))
    print(message)
end

function GroundControlStation.new()
    local instance = {}
    setmetatable(instance, self)
    __index = self
    return instance
end