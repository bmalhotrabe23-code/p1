class generator;
    transaction tr;
    mailbox #(transaction) gen_to_drv;
    int case_no = 0;

    function new (mailbox #(transaction) gen_to_drv);
        this.gen_to_drv = gen_to_drv;
    endfunction

    task run();
        // first transaction for reseting count to 0
        tr = new();
        tr.reset = 1;
        tr.enable = 0;
        tr.up_down = 0;
        tr.case_no = case_no++;
        // the rest of 99 cases for verification
        repeat(99) begin
            tr = new();
            assert(tr.randomize() with {
                reset == 0;
            });
            
            tr.case_no = case_no++;         
            gen_to_drv.put(tr);
        end
    endtask
endclass
