module synchronous_counter(
    input clk,
    input reset,
    input enable,
    input up_down,
    output reg [3:0] count
);

    always @(posedge clk)
        begin
            if (reset)
                count <= 0;
                else begin
                    count <= (enable) ? ((up_down) ? (count + 1) : (count - 1)) : count;
                end
        end

endmodule 
// New file
