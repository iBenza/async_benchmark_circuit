`timescale 1ps/1ps

module tb_gcd8;
  parameter DELAY = 1;
  parameter NUM_DATA = 6;
  parameter [7:0] x_data [0:NUM_DATA-1] = {13, 5, 12, 16, 1, 4}; 
  parameter [7:0] y_data [0:NUM_DATA-1] = {5, 13, 16, 12, 4, 1}; 

  integer counter;

  reg activate_0r; wire activate_0a; 
  reg x_0a; wire x_0r; reg [7:0] x_0d;
  reg y_0a; wire y_0r; reg [7:0] y_0d;
  reg z_0a; wire z_0r; wire [7:0] z_0d;
  reg initialise;

  Balsa_gcd8 (
    .activate_0r(activate_0r), .activate_0a(activate_0a),
    .x_0a(x_0a), .x_0r(x_0r), .x_0d(x_0d),
    .y_0a(y_0a), .y_0r(y_0r), .y_0d(y_0d),
    .z_0a(z_0a), .z_0r(z_0r), .z_0d(z_0d),
    .initialise(initialise)
  );  

  always@(posedge z_0r) begin
    if (activate_0r) begin
      $display("gcd(%d, %d) = %d", x_0d, y_0d, z_0d);
    end 
  end 

  always@(x_0r) begin
    if (x_0r) begin
      #DELAY x_0d = x_data[counter];
    end 
    #DELAY x_0a = x_0r;
  end 

  always@(y_0r) begin
    if (y_0r) begin
      #DELAY y_0d = y_data[counter];
    end 
    #DELAY y_0a = y_0r;
  end 

  always@(z_0r) begin
    #DELAY
    z_0a = z_0r;
    if (activate_0r && !z_0r) begin
      counter = counter + 1;
      if (counter >= NUM_DATA) begin
        $finish;
      end 
    end 
  end 

  initial begin
    counter = 0;
    x_0d = 0;
    y_0d = 0;
    x_0a = 0;
    y_0a = 0;
    z_0a = 0;
    activate_0r = 0;
    initialise = 1;
    #DELAY initialise = 0;
    #DELAY activate_0r = 1;
  end 
endmodule
