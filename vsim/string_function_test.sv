
import sv_string_pkg::*;
program tb_top;
	initial begin
        automatic string test_str;
        $display("============================");
        test_str="it's a upper test...";
        $display("[%s]-->[%s]",test_str,upper(test_str));
        test_str="IT'S A LOWER TEST...";
        $display("[%s]-->[%s]",test_str,lower(test_str));

        test_str="it's a capitalize test...";
        $display("[%s]-->[%s]",test_str,capitalize(test_str));
        test_str="it's a title test...";
        $display("[%s]-->[%s]",test_str,title(test_str));
        test_str="it's a swapcase TEST...";
        $display("[%s]-->[%s]",test_str,swapcase(test_str));

        test_str="'b1010";
        $display("bin digital test: [%s]-->[%0x]",test_str,atobin(test_str));
        test_str="'h10AE";
        $display("hex digital test: [%s]-->[%0x]",test_str,atohex(test_str));
        test_str="123";
        $display("dec digital test: [%s]-->[%0x]",test_str,atodec(test_str));

        test_str="it's a reverse test...";
        $display("[%s]-->[%s]",test_str,reverse(test_str));

        test_str="  it's a strip test... ";
        $display("[%s]-->[%s]",test_str,strip(test_str));

        test_str="zfill test";
        $display("[%s]-->[%s]",test_str,zfill(test_str,20,"#"));
        
        test_str="it's a split test";
        $display("[%s]-->[%p]",test_str,split(test_str," "));
        
        test_str="it's a replace test";
        $display("[%s]-->[%s]",test_str,replace(test_str," ",","));
        $display("[%s]-->[%s]",test_str,replace(test_str,"test","TEST"));
    end
endprogram
