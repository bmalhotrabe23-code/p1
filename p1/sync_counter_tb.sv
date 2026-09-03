module tb;

    logic clk;

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    counter_if vif(clk);

    synchronous_counter dut(.clk(vif.clk),
                            .reset(vif.reset),
                            .enable(vif.enable),
                            .up_down(vif.up_down),
                            .count(vif.count)
                            );

    test t;
    initial begin
        t = new(vif);
        t.run();
    end


endmodule 
