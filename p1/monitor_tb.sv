class monitor;
    transaction tr;
    mailbox #(transaction) mon_to_scbd;
    virtual counter_if vif;

    function new (mailbox #(transaction) mon_to_scbd,virtual counter_if vif);
        this.mon_to_scbd = mon_to_scbd;
        this.vif = vif;
    endfunction

    task run();
        forever begin
            @(posedge vif.clk);
            #1;
            
            tr = new();
            tr.reset = vif.reset;
            tr.enable = vif.enable;
            tr.up_down = vif.up_down;
            tr.count = vif.count;

            mon_to_scbd.put(tr);
        end
    endtask
endclass
