# Clock Signal
set_property -dict { PACKAGE_PIN E3   IOSTANDARD LVCMOS33 } [get_ports CLK]
create_clock -period 10.0 -name sys_clk_pin [get_ports CLK]

# Reset Signal
set_property -dict { PACKAGE_PIN C2   IOSTANDARD LVCMOS33 } [get_ports RESET]

# Program Counter Output (PC_OUT[9:0])
set_property -dict { PACKAGE_PIN H17  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[0]}]
set_property -dict { PACKAGE_PIN K15  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[1]}]
set_property -dict { PACKAGE_PIN J15  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[2]}]
set_property -dict { PACKAGE_PIN J16  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[3]}]
set_property -dict { PACKAGE_PIN H14  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[4]}]
set_property -dict { PACKAGE_PIN J14  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[5]}]
set_property -dict { PACKAGE_PIN K16  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[6]}]
set_property -dict { PACKAGE_PIN H15  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[7]}]
set_property -dict { PACKAGE_PIN G15  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[8]}]
set_property -dict { PACKAGE_PIN F15  IOSTANDARD LVCMOS33 } [get_ports {PC_OUT[9]}]

# HALT Signal
set_property -dict { PACKAGE_PIN G14  IOSTANDARD LVCMOS33 } [get_ports HALT]

# Default Pin Configurations
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
