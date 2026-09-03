class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard sbd;
    mailbox #(transaction) gen_to_drv;
    mailbox #(transaction) mon_to_scbd;
    virtual counter_if vif;
    event test_done;

    function new (virtual counter_if vif,event test_done);

        this.vif = vif;
        gen_to_drv = new();
        mon_to_scbd = new();
        gen = new(gen_to_drv);
        drv = new(gen_to_drv,vif);
        mon = new(mon_to_scbd,vif);
        sbd = new(mon_to_scbd,test_done);
    endfunction

    task run();

        fork 
            gen.run();
            drv.run();
            mon.run();
            sbd.run();
        join_none
    endtask

endclass 


