class test;
    environment env;
    virtual counter_if vif;
    event test_done;

    function new(virtual counter_if vif);
        this.vif = vif;
        env = new(vif,test_done);
    endfunction

    task run();
        env.run();
        @test_done;

        $display("test completed");
        $finish;
    endtask

endclass

