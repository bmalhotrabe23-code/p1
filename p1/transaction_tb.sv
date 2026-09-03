class transaction;
    rand bit enable;
    rand bit up_down;
    rand bit reset;
    bit [3:0] count;
    int case_no;

  /*  constraint reset_c {
        reset dist{0 := 90, 1 := 10};
    }*/

    function new ();
    endfunction

    function void display ();
        $display("succesfully called the transaction");
    endfunction
endclass
