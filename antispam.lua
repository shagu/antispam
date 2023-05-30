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

local _ChatFrame_OnEvent = ChatFrame_OnEvent
function ChatFrame_OnEvent(event)
  if events[event] and arg2 and arg1 then
    for _, data in pairs(blocks) do
      local matched = true

      for _, str in pairs(data) do
        if not strfind(string.lower(arg1), string.lower(str)) then
          matched = false
        end
      end

      if matched == true then
        return true
      end
    end
  end

  _ChatFrame_OnEvent(event)
end
