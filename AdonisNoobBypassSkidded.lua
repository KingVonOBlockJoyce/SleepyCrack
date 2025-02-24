local DTC;
                for Index, Value in next, getgc(true) do
                    if type(Value) == "table" then
                        local Detected = rawget(Value, "Detected");
                        local Kill = rawget(Value, "Kill");
                
                        if type(Detected) == "function" and not DTC then
                            DTC = Detected
                
                            hookfunction(Detected, function(...)
                                return true
                            end);
                        end;
                
                        if rawget(Value, "Variables") and rawget(Value, "Process") and typeof(Kill) == "function" then          
                            hookfunction(Kill, function(...)

                            end)
                        end;
                    end;
                end;
                
                local Old; Old = hookfunction(getrenv().debug.info, newcclosure(function(...)
                    local LevelOrFunc, Info = ...
                    if DTC and LevelOrFunc == DTC then
                        return coroutine.yield(coroutine.running())
                    end
                    return Old(...)
                end));



local GetAdonis = function()
    for i,v in next, getgc(true) do
        if type(v) == "table" then
            local Raw = rawget(v, "Detected")
            if Raw and typeof(Raw) == "function" and getfenv(Raw).script then
                return v
            end
        end
    end
    return nil
end
local Adonis = function()
    if GetAdonis() then
        return GetAdonis()
    end
    return false
end

local AntiAdonis = function()
    local Init = Adonis()
    if Init then
        for _,v in next, Init do
            if type(v) == "function" then
                print(getfenv(v).script.name, debug.info(v, "n"))
                hookfunction(v, coroutine.yield())
            end
        end
    end
    return {{{{{{}}}}}}
end

AntiAdonis()


 if getconnections then 
            local err;
            err = game:GetService("ScriptContext").Error
            for i,v in next, getconnections(err) do 
                v:Disable() 
            end
        end
