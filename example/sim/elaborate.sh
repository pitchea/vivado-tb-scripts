#!/bin/bash
# ========================================================================================
#
# File:             elaborate.sh
# Simulator:        Xilinx Vivado Simulator
# Description:      Runs the Xilinx Vivado Simulator and rtl behaviour simulation
# Author:           Aaron Pitcher (pitchea@mcmaster.ca)
# Date:             07-Jun-2021 03:01:46 PM
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

LIB=" \
    -L xil_defaultlib \
    -L unisims_ver \
    -L unimacro_ver \
    -L secureip \
    -L xpm
"

OPTS=" \
    --debug all \
    --incr \
    --relax
"

echo                                         | tee -a $log
echo "### xelab elaborating rtl designs ###" | tee -a $log

xelab -top $top $OPTS $LIB --snapshot $snapshot | tee -a $log

# ========================================================================================
# EoF
# ========================================================================================