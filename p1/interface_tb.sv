interface counter_if (input logic clk);
    logic reset;
    logic enable;
    logic up_down;
    logic [3:0] count;
endinterface
