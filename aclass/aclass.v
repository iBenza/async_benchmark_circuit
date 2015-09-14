//
// `aclass.v'
// Asynchronous class tech. cell description
//
// 2013  Shin'ya Ueoka

`define gate_delay 0.090

// VCC and GND
module VCC (Z);
  output Z;
  supply1 vdd;
  assign Z= vdd;
endmodule

module GND (Z);
  output Z;
  supply0 gnd;
  assign Z = gnd;
endmodule

// Combinational Gates
module AN2(Z,A,B);
  input A,B;
  output Z;
  and #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module AN3(Z,A,B,C);
  input A,B,C;
  output Z;
  and #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module AN4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  and #(`gate_delay, `gate_delay) (Z,A,B,C,D);
endmodule

module OR2(Z,A,B);
  input A,B;
  output Z;
  or #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module OR3(Z,A,B,C);
  input A,B,C;
  output Z;
  or #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module OR4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  or #(`gate_delay, `gate_delay) (Z,A,B,C,D);
endmodule

module IV(Z,A);
  input A;
  output Z;
  not #(`gate_delay, `gate_delay) (Z,A);
endmodule

module ND2(Z,A,B);
  input A,B;
  output Z;
  nand #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module ND3(Z,A,B,C);
  input A,B,C;
  output Z;
  nand #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module ND4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nand #(`gate_delay, `gate_delay) (Z,A,B,C,D);
endmodule

module NR2(Z,A,B);
  input A,B;
  output Z;
  nor #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module NR3(Z,A,B,C);
  input A,B,C;
  output Z;
  nor #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module NR4(Z,A,B,C,D);
  input A,B,C,D;
  output Z;
  nor #(`gate_delay, `gate_delay) (Z,A,B,C,D);
endmodule

module EN(Z,A,B);
  input A,B;
  output Z;
  xnor #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module EN3(Z,A,B,C);
  input A,B,C;
  output Z;
  xnor #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module EO(Z,A,B);
  input A,B;
  output Z;
  xor #(`gate_delay, `gate_delay) (Z,A,B);
endmodule

module EO3(Z,A,B,C);
  input A,B,C;
  output Z;
  xor #(`gate_delay, `gate_delay) (Z,A,B,C);
endmodule

module IBUF1(Z,A);
  output Z;
  input A;
  buf #(`gate_delay, `gate_delay) (Z,A);
endmodule

// Sequencial Gates
module LD1(D, G, Q, QN);
  output Q, QN;
  input D, G;
  p_latch #(`gate_delay, `gate_delay) latch (Q,G,D);
  not (QN,Q);
endmodule

primitive p_latch(q,g,d);
  output q;
  reg q;
  input g,d;
  table
//  g d : present q : next q
    1 0 : ? : 0;
    1 1 : ? : 1;
    0 ? : ? : -;
    x 0 : 0 : 0;
    x 1 : 1 : 1;
  endtable
endprimitive


module C2 (Z, A, B);
  output Z;
  input A, B;
  p_c2 #(`gate_delay, `gate_delay) (Z, A, B);
endmodule

primitive p_c2 (out, in0, in1);
  output out;
  input in0, in1;
  reg out;
  table
  //in0 in1 : out' : out
    0   0   : ?    : 0 ;
    0   ?   : 0    : 0 ;
    ?   0   : 0    : 0 ;
    ?   1   : 1    : 1 ;
    1   ?   : 1    : 1 ;
    1   1   : ?    : 1 ;
    x   x   : x    : x ;
  endtable
endprimitive

module C3 (Z, A, B, C);
  output Z;
  input A, B, C;
  p_c3 #(`gate_delay, `gate_delay) (Z, A, B, C);
endmodule

primitive p_c3 (out, in0, in1, in2);
   output out;
   input in0, in1, in2;
   reg out;
   table
   //in0 in1 in2 : out' :  out
     0   0   0   : ?    :  0 ;
     0   ?   ?   : 0    :  0 ;
     ?   0   ?   : 0    :  0 ;
     ?   ?   0   : 0    :  0 ;
     1   ?   ?   : 1    :  1 ;
     ?   1   ?   : 1    :  1 ;
     ?   ?   1   : 1    :  1 ;
     1   1   1   : ?    :  1 ;
     x   x   x   : x    :  x ;
  endtable
endprimitive

module C2R (Z, A, B, reset);
  output Z;
  input A, B;
  input reset;
  p_c2r #(`gate_delay, `gate_delay) U0 (Z, A, B, reset);
endmodule
        

primitive p_c2r(Q, A, B, reset);
  output Q;
  input A, B, reset;
  reg Q;
  table
  //A B reset : Q' : Q 
    0 0 0     : ?  : 0 ;
    0 ? 0     : 0  : 0 ;
    ? 0 0     : 0  : 0 ;
    ? 1 0     : 1  : 1 ;
    1 ? 0     : 1  : 1 ;
    1 1 0     : ?  : 1 ;
    ? ? 1     : ?  : 0 ;
    x x x     : x  : x ;
endtable

endprimitive
module p_ao22 (q, i0, i1, i2, i3);
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

module p_aoi22 (q, i0, i1, i2, i3);
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

module ACU0D1 (Z, A, B);
  output Z;
  input A, B;
  wire int_0n;
  OR2 I0 (Z, A, int_0n);
  AN2 I1 (int_0n, B, Z);
endmodule

module NC2 (Q, A, B);
  output Q;
  input A, B;
  wire nq_0n;
  p_aoi222 I0 (Q, A, B, A, nq_0n, B, nq_0n);
  IV I1 (nq_0n, Q);
endmodule

module p_aoi222(q, a, b, c, d, e, f);
  output q;
  input a, b, c, d, e, f;
  wire [1:0] internal_0n;
  wire [2:0] int_0n;
  AN2 I0 (q, internal_0n[0], internal_0n[1]);
  IV I1 (internal_0n[1], int_0n[2]);
  NR2 I2 (internal_0n[0], int_0n[0], int_0n[1]);
  AN2 I3 (int_0n[2], e, f);
  AN2 I4 (int_0n[1], c, d);
  AN2 I5 (int_0n[0], a, b);
endmodule

module NC2P (Z, A, B);
  output Z;
  input A, B;
  wire nq_0n;
  p_aoi22 I0 (Z, A, B, A, nq_0n);
  IV I1 (nq_0n, Z);
endmodule

module SRFF (S, R, Q, NQ);
  input S, R;
  output Q, NQ;

  NR2 I0 (NQ, Q, S);
  NR2 O1 (Q, NQ, R);
endmodule

module AC2(Z, A, B);
  input A, B;
  output Z;
  p_ao22 I0 (Z, A, B, A, Z);
endmodule

module AC3U12 (Z, A, B, C);
  output Z;
  input A, B, C;
  wire [1:0] internal_0n;
  wire [1:0] int_0n;
  OR2 I0 (Z, int_0n[0], int_0n[1]);
  AN2 I1 (int_0n[1], A, Z);
  NR2 I2 (int_0n[0], internal_0n[0], internal_0n[1]);
  IV I3 (internal_0n[1], C);
  ND2 I4 (internal_0n[0], A, B);
endmodule 
