# Basic SDC Constraints Template (10ns clock period = 100MHz)
# Clock definition
create_clock -name clk -period 10.0 [get_ports clk]

# Clock uncertainty (jitter + skew)
set_clock_uncertainty 0.5 [get_clocks clk]

# Input/Output delays (relative to clock)
# Note: Use specific port patterns instead of all_inputs/all_outputs to avoid clock port
# If your design has data inputs/outputs, uncomment and customize these constraints:
# set_input_delay -clock clk -max 2.0 [get_ports data_in*]
# set_input_delay -clock clk -min 0.5 [get_ports data_in*]
# set_output_delay -clock clk -max 2.0 [get_ports data_out*]
# set_output_delay -clock clk -min 0.5 [get_ports data_out*]

# False paths (if any)
# set_false_path -from [get_ports reset]

# Multicycle paths (if any)
# set_multicycle_path 2 -from [get_pins reg1/*] -to [get_pins reg2/*]
