local debug = false
local msg

local events = {
  ["CHAT_MSG_CHANNEL"] = true,
  ["CHAT_MSG_YELL"] = true,
  ["CHAT_MSG_SAY"] = true,
  ["CHAT_MSG_GUILD"] = true,
  ["CHAT_MSG_WHISPER"] = true,
}

local blocks = {
  { "need", "mana", "com" },
  { "nost", "100", "com" },
  { "mooo" },
}

local prepare = function(msg)
  msg = string.gsub(msg, "[^A-Za-z0-9]", "")
  return msg
end

local debug = function(msg)
  if not debug then return end
  DEFAULT_CHAT_FRAME:AddMessage("|cff33ffccBLOCKED|r"..msg)
end

local _ChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event)
  if events[event] and arg2 and arg1 then
    msg = prepare(arg1)

    for _, data in pairs(blocks) do
      local matched = true

      for _, str in pairs(data) do
        if not strfind(string.lower(msg), string.lower(str)) then
          matched = false
        end
      end

      if matched == true then
        debug(msg)
        return true
      end
    end
  end

  _ChatFrame_OnEvent(event)
end
