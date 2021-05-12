module Test(
  input         clock,
  input         reset,
  output [15:0] io_data,
  input  [15:0] io_address
);
  wire [7:0] _GEN_1 = 7'h1 == io_address[6:0] ? 8'h1 : 8'h0; // @[Test.scala 14:11]
  wire [7:0] _GEN_2 = 7'h2 == io_address[6:0] ? 8'h2 : _GEN_1; // @[Test.scala 14:11]
  wire [7:0] _GEN_3 = 7'h3 == io_address[6:0] ? 8'h3 : _GEN_2; // @[Test.scala 14:11]
  wire [7:0] _GEN_4 = 7'h4 == io_address[6:0] ? 8'h4 : _GEN_3; // @[Test.scala 14:11]
  wire [7:0] _GEN_5 = 7'h5 == io_address[6:0] ? 8'h5 : _GEN_4; // @[Test.scala 14:11]
  wire [7:0] _GEN_6 = 7'h6 == io_address[6:0] ? 8'h6 : _GEN_5; // @[Test.scala 14:11]
  wire [7:0] _GEN_7 = 7'h7 == io_address[6:0] ? 8'h7 : _GEN_6; // @[Test.scala 14:11]
  wire [7:0] _GEN_8 = 7'h8 == io_address[6:0] ? 8'h8 : _GEN_7; // @[Test.scala 14:11]
  wire [7:0] _GEN_9 = 7'h9 == io_address[6:0] ? 8'h9 : _GEN_8; // @[Test.scala 14:11]
  wire [7:0] _GEN_10 = 7'ha == io_address[6:0] ? 8'h10 : _GEN_9; // @[Test.scala 14:11]
  wire [7:0] _GEN_11 = 7'hb == io_address[6:0] ? 8'h11 : _GEN_10; // @[Test.scala 14:11]
  wire [7:0] _GEN_12 = 7'hc == io_address[6:0] ? 8'h12 : _GEN_11; // @[Test.scala 14:11]
  wire [7:0] _GEN_13 = 7'hd == io_address[6:0] ? 8'h13 : _GEN_12; // @[Test.scala 14:11]
  wire [7:0] _GEN_14 = 7'he == io_address[6:0] ? 8'h14 : _GEN_13; // @[Test.scala 14:11]
  wire [7:0] _GEN_15 = 7'hf == io_address[6:0] ? 8'h15 : _GEN_14; // @[Test.scala 14:11]
  wire [7:0] _GEN_16 = 7'h10 == io_address[6:0] ? 8'h16 : _GEN_15; // @[Test.scala 14:11]
  wire [7:0] _GEN_17 = 7'h11 == io_address[6:0] ? 8'h17 : _GEN_16; // @[Test.scala 14:11]
  wire [7:0] _GEN_18 = 7'h12 == io_address[6:0] ? 8'h18 : _GEN_17; // @[Test.scala 14:11]
  wire [7:0] _GEN_19 = 7'h13 == io_address[6:0] ? 8'h19 : _GEN_18; // @[Test.scala 14:11]
  wire [7:0] _GEN_20 = 7'h14 == io_address[6:0] ? 8'h20 : _GEN_19; // @[Test.scala 14:11]
  wire [7:0] _GEN_21 = 7'h15 == io_address[6:0] ? 8'h21 : _GEN_20; // @[Test.scala 14:11]
  wire [7:0] _GEN_22 = 7'h16 == io_address[6:0] ? 8'h22 : _GEN_21; // @[Test.scala 14:11]
  wire [7:0] _GEN_23 = 7'h17 == io_address[6:0] ? 8'h23 : _GEN_22; // @[Test.scala 14:11]
  wire [7:0] _GEN_24 = 7'h18 == io_address[6:0] ? 8'h24 : _GEN_23; // @[Test.scala 14:11]
  wire [7:0] _GEN_25 = 7'h19 == io_address[6:0] ? 8'h25 : _GEN_24; // @[Test.scala 14:11]
  wire [7:0] _GEN_26 = 7'h1a == io_address[6:0] ? 8'h26 : _GEN_25; // @[Test.scala 14:11]
  wire [7:0] _GEN_27 = 7'h1b == io_address[6:0] ? 8'h27 : _GEN_26; // @[Test.scala 14:11]
  wire [7:0] _GEN_28 = 7'h1c == io_address[6:0] ? 8'h28 : _GEN_27; // @[Test.scala 14:11]
  wire [7:0] _GEN_29 = 7'h1d == io_address[6:0] ? 8'h29 : _GEN_28; // @[Test.scala 14:11]
  wire [7:0] _GEN_30 = 7'h1e == io_address[6:0] ? 8'h30 : _GEN_29; // @[Test.scala 14:11]
  wire [7:0] _GEN_31 = 7'h1f == io_address[6:0] ? 8'h31 : _GEN_30; // @[Test.scala 14:11]
  wire [7:0] _GEN_32 = 7'h20 == io_address[6:0] ? 8'h32 : _GEN_31; // @[Test.scala 14:11]
  wire [7:0] _GEN_33 = 7'h21 == io_address[6:0] ? 8'h33 : _GEN_32; // @[Test.scala 14:11]
  wire [7:0] _GEN_34 = 7'h22 == io_address[6:0] ? 8'h34 : _GEN_33; // @[Test.scala 14:11]
  wire [7:0] _GEN_35 = 7'h23 == io_address[6:0] ? 8'h35 : _GEN_34; // @[Test.scala 14:11]
  wire [7:0] _GEN_36 = 7'h24 == io_address[6:0] ? 8'h36 : _GEN_35; // @[Test.scala 14:11]
  wire [7:0] _GEN_37 = 7'h25 == io_address[6:0] ? 8'h37 : _GEN_36; // @[Test.scala 14:11]
  wire [7:0] _GEN_38 = 7'h26 == io_address[6:0] ? 8'h38 : _GEN_37; // @[Test.scala 14:11]
  wire [7:0] _GEN_39 = 7'h27 == io_address[6:0] ? 8'h39 : _GEN_38; // @[Test.scala 14:11]
  wire [7:0] _GEN_40 = 7'h28 == io_address[6:0] ? 8'h40 : _GEN_39; // @[Test.scala 14:11]
  wire [7:0] _GEN_41 = 7'h29 == io_address[6:0] ? 8'h41 : _GEN_40; // @[Test.scala 14:11]
  wire [7:0] _GEN_42 = 7'h2a == io_address[6:0] ? 8'h42 : _GEN_41; // @[Test.scala 14:11]
  wire [7:0] _GEN_43 = 7'h2b == io_address[6:0] ? 8'h43 : _GEN_42; // @[Test.scala 14:11]
  wire [7:0] _GEN_44 = 7'h2c == io_address[6:0] ? 8'h44 : _GEN_43; // @[Test.scala 14:11]
  wire [7:0] _GEN_45 = 7'h2d == io_address[6:0] ? 8'h45 : _GEN_44; // @[Test.scala 14:11]
  wire [7:0] _GEN_46 = 7'h2e == io_address[6:0] ? 8'h46 : _GEN_45; // @[Test.scala 14:11]
  wire [7:0] _GEN_47 = 7'h2f == io_address[6:0] ? 8'h47 : _GEN_46; // @[Test.scala 14:11]
  wire [7:0] _GEN_48 = 7'h30 == io_address[6:0] ? 8'h48 : _GEN_47; // @[Test.scala 14:11]
  wire [7:0] _GEN_49 = 7'h31 == io_address[6:0] ? 8'h49 : _GEN_48; // @[Test.scala 14:11]
  wire [7:0] _GEN_50 = 7'h32 == io_address[6:0] ? 8'h50 : _GEN_49; // @[Test.scala 14:11]
  wire [7:0] _GEN_51 = 7'h33 == io_address[6:0] ? 8'h51 : _GEN_50; // @[Test.scala 14:11]
  wire [7:0] _GEN_52 = 7'h34 == io_address[6:0] ? 8'h52 : _GEN_51; // @[Test.scala 14:11]
  wire [7:0] _GEN_53 = 7'h35 == io_address[6:0] ? 8'h53 : _GEN_52; // @[Test.scala 14:11]
  wire [7:0] _GEN_54 = 7'h36 == io_address[6:0] ? 8'h54 : _GEN_53; // @[Test.scala 14:11]
  wire [7:0] _GEN_55 = 7'h37 == io_address[6:0] ? 8'h55 : _GEN_54; // @[Test.scala 14:11]
  wire [7:0] _GEN_56 = 7'h38 == io_address[6:0] ? 8'h56 : _GEN_55; // @[Test.scala 14:11]
  wire [7:0] _GEN_57 = 7'h39 == io_address[6:0] ? 8'h57 : _GEN_56; // @[Test.scala 14:11]
  wire [7:0] _GEN_58 = 7'h3a == io_address[6:0] ? 8'h58 : _GEN_57; // @[Test.scala 14:11]
  wire [7:0] _GEN_59 = 7'h3b == io_address[6:0] ? 8'h59 : _GEN_58; // @[Test.scala 14:11]
  wire [7:0] _GEN_60 = 7'h3c == io_address[6:0] ? 8'h60 : _GEN_59; // @[Test.scala 14:11]
  wire [7:0] _GEN_61 = 7'h3d == io_address[6:0] ? 8'h61 : _GEN_60; // @[Test.scala 14:11]
  wire [7:0] _GEN_62 = 7'h3e == io_address[6:0] ? 8'h62 : _GEN_61; // @[Test.scala 14:11]
  wire [7:0] _GEN_63 = 7'h3f == io_address[6:0] ? 8'h63 : _GEN_62; // @[Test.scala 14:11]
  wire [7:0] _GEN_64 = 7'h40 == io_address[6:0] ? 8'h64 : _GEN_63; // @[Test.scala 14:11]
  wire [7:0] _GEN_65 = 7'h41 == io_address[6:0] ? 8'h65 : _GEN_64; // @[Test.scala 14:11]
  wire [7:0] _GEN_66 = 7'h42 == io_address[6:0] ? 8'h66 : _GEN_65; // @[Test.scala 14:11]
  wire [7:0] _GEN_67 = 7'h43 == io_address[6:0] ? 8'h67 : _GEN_66; // @[Test.scala 14:11]
  wire [7:0] _GEN_68 = 7'h44 == io_address[6:0] ? 8'h68 : _GEN_67; // @[Test.scala 14:11]
  wire [7:0] _GEN_69 = 7'h45 == io_address[6:0] ? 8'h69 : _GEN_68; // @[Test.scala 14:11]
  wire [7:0] _GEN_70 = 7'h46 == io_address[6:0] ? 8'h70 : _GEN_69; // @[Test.scala 14:11]
  wire [7:0] _GEN_71 = 7'h47 == io_address[6:0] ? 8'h71 : _GEN_70; // @[Test.scala 14:11]
  wire [7:0] _GEN_72 = 7'h48 == io_address[6:0] ? 8'h72 : _GEN_71; // @[Test.scala 14:11]
  wire [7:0] _GEN_73 = 7'h49 == io_address[6:0] ? 8'h73 : _GEN_72; // @[Test.scala 14:11]
  wire [7:0] _GEN_74 = 7'h4a == io_address[6:0] ? 8'h74 : _GEN_73; // @[Test.scala 14:11]
  wire [7:0] _GEN_75 = 7'h4b == io_address[6:0] ? 8'h75 : _GEN_74; // @[Test.scala 14:11]
  wire [7:0] _GEN_76 = 7'h4c == io_address[6:0] ? 8'h76 : _GEN_75; // @[Test.scala 14:11]
  wire [7:0] _GEN_77 = 7'h4d == io_address[6:0] ? 8'h77 : _GEN_76; // @[Test.scala 14:11]
  wire [7:0] _GEN_78 = 7'h4e == io_address[6:0] ? 8'h78 : _GEN_77; // @[Test.scala 14:11]
  wire [7:0] _GEN_79 = 7'h4f == io_address[6:0] ? 8'h79 : _GEN_78; // @[Test.scala 14:11]
  wire [7:0] _GEN_80 = 7'h50 == io_address[6:0] ? 8'h80 : _GEN_79; // @[Test.scala 14:11]
  wire [7:0] _GEN_81 = 7'h51 == io_address[6:0] ? 8'h81 : _GEN_80; // @[Test.scala 14:11]
  wire [7:0] _GEN_82 = 7'h52 == io_address[6:0] ? 8'h82 : _GEN_81; // @[Test.scala 14:11]
  wire [7:0] _GEN_83 = 7'h53 == io_address[6:0] ? 8'h83 : _GEN_82; // @[Test.scala 14:11]
  wire [7:0] _GEN_84 = 7'h54 == io_address[6:0] ? 8'h84 : _GEN_83; // @[Test.scala 14:11]
  wire [7:0] _GEN_85 = 7'h55 == io_address[6:0] ? 8'h85 : _GEN_84; // @[Test.scala 14:11]
  wire [7:0] _GEN_86 = 7'h56 == io_address[6:0] ? 8'h86 : _GEN_85; // @[Test.scala 14:11]
  wire [7:0] _GEN_87 = 7'h57 == io_address[6:0] ? 8'h87 : _GEN_86; // @[Test.scala 14:11]
  wire [7:0] _GEN_88 = 7'h58 == io_address[6:0] ? 8'h88 : _GEN_87; // @[Test.scala 14:11]
  wire [7:0] _GEN_89 = 7'h59 == io_address[6:0] ? 8'h89 : _GEN_88; // @[Test.scala 14:11]
  wire [7:0] _GEN_90 = 7'h5a == io_address[6:0] ? 8'h90 : _GEN_89; // @[Test.scala 14:11]
  wire [7:0] _GEN_91 = 7'h5b == io_address[6:0] ? 8'h91 : _GEN_90; // @[Test.scala 14:11]
  wire [7:0] _GEN_92 = 7'h5c == io_address[6:0] ? 8'h92 : _GEN_91; // @[Test.scala 14:11]
  wire [7:0] _GEN_93 = 7'h5d == io_address[6:0] ? 8'h93 : _GEN_92; // @[Test.scala 14:11]
  wire [7:0] _GEN_94 = 7'h5e == io_address[6:0] ? 8'h94 : _GEN_93; // @[Test.scala 14:11]
  wire [7:0] _GEN_95 = 7'h5f == io_address[6:0] ? 8'h95 : _GEN_94; // @[Test.scala 14:11]
  wire [7:0] _GEN_96 = 7'h60 == io_address[6:0] ? 8'h96 : _GEN_95; // @[Test.scala 14:11]
  wire [7:0] _GEN_97 = 7'h61 == io_address[6:0] ? 8'h97 : _GEN_96; // @[Test.scala 14:11]
  wire [7:0] _GEN_98 = 7'h62 == io_address[6:0] ? 8'h98 : _GEN_97; // @[Test.scala 14:11]
  wire [7:0] _GEN_99 = 7'h63 == io_address[6:0] ? 8'h99 : _GEN_98; // @[Test.scala 14:11]
  assign io_data = {{8'd0}, _GEN_99}; // @[Test.scala 14:11]
endmodule
