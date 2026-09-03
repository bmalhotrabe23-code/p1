class driver;
    transaction tr;
    mailbox #(transaction) gen_to_drv;
    virtual counter_if vif;

    function new(mailbox #(transaction) gen_to_drv,virtual counter_if vif);
        this.gen_to_drv = gen_to_drv;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            gen_to_drv.get(tr);

            @(negedge vif.clk);

            vif.reset <= tr.reset;
            vif.enable <= tr.enable;
            vif.up_down <= tr.up_down;

        end
    endtask
endclass

        
