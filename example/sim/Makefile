# ========================================================================================
#
# File:             Makefile
# Description:      Runs the bash scripts and configures displays
# Author:           Aaron Pitcher (pitchea@mcmaster.ca)
# Date:             07-Jun-2021 03:01:51 PM
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
SHELL:=/bin/bash

all:
	Xephyr :99 -screen 1600x900 &
	DISPLAY=:99 openbox &
	DISPLAY=:99 $(MAKE) . run

run:
	./run.sh

clean:
	rm -rf xsim.dir
	rm -rf .Xil
	rm -f *.jou *.log *.pb *.wdb *.str

help:
	@echo -e ""
	@echo -e "Make Help"
	@echo -e "--------------------------------------------------------------------"
	@echo -e " Command                 Description"
	@echo -e "--------------------------------------------------------------------"
	@echo -e "[~] make                 -> builds the whole project by running "
	@echo -e "                            make all"
	@echo -e "[~] make all             -> builds the whole project"
	@echo -e "[~] make run             -> builds only the IP libraries"
	@echo -e "[~] make clean           -> cleans up the entire repo"
	@echo -e "--------------------------------------------------------------------"
	@echo -e ""
	@echo -e "Instructions to run simulation:"
	@echo -e "--------------------------------------------------------------------"
	@echo -e "Option 1: Multiple monitor Use"
	@echo -e " 1) run make or make all"
	@echo -e "\tNote: this will create a virtual display using Xephyr and"
	@echo -e "\t      Openbox. xsim will then open within the virtual display"
	@echo -e "\tRequirements:"
	@echo -e "\t      i)\tXephyr (https://wiki.archlinux.org/title/Xephyr)"
	@echo -e "\t      ii)\tOpenbox (https://wiki.archlinux.org/title/Openbox)"
	@echo -e "\t      iii)\tobmenu (https://aur.archlinux.org/packages/obmenu/)"
	@echo -e "Option 2: Single Monitor Use"
	@echo -e " 1) run make run"
	@echo -e ""

# ========================================================================================
# EoF
# ========================================================================================