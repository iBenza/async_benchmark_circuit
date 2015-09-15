`timescale 1ps/1ps

module tb_booth_mul8;
  parameter DELAY = 1;
  parameter NUM_DATA = 6;
  parameter [7:0] x_data [0:NUM_DATA-1] = {15, 5, 0, 10, 200, 2};
  parameter [7:0] y_data [0:NUM_DATA-1] = {5, 15, 10, 0, 2, 200};

  integer counter;

  reg activate_0r; wire activate_0a;
  reg x_0a; wire x_0r; reg [7:0] x_0d;
  reg y_0a; wire y_0r; reg [7:0] y_0d;
  reg z_0a; wire z_0r; wire [7:0] z_0d;

  Balsa_booth__mul8 (
    .activate_0r(activate_0r), .activate_0a(activate_0a),
    .x_0a(x_0a), .x_0r(x_0r), .x_0d(x_0d),
    .y_0a(y_0a), .y_0r(y_0r), .y_0d(y_0d),
    .z_0a(z_0a), .z_0r(z_0r), .z_0d(z_0d)
  );

  always@(posedge z_0r) begin
    if (z_0r) begin
      $display("booth_mul(%d, %d) = %d", x_0d, y_0d, z_0d);
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
    if (activate_0r && z_0r) begin
      counter = counter + 1;
      if (counter >= NUM_DATA) begin
        $finish;
      end
    end
  end

  initial begin
    counter = 0;
    x_0a = 0;
    y_0a = 0;
    z_0a = 0;
    activate_0r = 0;
    #DELAY activate_0r = 1;
  end
endmodule
