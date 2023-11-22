// Code your testbench here
// or browse Examples
module tb;
  reg clk;
  reg signed [15:0] x_in,y_in,theta_in;
  wire signed [15:0] sinx,cosx;
  cordicpipe dut(.clk(clk),.x_in(x_in),.y_in(y_in),.theta_in(theta_in),.sinx(sinx),.cosx(cosx));
  always #3 clk=~clk;
  initial 
    begin
      clk='d0;
      drive_values();
      #150
      $finish;
    end
  task drive_values();
    @(negedge clk)
    x_in ='h26DD;
    y_in='h0;
    theta_in= 'b0011001001000100;
    @(negedge clk)
      x_in ='h26DD;
    y_in='h0;
    theta_in= 'd0;
  endtask
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars(0);
    end
endmodule
