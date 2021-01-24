//Scenario 1
module TestBenchSc1();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd0;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0011;
	fakeAD = 32'h12345678;
	#10 //IRDY = 1;
	fakeAD = 32'h33345633;
	cbe = 4'b1001;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44442222;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	f=1;

  //Secons read
	#10 -> TurnAround;
        IRDY = 1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd0;
	cbe = 4'b0110;
  	#10 -> TurnAround;
        IRDY = 0;
  	#10 oe=0;
  	cbe = 4'b1101;
        #10 cbe = 4'b1111; 
        #10 cbe = 4'b1011;
        #10 cbe = 4'b1110;
  	 f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule

//scenario 2
module TestBenchSc2();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd3;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0110;
	fakeAD = 32'h12345123;
	#10 //IRDY = 1;
	fakeAD = 32'h33337746;
	cbe = 4'b1111;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44442222;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h22334455;
	cbe = 4'b1111;
	f=1;

  //Secons read
	#10 -> TurnAround;
         IRDY = 1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd2;
	cbe = 4'b0110;
  	#10 -> TurnAround; 
        IRDY = 0;
  	#10 oe=0;
  	cbe = 4'b1101;
        #10 cbe = 4'b1111; 
        #10 cbe = 4'b1011;
        #10 cbe = 4'b1111;
  	 f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule

//Scenario 3
module TestBenchSc3();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd0;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10 //IRDY = 1;
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	//#10
	//IRDY = 0; 
	/*fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	//IRDY = 0; 
	fakeAD = 32'h11111111;
	cbe = 4'b1111;*/
	f=1;

  //Secons read
	#10 -> TurnAround;
	IRDY=1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0110;
  	#10 -> TurnAround;
	IRDY=0;
  	#10 oe=0;
  	    cbe=4'b1111;
	#10 cbe=4'b0111;
	   IRDY=1;
	#10 IRDY=0;
	#10 cbe=4'b0011;
	#10 cbe=4'b1101;
  	#10 cbe=4'b1010;
	     f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
  
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule
//Scenario 4
module TestBenchSc4();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd0;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10 //IRDY = 1;
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	#10
	//IRDY = 0; 
	fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	//IRDY = 0; 
	fakeAD = 32'h11111111;
	cbe = 4'b1111;
	f=1;

  //Secons read
	#10 -> TurnAround;
        IRDY = 1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0110;
  	#10 -> TurnAround;
        IRDY = 0;
  	#10 oe=0;
  	cbe = 4'b1111;
        #10 cbe = 4'b1111; 
        #10 cbe = 4'b1111;
        #10 cbe = 4'b1111;
  	 f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule

//Scenario 5
module TestBenchSc5();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd2;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10 //IRDY = 1;
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	//#10
	//IRDY = 0; 
	/*fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	//IRDY = 0; 
	fakeAD = 32'h11111111;
	cbe = 4'b1111;*/
	f=1;

  //Secons read
	#10 -> TurnAround;
	IRDY=1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0110;
  	#10 -> TurnAround;
	IRDY=0;
  	#10 oe=0;
  	    cbe=4'b1111;
	#10 cbe=4'b0111;
	#10 cbe=4'b0011;
	#10 cbe=4'b1101;
  	#10 cbe=4'b1010;
	     f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
  
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule
//Scenario 6
module TestBenchSc6();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;

initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd5;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	oe=1;
	#10
	IRDY = 0;
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#20
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	#10
	fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	fakeAD = 32'h11111111;
	cbe = 4'b1111;
	f=1;

  //Secons read
	#10 -> TurnAround;
	IRDY = 1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0110;
  	#10 -> TurnAround;
  	IRDY = 0;
	#10 oe=0;
  	#20 //IRDY = 1;
	#20 //IRDY = 0;
  	#20 f=1;	
  	#10 IRDY = 1; 
  	
 end
	always @(TurnAround) begin
	  oe <= 1;
  	fakeAD <= 32'hz;
  
 	end

	ClockGen c (CLK);
 	Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule
//Scenario 7
module TestBenchSc7();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
 
 initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd2;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	
  	oe=1;
	#10
	IRDY = 0;
        
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10 //IRDY = 1;
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#10
	//IRDY = 0; 
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	//#10
	//IRDY = 0; 
	/*fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	//IRDY = 0; 
	fakeAD = 32'h11111111;
	cbe = 4'b1111;*/
	f=1;
 //another write 
	#10 -> TurnAround;
	IRDY=1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0111;	
	#10
	IRDY = 0;
        
	cbe = 4'b0101;
	fakeAD = 32'h00440000;
	#10 //IRDY = 1;
	fakeAD = 32'h66117777;
	cbe = 4'b1101;
	#10
	//IRDY = 0; 
	fakeAD = 32'h88844444;
	cbe = 4'b1100;
	#10
	//IRDY = 0; 
	fakeAD = 32'h22255555;
	cbe = 4'b1001;
	f=1;
  //Secons read
	#10 -> TurnAround;
	IRDY=1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd0;
	cbe = 4'b0110;
  	#10 -> TurnAround;
	IRDY=0;
  	#10 oe=0;
  	    cbe=4'b1111;
	#10 cbe=4'b0111;
	#10 cbe=4'b0011;
	#10 cbe=4'b1101;
  	#10 cbe=4'b1010;
	     f=1;	
  	#10 IRDY = 1;  	
  	
 end

 always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
  
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule

//Scenario 8
module TestBenchSc8();
 wire d, t;
 event TurnAround;
 event Wait;
 reg oe;
 reg Rst;
 reg IRDY ;
 reg f ;
 reg[3:0] cbe;
 wire[31:0] ad;
 reg[31:0] fakeAD;
 assign ad = (oe)? fakeAD : 32'bz;
initial begin
	Rst=0;
        f=1;
	IRDY=1;
	#10
	Rst=1;
  	fakeAD = 32'd0;
  	f = 0;
  //First Write
	cbe = 4'b0111;	
  	oe=1;
	#10
	IRDY = 0;
	cbe = 4'b0111;
	fakeAD = 32'h22222222;
	#10
	fakeAD = 32'h33333333;
	cbe = 4'b1001;
	#10
	fakeAD = 32'h44444444;
	cbe = 4'b1100;
	#10
	fakeAD = 32'h55555555;
	cbe = 4'b1111;
	#10
	fakeAD = 32'h66666666;
	cbe = 4'b1111;
	#20
	fakeAD = 32'h11111111;
	cbe = 4'b1111;
	f=1;

  //Secons read
	#10 -> TurnAround;
	IRDY = 1;
	#10
	f = 0;	
        oe = 1;	
        fakeAD = 32'd1;
	cbe = 4'b0110;
  	#10 -> TurnAround;
  	IRDY = 0;
	#10 oe=0;
  	#20 IRDY = 1;
	#20 IRDY = 0;
  	#20 f=1;	
  	#10 IRDY = 1; 
  	
 end
always @(TurnAround) begin
  oe <= 1;
  fakeAD <= 32'hz;
  
 end

ClockGen c (CLK);

 //ClockGen c (CLK);
 Target C (.DEVSEL(d), .Clk(CLK), .Frame(f), .CBE(cbe), .TRDY(t), .AddressDataLine(ad), .oe(oe), .IRDY(IRDY),.Rst(Rst));
endmodule


