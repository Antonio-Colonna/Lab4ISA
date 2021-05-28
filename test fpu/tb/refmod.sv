class refmod extends uvm_component;
    `uvm_component_utils(refmod)
    
    shortreal A_t;
	shortreal B_t;
	shortreal P_t;

    packet_in tr_in;
    packet_out tr_out;
    uvm_get_port #(packet_in) in;
    uvm_put_port #(packet_out) out;

	int ind = 0;
	packet_out tr_out1;
	packet_out tr_out2;
	packet_out tr_out3;
	shortreal P_zero = 0.0;

    function new(string name = "refmod", uvm_component parent);
        super.new(name, parent);
        in = new("in", this);
        out = new("out", this);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        tr_out = packet_out::type_id::create("tr_out", this);
        tr_out1 = packet_out::type_id::create("tr_out1", this);
        tr_out2 = packet_out::type_id::create("tr_out2", this);
        tr_out3 = packet_out::type_id::create("tr_out3", this);
 	endfunction: build_phase
    

    virtual task run_phase(uvm_phase phase);
        super.run_phase(phase);

		forever begin	
			if(ind == 0) begin
				in.get(tr_in);

				A_t = $bitstoshortreal(tr_in.A);
				B_t = $bitstoshortreal(tr_in.B);
				P_t = A_t * B_t;

				tr_out.data = $shortrealtobits(P_zero);
				tr_out1.data = $shortrealtobits(P_t);
				
				ind++;

                $display("refmod: input A = %f, input B = %f, output OUT = %f", A_t, B_t, P_zero);
			    $display("refmod: input A = %b, input B = %b, output OUT = %b",tr_in.A, tr_in.B, tr_out.data);
            	out.put(tr_out);
			end;
			if(ind == 1) begin
				in.get(tr_in);

				A_t = $bitstoshortreal(tr_in.A);
				B_t = $bitstoshortreal(tr_in.B);
				P_t = A_t * B_t;

				tr_out.data = $shortrealtobits(P_zero);
				tr_out2.data = $shortrealtobits(P_t);

				ind++;

                $display("refmod: input A = %f, input B = %f, output OUT = %f", A_t, B_t, P_zero);
			    $display("refmod: input A = %b, input B = %b, output OUT = %b",tr_in.A, tr_in.B, tr_out.data);
            	out.put(tr_out);
			end;
			if(ind == 2) begin
				in.get(tr_in);

				A_t = $bitstoshortreal(tr_in.A);
				B_t = $bitstoshortreal(tr_in.B);
				P_t = A_t * B_t;

				tr_out.data = tr_out1.data;
				tr_out3.data = $shortrealtobits(P_t);


				ind++;

                $display("refmod: input A = %f, input B = %f, output OUT = %f", A_t, B_t, P_t);
			    $display("refmod: input A = %b, input B = %b, output OUT = %b",tr_in.A, tr_in.B, tr_out.data);
            	out.put(tr_out);
			end;
			if(ind == 3) begin
				in.get(tr_in);

				A_t = $bitstoshortreal(tr_in.A);
				B_t = $bitstoshortreal(tr_in.B);
				P_t = A_t * B_t;

				tr_out.data = tr_out2.data;
				tr_out1.data = $shortrealtobits(P_t);

				ind++;

                $display("refmod: input A = %f, input B = %f, output OUT = %f", A_t, B_t, P_t);
			    $display("refmod: input A = %b, input B = %b, output OUT = %b",tr_in.A, tr_in.B, tr_out.data);
            	out.put(tr_out);
			end;
			if(ind == 4) begin
				in.get(tr_in);

				A_t = $bitstoshortreal(tr_in.A);
				B_t = $bitstoshortreal(tr_in.B);
				P_t = A_t * B_t;

				tr_out.data = tr_out3.data;
				tr_out2.data = $shortrealtobits(P_t);
				
				ind = 2;

                $display("refmod: input A = %f, input B = %f, output OUT = %f", A_t, B_t, P_t);
			    $display("refmod: input A = %b, input B = %b, output OUT = %b",tr_in.A, tr_in.B, tr_out.data);
            	out.put(tr_out);
			end;
        end
    endtask: run_phase
endclass: refmod
