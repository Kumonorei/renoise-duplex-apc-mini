--[[----------------------------------------------------------------------------
-- Duplex.APCmini
----------------------------------------------------------------------------]]--

duplex_configurations:insert {

  -- configuration properties
  name = "Gridpie",
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
    GridPie = {
		mappings = {
			grid = {
				group_name = "Slot",
				},
			v_prev = {
				group_name = "Arrow Buttons",
					index = 1,
				},
			v_next = {
				group_name = "Arrow Buttons",
				index = 2,
				},
			h_prev = {
				group_name = "Arrow Buttons",
				index = 3,
				},
			h_next = {
				group_name = "Arrow Buttons",
				index = 4,
				},
			},
        palette = {
			out_of_bounds = {  
				color={0x00,0x00,0x00},   
				text="",  
			},    
			content_active = {  
				color={0xFF,0xFF,0x00},  
				text="■",  
			},
			content_active_current = {
				color={0xFF,0x00,0x00},  
				text="■", 
			},  
			empty_active = {  
				color={0x00,0xFF,0x00},  
				text="■",  
			},  
			empty = {  
				color={0x00,0x00,0x00},  
				text="□"      
			},  
			inactive_content = {  
				color={0xFF,0xFF,0x00},  
				text="□",  
			},
			filled_silent = {
				color={0xFF,0xFF,0x00},
				text="□",
			},  
			content_selected = {
				color={0x00,0xFF,0x00},
				text="■",			
			},
        },
    },
	
	Navigator = {
		mappings = {
			blockpos = {
				group_name = "Scene Launch",
			},
		},
		palette = {
			blockpos_index = {  
				color={0x00,0xFF,0x00},   
				text="■",  
			},    
			blockpos_range = {  
				color={0xFF,0x00,0x00},  
				text="□",  
			},
		},
	},
     
  },
}

