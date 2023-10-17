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
  { "selling", "gold", "google" },
  { "gold", "account", "nost" },
  { "mooo" },
}

local prepare = function(msg)
  msg = string.gsub(msg, "[^A-Za-z0-9]", "")
  return msg
end

local _ChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event)
  if events[event] and arg2 and arg1 then
    msg = prepare(arg1)

    -- Can't block all moo's because of "moonfire" and alike.
    -- So only filter every message that ends with a "moo".
    if string.find(string.lower(msg), "moo$") then return end

    for _, data in pairs(blocks) do
      local matched = true

      for _, str in pairs(data) do
        if not strfind(string.lower(msg), string.lower(str)) then
          matched = false
        end
      end

      if matched == true then
        if SPAM == true then
          arg1 = "|cff33ffcc[SPAM] |r"..arg1
        else
          return true
        end
      end
    end
  end

  _ChatFrame_OnEvent(event)
end
