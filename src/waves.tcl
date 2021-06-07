# ========================================================================================
#
# File:             waves.tcl
# Simulator:        Xilinx Vivado Simulator
# Description:      Configures the waves shown within the simulation window
# Author:           Aaron Pitcher (pitchea@mcmaster.ca)
# Date:             07-Jun-2021 03:07:14 PM
#
# Copyright 2021 Aaron Pitcher
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
# ========================================================================================
set curr_wave [current_wave_config]

# NOTE: Can be modified to use add_wave, add_wave_group, add_wave_divider,
#       add_wave_virtual_bus, add_wave_marker
# Reference: https://www.xilinx.com/support/documentation/sw_manuals/xilinx2018_3/ug900-
#            vivado-logic-simulation.pdf
if { [string length $curr_wave] == 0 } {
    if { [llength [get_objects]] > 0} {
        add_wave /
        set_property needs_save false [current_wave_config]
    } else {
        send_msg_id Add_Wave-1 WARNING "No top level signals found. Simulator will start without a wave window. If you want to open a wave window go to 'File->New Waveform Configuration' or type 'create_wave_config' in the TCL console."
    }
}

# run simulation for 1 ms (change as needed)
run 1ms

# ========================================================================================
# EoF
# ========================================================================================