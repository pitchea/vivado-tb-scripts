# Vivado Simulation Script
These scripts allow to run the vivado simulator, xsim, from the command line in a single or multiple monitor setup.

## Requirements:
- A linux terminal, [Windows Subsystem Linux (WLS)](https://docs.microsoft.com/en-us/windows/wsl/install-win10) or [cygwin](https://www.cygwin.com/)
- [Xilinx Vivado 2018.3 and Xilinx Software Development Kid (SDK)](https://www.xilinx.com/support/download/index.html/content/xilinx/en/downloadNav/vivado-design-tools/2018-3.html)
   - `vivado` and `xsim` must be executable via a terminal
   - This may require you to add `source /tools/Xilinx/Vivado/2018.3/settings64.sh` to your `~/.bashrc` file. Please note you will need sudo privilages to update this file.
- [GNU Make tool](https://www.gnu.org/software/make/)
- [Xephyr](https://wiki.archlinux.org/title/Xephyr)
- [Openbox](https://wiki.archlinux.org/title/Openbox)
- [obmenu](https://aur.archlinux.org/packages/obmenu/) - may or may not be necessary but it was what was in the [example](https://www.lifewire.com/install-openbox-using-ubuntu-4051832) I followed

## Layout:
```
run.sh                  : single bash script to run the whole simulation
└─── compile.sh         : compiles the rtl and tb code using xvlog, xvlog -sv, xvhdl as needed
└─── elaborate.sh       : elaborates the tb design and creates a snapshot of the design using xelab
└─── simulate.sh        : performs the simulation using xsim
|   └─── waves.tcl      : configures the waves for the simulation
```

## How to use:
1) Run "make" (multiple monitors) or "make run" (single monitor) depending on monitor configuration.
Please refer to "make help" for more details.

## Notes:
Vivado has a multiple monitor issue [AR#72614](https://www.xilinx.com/support/answers/72614.html) which is still present in xsim even after applying the patch of AR#72614.
The issue stems from a "Window must not be zero" issue due to a well documented java [bug](https://bugs.openjdk.java.net/browse/JDK-8204646).
To address this issue with my code and monitor setup, the make file creates a virtual display using Xephyr and Openbox.
Xsim is then forced to open into this virtual display so that it believes there is only one display/monitor.
The simulation executes and runs nominally.


Xilinx References:
- [Vivado 2019.1 java error on start_gui with multiple monitors attached (Ubuntu 18.04)](https://forums.xilinx.com/t5/Design-Entry/Vivado-2019-1-java-error-on-start-gui-with-multiple-monitors/td-p/983998)
- [2018.3 Vivado - Cannot start the Vivado GUI Multiple Display Issue: IllegalArgumentException: Window must not be zero](https://forums.xilinx.com/t5/Design-Entry/2018-3-Vivado-Cannot-start-the-Vivado-GUI-Multiple-Display-Issue/td-p/1055605)
- [Vivado 2018.3 xsim crash on multiple monitors](https://forums.xilinx.com/t5/Simulation-and-Verification/Vivado-2018-3-xsim-crash-on-multiple-monitors/m-p/1248499/) <-- my post

## Copywrite and License
Copyright 2021 Aaron Pitcher

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
