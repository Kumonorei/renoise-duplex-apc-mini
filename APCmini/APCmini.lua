--[[----------------------------------------------------------------------------
-- Duplex.APCmini
----------------------------------------------------------------------------]]--

--[[

Inheritance: APCmini > MidiDevice > Device

A device-specific class, valid for Akai APC Mini models

--]]


--==============================================================================

class "APCmini" (MidiDevice)

function APCmini:__init(display_name, message_stream, port_in, port_out)

  MidiDevice.__init(self, display_name, message_stream, port_in, port_out)

  -- set device to "mode 1"
  self:send_sysex_message(0x47,0x7F,0x7B,0x60,0x00,0x04,0x41,0x08,0x02,0x01)

  -- define a default colorspace
  self.colorspace = {2, 2, 0}

end

--------------------------------------------------------------------------------

--- override default Device method
-- @see Device.output_boolean

function APCmini:output_boolean(pt,xarg,ui_obj)

  local value = nil

  local color = self:quantize_color(pt.color)
  -- use the local colorspace if it's available
  local colorspace = xarg.colorspace or self.colorspace
  if (colorspace[1]>1) then
    -- clip launch buttons can have multiple colors
    local red = (pt.color[1]==0xff)
    local green = (pt.color[2]==0xff)
    if red and green then
      value = 5 -- yellow
    elseif red then
      value = 3 -- red
    elseif green then
      value = 1 -- green
    else
      value = 0 -- turned off
    end
  else
    -- normal LED buttons are monochrome
    value = (pt.val == true) and xarg.maximum or xarg.minimum
  end

  return value

end



function APCmini:send_note_message(key,velocity,channel)

  if (not self.midi_out or not self.midi_out.is_open) then
    return
  end

  key = math.floor(key)
  velocity = math.floor(velocity)
  
  local message = {nil, key, velocity}
  
  if not channel then
    channel = self.default_midi_channel
  end

    message[1] = 0x8F+channel -- note-on
  
  TRACE(("MidiDevice: %s send MIDI %X %X %X"):format(
    self.port_out, message[1], message[2], message[3]))
    
  if(self.dump_midi)then
    LOG(("MidiDevice: %s send MIDI %X %X %X"):format(
      self.port_out, message[1], message[2], message[3]))
  end

  self.midi_out:send(message) 
end

