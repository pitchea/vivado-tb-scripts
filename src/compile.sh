#!/bin/bash
# ========================================================================================
#
# File:             run.sh
# Simulator:        Xilinx Vivado Simulator
# Description:      Runs the Xilinx Vivado Simulator and rtl behaviour simulation
# Author:           Aaron Pitcher (pitchea@mcmaster.ca)
# Date:             07-Jun-2021 03:01:41 PM
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

echo                                        | tee -a $log
echo "### xvlog reading in rtl designs ###" | tee -a $log

# load rtl designs

# add you rtl designs here...
# xvlog           -work $snapshot "$rtl/<file_name>.v"  | tee -a $log
# xvlog   -sv     -work $snapshot "$rtl/<file_name.sv"  | tee -a $log
# xvdhl           -work $snapshot "$rtl/<file_name.sv"  | tee -a $log
xvlog   -sv     -work $snapshot "$rtl/multiplier.sv"    | tee -a $log

# load tb designs
echo "xvlog reading in tb designs" | tee -a $log

# add you tb designs here
# xvlog   -sv     -work $snapshot "$tb/tb_<file_name>.sv"              | tee -a $log
xvlog   -sv     -work $snapshot "$tb/tb_multiplier.sv"              | tee -a $log

# ========================================================================================
# EoF
# ========================================================================================