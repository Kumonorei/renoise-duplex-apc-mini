--[[----------------------------------------------------------------------------
-- Duplex.APCtest
----------------------------------------------------------------------------]]--

duplex_configurations:insert {

  -- configuration properties
  name = "Matrix",
  pinned = true,
  
  -- device properties
  device = {
    class_name = "APCmini",
    display_name = "APCmini",
    device_port_in = "APCmini",
    device_port_out = "APCmini",
    control_map = "Controllers/APCmini/Controlmaps/APCmini_Gridpie.xml",
    thumbnail = "Controllers/APCmini/APCmini.bmp",
    protocol = DEVICE_PROTOCOL.MIDI,
  },

  applications = {
	Mixer = {
		mappings = {
			levels = {
				group_name = "Track Fader",
				},
			master = {
				group_name = "Master Fader",
				},
			},
		},
    Matrix = {
		mappings = {
			matrix = {
				group_name = "Slot",
				},
			triggers = {
				group_name = "Scene Launch",
			},
		},
        palette = {
			out_of_bounds = {  
				color={0x00,0x00,0x00},   
				text="",  
			},    
			trigger_loop = {  
				color={0xFF,0x00,0x00},  
				text="■",  
			},
			trigger_active = {
				color={0xFF,0xFF,0x00},
				text="■",
			},
			empty_active = {  
				color={0x00,0xFF,0x00},  
				text="■",  
			},  
			slot_empty = {  
				color={0x00,0x00,0x00},  
				text="□"      
			},  
			slot_filled = {  
				color={0xFF,0xFF,0x00},  
				text="□",  
			},
			filled_silent = {
				color={0x00,0x00,0x00},
				text="□",
			},  
			content_selected = {
				color={0x00,0xFF,0x00},
				text="■",			
			},
        },


	},
     
  },
}

