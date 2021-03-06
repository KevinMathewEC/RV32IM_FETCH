module RV32IM_tb();
 reg RESET,clk;
 wire test;
 rv32im_top rv32im(RESET,clk,test);
  initial
  begin
	  clk=1'b0;
	  forever #5 clk=!clk;
  end
  initial
  begin
  force rv32im.rv32im_top.fetch.PC_control.Mem[0]=32'h2081B3;//ADD X3,x1,x2
  force rv32im.rv32im_top.fetch.PC_control.Mem[1]=32'hC18213;// -ADDI x4,x3,12
  force rv32im.rv32im_top.fetch.PC_control.Mem[2]=32'h40328333;// -SUB x6,x5,x3
  force rv32im.rv32im_top.fetch.PC_control.Mem[3]=32'h60F3B3;// -AND x7,x1,x6
  force rv32im.rv32im_top.fetch.PC_control.Mem[4]=32'h945533;// -SRL x10,x8,x9
  force rv32im.rv32im_top.fetch.PC_control.Mem[5]=32'hFE251FE3;// -BNE x10,x2
  force rv32im.rv32im_top.fetch.PC_control.Mem[6]=32'h60F593;// -ANDI x11,x1,0110 
  force rv32im.rv32im_top.fetch.PC_control.Mem[7]=32'h678067;// -JALR x0,x15,6 jump to location 12, x15=6
  force rv32im.rv32im_top.fetch.PC_control.Mem[12]=32'h51B233;// -SLTU x4,x3,x5 -[12]
  
  force rv32im.rv32im_top.register_bank.regfile[1]=-32'd3;
   force rv32im.rv32im_top.register_bank.regfile[2]=32'd8;
   force rv32im.rv32im_top.register_bank.regfile[5]=32'd7;
   force rv32im.rv32im_top.register_bank.regfile[8]=32'd0;
   force rv32im.rv32im_top.register_bank.regfile[9]=32'd1;
   RESET=1'b1;
   #2 RESET=1'b0;
 //  #500 $stop;
end
endmodule
