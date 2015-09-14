/*
    `gcd16.v'
    Balsa Verilog netlist file
    Created: Fri Jan 10 11:55:03 JST 2014
    By: xaos@kikurage (Linux)
    With net-verilog (balsa-netlist) version: 4.0
    Using technology: aclass/four_b_rb
    Command line : (balsa-netlist -Xaclass gcd16.breeze)

    Using `propagate-globals'
    The design contains the following global nets
		global-signal:  initialise input 1
*/

module ao22 (
  q,
  i0,
  i1,
  i2,
  i3
);
  output q;
  input i0;
  input i1;
  input i2;
  input i3;
  wire [1:0] int_0n;
  OR2 I0 (q, int_0n[0], int_0n[1]);
  AN2 I1 (int_0n[1], i2, i3);
  AN2 I2 (int_0n[0], i0, i1);
endmodule

module mux2 (
  out,
  in0,
  in1,
  sel
);
  output out;
  input in0;
  input in1;
  input sel;
  wire nsel_0n;
  ao22 I0 (out, in0, nsel_0n, in1, sel);
  IV I1 (nsel_0n, sel);
endmodule

module aoi22 (
  q,
  i0,
  i1,
  i2,
  i3
);
  output q;
  input i0;
  input i1;
  input i2;
  input i3;
  wire [1:0] int_0n;
  NR2 I0 (q, int_0n[0], int_0n[1]);
  AN2 I1 (int_0n[1], i2, i3);
  AN2 I2 (int_0n[0], i0, i1);
endmodule

module nmux2 (
  out,
  in0,
  in1,
  sel
);
  output out;
  input in0;
  input in1;
  input sel;
  wire nsel_0n;
  aoi22 I0 (out, in0, nsel_0n, in1, sel);
  IV I1 (nsel_0n, sel);
endmodule

module balsa_fa (
  nStart,
  A,
  B,
  nCVi,
  Ci,
  nCVo,
  Co,
  sum
);
  input nStart;
  input A;
  input B;
  input nCVi;
  input Ci;
  output nCVo;
  output Co;
  output sum;
  wire start;
  wire ha;
  wire cv;
  IV I0 (start, nStart);
  NR2 I1 (cv, nStart, nCVi);
  nmux2 I2 (nCVo, start, cv, ha);
  mux2 I3 (Co, A, Ci, ha);
  EO I4 (ha, A, B);
  EO I5 (sum, ha, Ci);
endmodule

module buf1 (
  z,
  a
);
  output z;
  input a;
  wire na_0n;
  IV I0 (z, na_0n);
  IV I1 (na_0n, a);
endmodule

module BrzBinaryFunc_1_16_16_s11_GreaterThan_s5_f_m13m (
  out_0r, out_0a, out_0d,
  inpA_0r, inpA_0a, inpA_0d,
  inpB_0r, inpB_0a, inpB_0d
);
  input out_0r;
  output out_0a;
  output out_0d;
  output inpA_0r;
  input inpA_0a;
  input [15:0] inpA_0d;
  output inpB_0r;
  input inpB_0a;
  input [15:0] inpB_0d;
  wire [7:0] internal_0n;
  wire start_0n;
  wire nStart_0n;
  wire [16:0] nCv_0n;
  wire [16:0] c_0n;
  wire [15:0] eq_0n;
  wire [15:0] addOut_0n;
  wire [15:0] w_0n;
  wire [15:0] n_0n;
  wire v_0n;
  wire z_0n;
  wire nz_0n;
  wire nxv_0n;
  wire done_0n;
  wire vcc;
  VCC vcc_cell_instance (vcc);
  NR2 I0 (out_0d, z_0n, nxv_0n);
  EO I1 (nxv_0n, v_0n, addOut_0n[15]);
  NR4 I2 (internal_0n[0], addOut_0n[0], addOut_0n[1], addOut_0n[2], addOut_0n[3]);
  NR4 I3 (internal_0n[1], addOut_0n[4], addOut_0n[5], addOut_0n[6], addOut_0n[7]);
  NR4 I4 (internal_0n[2], addOut_0n[8], addOut_0n[9], addOut_0n[10], addOut_0n[11]);
  NR4 I5 (internal_0n[3], addOut_0n[12], addOut_0n[13], addOut_0n[14], addOut_0n[15]);
  AN4 I6 (z_0n, internal_0n[0], internal_0n[1], internal_0n[2], internal_0n[3]);
  NR4 I7 (internal_0n[4], nCv_0n[1], nCv_0n[2], nCv_0n[3], nCv_0n[4]);
  NR4 I8 (internal_0n[5], nCv_0n[5], nCv_0n[6], nCv_0n[7], nCv_0n[8]);
  NR4 I9 (internal_0n[6], nCv_0n[9], nCv_0n[10], nCv_0n[11], nCv_0n[12]);
  NR4 I10 (internal_0n[7], nCv_0n[13], nCv_0n[14], nCv_0n[15], nCv_0n[16]);
  AN4 I11 (done_0n, internal_0n[4], internal_0n[5], internal_0n[6], internal_0n[7]);
  EO I12 (v_0n, c_0n[15], c_0n[16]);
  balsa_fa I13 (nStart_0n, n_0n[0], w_0n[0], nCv_0n[0], c_0n[0], nCv_0n[1], c_0n[1], addOut_0n[0]);
  balsa_fa I14 (nStart_0n, n_0n[1], w_0n[1], nCv_0n[1], c_0n[1], nCv_0n[2], c_0n[2], addOut_0n[1]);
  balsa_fa I15 (nStart_0n, n_0n[2], w_0n[2], nCv_0n[2], c_0n[2], nCv_0n[3], c_0n[3], addOut_0n[2]);
  balsa_fa I16 (nStart_0n, n_0n[3], w_0n[3], nCv_0n[3], c_0n[3], nCv_0n[4], c_0n[4], addOut_0n[3]);
  balsa_fa I17 (nStart_0n, n_0n[4], w_0n[4], nCv_0n[4], c_0n[4], nCv_0n[5], c_0n[5], addOut_0n[4]);
  balsa_fa I18 (nStart_0n, n_0n[5], w_0n[5], nCv_0n[5], c_0n[5], nCv_0n[6], c_0n[6], addOut_0n[5]);
  balsa_fa I19 (nStart_0n, n_0n[6], w_0n[6], nCv_0n[6], c_0n[6], nCv_0n[7], c_0n[7], addOut_0n[6]);
  balsa_fa I20 (nStart_0n, n_0n[7], w_0n[7], nCv_0n[7], c_0n[7], nCv_0n[8], c_0n[8], addOut_0n[7]);
  balsa_fa I21 (nStart_0n, n_0n[8], w_0n[8], nCv_0n[8], c_0n[8], nCv_0n[9], c_0n[9], addOut_0n[8]);
  balsa_fa I22 (nStart_0n, n_0n[9], w_0n[9], nCv_0n[9], c_0n[9], nCv_0n[10], c_0n[10], addOut_0n[9]);
  balsa_fa I23 (nStart_0n, n_0n[10], w_0n[10], nCv_0n[10], c_0n[10], nCv_0n[11], c_0n[11], addOut_0n[10]);
  balsa_fa I24 (nStart_0n, n_0n[11], w_0n[11], nCv_0n[11], c_0n[11], nCv_0n[12], c_0n[12], addOut_0n[11]);
  balsa_fa I25 (nStart_0n, n_0n[12], w_0n[12], nCv_0n[12], c_0n[12], nCv_0n[13], c_0n[13], addOut_0n[12]);
  balsa_fa I26 (nStart_0n, n_0n[13], w_0n[13], nCv_0n[13], c_0n[13], nCv_0n[14], c_0n[14], addOut_0n[13]);
  balsa_fa I27 (nStart_0n, n_0n[14], w_0n[14], nCv_0n[14], c_0n[14], nCv_0n[15], c_0n[15], addOut_0n[14]);
  balsa_fa I28 (nStart_0n, n_0n[15], w_0n[15], nCv_0n[15], c_0n[15], nCv_0n[16], c_0n[16], addOut_0n[15]);
  assign nCv_0n[0] = nStart_0n;
  assign c_0n[0] = vcc;
  IV I31 (nStart_0n, start_0n);
  IV I32 (n_0n[0], inpB_0d[0]);
  IV I33 (n_0n[1], inpB_0d[1]);
  IV I34 (n_0n[2], inpB_0d[2]);
  IV I35 (n_0n[3], inpB_0d[3]);
  IV I36 (n_0n[4], inpB_0d[4]);
  IV I37 (n_0n[5], inpB_0d[5]);
  IV I38 (n_0n[6], inpB_0d[6]);
  IV I39 (n_0n[7], inpB_0d[7]);
  IV I40 (n_0n[8], inpB_0d[8]);
  IV I41 (n_0n[9], inpB_0d[9]);
  IV I42 (n_0n[10], inpB_0d[10]);
  IV I43 (n_0n[11], inpB_0d[11]);
  IV I44 (n_0n[12], inpB_0d[12]);
  IV I45 (n_0n[13], inpB_0d[13]);
  IV I46 (n_0n[14], inpB_0d[14]);
  IV I47 (n_0n[15], inpB_0d[15]);
  assign w_0n[0] = inpA_0d[0];
  assign w_0n[1] = inpA_0d[1];
  assign w_0n[2] = inpA_0d[2];
  assign w_0n[3] = inpA_0d[3];
  assign w_0n[4] = inpA_0d[4];
  assign w_0n[5] = inpA_0d[5];
  assign w_0n[6] = inpA_0d[6];
  assign w_0n[7] = inpA_0d[7];
  assign w_0n[8] = inpA_0d[8];
  assign w_0n[9] = inpA_0d[9];
  assign w_0n[10] = inpA_0d[10];
  assign w_0n[11] = inpA_0d[11];
  assign w_0n[12] = inpA_0d[12];
  assign w_0n[13] = inpA_0d[13];
  assign w_0n[14] = inpA_0d[14];
  assign w_0n[15] = inpA_0d[15];
  assign out_0a = done_0n;
  C2 I65 (start_0n, inpA_0a, inpB_0a);
  assign inpA_0r = out_0r;
  assign inpB_0r = out_0r;
endmodule

module BrzBinaryFunc_1_16_16_s9_NotEquals_s5_fals_m14m (
  out_0r, out_0a, out_0d,
  inpA_0r, inpA_0a, inpA_0d,
  inpB_0r, inpB_0a, inpB_0d
);
  input out_0r;
  output out_0a;
  output out_0d;
  output inpA_0r;
  input inpA_0a;
  input [15:0] inpA_0d;
  output inpB_0r;
  input inpB_0a;
  input [15:0] inpB_0d;
  wire [3:0] internal_0n;
  wire start_0n;
  wire nStart_0n;
  wire [16:0] nCv_0n;
  wire [16:0] c_0n;
  wire [15:0] eq_0n;
  wire [15:0] addOut_0n;
  wire [15:0] w_0n;
  wire [15:0] n_0n;
  wire v_0n;
  wire z_0n;
  wire nz_0n;
  wire nxv_0n;
  wire done_0n;
  NR4 I0 (internal_0n[0], eq_0n[0], eq_0n[1], eq_0n[2], eq_0n[3]);
  NR4 I1 (internal_0n[1], eq_0n[4], eq_0n[5], eq_0n[6], eq_0n[7]);
  NR4 I2 (internal_0n[2], eq_0n[8], eq_0n[9], eq_0n[10], eq_0n[11]);
  NR4 I3 (internal_0n[3], eq_0n[12], eq_0n[13], eq_0n[14], eq_0n[15]);
  ND4 I4 (out_0d, internal_0n[0], internal_0n[1], internal_0n[2], internal_0n[3]);
  EO I5 (eq_0n[0], w_0n[0], n_0n[0]);
  EO I6 (eq_0n[1], w_0n[1], n_0n[1]);
  EO I7 (eq_0n[2], w_0n[2], n_0n[2]);
  EO I8 (eq_0n[3], w_0n[3], n_0n[3]);
  EO I9 (eq_0n[4], w_0n[4], n_0n[4]);
  EO I10 (eq_0n[5], w_0n[5], n_0n[5]);
  EO I11 (eq_0n[6], w_0n[6], n_0n[6]);
  EO I12 (eq_0n[7], w_0n[7], n_0n[7]);
  EO I13 (eq_0n[8], w_0n[8], n_0n[8]);
  EO I14 (eq_0n[9], w_0n[9], n_0n[9]);
  EO I15 (eq_0n[10], w_0n[10], n_0n[10]);
  EO I16 (eq_0n[11], w_0n[11], n_0n[11]);
  EO I17 (eq_0n[12], w_0n[12], n_0n[12]);
  EO I18 (eq_0n[13], w_0n[13], n_0n[13]);
  EO I19 (eq_0n[14], w_0n[14], n_0n[14]);
  EO I20 (eq_0n[15], w_0n[15], n_0n[15]);
  assign done_0n = start_0n;
  assign n_0n[0] = inpB_0d[0];
  assign n_0n[1] = inpB_0d[1];
  assign n_0n[2] = inpB_0d[2];
  assign n_0n[3] = inpB_0d[3];
  assign n_0n[4] = inpB_0d[4];
  assign n_0n[5] = inpB_0d[5];
  assign n_0n[6] = inpB_0d[6];
  assign n_0n[7] = inpB_0d[7];
  assign n_0n[8] = inpB_0d[8];
  assign n_0n[9] = inpB_0d[9];
  assign n_0n[10] = inpB_0d[10];
  assign n_0n[11] = inpB_0d[11];
  assign n_0n[12] = inpB_0d[12];
  assign n_0n[13] = inpB_0d[13];
  assign n_0n[14] = inpB_0d[14];
  assign n_0n[15] = inpB_0d[15];
  assign w_0n[0] = inpA_0d[0];
  assign w_0n[1] = inpA_0d[1];
  assign w_0n[2] = inpA_0d[2];
  assign w_0n[3] = inpA_0d[3];
  assign w_0n[4] = inpA_0d[4];
  assign w_0n[5] = inpA_0d[5];
  assign w_0n[6] = inpA_0d[6];
  assign w_0n[7] = inpA_0d[7];
  assign w_0n[8] = inpA_0d[8];
  assign w_0n[9] = inpA_0d[9];
  assign w_0n[10] = inpA_0d[10];
  assign w_0n[11] = inpA_0d[11];
  assign w_0n[12] = inpA_0d[12];
  assign w_0n[13] = inpA_0d[13];
  assign w_0n[14] = inpA_0d[14];
  assign w_0n[15] = inpA_0d[15];
  assign out_0a = done_0n;
  C2 I55 (start_0n, inpA_0a, inpB_0a);
  assign inpA_0r = out_0r;
  assign inpB_0r = out_0r;
endmodule

module BrzBinaryFunc_16_16_16_s8_Subtract_s5_fals_m15m (
  out_0r, out_0a, out_0d,
  inpA_0r, inpA_0a, inpA_0d,
  inpB_0r, inpB_0a, inpB_0d
);
  input out_0r;
  output out_0a;
  output [15:0] out_0d;
  output inpA_0r;
  input inpA_0a;
  input [15:0] inpA_0d;
  output inpB_0r;
  input inpB_0a;
  input [15:0] inpB_0d;
  wire [3:0] internal_0n;
  wire start_0n;
  wire nStart_0n;
  wire [16:0] nCv_0n;
  wire [16:0] c_0n;
  wire [15:0] eq_0n;
  wire [15:0] addOut_0n;
  wire [15:0] w_0n;
  wire [15:0] n_0n;
  wire v_0n;
  wire z_0n;
  wire nz_0n;
  wire nxv_0n;
  wire done_0n;
  wire vcc;
  VCC vcc_cell_instance (vcc);
  NR4 I0 (internal_0n[0], nCv_0n[1], nCv_0n[2], nCv_0n[3], nCv_0n[4]);
  NR4 I1 (internal_0n[1], nCv_0n[5], nCv_0n[6], nCv_0n[7], nCv_0n[8]);
  NR4 I2 (internal_0n[2], nCv_0n[9], nCv_0n[10], nCv_0n[11], nCv_0n[12]);
  NR4 I3 (internal_0n[3], nCv_0n[13], nCv_0n[14], nCv_0n[15], nCv_0n[16]);
  AN4 I4 (done_0n, internal_0n[0], internal_0n[1], internal_0n[2], internal_0n[3]);
  assign out_0d[0] = addOut_0n[0];
  assign out_0d[1] = addOut_0n[1];
  assign out_0d[2] = addOut_0n[2];
  assign out_0d[3] = addOut_0n[3];
  assign out_0d[4] = addOut_0n[4];
  assign out_0d[5] = addOut_0n[5];
  assign out_0d[6] = addOut_0n[6];
  assign out_0d[7] = addOut_0n[7];
  assign out_0d[8] = addOut_0n[8];
  assign out_0d[9] = addOut_0n[9];
  assign out_0d[10] = addOut_0n[10];
  assign out_0d[11] = addOut_0n[11];
  assign out_0d[12] = addOut_0n[12];
  assign out_0d[13] = addOut_0n[13];
  assign out_0d[14] = addOut_0n[14];
  assign out_0d[15] = addOut_0n[15];
  balsa_fa I21 (nStart_0n, n_0n[0], w_0n[0], nCv_0n[0], c_0n[0], nCv_0n[1], c_0n[1], addOut_0n[0]);
  balsa_fa I22 (nStart_0n, n_0n[1], w_0n[1], nCv_0n[1], c_0n[1], nCv_0n[2], c_0n[2], addOut_0n[1]);
  balsa_fa I23 (nStart_0n, n_0n[2], w_0n[2], nCv_0n[2], c_0n[2], nCv_0n[3], c_0n[3], addOut_0n[2]);
  balsa_fa I24 (nStart_0n, n_0n[3], w_0n[3], nCv_0n[3], c_0n[3], nCv_0n[4], c_0n[4], addOut_0n[3]);
  balsa_fa I25 (nStart_0n, n_0n[4], w_0n[4], nCv_0n[4], c_0n[4], nCv_0n[5], c_0n[5], addOut_0n[4]);
  balsa_fa I26 (nStart_0n, n_0n[5], w_0n[5], nCv_0n[5], c_0n[5], nCv_0n[6], c_0n[6], addOut_0n[5]);
  balsa_fa I27 (nStart_0n, n_0n[6], w_0n[6], nCv_0n[6], c_0n[6], nCv_0n[7], c_0n[7], addOut_0n[6]);
  balsa_fa I28 (nStart_0n, n_0n[7], w_0n[7], nCv_0n[7], c_0n[7], nCv_0n[8], c_0n[8], addOut_0n[7]);
  balsa_fa I29 (nStart_0n, n_0n[8], w_0n[8], nCv_0n[8], c_0n[8], nCv_0n[9], c_0n[9], addOut_0n[8]);
  balsa_fa I30 (nStart_0n, n_0n[9], w_0n[9], nCv_0n[9], c_0n[9], nCv_0n[10], c_0n[10], addOut_0n[9]);
  balsa_fa I31 (nStart_0n, n_0n[10], w_0n[10], nCv_0n[10], c_0n[10], nCv_0n[11], c_0n[11], addOut_0n[10]);
  balsa_fa I32 (nStart_0n, n_0n[11], w_0n[11], nCv_0n[11], c_0n[11], nCv_0n[12], c_0n[12], addOut_0n[11]);
  balsa_fa I33 (nStart_0n, n_0n[12], w_0n[12], nCv_0n[12], c_0n[12], nCv_0n[13], c_0n[13], addOut_0n[12]);
  balsa_fa I34 (nStart_0n, n_0n[13], w_0n[13], nCv_0n[13], c_0n[13], nCv_0n[14], c_0n[14], addOut_0n[13]);
  balsa_fa I35 (nStart_0n, n_0n[14], w_0n[14], nCv_0n[14], c_0n[14], nCv_0n[15], c_0n[15], addOut_0n[14]);
  balsa_fa I36 (nStart_0n, n_0n[15], w_0n[15], nCv_0n[15], c_0n[15], nCv_0n[16], c_0n[16], addOut_0n[15]);
  assign nCv_0n[0] = nStart_0n;
  assign c_0n[0] = vcc;
  IV I39 (nStart_0n, start_0n);
  IV I40 (n_0n[0], inpB_0d[0]);
  IV I41 (n_0n[1], inpB_0d[1]);
  IV I42 (n_0n[2], inpB_0d[2]);
  IV I43 (n_0n[3], inpB_0d[3]);
  IV I44 (n_0n[4], inpB_0d[4]);
  IV I45 (n_0n[5], inpB_0d[5]);
  IV I46 (n_0n[6], inpB_0d[6]);
  IV I47 (n_0n[7], inpB_0d[7]);
  IV I48 (n_0n[8], inpB_0d[8]);
  IV I49 (n_0n[9], inpB_0d[9]);
  IV I50 (n_0n[10], inpB_0d[10]);
  IV I51 (n_0n[11], inpB_0d[11]);
  IV I52 (n_0n[12], inpB_0d[12]);
  IV I53 (n_0n[13], inpB_0d[13]);
  IV I54 (n_0n[14], inpB_0d[14]);
  IV I55 (n_0n[15], inpB_0d[15]);
  assign w_0n[0] = inpA_0d[0];
  assign w_0n[1] = inpA_0d[1];
  assign w_0n[2] = inpA_0d[2];
  assign w_0n[3] = inpA_0d[3];
  assign w_0n[4] = inpA_0d[4];
  assign w_0n[5] = inpA_0d[5];
  assign w_0n[6] = inpA_0d[6];
  assign w_0n[7] = inpA_0d[7];
  assign w_0n[8] = inpA_0d[8];
  assign w_0n[9] = inpA_0d[9];
  assign w_0n[10] = inpA_0d[10];
  assign w_0n[11] = inpA_0d[11];
  assign w_0n[12] = inpA_0d[12];
  assign w_0n[13] = inpA_0d[13];
  assign w_0n[14] = inpA_0d[14];
  assign w_0n[15] = inpA_0d[15];
  assign out_0a = done_0n;
  C2 I73 (start_0n, inpA_0a, inpB_0a);
  assign inpA_0r = out_0r;
  assign inpB_0r = out_0r;
endmodule

module BrzCallMux_16_2 (
  inp_0r, inp_0a, inp_0d,
  inp_1r, inp_1a, inp_1d,
  out_0r, out_0a, out_0d
);
  input inp_0r;
  output inp_0a;
  input [15:0] inp_0d;
  input inp_1r;
  output inp_1a;
  input [15:0] inp_1d;
  output out_0r;
  input out_0a;
  output [15:0] out_0d;
  wire [15:0] muxOut_0n;
  wire select_0n;
  wire nselect_0n;
  wire [1:0] nwaySelect_0n;
  wire [15:0] nwayMuxOut_0n;
  wire [15:0] nwayMuxOut_1n;
  mux2 I0 (out_0d[0], inp_0d[0], inp_1d[0], select_0n);
  mux2 I1 (out_0d[1], inp_0d[1], inp_1d[1], select_0n);
  mux2 I2 (out_0d[2], inp_0d[2], inp_1d[2], select_0n);
  mux2 I3 (out_0d[3], inp_0d[3], inp_1d[3], select_0n);
  mux2 I4 (out_0d[4], inp_0d[4], inp_1d[4], select_0n);
  mux2 I5 (out_0d[5], inp_0d[5], inp_1d[5], select_0n);
  mux2 I6 (out_0d[6], inp_0d[6], inp_1d[6], select_0n);
  mux2 I7 (out_0d[7], inp_0d[7], inp_1d[7], select_0n);
  mux2 I8 (out_0d[8], inp_0d[8], inp_1d[8], select_0n);
  mux2 I9 (out_0d[9], inp_0d[9], inp_1d[9], select_0n);
  mux2 I10 (out_0d[10], inp_0d[10], inp_1d[10], select_0n);
  mux2 I11 (out_0d[11], inp_0d[11], inp_1d[11], select_0n);
  mux2 I12 (out_0d[12], inp_0d[12], inp_1d[12], select_0n);
  mux2 I13 (out_0d[13], inp_0d[13], inp_1d[13], select_0n);
  mux2 I14 (out_0d[14], inp_0d[14], inp_1d[14], select_0n);
  mux2 I15 (out_0d[15], inp_0d[15], inp_1d[15], select_0n);
  mux2 I16 (out_0r, inp_0r, inp_1r, select_0n);
  AN2 I17 (inp_0a, nselect_0n, out_0a);
  AN2 I18 (inp_1a, select_0n, out_0a);
  SRFF I19 (inp_1r, inp_0r, select_0n, nselect_0n);
endmodule

module demux2 (
  i,
  o0,
  o1,
  s
);
  input i;
  output o0;
  output o1;
  input s;
  wire ns_0n;
  AN2 I0 (o1, i, s);
  AN2 I1 (o0, i, ns_0n);
  IV I2 (ns_0n, s);
endmodule

module BrzCase_1_2_s5_0_3b1 (
  inp_0r, inp_0a, inp_0d,
  activateOut_0r, activateOut_0a,
  activateOut_1r, activateOut_1a
);
  input inp_0r;
  output inp_0a;
  input inp_0d;
  output activateOut_0r;
  input activateOut_0a;
  output activateOut_1r;
  input activateOut_1a;
  wire t_0n;
  wire c_0n;
  wire elseAck_0n;
  wire [1:0] int0_0n;
  OR2 I0 (inp_0a, activateOut_0a, activateOut_1a);
  assign int0_0n[0] = c_0n;
  assign int0_0n[1] = t_0n;
  assign activateOut_1r = int0_0n[1];
  assign activateOut_0r = int0_0n[0];
  demux2 I5 (inp_0r, c_0n, t_0n, inp_0d);
endmodule

module telem (
  Ar,
  Aa,
  Br,
  Ba
);
  input Ar;
  output Aa;
  output Br;
  input Ba;
  wire s_0n;
  ACU0D1 I0 (Aa, Ba, Ar);
  IV I1 (s_0n, Aa);
  AN2 I2 (Br, Ar, s_0n);
endmodule

module BrzConcur_2 (
  activate_0r, activate_0a,
  activateOut_0r, activateOut_0a,
  activateOut_1r, activateOut_1a
);
  input activate_0r;
  output activate_0a;
  output activateOut_0r;
  input activateOut_0a;
  output activateOut_1r;
  input activateOut_1a;
  wire [1:0] acks_0n;
  C2 I0 (activate_0a, acks_0n[0], acks_0n[1]);
  telem I1 (activate_0r, acks_0n[0], activateOut_0r, activateOut_0a);
  telem I2 (activate_0r, acks_0n[1], activateOut_1r, activateOut_1a);
endmodule

module BrzFetch_1_s5_false (
  activate_0r, activate_0a,
  inp_0r, inp_0a, inp_0d,
  out_0r, out_0a, out_0d
);
  input activate_0r;
  output activate_0a;
  output inp_0r;
  input inp_0a;
  input inp_0d;
  output out_0r;
  input out_0a;
  output out_0d;
  assign activate_0a = out_0a;
  assign out_0r = inp_0a;
  assign inp_0r = activate_0r;
  assign out_0d = inp_0d;
endmodule

module BrzFetch_16_s5_false (
  activate_0r, activate_0a,
  inp_0r, inp_0a, inp_0d,
  out_0r, out_0a, out_0d
);
  input activate_0r;
  output activate_0a;
  output inp_0r;
  input inp_0a;
  input [15:0] inp_0d;
  output out_0r;
  input out_0a;
  output [15:0] out_0d;
  assign activate_0a = out_0a;
  assign out_0r = inp_0a;
  assign inp_0r = activate_0r;
  assign out_0d[0] = inp_0d[0];
  assign out_0d[1] = inp_0d[1];
  assign out_0d[2] = inp_0d[2];
  assign out_0d[3] = inp_0d[3];
  assign out_0d[4] = inp_0d[4];
  assign out_0d[5] = inp_0d[5];
  assign out_0d[6] = inp_0d[6];
  assign out_0d[7] = inp_0d[7];
  assign out_0d[8] = inp_0d[8];
  assign out_0d[9] = inp_0d[9];
  assign out_0d[10] = inp_0d[10];
  assign out_0d[11] = inp_0d[11];
  assign out_0d[12] = inp_0d[12];
  assign out_0d[13] = inp_0d[13];
  assign out_0d[14] = inp_0d[14];
  assign out_0d[15] = inp_0d[15];
endmodule

module BrzLoop (
  activate_0r, activate_0a,
  activateOut_0r, activateOut_0a
);
  input activate_0r;
  output activate_0a;
  output activateOut_0r;
  input activateOut_0a;
  wire nReq_0n;
  wire gnd;
  GND gnd_cell_instance (gnd);
  IV I0 (nReq_0n, activate_0r);
  NR2 I1 (activateOut_0r, nReq_0n, activateOut_0a);
  assign activate_0a = gnd;
endmodule

module selem (
  Ar,
  Aa,
  Br,
  Ba
);
  input Ar;
  output Aa;
  output Br;
  input Ba;
  wire s_0n;
  NC2P I0 (s_0n, Ar, Ba);
  NR2 I1 (Aa, Ba, s_0n);
  AN2 I2 (Br, Ar, s_0n);
endmodule

module BrzSequence_2_s1_S (
  activate_0r, activate_0a,
  activateOut_0r, activateOut_0a,
  activateOut_1r, activateOut_1a
);
  input activate_0r;
  output activate_0a;
  output activateOut_0r;
  input activateOut_0a;
  output activateOut_1r;
  input activateOut_1a;
  wire [1:0] sreq_0n;
  assign activate_0a = activateOut_1a;
  assign activateOut_1r = sreq_0n[1];
  assign sreq_0n[0] = activate_0r;
  selem I3 (sreq_0n[0], sreq_0n[1], activateOut_0r, activateOut_0a);
endmodule

module telemr (
  Ar,
  Aa,
  Br,
  Ba,
  initialise
);
  input Ar;
  output Aa;
  output Br;
  input Ba;
  input initialise;
  wire s;
  AN2 I0 (Br, Ar, s);
  IV I1 (s, Aa);
  C2R I2 (Aa, Ba, Ar, initialise);
endmodule

module BrzSequence_3_s2_ST (
  activate_0r, activate_0a,
  activateOut_0r, activateOut_0a,
  activateOut_1r, activateOut_1a,
  activateOut_2r, activateOut_2a,
  initialise
);
  input activate_0r;
  output activate_0a;
  output activateOut_0r;
  input activateOut_0a;
  output activateOut_1r;
  input activateOut_1a;
  output activateOut_2r;
  input activateOut_2a;
  input initialise;
  wire [2:0] sreq_0n;
  assign activate_0a = activateOut_2a;
  assign activateOut_2r = sreq_0n[2];
  assign sreq_0n[0] = activate_0r;
  telemr I3 (sreq_0n[1], sreq_0n[2], activateOut_1r, activateOut_1a, initialise);
  selem I4 (sreq_0n[0], sreq_0n[1], activateOut_0r, activateOut_0a);
endmodule

module BrzVariable_1_1_s0_ (
  write_0r, write_0a, write_0d,
  read_0r, read_0a, read_0d
);
  input write_0r;
  output write_0a;
  input write_0d;
  input read_0r;
  output read_0a;
  output read_0d;
  wire data_0n;
  wire nWriteReq_0n;
  wire bWriteReq_0n;
  wire nbWriteReq_0n;
  assign read_0a = read_0r;
  assign read_0d = data_0n;
  LD1 I2 (write_0d, bWriteReq_0n, data_0n);
  IV I3 (write_0a, nbWriteReq_0n);
  IV I4 (nbWriteReq_0n, bWriteReq_0n);
  IV I5 (bWriteReq_0n, nWriteReq_0n);
  IV I6 (nWriteReq_0n, write_0r);
endmodule

module BrzVariable_16_1_s0_ (
  write_0r, write_0a, write_0d,
  read_0r, read_0a, read_0d
);
  input write_0r;
  output write_0a;
  input [15:0] write_0d;
  input read_0r;
  output read_0a;
  output [15:0] read_0d;
  wire [15:0] data_0n;
  wire nWriteReq_0n;
  wire bWriteReq_0n;
  wire nbWriteReq_0n;
  assign read_0a = read_0r;
  assign read_0d[0] = data_0n[0];
  assign read_0d[1] = data_0n[1];
  assign read_0d[2] = data_0n[2];
  assign read_0d[3] = data_0n[3];
  assign read_0d[4] = data_0n[4];
  assign read_0d[5] = data_0n[5];
  assign read_0d[6] = data_0n[6];
  assign read_0d[7] = data_0n[7];
  assign read_0d[8] = data_0n[8];
  assign read_0d[9] = data_0n[9];
  assign read_0d[10] = data_0n[10];
  assign read_0d[11] = data_0n[11];
  assign read_0d[12] = data_0n[12];
  assign read_0d[13] = data_0n[13];
  assign read_0d[14] = data_0n[14];
  assign read_0d[15] = data_0n[15];
  LD1 I17 (write_0d[0], bWriteReq_0n, data_0n[0]);
  LD1 I18 (write_0d[1], bWriteReq_0n, data_0n[1]);
  LD1 I19 (write_0d[2], bWriteReq_0n, data_0n[2]);
  LD1 I20 (write_0d[3], bWriteReq_0n, data_0n[3]);
  LD1 I21 (write_0d[4], bWriteReq_0n, data_0n[4]);
  LD1 I22 (write_0d[5], bWriteReq_0n, data_0n[5]);
  LD1 I23 (write_0d[6], bWriteReq_0n, data_0n[6]);
  LD1 I24 (write_0d[7], bWriteReq_0n, data_0n[7]);
  LD1 I25 (write_0d[8], bWriteReq_0n, data_0n[8]);
  LD1 I26 (write_0d[9], bWriteReq_0n, data_0n[9]);
  LD1 I27 (write_0d[10], bWriteReq_0n, data_0n[10]);
  LD1 I28 (write_0d[11], bWriteReq_0n, data_0n[11]);
  LD1 I29 (write_0d[12], bWriteReq_0n, data_0n[12]);
  LD1 I30 (write_0d[13], bWriteReq_0n, data_0n[13]);
  LD1 I31 (write_0d[14], bWriteReq_0n, data_0n[14]);
  LD1 I32 (write_0d[15], bWriteReq_0n, data_0n[15]);
  IV I33 (write_0a, nbWriteReq_0n);
  IV I34 (nbWriteReq_0n, bWriteReq_0n);
  IV I35 (bWriteReq_0n, nWriteReq_0n);
  IV I36 (nWriteReq_0n, write_0r);
endmodule

module BrzVariable_16_4_s0_ (
  write_0r, write_0a, write_0d,
  read_0r, read_0a, read_0d,
  read_1r, read_1a, read_1d,
  read_2r, read_2a, read_2d,
  read_3r, read_3a, read_3d
);
  input write_0r;
  output write_0a;
  input [15:0] write_0d;
  input read_0r;
  output read_0a;
  output [15:0] read_0d;
  input read_1r;
  output read_1a;
  output [15:0] read_1d;
  input read_2r;
  output read_2a;
  output [15:0] read_2d;
  input read_3r;
  output read_3a;
  output [15:0] read_3d;
  wire [15:0] data_0n;
  wire nWriteReq_0n;
  wire bWriteReq_0n;
  wire nbWriteReq_0n;
  assign read_0a = read_0r;
  assign read_1a = read_1r;
  assign read_2a = read_2r;
  assign read_3a = read_3r;
  assign read_3d[0] = data_0n[0];
  assign read_3d[1] = data_0n[1];
  assign read_3d[2] = data_0n[2];
  assign read_3d[3] = data_0n[3];
  assign read_3d[4] = data_0n[4];
  assign read_3d[5] = data_0n[5];
  assign read_3d[6] = data_0n[6];
  assign read_3d[7] = data_0n[7];
  assign read_3d[8] = data_0n[8];
  assign read_3d[9] = data_0n[9];
  assign read_3d[10] = data_0n[10];
  assign read_3d[11] = data_0n[11];
  assign read_3d[12] = data_0n[12];
  assign read_3d[13] = data_0n[13];
  assign read_3d[14] = data_0n[14];
  assign read_3d[15] = data_0n[15];
  assign read_2d[0] = data_0n[0];
  assign read_2d[1] = data_0n[1];
  assign read_2d[2] = data_0n[2];
  assign read_2d[3] = data_0n[3];
  assign read_2d[4] = data_0n[4];
  assign read_2d[5] = data_0n[5];
  assign read_2d[6] = data_0n[6];
  assign read_2d[7] = data_0n[7];
  assign read_2d[8] = data_0n[8];
  assign read_2d[9] = data_0n[9];
  assign read_2d[10] = data_0n[10];
  assign read_2d[11] = data_0n[11];
  assign read_2d[12] = data_0n[12];
  assign read_2d[13] = data_0n[13];
  assign read_2d[14] = data_0n[14];
  assign read_2d[15] = data_0n[15];
  assign read_1d[0] = data_0n[0];
  assign read_1d[1] = data_0n[1];
  assign read_1d[2] = data_0n[2];
  assign read_1d[3] = data_0n[3];
  assign read_1d[4] = data_0n[4];
  assign read_1d[5] = data_0n[5];
  assign read_1d[6] = data_0n[6];
  assign read_1d[7] = data_0n[7];
  assign read_1d[8] = data_0n[8];
  assign read_1d[9] = data_0n[9];
  assign read_1d[10] = data_0n[10];
  assign read_1d[11] = data_0n[11];
  assign read_1d[12] = data_0n[12];
  assign read_1d[13] = data_0n[13];
  assign read_1d[14] = data_0n[14];
  assign read_1d[15] = data_0n[15];
  assign read_0d[0] = data_0n[0];
  assign read_0d[1] = data_0n[1];
  assign read_0d[2] = data_0n[2];
  assign read_0d[3] = data_0n[3];
  assign read_0d[4] = data_0n[4];
  assign read_0d[5] = data_0n[5];
  assign read_0d[6] = data_0n[6];
  assign read_0d[7] = data_0n[7];
  assign read_0d[8] = data_0n[8];
  assign read_0d[9] = data_0n[9];
  assign read_0d[10] = data_0n[10];
  assign read_0d[11] = data_0n[11];
  assign read_0d[12] = data_0n[12];
  assign read_0d[13] = data_0n[13];
  assign read_0d[14] = data_0n[14];
  assign read_0d[15] = data_0n[15];
  LD1 I68 (write_0d[0], bWriteReq_0n, data_0n[0]);
  LD1 I69 (write_0d[1], bWriteReq_0n, data_0n[1]);
  LD1 I70 (write_0d[2], bWriteReq_0n, data_0n[2]);
  LD1 I71 (write_0d[3], bWriteReq_0n, data_0n[3]);
  LD1 I72 (write_0d[4], bWriteReq_0n, data_0n[4]);
  LD1 I73 (write_0d[5], bWriteReq_0n, data_0n[5]);
  LD1 I74 (write_0d[6], bWriteReq_0n, data_0n[6]);
  LD1 I75 (write_0d[7], bWriteReq_0n, data_0n[7]);
  LD1 I76 (write_0d[8], bWriteReq_0n, data_0n[8]);
  LD1 I77 (write_0d[9], bWriteReq_0n, data_0n[9]);
  LD1 I78 (write_0d[10], bWriteReq_0n, data_0n[10]);
  LD1 I79 (write_0d[11], bWriteReq_0n, data_0n[11]);
  LD1 I80 (write_0d[12], bWriteReq_0n, data_0n[12]);
  LD1 I81 (write_0d[13], bWriteReq_0n, data_0n[13]);
  LD1 I82 (write_0d[14], bWriteReq_0n, data_0n[14]);
  LD1 I83 (write_0d[15], bWriteReq_0n, data_0n[15]);
  IV I84 (write_0a, nbWriteReq_0n);
  IV I85 (nbWriteReq_0n, bWriteReq_0n);
  IV I86 (bWriteReq_0n, nWriteReq_0n);
  IV I87 (nWriteReq_0n, write_0r);
endmodule

module BrzVariable_16_5_s0_ (
  write_0r, write_0a, write_0d,
  read_0r, read_0a, read_0d,
  read_1r, read_1a, read_1d,
  read_2r, read_2a, read_2d,
  read_3r, read_3a, read_3d,
  read_4r, read_4a, read_4d
);
  input write_0r;
  output write_0a;
  input [15:0] write_0d;
  input read_0r;
  output read_0a;
  output [15:0] read_0d;
  input read_1r;
  output read_1a;
  output [15:0] read_1d;
  input read_2r;
  output read_2a;
  output [15:0] read_2d;
  input read_3r;
  output read_3a;
  output [15:0] read_3d;
  input read_4r;
  output read_4a;
  output [15:0] read_4d;
  wire [15:0] data_0n;
  wire nWriteReq_0n;
  wire bWriteReq_0n;
  wire nbWriteReq_0n;
  assign read_0a = read_0r;
  assign read_1a = read_1r;
  assign read_2a = read_2r;
  assign read_3a = read_3r;
  assign read_4a = read_4r;
  assign read_4d[0] = data_0n[0];
  assign read_4d[1] = data_0n[1];
  assign read_4d[2] = data_0n[2];
  assign read_4d[3] = data_0n[3];
  assign read_4d[4] = data_0n[4];
  assign read_4d[5] = data_0n[5];
  assign read_4d[6] = data_0n[6];
  assign read_4d[7] = data_0n[7];
  assign read_4d[8] = data_0n[8];
  assign read_4d[9] = data_0n[9];
  assign read_4d[10] = data_0n[10];
  assign read_4d[11] = data_0n[11];
  assign read_4d[12] = data_0n[12];
  assign read_4d[13] = data_0n[13];
  assign read_4d[14] = data_0n[14];
  assign read_4d[15] = data_0n[15];
  assign read_3d[0] = data_0n[0];
  assign read_3d[1] = data_0n[1];
  assign read_3d[2] = data_0n[2];
  assign read_3d[3] = data_0n[3];
  assign read_3d[4] = data_0n[4];
  assign read_3d[5] = data_0n[5];
  assign read_3d[6] = data_0n[6];
  assign read_3d[7] = data_0n[7];
  assign read_3d[8] = data_0n[8];
  assign read_3d[9] = data_0n[9];
  assign read_3d[10] = data_0n[10];
  assign read_3d[11] = data_0n[11];
  assign read_3d[12] = data_0n[12];
  assign read_3d[13] = data_0n[13];
  assign read_3d[14] = data_0n[14];
  assign read_3d[15] = data_0n[15];
  assign read_2d[0] = data_0n[0];
  assign read_2d[1] = data_0n[1];
  assign read_2d[2] = data_0n[2];
  assign read_2d[3] = data_0n[3];
  assign read_2d[4] = data_0n[4];
  assign read_2d[5] = data_0n[5];
  assign read_2d[6] = data_0n[6];
  assign read_2d[7] = data_0n[7];
  assign read_2d[8] = data_0n[8];
  assign read_2d[9] = data_0n[9];
  assign read_2d[10] = data_0n[10];
  assign read_2d[11] = data_0n[11];
  assign read_2d[12] = data_0n[12];
  assign read_2d[13] = data_0n[13];
  assign read_2d[14] = data_0n[14];
  assign read_2d[15] = data_0n[15];
  assign read_1d[0] = data_0n[0];
  assign read_1d[1] = data_0n[1];
  assign read_1d[2] = data_0n[2];
  assign read_1d[3] = data_0n[3];
  assign read_1d[4] = data_0n[4];
  assign read_1d[5] = data_0n[5];
  assign read_1d[6] = data_0n[6];
  assign read_1d[7] = data_0n[7];
  assign read_1d[8] = data_0n[8];
  assign read_1d[9] = data_0n[9];
  assign read_1d[10] = data_0n[10];
  assign read_1d[11] = data_0n[11];
  assign read_1d[12] = data_0n[12];
  assign read_1d[13] = data_0n[13];
  assign read_1d[14] = data_0n[14];
  assign read_1d[15] = data_0n[15];
  assign read_0d[0] = data_0n[0];
  assign read_0d[1] = data_0n[1];
  assign read_0d[2] = data_0n[2];
  assign read_0d[3] = data_0n[3];
  assign read_0d[4] = data_0n[4];
  assign read_0d[5] = data_0n[5];
  assign read_0d[6] = data_0n[6];
  assign read_0d[7] = data_0n[7];
  assign read_0d[8] = data_0n[8];
  assign read_0d[9] = data_0n[9];
  assign read_0d[10] = data_0n[10];
  assign read_0d[11] = data_0n[11];
  assign read_0d[12] = data_0n[12];
  assign read_0d[13] = data_0n[13];
  assign read_0d[14] = data_0n[14];
  assign read_0d[15] = data_0n[15];
  LD1 I85 (write_0d[0], bWriteReq_0n, data_0n[0]);
  LD1 I86 (write_0d[1], bWriteReq_0n, data_0n[1]);
  LD1 I87 (write_0d[2], bWriteReq_0n, data_0n[2]);
  LD1 I88 (write_0d[3], bWriteReq_0n, data_0n[3]);
  LD1 I89 (write_0d[4], bWriteReq_0n, data_0n[4]);
  LD1 I90 (write_0d[5], bWriteReq_0n, data_0n[5]);
  LD1 I91 (write_0d[6], bWriteReq_0n, data_0n[6]);
  LD1 I92 (write_0d[7], bWriteReq_0n, data_0n[7]);
  LD1 I93 (write_0d[8], bWriteReq_0n, data_0n[8]);
  LD1 I94 (write_0d[9], bWriteReq_0n, data_0n[9]);
  LD1 I95 (write_0d[10], bWriteReq_0n, data_0n[10]);
  LD1 I96 (write_0d[11], bWriteReq_0n, data_0n[11]);
  LD1 I97 (write_0d[12], bWriteReq_0n, data_0n[12]);
  LD1 I98 (write_0d[13], bWriteReq_0n, data_0n[13]);
  LD1 I99 (write_0d[14], bWriteReq_0n, data_0n[14]);
  LD1 I100 (write_0d[15], bWriteReq_0n, data_0n[15]);
  IV I101 (write_0a, nbWriteReq_0n);
  IV I102 (nbWriteReq_0n, bWriteReq_0n);
  IV I103 (bWriteReq_0n, nWriteReq_0n);
  IV I104 (nWriteReq_0n, write_0r);
endmodule

module BrzWhile (
  activate_0r, activate_0a,
  guard_0r, guard_0a, guard_0d,
  activateOut_0r, activateOut_0a
);
  input activate_0r;
  output activate_0a;
  output guard_0r;
  input guard_0a;
  input guard_0d;
  output activateOut_0r;
  input activateOut_0a;
  wire guardReq_0n;
  wire guardAck_0n;
  wire nReq_0n;
  demux2 I0 (guard_0a, activate_0a, guardAck_0n, guard_0d);
  selem I1 (guardReq_0n, activateOut_0r, guard_0r, guardAck_0n);
  IV I2 (nReq_0n, activate_0r);
  NR2 I3 (guardReq_0n, nReq_0n, activateOut_0a);
endmodule

module Balsa_gcd16 (
  activate_0r, activate_0a,
  x_0r, x_0a, x_0d,
  y_0r, y_0a, y_0d,
  z_0r, z_0a, z_0d,
  initialise
);
  input activate_0r;
  output activate_0a;
  output x_0r;
  input x_0a;
  input [15:0] x_0d;
  output y_0r;
  input y_0a;
  input [15:0] y_0d;
  output z_0r;
  input z_0a;
  output [15:0] z_0d;
  input initialise;
  wire c45_r;
  wire c45_a;
  wire [15:0] c45_d;
  wire c44_r;
  wire c44_a;
  wire [15:0] c44_d;
  wire c43_r;
  wire c43_a;
  wire c42_r;
  wire c42_a;
  wire c41_r;
  wire c41_a;
  wire c40_r;
  wire c40_a;
  wire [15:0] c40_d;
  wire c39_r;
  wire c39_a;
  wire c38_r;
  wire c38_a;
  wire [15:0] c38_d;
  wire c37_r;
  wire c37_a;
  wire c36_r;
  wire c36_a;
  wire c36_d;
  wire c35_r;
  wire c35_a;
  wire [15:0] c35_d;
  wire c34_r;
  wire c34_a;
  wire [15:0] c34_d;
  wire c33_r;
  wire c33_a;
  wire c33_d;
  wire c32_r;
  wire c32_a;
  wire c32_d;
  wire c31_r;
  wire c31_a;
  wire c30_r;
  wire c30_a;
  wire c29_r;
  wire c29_a;
  wire c29_d;
  wire c28_r;
  wire c28_a;
  wire c27_r;
  wire c27_a;
  wire c27_d;
  wire c26_r;
  wire c26_a;
  wire [15:0] c26_d;
  wire c25_r;
  wire c25_a;
  wire [15:0] c25_d;
  wire c24_r;
  wire c24_a;
  wire [15:0] c24_d;
  wire c23_r;
  wire c23_a;
  wire [15:0] c23_d;
  wire c22_r;
  wire c22_a;
  wire c21_r;
  wire c21_a;
  wire c20_r;
  wire c20_a;
  wire c19_r;
  wire c19_a;
  wire [15:0] c19_d;
  wire c18_r;
  wire c18_a;
  wire [15:0] c18_d;
  wire c17_r;
  wire c17_a;
  wire [15:0] c17_d;
  wire c16_r;
  wire c16_a;
  wire [15:0] c16_d;
  wire c15_r;
  wire c15_a;
  wire [15:0] c15_d;
  wire c14_r;
  wire c14_a;
  wire [15:0] c14_d;
  wire c13_r;
  wire c13_a;
  wire c12_r;
  wire c12_a;
  wire c11_r;
  wire c11_a;
  wire c10_r;
  wire c10_a;
  wire [15:0] c10_d;
  wire c9_r;
  wire c9_a;
  wire [15:0] c9_d;
  wire c8_r;
  wire c8_a;
  wire [15:0] c8_d;
  wire c7_r;
  wire c7_a;
  wire [15:0] c7_d;
  wire c6_r;
  wire c6_a;
  wire c5_r;
  wire c5_a;
  wire [15:0] c5_d;
  BrzVariable_16_5_s0_ I0 (c45_r, c45_a, c45_d, c35_r, c35_a, c35_d, c17_r, c17_a, c17_d, c7_r, c7_a, c7_d, c26_r, c26_a, c26_d, c5_r, c5_a, c5_d);
  BrzCallMux_16_2 I1 (c19_r, c19_a, c19_d, c40_r, c40_a, c40_d, c45_r, c45_a, c45_d);
  BrzVariable_16_4_s0_ I2 (c44_r, c44_a, c44_d, c34_r, c34_a, c34_d, c16_r, c16_a, c16_d, c8_r, c8_a, c8_d, c25_r, c25_a, c25_d);
  BrzCallMux_16_2 I3 (c10_r, c10_a, c10_d, c38_r, c38_a, c38_d, c44_r, c44_a, c44_d);
  BrzLoop I4 (activate_0r, activate_0a, c43_r, c43_a);
  BrzSequence_3_s2_ST I5 (c43_r, c43_a, c42_r, c42_a, c37_r, c37_a, c6_r, c6_a, initialise);
  BrzConcur_2 I6 (c42_r, c42_a, c41_r, c41_a, c39_r, c39_a);
  BrzFetch_16_s5_false I7 (c41_r, c41_a, x_0r, x_0a, x_0d, c40_r, c40_a, c40_d);
  BrzFetch_16_s5_false I8 (c39_r, c39_a, y_0r, y_0a, y_0d, c38_r, c38_a, c38_d);
  BrzWhile I9 (c37_r, c37_a, c36_r, c36_a, c36_d, c28_r, c28_a);
  BrzBinaryFunc_1_16_16_s9_NotEquals_s5_fals_m14m I10 (c36_r, c36_a, c36_d, c35_r, c35_a, c35_d, c34_r, c34_a, c34_d);
  BrzCase_1_2_s5_0_3b1 I11 (c29_r, c29_a, c29_d, c11_r, c11_a, c20_r, c20_a);
  BrzSequence_2_s1_S I12 (c28_r, c28_a, c30_r, c30_a, c31_r, c31_a);
  BrzFetch_1_s5_false I13 (c30_r, c30_a, c27_r, c27_a, c27_d, c32_r, c32_a, c32_d);
  BrzFetch_1_s5_false I14 (c31_r, c31_a, c33_r, c33_a, c33_d, c29_r, c29_a, c29_d);
  BrzVariable_1_1_s0_ I15 (c32_r, c32_a, c32_d, c33_r, c33_a, c33_d);
  BrzBinaryFunc_1_16_16_s11_GreaterThan_s5_f_m13m I16 (c27_r, c27_a, c27_d, c26_r, c26_a, c26_d, c25_r, c25_a, c25_d);
  BrzSequence_2_s1_S I17 (c20_r, c20_a, c21_r, c21_a, c22_r, c22_a);
  BrzFetch_16_s5_false I18 (c21_r, c21_a, c18_r, c18_a, c18_d, c23_r, c23_a, c23_d);
  BrzFetch_16_s5_false I19 (c22_r, c22_a, c24_r, c24_a, c24_d, c19_r, c19_a, c19_d);
  BrzVariable_16_1_s0_ I20 (c23_r, c23_a, c23_d, c24_r, c24_a, c24_d);
  BrzBinaryFunc_16_16_16_s8_Subtract_s5_fals_m15m I21 (c18_r, c18_a, c18_d, c17_r, c17_a, c17_d, c16_r, c16_a, c16_d);
  BrzSequence_2_s1_S I22 (c11_r, c11_a, c12_r, c12_a, c13_r, c13_a);
  BrzFetch_16_s5_false I23 (c12_r, c12_a, c9_r, c9_a, c9_d, c14_r, c14_a, c14_d);
  BrzFetch_16_s5_false I24 (c13_r, c13_a, c15_r, c15_a, c15_d, c10_r, c10_a, c10_d);
  BrzVariable_16_1_s0_ I25 (c14_r, c14_a, c14_d, c15_r, c15_a, c15_d);
  BrzBinaryFunc_16_16_16_s8_Subtract_s5_fals_m15m I26 (c9_r, c9_a, c9_d, c8_r, c8_a, c8_d, c7_r, c7_a, c7_d);
  BrzFetch_16_s5_false I27 (c6_r, c6_a, c5_r, c5_a, c5_d, z_0r, z_0a, z_0d);
endmodule

