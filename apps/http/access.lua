local knightConfig 	   = require "config.knight".run()
local systemConf 	   = require "config.init"
local statsPrefixConf  = systemConf.statsPrefixConf
local statsMatchConf   = systemConf.statsMatchConf

local statsCache 	   = ngx.shared.stats
local statsAllCache    = ngx.shared.statsAll

--ngx.say(statsCache:get(statsPrefixConf.http_success_time))

function dump(o)
    if type(o) == 'table' then
        local s = ''
        for k,v in pairs(o) do
            if type(k) ~= 'number'
            then
                sk = '"'..k..'"'
            else
                sk =  k
            end
            s = s .. ', ' .. '['..sk..'] = ' .. dump(v)
        end
        s = string.sub(s, 3)
        return '{ ' .. s .. '} '
    else
        return tostring(o)
    end
end

-- 过滤nginx无法处理请求

--ngx.say(ngx.var.request_time)