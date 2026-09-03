class scoreboard;
    transaction tr;
    mailbox #(transaction) mon_to_scbd;
    bit [3:0] expected_count;
    event test_done;
    int count_checked;
    int case_no;


    function new (mailbox #(transaction) mon_to_scbd,event test_done);
        this.mon_to_scbd = mon_to_scbd;
        this.test_done = test_done;
        count_checked = 0;
        expected_count = 0;
        case_no = 0;
    endfunction

    task run();
        forever begin
            //tr = new();
            mon_to_scbd.get(tr);

            if (tr.reset)
                expected_count = 0;
                else if (tr.enable) begin
                    if (tr.up_down)
                        expected_count = expected_count + 1;
                    else 
                        expected_count = expected_count - 1;
                end

/*            if (expected_count == tr.count) begin
                $display("PASS the verification");
            end
            else begin 
                $display("FAIL the verification");
            end    
*/

             // Compare expected and actual
            if (expected_count == tr.count) begin

                $display("CASE %0d | reset=%0b enable=%0b up_down=%0b | EXPECTED=%0d ACTUAL=%0d | PASS",
                         case_no,
                         tr.reset,
                         tr.enable,
                         tr.up_down,
                         expected_count,
                         tr.count);

            end

            else begin

                $display("CASE %0d | reset=%0b enable=%0b up_down=%0b | EXPECTED=%0d ACTUAL=%0d | FAIL",
                         case_no,
                         tr.reset,
                         tr.enable,
                         tr.up_down,
                         expected_count,
                         tr.count);

            end



                count_checked++;
                case_no++;

                if (count_checked == 100) begin
                    -> test_done;
                end
                
        end
    endtask
endclass
