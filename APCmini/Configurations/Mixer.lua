--[[----------------------------------------------------------------------------
-- Duplex.APCtest
----------------------------------------------------------------------------]]--

duplex_configurations:insert {

  -- configuration properties
  name = "Mixer",
  pinned = true,
  
  -- device properties
  device = {
    class_name = "APCmini",
    display_name = "APCmini",
    device_port_in = "APCmini",
    device_port_out = "APCmini",
    control_map = "Controllers/APCmini/Controlmaps/APCmini_Mixer.xml",
    thumbnail = "Controllers/APCmini/APCmini.bmp",
    protocol = DEVICE_PROTOCOL.MIDI,
  },

  applications = {
     Mixer = {
      mappings = {
        levels = {
          group_name = "Track Fader",
        },
        mute = {
          group_name = "Mute",
        },
        solo = {
          group_name = "Solo",
        },
        master = {
          group_name = "Master Fader",
        },
      },
     },
  }
}

