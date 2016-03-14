`timescale 1ps/1ps

module tb_booth_sha256;
  parameter DELAY = 1;
  parameter NUM_DATA = 6;

  integer counter;
  integer pointer;

  reg activate_0r; wire activate_0a;
  wire data_0r; reg data_0a; reg [7:0] data_0d;
  wire digest_0r; reg digest_0a; wire [255:0] digest_0d;
  reg out_0r; wire out_0a;
  reg initialise;

  Balsa_sha256 (
    .activate_0r(activate_0r), .activate_0a(activate_0a),
    .data_0r(data_0r), .data_0a(data_0a), .data_0d(data_0d),
    .digest_0r(digest_0r), .digest_0a(digest_0a), .digest_0d(digest_0d),
    .out_0r(out_0r), .out_0a(out_0a),
    .initialise(initialise)
  );

  always@(posedge digest_0r) begin
    $display("sha256 : %d", digest_0d);
  end

  // always@(x_0r) begin
  //   if (x_0r) begin
  //     #DELAY x_0d = x_data[counter];
  //   end
  //   #DELAY x_0a = x_0r;
  // end

  // always@(y_0r) begin
  //   if (y_0r) begin
  //     #DELAY y_0d = y_data[counter];
  //   end
  //   #DELAY y_0a = y_0r;
  // end

  // always@(z_0r) begin
  //   #DELAY
  //   z_0a = z_0r;
  //   if (activate_0r && z_0r) begin
  //     counter = counter + 1;
  //     if (counter >= NUM_DATA) begin
  //       $finish;
  //     end
  //   end
  // end

  initial begin
    counter = 0;
    activate_0r = 0;
    data_0a = 0;
    digest_0a = 0;
    out_0r = 0;
    initialise = 1;
    #DELAY initialise = 0;
    #DELAY activate_0r = 1;
  end
endmodule
