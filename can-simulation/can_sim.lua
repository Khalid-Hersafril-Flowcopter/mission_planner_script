CANFrame = {}

function CANFrame.new(id, dlc, data)

    local CANFrame_mt =  {__index = CANFrame}

    if data == nil then
       data = CANFrame:create_data(dlc) 
    end

    assert((type(id) == "number"), string.format("ID must be of type number, not %s", type(id)))
    assert(type(dlc) == "number", string.format("DLC must be of type number, not %s", type(dlc)))
    assert((#data == dlc), string.format("Data needs to be %i bytes long. Currently, %i bytes long given", dlc, #data))

    local instance = {
        _id = id,
        _dlc = dlc or 8,
        _data = data or {0, 0, 0, 0, 0, 0, 0, 0}
    }
    setmetatable(instance, CANFrame_mt)
    return instance
end

function CANFrame:id()
    return self._id
end

function CANFrame:data(n)
    return self._data[n]
end

function CANFrame:dlc()
    return self._dlc
end

function CANFrame:create_data(dlc)
    local data = {}
    for i=1, dlc do
        data[i] = 0
    end
    return data
end

local can_frame = CANFrame.new(18, 8)

