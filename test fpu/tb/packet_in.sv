class packet_in extends uvm_sequence_item;
	rand bit[31:0] A;
	rand bit[31:0] B;	

  
    constraint range1 { !(A inside {['b01011111100000000000000000000000:'b01111111111111111111111111111111]});
					    !(B inside {['b01011111100000000000000000000000:'b01111111111111111111111111111111]});}

	constraint range2 { !(A inside {['b11011111100000000000000000000000:'b11111111111111111111111111111111]});
					    !(B inside {['b11011111100000000000000000000000:'b11111111111111111111111111111111]});}

	constraint range3 { !(A inside {['b00000000000000000000000000000000:'b00011111111111111111111111111111]});
					    !(B inside {['b00000000000000000000000000000000:'b00011111111111111111111111111111]});}

	constraint range4 { !(A inside {['b10000000000000000000000000000000:'b10011111111111111111111111111111]});
					    !(B inside {['b10000000000000000000000000000000:'b10011111111111111111111111111111]});}
	
	`uvm_object_utils_begin(packet_in)
		`uvm_field_int(A, UVM_ALL_ON|UVM_HEX)
        `uvm_field_int(B, UVM_ALL_ON|UVM_HEX)
    `uvm_object_utils_end

    function new(string name="packet_in");
        super.new(name);
    endfunction: new
endclass: packet_in


