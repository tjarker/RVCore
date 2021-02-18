module IF(
  input         clock,
  input         reset,
  input  [31:0] in_pcNext,
  input         in_branch,
  output [31:0] out_pc,
  output [31:0] out_instr,
  input         ctrl_pcEn
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] pc; // @[IF.scala 18:19]
  wire [31:0] _T_1 = pc + 32'h3; // @[IF.scala 28:27]
  wire [31:0] _T_4 = pc + 32'h2; // @[IF.scala 28:43]
  wire [31:0] _T_7 = pc + 32'h1; // @[IF.scala 28:59]
  wire [7:0] _GEN_1 = 8'h1 == _T_7[7:0] ? 8'h9 : 8'h13; // @[Cat.scala 29:58]
  wire [7:0] _GEN_2 = 8'h2 == _T_7[7:0] ? 8'h0 : _GEN_1; // @[Cat.scala 29:58]
  wire [7:0] _GEN_3 = 8'h3 == _T_7[7:0] ? 8'h0 : _GEN_2; // @[Cat.scala 29:58]
  wire [7:0] _GEN_4 = 8'h4 == _T_7[7:0] ? 8'h13 : _GEN_3; // @[Cat.scala 29:58]
  wire [7:0] _GEN_5 = 8'h5 == _T_7[7:0] ? 8'h9 : _GEN_4; // @[Cat.scala 29:58]
  wire [7:0] _GEN_6 = 8'h6 == _T_7[7:0] ? 8'h19 : _GEN_5; // @[Cat.scala 29:58]
  wire [7:0] _GEN_7 = 8'h7 == _T_7[7:0] ? 8'h0 : _GEN_6; // @[Cat.scala 29:58]
  wire [7:0] _GEN_8 = 8'h8 == _T_7[7:0] ? 8'h23 : _GEN_7; // @[Cat.scala 29:58]
  wire [7:0] _GEN_9 = 8'h9 == _T_7[7:0] ? 8'h20 : _GEN_8; // @[Cat.scala 29:58]
  wire [7:0] _GEN_10 = 8'ha == _T_7[7:0] ? 8'h20 : _GEN_9; // @[Cat.scala 29:58]
  wire [7:0] _GEN_11 = 8'hb == _T_7[7:0] ? 8'h51 : _GEN_10; // @[Cat.scala 29:58]
  wire [7:0] _GEN_12 = 8'hc == _T_7[7:0] ? 8'h6f : _GEN_11; // @[Cat.scala 29:58]
  wire [7:0] _GEN_13 = 8'hd == _T_7[7:0] ? 8'hf0 : _GEN_12; // @[Cat.scala 29:58]
  wire [7:0] _GEN_14 = 8'he == _T_7[7:0] ? 8'h9f : _GEN_13; // @[Cat.scala 29:58]
  wire [7:0] _GEN_15 = 8'hf == _T_7[7:0] ? 8'hff : _GEN_14; // @[Cat.scala 29:58]
  wire [7:0] _GEN_16 = 8'h10 == _T_7[7:0] ? 8'h0 : _GEN_15; // @[Cat.scala 29:58]
  wire [7:0] _GEN_17 = 8'h11 == _T_7[7:0] ? 8'h0 : _GEN_16; // @[Cat.scala 29:58]
  wire [7:0] _GEN_18 = 8'h12 == _T_7[7:0] ? 8'h0 : _GEN_17; // @[Cat.scala 29:58]
  wire [7:0] _GEN_19 = 8'h13 == _T_7[7:0] ? 8'h0 : _GEN_18; // @[Cat.scala 29:58]
  wire [7:0] _GEN_20 = 8'h14 == _T_7[7:0] ? 8'h0 : _GEN_19; // @[Cat.scala 29:58]
  wire [7:0] _GEN_21 = 8'h15 == _T_7[7:0] ? 8'h0 : _GEN_20; // @[Cat.scala 29:58]
  wire [7:0] _GEN_22 = 8'h16 == _T_7[7:0] ? 8'h0 : _GEN_21; // @[Cat.scala 29:58]
  wire [7:0] _GEN_23 = 8'h17 == _T_7[7:0] ? 8'h0 : _GEN_22; // @[Cat.scala 29:58]
  wire [7:0] _GEN_24 = 8'h18 == _T_7[7:0] ? 8'h0 : _GEN_23; // @[Cat.scala 29:58]
  wire [7:0] _GEN_25 = 8'h19 == _T_7[7:0] ? 8'h0 : _GEN_24; // @[Cat.scala 29:58]
  wire [7:0] _GEN_26 = 8'h1a == _T_7[7:0] ? 8'h0 : _GEN_25; // @[Cat.scala 29:58]
  wire [7:0] _GEN_27 = 8'h1b == _T_7[7:0] ? 8'h0 : _GEN_26; // @[Cat.scala 29:58]
  wire [7:0] _GEN_28 = 8'h1c == _T_7[7:0] ? 8'h0 : _GEN_27; // @[Cat.scala 29:58]
  wire [7:0] _GEN_29 = 8'h1d == _T_7[7:0] ? 8'h0 : _GEN_28; // @[Cat.scala 29:58]
  wire [7:0] _GEN_30 = 8'h1e == _T_7[7:0] ? 8'h0 : _GEN_29; // @[Cat.scala 29:58]
  wire [7:0] _GEN_31 = 8'h1f == _T_7[7:0] ? 8'h0 : _GEN_30; // @[Cat.scala 29:58]
  wire [7:0] _GEN_32 = 8'h20 == _T_7[7:0] ? 8'h0 : _GEN_31; // @[Cat.scala 29:58]
  wire [7:0] _GEN_33 = 8'h21 == _T_7[7:0] ? 8'h0 : _GEN_32; // @[Cat.scala 29:58]
  wire [7:0] _GEN_34 = 8'h22 == _T_7[7:0] ? 8'h0 : _GEN_33; // @[Cat.scala 29:58]
  wire [7:0] _GEN_35 = 8'h23 == _T_7[7:0] ? 8'h0 : _GEN_34; // @[Cat.scala 29:58]
  wire [7:0] _GEN_36 = 8'h24 == _T_7[7:0] ? 8'h0 : _GEN_35; // @[Cat.scala 29:58]
  wire [7:0] _GEN_37 = 8'h25 == _T_7[7:0] ? 8'h0 : _GEN_36; // @[Cat.scala 29:58]
  wire [7:0] _GEN_38 = 8'h26 == _T_7[7:0] ? 8'h0 : _GEN_37; // @[Cat.scala 29:58]
  wire [7:0] _GEN_39 = 8'h27 == _T_7[7:0] ? 8'h0 : _GEN_38; // @[Cat.scala 29:58]
  wire [7:0] _GEN_40 = 8'h28 == _T_7[7:0] ? 8'h0 : _GEN_39; // @[Cat.scala 29:58]
  wire [7:0] _GEN_41 = 8'h29 == _T_7[7:0] ? 8'h0 : _GEN_40; // @[Cat.scala 29:58]
  wire [7:0] _GEN_42 = 8'h2a == _T_7[7:0] ? 8'h0 : _GEN_41; // @[Cat.scala 29:58]
  wire [7:0] _GEN_43 = 8'h2b == _T_7[7:0] ? 8'h0 : _GEN_42; // @[Cat.scala 29:58]
  wire [7:0] _GEN_44 = 8'h2c == _T_7[7:0] ? 8'h0 : _GEN_43; // @[Cat.scala 29:58]
  wire [7:0] _GEN_45 = 8'h2d == _T_7[7:0] ? 8'h0 : _GEN_44; // @[Cat.scala 29:58]
  wire [7:0] _GEN_46 = 8'h2e == _T_7[7:0] ? 8'h0 : _GEN_45; // @[Cat.scala 29:58]
  wire [7:0] _GEN_47 = 8'h2f == _T_7[7:0] ? 8'h0 : _GEN_46; // @[Cat.scala 29:58]
  wire [7:0] _GEN_48 = 8'h30 == _T_7[7:0] ? 8'h0 : _GEN_47; // @[Cat.scala 29:58]
  wire [7:0] _GEN_49 = 8'h31 == _T_7[7:0] ? 8'h0 : _GEN_48; // @[Cat.scala 29:58]
  wire [7:0] _GEN_50 = 8'h32 == _T_7[7:0] ? 8'h0 : _GEN_49; // @[Cat.scala 29:58]
  wire [7:0] _GEN_51 = 8'h33 == _T_7[7:0] ? 8'h0 : _GEN_50; // @[Cat.scala 29:58]
  wire [7:0] _GEN_52 = 8'h34 == _T_7[7:0] ? 8'h0 : _GEN_51; // @[Cat.scala 29:58]
  wire [7:0] _GEN_53 = 8'h35 == _T_7[7:0] ? 8'h0 : _GEN_52; // @[Cat.scala 29:58]
  wire [7:0] _GEN_54 = 8'h36 == _T_7[7:0] ? 8'h0 : _GEN_53; // @[Cat.scala 29:58]
  wire [7:0] _GEN_55 = 8'h37 == _T_7[7:0] ? 8'h0 : _GEN_54; // @[Cat.scala 29:58]
  wire [7:0] _GEN_56 = 8'h38 == _T_7[7:0] ? 8'h0 : _GEN_55; // @[Cat.scala 29:58]
  wire [7:0] _GEN_57 = 8'h39 == _T_7[7:0] ? 8'h0 : _GEN_56; // @[Cat.scala 29:58]
  wire [7:0] _GEN_58 = 8'h3a == _T_7[7:0] ? 8'h0 : _GEN_57; // @[Cat.scala 29:58]
  wire [7:0] _GEN_59 = 8'h3b == _T_7[7:0] ? 8'h0 : _GEN_58; // @[Cat.scala 29:58]
  wire [7:0] _GEN_60 = 8'h3c == _T_7[7:0] ? 8'h0 : _GEN_59; // @[Cat.scala 29:58]
  wire [7:0] _GEN_61 = 8'h3d == _T_7[7:0] ? 8'h0 : _GEN_60; // @[Cat.scala 29:58]
  wire [7:0] _GEN_62 = 8'h3e == _T_7[7:0] ? 8'h0 : _GEN_61; // @[Cat.scala 29:58]
  wire [7:0] _GEN_63 = 8'h3f == _T_7[7:0] ? 8'h0 : _GEN_62; // @[Cat.scala 29:58]
  wire [7:0] _GEN_64 = 8'h40 == _T_7[7:0] ? 8'h0 : _GEN_63; // @[Cat.scala 29:58]
  wire [7:0] _GEN_65 = 8'h41 == _T_7[7:0] ? 8'h0 : _GEN_64; // @[Cat.scala 29:58]
  wire [7:0] _GEN_66 = 8'h42 == _T_7[7:0] ? 8'h0 : _GEN_65; // @[Cat.scala 29:58]
  wire [7:0] _GEN_67 = 8'h43 == _T_7[7:0] ? 8'h0 : _GEN_66; // @[Cat.scala 29:58]
  wire [7:0] _GEN_68 = 8'h44 == _T_7[7:0] ? 8'h0 : _GEN_67; // @[Cat.scala 29:58]
  wire [7:0] _GEN_69 = 8'h45 == _T_7[7:0] ? 8'h0 : _GEN_68; // @[Cat.scala 29:58]
  wire [7:0] _GEN_70 = 8'h46 == _T_7[7:0] ? 8'h0 : _GEN_69; // @[Cat.scala 29:58]
  wire [7:0] _GEN_71 = 8'h47 == _T_7[7:0] ? 8'h0 : _GEN_70; // @[Cat.scala 29:58]
  wire [7:0] _GEN_72 = 8'h48 == _T_7[7:0] ? 8'h0 : _GEN_71; // @[Cat.scala 29:58]
  wire [7:0] _GEN_73 = 8'h49 == _T_7[7:0] ? 8'h0 : _GEN_72; // @[Cat.scala 29:58]
  wire [7:0] _GEN_74 = 8'h4a == _T_7[7:0] ? 8'h0 : _GEN_73; // @[Cat.scala 29:58]
  wire [7:0] _GEN_75 = 8'h4b == _T_7[7:0] ? 8'h0 : _GEN_74; // @[Cat.scala 29:58]
  wire [7:0] _GEN_76 = 8'h4c == _T_7[7:0] ? 8'h0 : _GEN_75; // @[Cat.scala 29:58]
  wire [7:0] _GEN_77 = 8'h4d == _T_7[7:0] ? 8'h0 : _GEN_76; // @[Cat.scala 29:58]
  wire [7:0] _GEN_78 = 8'h4e == _T_7[7:0] ? 8'h0 : _GEN_77; // @[Cat.scala 29:58]
  wire [7:0] _GEN_79 = 8'h4f == _T_7[7:0] ? 8'h0 : _GEN_78; // @[Cat.scala 29:58]
  wire [7:0] _GEN_80 = 8'h50 == _T_7[7:0] ? 8'h0 : _GEN_79; // @[Cat.scala 29:58]
  wire [7:0] _GEN_81 = 8'h51 == _T_7[7:0] ? 8'h0 : _GEN_80; // @[Cat.scala 29:58]
  wire [7:0] _GEN_82 = 8'h52 == _T_7[7:0] ? 8'h0 : _GEN_81; // @[Cat.scala 29:58]
  wire [7:0] _GEN_83 = 8'h53 == _T_7[7:0] ? 8'h0 : _GEN_82; // @[Cat.scala 29:58]
  wire [7:0] _GEN_84 = 8'h54 == _T_7[7:0] ? 8'h0 : _GEN_83; // @[Cat.scala 29:58]
  wire [7:0] _GEN_85 = 8'h55 == _T_7[7:0] ? 8'h0 : _GEN_84; // @[Cat.scala 29:58]
  wire [7:0] _GEN_86 = 8'h56 == _T_7[7:0] ? 8'h0 : _GEN_85; // @[Cat.scala 29:58]
  wire [7:0] _GEN_87 = 8'h57 == _T_7[7:0] ? 8'h0 : _GEN_86; // @[Cat.scala 29:58]
  wire [7:0] _GEN_88 = 8'h58 == _T_7[7:0] ? 8'h0 : _GEN_87; // @[Cat.scala 29:58]
  wire [7:0] _GEN_89 = 8'h59 == _T_7[7:0] ? 8'h0 : _GEN_88; // @[Cat.scala 29:58]
  wire [7:0] _GEN_90 = 8'h5a == _T_7[7:0] ? 8'h0 : _GEN_89; // @[Cat.scala 29:58]
  wire [7:0] _GEN_91 = 8'h5b == _T_7[7:0] ? 8'h0 : _GEN_90; // @[Cat.scala 29:58]
  wire [7:0] _GEN_92 = 8'h5c == _T_7[7:0] ? 8'h0 : _GEN_91; // @[Cat.scala 29:58]
  wire [7:0] _GEN_93 = 8'h5d == _T_7[7:0] ? 8'h0 : _GEN_92; // @[Cat.scala 29:58]
  wire [7:0] _GEN_94 = 8'h5e == _T_7[7:0] ? 8'h0 : _GEN_93; // @[Cat.scala 29:58]
  wire [7:0] _GEN_95 = 8'h5f == _T_7[7:0] ? 8'h0 : _GEN_94; // @[Cat.scala 29:58]
  wire [7:0] _GEN_96 = 8'h60 == _T_7[7:0] ? 8'h0 : _GEN_95; // @[Cat.scala 29:58]
  wire [7:0] _GEN_97 = 8'h61 == _T_7[7:0] ? 8'h0 : _GEN_96; // @[Cat.scala 29:58]
  wire [7:0] _GEN_98 = 8'h62 == _T_7[7:0] ? 8'h0 : _GEN_97; // @[Cat.scala 29:58]
  wire [7:0] _GEN_99 = 8'h63 == _T_7[7:0] ? 8'h0 : _GEN_98; // @[Cat.scala 29:58]
  wire [7:0] _GEN_100 = 8'h64 == _T_7[7:0] ? 8'h0 : _GEN_99; // @[Cat.scala 29:58]
  wire [7:0] _GEN_101 = 8'h65 == _T_7[7:0] ? 8'h0 : _GEN_100; // @[Cat.scala 29:58]
  wire [7:0] _GEN_102 = 8'h66 == _T_7[7:0] ? 8'h0 : _GEN_101; // @[Cat.scala 29:58]
  wire [7:0] _GEN_103 = 8'h67 == _T_7[7:0] ? 8'h0 : _GEN_102; // @[Cat.scala 29:58]
  wire [7:0] _GEN_104 = 8'h68 == _T_7[7:0] ? 8'h0 : _GEN_103; // @[Cat.scala 29:58]
  wire [7:0] _GEN_105 = 8'h69 == _T_7[7:0] ? 8'h0 : _GEN_104; // @[Cat.scala 29:58]
  wire [7:0] _GEN_106 = 8'h6a == _T_7[7:0] ? 8'h0 : _GEN_105; // @[Cat.scala 29:58]
  wire [7:0] _GEN_107 = 8'h6b == _T_7[7:0] ? 8'h0 : _GEN_106; // @[Cat.scala 29:58]
  wire [7:0] _GEN_108 = 8'h6c == _T_7[7:0] ? 8'h0 : _GEN_107; // @[Cat.scala 29:58]
  wire [7:0] _GEN_109 = 8'h6d == _T_7[7:0] ? 8'h0 : _GEN_108; // @[Cat.scala 29:58]
  wire [7:0] _GEN_110 = 8'h6e == _T_7[7:0] ? 8'h0 : _GEN_109; // @[Cat.scala 29:58]
  wire [7:0] _GEN_111 = 8'h6f == _T_7[7:0] ? 8'h0 : _GEN_110; // @[Cat.scala 29:58]
  wire [7:0] _GEN_112 = 8'h70 == _T_7[7:0] ? 8'h0 : _GEN_111; // @[Cat.scala 29:58]
  wire [7:0] _GEN_113 = 8'h71 == _T_7[7:0] ? 8'h0 : _GEN_112; // @[Cat.scala 29:58]
  wire [7:0] _GEN_114 = 8'h72 == _T_7[7:0] ? 8'h0 : _GEN_113; // @[Cat.scala 29:58]
  wire [7:0] _GEN_115 = 8'h73 == _T_7[7:0] ? 8'h0 : _GEN_114; // @[Cat.scala 29:58]
  wire [7:0] _GEN_116 = 8'h74 == _T_7[7:0] ? 8'h0 : _GEN_115; // @[Cat.scala 29:58]
  wire [7:0] _GEN_117 = 8'h75 == _T_7[7:0] ? 8'h0 : _GEN_116; // @[Cat.scala 29:58]
  wire [7:0] _GEN_118 = 8'h76 == _T_7[7:0] ? 8'h0 : _GEN_117; // @[Cat.scala 29:58]
  wire [7:0] _GEN_119 = 8'h77 == _T_7[7:0] ? 8'h0 : _GEN_118; // @[Cat.scala 29:58]
  wire [7:0] _GEN_120 = 8'h78 == _T_7[7:0] ? 8'h0 : _GEN_119; // @[Cat.scala 29:58]
  wire [7:0] _GEN_121 = 8'h79 == _T_7[7:0] ? 8'h0 : _GEN_120; // @[Cat.scala 29:58]
  wire [7:0] _GEN_122 = 8'h7a == _T_7[7:0] ? 8'h0 : _GEN_121; // @[Cat.scala 29:58]
  wire [7:0] _GEN_123 = 8'h7b == _T_7[7:0] ? 8'h0 : _GEN_122; // @[Cat.scala 29:58]
  wire [7:0] _GEN_124 = 8'h7c == _T_7[7:0] ? 8'h0 : _GEN_123; // @[Cat.scala 29:58]
  wire [7:0] _GEN_125 = 8'h7d == _T_7[7:0] ? 8'h0 : _GEN_124; // @[Cat.scala 29:58]
  wire [7:0] _GEN_126 = 8'h7e == _T_7[7:0] ? 8'h0 : _GEN_125; // @[Cat.scala 29:58]
  wire [7:0] _GEN_127 = 8'h7f == _T_7[7:0] ? 8'h0 : _GEN_126; // @[Cat.scala 29:58]
  wire [7:0] _GEN_128 = 8'h80 == _T_7[7:0] ? 8'h0 : _GEN_127; // @[Cat.scala 29:58]
  wire [7:0] _GEN_129 = 8'h81 == _T_7[7:0] ? 8'h0 : _GEN_128; // @[Cat.scala 29:58]
  wire [7:0] _GEN_130 = 8'h82 == _T_7[7:0] ? 8'h0 : _GEN_129; // @[Cat.scala 29:58]
  wire [7:0] _GEN_131 = 8'h83 == _T_7[7:0] ? 8'h0 : _GEN_130; // @[Cat.scala 29:58]
  wire [7:0] _GEN_132 = 8'h84 == _T_7[7:0] ? 8'h0 : _GEN_131; // @[Cat.scala 29:58]
  wire [7:0] _GEN_133 = 8'h85 == _T_7[7:0] ? 8'h0 : _GEN_132; // @[Cat.scala 29:58]
  wire [7:0] _GEN_134 = 8'h86 == _T_7[7:0] ? 8'h0 : _GEN_133; // @[Cat.scala 29:58]
  wire [7:0] _GEN_135 = 8'h87 == _T_7[7:0] ? 8'h0 : _GEN_134; // @[Cat.scala 29:58]
  wire [7:0] _GEN_136 = 8'h88 == _T_7[7:0] ? 8'h0 : _GEN_135; // @[Cat.scala 29:58]
  wire [7:0] _GEN_137 = 8'h89 == _T_7[7:0] ? 8'h0 : _GEN_136; // @[Cat.scala 29:58]
  wire [7:0] _GEN_138 = 8'h8a == _T_7[7:0] ? 8'h0 : _GEN_137; // @[Cat.scala 29:58]
  wire [7:0] _GEN_139 = 8'h8b == _T_7[7:0] ? 8'h0 : _GEN_138; // @[Cat.scala 29:58]
  wire [7:0] _GEN_140 = 8'h8c == _T_7[7:0] ? 8'h0 : _GEN_139; // @[Cat.scala 29:58]
  wire [7:0] _GEN_141 = 8'h8d == _T_7[7:0] ? 8'h0 : _GEN_140; // @[Cat.scala 29:58]
  wire [7:0] _GEN_142 = 8'h8e == _T_7[7:0] ? 8'h0 : _GEN_141; // @[Cat.scala 29:58]
  wire [7:0] _GEN_143 = 8'h8f == _T_7[7:0] ? 8'h0 : _GEN_142; // @[Cat.scala 29:58]
  wire [7:0] _GEN_144 = 8'h90 == _T_7[7:0] ? 8'h0 : _GEN_143; // @[Cat.scala 29:58]
  wire [7:0] _GEN_145 = 8'h91 == _T_7[7:0] ? 8'h0 : _GEN_144; // @[Cat.scala 29:58]
  wire [7:0] _GEN_146 = 8'h92 == _T_7[7:0] ? 8'h0 : _GEN_145; // @[Cat.scala 29:58]
  wire [7:0] _GEN_147 = 8'h93 == _T_7[7:0] ? 8'h0 : _GEN_146; // @[Cat.scala 29:58]
  wire [7:0] _GEN_148 = 8'h94 == _T_7[7:0] ? 8'h0 : _GEN_147; // @[Cat.scala 29:58]
  wire [7:0] _GEN_149 = 8'h95 == _T_7[7:0] ? 8'h0 : _GEN_148; // @[Cat.scala 29:58]
  wire [7:0] _GEN_150 = 8'h96 == _T_7[7:0] ? 8'h0 : _GEN_149; // @[Cat.scala 29:58]
  wire [7:0] _GEN_151 = 8'h97 == _T_7[7:0] ? 8'h0 : _GEN_150; // @[Cat.scala 29:58]
  wire [7:0] _GEN_152 = 8'h98 == _T_7[7:0] ? 8'h0 : _GEN_151; // @[Cat.scala 29:58]
  wire [7:0] _GEN_153 = 8'h99 == _T_7[7:0] ? 8'h0 : _GEN_152; // @[Cat.scala 29:58]
  wire [7:0] _GEN_154 = 8'h9a == _T_7[7:0] ? 8'h0 : _GEN_153; // @[Cat.scala 29:58]
  wire [7:0] _GEN_155 = 8'h9b == _T_7[7:0] ? 8'h0 : _GEN_154; // @[Cat.scala 29:58]
  wire [7:0] _GEN_156 = 8'h9c == _T_7[7:0] ? 8'h0 : _GEN_155; // @[Cat.scala 29:58]
  wire [7:0] _GEN_157 = 8'h9d == _T_7[7:0] ? 8'h0 : _GEN_156; // @[Cat.scala 29:58]
  wire [7:0] _GEN_158 = 8'h9e == _T_7[7:0] ? 8'h0 : _GEN_157; // @[Cat.scala 29:58]
  wire [7:0] _GEN_159 = 8'h9f == _T_7[7:0] ? 8'h0 : _GEN_158; // @[Cat.scala 29:58]
  wire [7:0] _GEN_160 = 8'ha0 == _T_7[7:0] ? 8'h0 : _GEN_159; // @[Cat.scala 29:58]
  wire [7:0] _GEN_161 = 8'ha1 == _T_7[7:0] ? 8'h0 : _GEN_160; // @[Cat.scala 29:58]
  wire [7:0] _GEN_162 = 8'ha2 == _T_7[7:0] ? 8'h0 : _GEN_161; // @[Cat.scala 29:58]
  wire [7:0] _GEN_163 = 8'ha3 == _T_7[7:0] ? 8'h0 : _GEN_162; // @[Cat.scala 29:58]
  wire [7:0] _GEN_164 = 8'ha4 == _T_7[7:0] ? 8'h0 : _GEN_163; // @[Cat.scala 29:58]
  wire [7:0] _GEN_165 = 8'ha5 == _T_7[7:0] ? 8'h0 : _GEN_164; // @[Cat.scala 29:58]
  wire [7:0] _GEN_166 = 8'ha6 == _T_7[7:0] ? 8'h0 : _GEN_165; // @[Cat.scala 29:58]
  wire [7:0] _GEN_167 = 8'ha7 == _T_7[7:0] ? 8'h0 : _GEN_166; // @[Cat.scala 29:58]
  wire [7:0] _GEN_168 = 8'ha8 == _T_7[7:0] ? 8'h0 : _GEN_167; // @[Cat.scala 29:58]
  wire [7:0] _GEN_169 = 8'ha9 == _T_7[7:0] ? 8'h0 : _GEN_168; // @[Cat.scala 29:58]
  wire [7:0] _GEN_170 = 8'haa == _T_7[7:0] ? 8'h0 : _GEN_169; // @[Cat.scala 29:58]
  wire [7:0] _GEN_171 = 8'hab == _T_7[7:0] ? 8'h0 : _GEN_170; // @[Cat.scala 29:58]
  wire [7:0] _GEN_172 = 8'hac == _T_7[7:0] ? 8'h0 : _GEN_171; // @[Cat.scala 29:58]
  wire [7:0] _GEN_173 = 8'had == _T_7[7:0] ? 8'h0 : _GEN_172; // @[Cat.scala 29:58]
  wire [7:0] _GEN_174 = 8'hae == _T_7[7:0] ? 8'h0 : _GEN_173; // @[Cat.scala 29:58]
  wire [7:0] _GEN_175 = 8'haf == _T_7[7:0] ? 8'h0 : _GEN_174; // @[Cat.scala 29:58]
  wire [7:0] _GEN_176 = 8'hb0 == _T_7[7:0] ? 8'h0 : _GEN_175; // @[Cat.scala 29:58]
  wire [7:0] _GEN_177 = 8'hb1 == _T_7[7:0] ? 8'h0 : _GEN_176; // @[Cat.scala 29:58]
  wire [7:0] _GEN_178 = 8'hb2 == _T_7[7:0] ? 8'h0 : _GEN_177; // @[Cat.scala 29:58]
  wire [7:0] _GEN_179 = 8'hb3 == _T_7[7:0] ? 8'h0 : _GEN_178; // @[Cat.scala 29:58]
  wire [7:0] _GEN_180 = 8'hb4 == _T_7[7:0] ? 8'h0 : _GEN_179; // @[Cat.scala 29:58]
  wire [7:0] _GEN_181 = 8'hb5 == _T_7[7:0] ? 8'h0 : _GEN_180; // @[Cat.scala 29:58]
  wire [7:0] _GEN_182 = 8'hb6 == _T_7[7:0] ? 8'h0 : _GEN_181; // @[Cat.scala 29:58]
  wire [7:0] _GEN_183 = 8'hb7 == _T_7[7:0] ? 8'h0 : _GEN_182; // @[Cat.scala 29:58]
  wire [7:0] _GEN_184 = 8'hb8 == _T_7[7:0] ? 8'h0 : _GEN_183; // @[Cat.scala 29:58]
  wire [7:0] _GEN_185 = 8'hb9 == _T_7[7:0] ? 8'h0 : _GEN_184; // @[Cat.scala 29:58]
  wire [7:0] _GEN_186 = 8'hba == _T_7[7:0] ? 8'h0 : _GEN_185; // @[Cat.scala 29:58]
  wire [7:0] _GEN_187 = 8'hbb == _T_7[7:0] ? 8'h0 : _GEN_186; // @[Cat.scala 29:58]
  wire [7:0] _GEN_188 = 8'hbc == _T_7[7:0] ? 8'h0 : _GEN_187; // @[Cat.scala 29:58]
  wire [7:0] _GEN_189 = 8'hbd == _T_7[7:0] ? 8'h0 : _GEN_188; // @[Cat.scala 29:58]
  wire [7:0] _GEN_190 = 8'hbe == _T_7[7:0] ? 8'h0 : _GEN_189; // @[Cat.scala 29:58]
  wire [7:0] _GEN_191 = 8'hbf == _T_7[7:0] ? 8'h0 : _GEN_190; // @[Cat.scala 29:58]
  wire [7:0] _GEN_192 = 8'hc0 == _T_7[7:0] ? 8'h0 : _GEN_191; // @[Cat.scala 29:58]
  wire [7:0] _GEN_193 = 8'hc1 == _T_7[7:0] ? 8'h0 : _GEN_192; // @[Cat.scala 29:58]
  wire [7:0] _GEN_194 = 8'hc2 == _T_7[7:0] ? 8'h0 : _GEN_193; // @[Cat.scala 29:58]
  wire [7:0] _GEN_195 = 8'hc3 == _T_7[7:0] ? 8'h0 : _GEN_194; // @[Cat.scala 29:58]
  wire [7:0] _GEN_196 = 8'hc4 == _T_7[7:0] ? 8'h0 : _GEN_195; // @[Cat.scala 29:58]
  wire [7:0] _GEN_197 = 8'hc5 == _T_7[7:0] ? 8'h0 : _GEN_196; // @[Cat.scala 29:58]
  wire [7:0] _GEN_198 = 8'hc6 == _T_7[7:0] ? 8'h0 : _GEN_197; // @[Cat.scala 29:58]
  wire [7:0] _GEN_199 = 8'hc7 == _T_7[7:0] ? 8'h0 : _GEN_198; // @[Cat.scala 29:58]
  wire [7:0] _GEN_200 = 8'hc8 == _T_7[7:0] ? 8'h0 : _GEN_199; // @[Cat.scala 29:58]
  wire [7:0] _GEN_201 = 8'hc9 == _T_7[7:0] ? 8'h0 : _GEN_200; // @[Cat.scala 29:58]
  wire [7:0] _GEN_202 = 8'hca == _T_7[7:0] ? 8'h0 : _GEN_201; // @[Cat.scala 29:58]
  wire [7:0] _GEN_203 = 8'hcb == _T_7[7:0] ? 8'h0 : _GEN_202; // @[Cat.scala 29:58]
  wire [7:0] _GEN_204 = 8'hcc == _T_7[7:0] ? 8'h0 : _GEN_203; // @[Cat.scala 29:58]
  wire [7:0] _GEN_205 = 8'hcd == _T_7[7:0] ? 8'h0 : _GEN_204; // @[Cat.scala 29:58]
  wire [7:0] _GEN_206 = 8'hce == _T_7[7:0] ? 8'h0 : _GEN_205; // @[Cat.scala 29:58]
  wire [7:0] _GEN_207 = 8'hcf == _T_7[7:0] ? 8'h0 : _GEN_206; // @[Cat.scala 29:58]
  wire [7:0] _GEN_208 = 8'hd0 == _T_7[7:0] ? 8'h0 : _GEN_207; // @[Cat.scala 29:58]
  wire [7:0] _GEN_209 = 8'hd1 == _T_7[7:0] ? 8'h0 : _GEN_208; // @[Cat.scala 29:58]
  wire [7:0] _GEN_210 = 8'hd2 == _T_7[7:0] ? 8'h0 : _GEN_209; // @[Cat.scala 29:58]
  wire [7:0] _GEN_211 = 8'hd3 == _T_7[7:0] ? 8'h0 : _GEN_210; // @[Cat.scala 29:58]
  wire [7:0] _GEN_212 = 8'hd4 == _T_7[7:0] ? 8'h0 : _GEN_211; // @[Cat.scala 29:58]
  wire [7:0] _GEN_213 = 8'hd5 == _T_7[7:0] ? 8'h0 : _GEN_212; // @[Cat.scala 29:58]
  wire [7:0] _GEN_214 = 8'hd6 == _T_7[7:0] ? 8'h0 : _GEN_213; // @[Cat.scala 29:58]
  wire [7:0] _GEN_215 = 8'hd7 == _T_7[7:0] ? 8'h0 : _GEN_214; // @[Cat.scala 29:58]
  wire [7:0] _GEN_217 = 8'h1 == pc[7:0] ? 8'h9 : 8'h13; // @[Cat.scala 29:58]
  wire [7:0] _GEN_218 = 8'h2 == pc[7:0] ? 8'h0 : _GEN_217; // @[Cat.scala 29:58]
  wire [7:0] _GEN_219 = 8'h3 == pc[7:0] ? 8'h0 : _GEN_218; // @[Cat.scala 29:58]
  wire [7:0] _GEN_220 = 8'h4 == pc[7:0] ? 8'h13 : _GEN_219; // @[Cat.scala 29:58]
  wire [7:0] _GEN_221 = 8'h5 == pc[7:0] ? 8'h9 : _GEN_220; // @[Cat.scala 29:58]
  wire [7:0] _GEN_222 = 8'h6 == pc[7:0] ? 8'h19 : _GEN_221; // @[Cat.scala 29:58]
  wire [7:0] _GEN_223 = 8'h7 == pc[7:0] ? 8'h0 : _GEN_222; // @[Cat.scala 29:58]
  wire [7:0] _GEN_224 = 8'h8 == pc[7:0] ? 8'h23 : _GEN_223; // @[Cat.scala 29:58]
  wire [7:0] _GEN_225 = 8'h9 == pc[7:0] ? 8'h20 : _GEN_224; // @[Cat.scala 29:58]
  wire [7:0] _GEN_226 = 8'ha == pc[7:0] ? 8'h20 : _GEN_225; // @[Cat.scala 29:58]
  wire [7:0] _GEN_227 = 8'hb == pc[7:0] ? 8'h51 : _GEN_226; // @[Cat.scala 29:58]
  wire [7:0] _GEN_228 = 8'hc == pc[7:0] ? 8'h6f : _GEN_227; // @[Cat.scala 29:58]
  wire [7:0] _GEN_229 = 8'hd == pc[7:0] ? 8'hf0 : _GEN_228; // @[Cat.scala 29:58]
  wire [7:0] _GEN_230 = 8'he == pc[7:0] ? 8'h9f : _GEN_229; // @[Cat.scala 29:58]
  wire [7:0] _GEN_231 = 8'hf == pc[7:0] ? 8'hff : _GEN_230; // @[Cat.scala 29:58]
  wire [7:0] _GEN_232 = 8'h10 == pc[7:0] ? 8'h0 : _GEN_231; // @[Cat.scala 29:58]
  wire [7:0] _GEN_233 = 8'h11 == pc[7:0] ? 8'h0 : _GEN_232; // @[Cat.scala 29:58]
  wire [7:0] _GEN_234 = 8'h12 == pc[7:0] ? 8'h0 : _GEN_233; // @[Cat.scala 29:58]
  wire [7:0] _GEN_235 = 8'h13 == pc[7:0] ? 8'h0 : _GEN_234; // @[Cat.scala 29:58]
  wire [7:0] _GEN_236 = 8'h14 == pc[7:0] ? 8'h0 : _GEN_235; // @[Cat.scala 29:58]
  wire [7:0] _GEN_237 = 8'h15 == pc[7:0] ? 8'h0 : _GEN_236; // @[Cat.scala 29:58]
  wire [7:0] _GEN_238 = 8'h16 == pc[7:0] ? 8'h0 : _GEN_237; // @[Cat.scala 29:58]
  wire [7:0] _GEN_239 = 8'h17 == pc[7:0] ? 8'h0 : _GEN_238; // @[Cat.scala 29:58]
  wire [7:0] _GEN_240 = 8'h18 == pc[7:0] ? 8'h0 : _GEN_239; // @[Cat.scala 29:58]
  wire [7:0] _GEN_241 = 8'h19 == pc[7:0] ? 8'h0 : _GEN_240; // @[Cat.scala 29:58]
  wire [7:0] _GEN_242 = 8'h1a == pc[7:0] ? 8'h0 : _GEN_241; // @[Cat.scala 29:58]
  wire [7:0] _GEN_243 = 8'h1b == pc[7:0] ? 8'h0 : _GEN_242; // @[Cat.scala 29:58]
  wire [7:0] _GEN_244 = 8'h1c == pc[7:0] ? 8'h0 : _GEN_243; // @[Cat.scala 29:58]
  wire [7:0] _GEN_245 = 8'h1d == pc[7:0] ? 8'h0 : _GEN_244; // @[Cat.scala 29:58]
  wire [7:0] _GEN_246 = 8'h1e == pc[7:0] ? 8'h0 : _GEN_245; // @[Cat.scala 29:58]
  wire [7:0] _GEN_247 = 8'h1f == pc[7:0] ? 8'h0 : _GEN_246; // @[Cat.scala 29:58]
  wire [7:0] _GEN_248 = 8'h20 == pc[7:0] ? 8'h0 : _GEN_247; // @[Cat.scala 29:58]
  wire [7:0] _GEN_249 = 8'h21 == pc[7:0] ? 8'h0 : _GEN_248; // @[Cat.scala 29:58]
  wire [7:0] _GEN_250 = 8'h22 == pc[7:0] ? 8'h0 : _GEN_249; // @[Cat.scala 29:58]
  wire [7:0] _GEN_251 = 8'h23 == pc[7:0] ? 8'h0 : _GEN_250; // @[Cat.scala 29:58]
  wire [7:0] _GEN_252 = 8'h24 == pc[7:0] ? 8'h0 : _GEN_251; // @[Cat.scala 29:58]
  wire [7:0] _GEN_253 = 8'h25 == pc[7:0] ? 8'h0 : _GEN_252; // @[Cat.scala 29:58]
  wire [7:0] _GEN_254 = 8'h26 == pc[7:0] ? 8'h0 : _GEN_253; // @[Cat.scala 29:58]
  wire [7:0] _GEN_255 = 8'h27 == pc[7:0] ? 8'h0 : _GEN_254; // @[Cat.scala 29:58]
  wire [7:0] _GEN_256 = 8'h28 == pc[7:0] ? 8'h0 : _GEN_255; // @[Cat.scala 29:58]
  wire [7:0] _GEN_257 = 8'h29 == pc[7:0] ? 8'h0 : _GEN_256; // @[Cat.scala 29:58]
  wire [7:0] _GEN_258 = 8'h2a == pc[7:0] ? 8'h0 : _GEN_257; // @[Cat.scala 29:58]
  wire [7:0] _GEN_259 = 8'h2b == pc[7:0] ? 8'h0 : _GEN_258; // @[Cat.scala 29:58]
  wire [7:0] _GEN_260 = 8'h2c == pc[7:0] ? 8'h0 : _GEN_259; // @[Cat.scala 29:58]
  wire [7:0] _GEN_261 = 8'h2d == pc[7:0] ? 8'h0 : _GEN_260; // @[Cat.scala 29:58]
  wire [7:0] _GEN_262 = 8'h2e == pc[7:0] ? 8'h0 : _GEN_261; // @[Cat.scala 29:58]
  wire [7:0] _GEN_263 = 8'h2f == pc[7:0] ? 8'h0 : _GEN_262; // @[Cat.scala 29:58]
  wire [7:0] _GEN_264 = 8'h30 == pc[7:0] ? 8'h0 : _GEN_263; // @[Cat.scala 29:58]
  wire [7:0] _GEN_265 = 8'h31 == pc[7:0] ? 8'h0 : _GEN_264; // @[Cat.scala 29:58]
  wire [7:0] _GEN_266 = 8'h32 == pc[7:0] ? 8'h0 : _GEN_265; // @[Cat.scala 29:58]
  wire [7:0] _GEN_267 = 8'h33 == pc[7:0] ? 8'h0 : _GEN_266; // @[Cat.scala 29:58]
  wire [7:0] _GEN_268 = 8'h34 == pc[7:0] ? 8'h0 : _GEN_267; // @[Cat.scala 29:58]
  wire [7:0] _GEN_269 = 8'h35 == pc[7:0] ? 8'h0 : _GEN_268; // @[Cat.scala 29:58]
  wire [7:0] _GEN_270 = 8'h36 == pc[7:0] ? 8'h0 : _GEN_269; // @[Cat.scala 29:58]
  wire [7:0] _GEN_271 = 8'h37 == pc[7:0] ? 8'h0 : _GEN_270; // @[Cat.scala 29:58]
  wire [7:0] _GEN_272 = 8'h38 == pc[7:0] ? 8'h0 : _GEN_271; // @[Cat.scala 29:58]
  wire [7:0] _GEN_273 = 8'h39 == pc[7:0] ? 8'h0 : _GEN_272; // @[Cat.scala 29:58]
  wire [7:0] _GEN_274 = 8'h3a == pc[7:0] ? 8'h0 : _GEN_273; // @[Cat.scala 29:58]
  wire [7:0] _GEN_275 = 8'h3b == pc[7:0] ? 8'h0 : _GEN_274; // @[Cat.scala 29:58]
  wire [7:0] _GEN_276 = 8'h3c == pc[7:0] ? 8'h0 : _GEN_275; // @[Cat.scala 29:58]
  wire [7:0] _GEN_277 = 8'h3d == pc[7:0] ? 8'h0 : _GEN_276; // @[Cat.scala 29:58]
  wire [7:0] _GEN_278 = 8'h3e == pc[7:0] ? 8'h0 : _GEN_277; // @[Cat.scala 29:58]
  wire [7:0] _GEN_279 = 8'h3f == pc[7:0] ? 8'h0 : _GEN_278; // @[Cat.scala 29:58]
  wire [7:0] _GEN_280 = 8'h40 == pc[7:0] ? 8'h0 : _GEN_279; // @[Cat.scala 29:58]
  wire [7:0] _GEN_281 = 8'h41 == pc[7:0] ? 8'h0 : _GEN_280; // @[Cat.scala 29:58]
  wire [7:0] _GEN_282 = 8'h42 == pc[7:0] ? 8'h0 : _GEN_281; // @[Cat.scala 29:58]
  wire [7:0] _GEN_283 = 8'h43 == pc[7:0] ? 8'h0 : _GEN_282; // @[Cat.scala 29:58]
  wire [7:0] _GEN_284 = 8'h44 == pc[7:0] ? 8'h0 : _GEN_283; // @[Cat.scala 29:58]
  wire [7:0] _GEN_285 = 8'h45 == pc[7:0] ? 8'h0 : _GEN_284; // @[Cat.scala 29:58]
  wire [7:0] _GEN_286 = 8'h46 == pc[7:0] ? 8'h0 : _GEN_285; // @[Cat.scala 29:58]
  wire [7:0] _GEN_287 = 8'h47 == pc[7:0] ? 8'h0 : _GEN_286; // @[Cat.scala 29:58]
  wire [7:0] _GEN_288 = 8'h48 == pc[7:0] ? 8'h0 : _GEN_287; // @[Cat.scala 29:58]
  wire [7:0] _GEN_289 = 8'h49 == pc[7:0] ? 8'h0 : _GEN_288; // @[Cat.scala 29:58]
  wire [7:0] _GEN_290 = 8'h4a == pc[7:0] ? 8'h0 : _GEN_289; // @[Cat.scala 29:58]
  wire [7:0] _GEN_291 = 8'h4b == pc[7:0] ? 8'h0 : _GEN_290; // @[Cat.scala 29:58]
  wire [7:0] _GEN_292 = 8'h4c == pc[7:0] ? 8'h0 : _GEN_291; // @[Cat.scala 29:58]
  wire [7:0] _GEN_293 = 8'h4d == pc[7:0] ? 8'h0 : _GEN_292; // @[Cat.scala 29:58]
  wire [7:0] _GEN_294 = 8'h4e == pc[7:0] ? 8'h0 : _GEN_293; // @[Cat.scala 29:58]
  wire [7:0] _GEN_295 = 8'h4f == pc[7:0] ? 8'h0 : _GEN_294; // @[Cat.scala 29:58]
  wire [7:0] _GEN_296 = 8'h50 == pc[7:0] ? 8'h0 : _GEN_295; // @[Cat.scala 29:58]
  wire [7:0] _GEN_297 = 8'h51 == pc[7:0] ? 8'h0 : _GEN_296; // @[Cat.scala 29:58]
  wire [7:0] _GEN_298 = 8'h52 == pc[7:0] ? 8'h0 : _GEN_297; // @[Cat.scala 29:58]
  wire [7:0] _GEN_299 = 8'h53 == pc[7:0] ? 8'h0 : _GEN_298; // @[Cat.scala 29:58]
  wire [7:0] _GEN_300 = 8'h54 == pc[7:0] ? 8'h0 : _GEN_299; // @[Cat.scala 29:58]
  wire [7:0] _GEN_301 = 8'h55 == pc[7:0] ? 8'h0 : _GEN_300; // @[Cat.scala 29:58]
  wire [7:0] _GEN_302 = 8'h56 == pc[7:0] ? 8'h0 : _GEN_301; // @[Cat.scala 29:58]
  wire [7:0] _GEN_303 = 8'h57 == pc[7:0] ? 8'h0 : _GEN_302; // @[Cat.scala 29:58]
  wire [7:0] _GEN_304 = 8'h58 == pc[7:0] ? 8'h0 : _GEN_303; // @[Cat.scala 29:58]
  wire [7:0] _GEN_305 = 8'h59 == pc[7:0] ? 8'h0 : _GEN_304; // @[Cat.scala 29:58]
  wire [7:0] _GEN_306 = 8'h5a == pc[7:0] ? 8'h0 : _GEN_305; // @[Cat.scala 29:58]
  wire [7:0] _GEN_307 = 8'h5b == pc[7:0] ? 8'h0 : _GEN_306; // @[Cat.scala 29:58]
  wire [7:0] _GEN_308 = 8'h5c == pc[7:0] ? 8'h0 : _GEN_307; // @[Cat.scala 29:58]
  wire [7:0] _GEN_309 = 8'h5d == pc[7:0] ? 8'h0 : _GEN_308; // @[Cat.scala 29:58]
  wire [7:0] _GEN_310 = 8'h5e == pc[7:0] ? 8'h0 : _GEN_309; // @[Cat.scala 29:58]
  wire [7:0] _GEN_311 = 8'h5f == pc[7:0] ? 8'h0 : _GEN_310; // @[Cat.scala 29:58]
  wire [7:0] _GEN_312 = 8'h60 == pc[7:0] ? 8'h0 : _GEN_311; // @[Cat.scala 29:58]
  wire [7:0] _GEN_313 = 8'h61 == pc[7:0] ? 8'h0 : _GEN_312; // @[Cat.scala 29:58]
  wire [7:0] _GEN_314 = 8'h62 == pc[7:0] ? 8'h0 : _GEN_313; // @[Cat.scala 29:58]
  wire [7:0] _GEN_315 = 8'h63 == pc[7:0] ? 8'h0 : _GEN_314; // @[Cat.scala 29:58]
  wire [7:0] _GEN_316 = 8'h64 == pc[7:0] ? 8'h0 : _GEN_315; // @[Cat.scala 29:58]
  wire [7:0] _GEN_317 = 8'h65 == pc[7:0] ? 8'h0 : _GEN_316; // @[Cat.scala 29:58]
  wire [7:0] _GEN_318 = 8'h66 == pc[7:0] ? 8'h0 : _GEN_317; // @[Cat.scala 29:58]
  wire [7:0] _GEN_319 = 8'h67 == pc[7:0] ? 8'h0 : _GEN_318; // @[Cat.scala 29:58]
  wire [7:0] _GEN_320 = 8'h68 == pc[7:0] ? 8'h0 : _GEN_319; // @[Cat.scala 29:58]
  wire [7:0] _GEN_321 = 8'h69 == pc[7:0] ? 8'h0 : _GEN_320; // @[Cat.scala 29:58]
  wire [7:0] _GEN_322 = 8'h6a == pc[7:0] ? 8'h0 : _GEN_321; // @[Cat.scala 29:58]
  wire [7:0] _GEN_323 = 8'h6b == pc[7:0] ? 8'h0 : _GEN_322; // @[Cat.scala 29:58]
  wire [7:0] _GEN_324 = 8'h6c == pc[7:0] ? 8'h0 : _GEN_323; // @[Cat.scala 29:58]
  wire [7:0] _GEN_325 = 8'h6d == pc[7:0] ? 8'h0 : _GEN_324; // @[Cat.scala 29:58]
  wire [7:0] _GEN_326 = 8'h6e == pc[7:0] ? 8'h0 : _GEN_325; // @[Cat.scala 29:58]
  wire [7:0] _GEN_327 = 8'h6f == pc[7:0] ? 8'h0 : _GEN_326; // @[Cat.scala 29:58]
  wire [7:0] _GEN_328 = 8'h70 == pc[7:0] ? 8'h0 : _GEN_327; // @[Cat.scala 29:58]
  wire [7:0] _GEN_329 = 8'h71 == pc[7:0] ? 8'h0 : _GEN_328; // @[Cat.scala 29:58]
  wire [7:0] _GEN_330 = 8'h72 == pc[7:0] ? 8'h0 : _GEN_329; // @[Cat.scala 29:58]
  wire [7:0] _GEN_331 = 8'h73 == pc[7:0] ? 8'h0 : _GEN_330; // @[Cat.scala 29:58]
  wire [7:0] _GEN_332 = 8'h74 == pc[7:0] ? 8'h0 : _GEN_331; // @[Cat.scala 29:58]
  wire [7:0] _GEN_333 = 8'h75 == pc[7:0] ? 8'h0 : _GEN_332; // @[Cat.scala 29:58]
  wire [7:0] _GEN_334 = 8'h76 == pc[7:0] ? 8'h0 : _GEN_333; // @[Cat.scala 29:58]
  wire [7:0] _GEN_335 = 8'h77 == pc[7:0] ? 8'h0 : _GEN_334; // @[Cat.scala 29:58]
  wire [7:0] _GEN_336 = 8'h78 == pc[7:0] ? 8'h0 : _GEN_335; // @[Cat.scala 29:58]
  wire [7:0] _GEN_337 = 8'h79 == pc[7:0] ? 8'h0 : _GEN_336; // @[Cat.scala 29:58]
  wire [7:0] _GEN_338 = 8'h7a == pc[7:0] ? 8'h0 : _GEN_337; // @[Cat.scala 29:58]
  wire [7:0] _GEN_339 = 8'h7b == pc[7:0] ? 8'h0 : _GEN_338; // @[Cat.scala 29:58]
  wire [7:0] _GEN_340 = 8'h7c == pc[7:0] ? 8'h0 : _GEN_339; // @[Cat.scala 29:58]
  wire [7:0] _GEN_341 = 8'h7d == pc[7:0] ? 8'h0 : _GEN_340; // @[Cat.scala 29:58]
  wire [7:0] _GEN_342 = 8'h7e == pc[7:0] ? 8'h0 : _GEN_341; // @[Cat.scala 29:58]
  wire [7:0] _GEN_343 = 8'h7f == pc[7:0] ? 8'h0 : _GEN_342; // @[Cat.scala 29:58]
  wire [7:0] _GEN_344 = 8'h80 == pc[7:0] ? 8'h0 : _GEN_343; // @[Cat.scala 29:58]
  wire [7:0] _GEN_345 = 8'h81 == pc[7:0] ? 8'h0 : _GEN_344; // @[Cat.scala 29:58]
  wire [7:0] _GEN_346 = 8'h82 == pc[7:0] ? 8'h0 : _GEN_345; // @[Cat.scala 29:58]
  wire [7:0] _GEN_347 = 8'h83 == pc[7:0] ? 8'h0 : _GEN_346; // @[Cat.scala 29:58]
  wire [7:0] _GEN_348 = 8'h84 == pc[7:0] ? 8'h0 : _GEN_347; // @[Cat.scala 29:58]
  wire [7:0] _GEN_349 = 8'h85 == pc[7:0] ? 8'h0 : _GEN_348; // @[Cat.scala 29:58]
  wire [7:0] _GEN_350 = 8'h86 == pc[7:0] ? 8'h0 : _GEN_349; // @[Cat.scala 29:58]
  wire [7:0] _GEN_351 = 8'h87 == pc[7:0] ? 8'h0 : _GEN_350; // @[Cat.scala 29:58]
  wire [7:0] _GEN_352 = 8'h88 == pc[7:0] ? 8'h0 : _GEN_351; // @[Cat.scala 29:58]
  wire [7:0] _GEN_353 = 8'h89 == pc[7:0] ? 8'h0 : _GEN_352; // @[Cat.scala 29:58]
  wire [7:0] _GEN_354 = 8'h8a == pc[7:0] ? 8'h0 : _GEN_353; // @[Cat.scala 29:58]
  wire [7:0] _GEN_355 = 8'h8b == pc[7:0] ? 8'h0 : _GEN_354; // @[Cat.scala 29:58]
  wire [7:0] _GEN_356 = 8'h8c == pc[7:0] ? 8'h0 : _GEN_355; // @[Cat.scala 29:58]
  wire [7:0] _GEN_357 = 8'h8d == pc[7:0] ? 8'h0 : _GEN_356; // @[Cat.scala 29:58]
  wire [7:0] _GEN_358 = 8'h8e == pc[7:0] ? 8'h0 : _GEN_357; // @[Cat.scala 29:58]
  wire [7:0] _GEN_359 = 8'h8f == pc[7:0] ? 8'h0 : _GEN_358; // @[Cat.scala 29:58]
  wire [7:0] _GEN_360 = 8'h90 == pc[7:0] ? 8'h0 : _GEN_359; // @[Cat.scala 29:58]
  wire [7:0] _GEN_361 = 8'h91 == pc[7:0] ? 8'h0 : _GEN_360; // @[Cat.scala 29:58]
  wire [7:0] _GEN_362 = 8'h92 == pc[7:0] ? 8'h0 : _GEN_361; // @[Cat.scala 29:58]
  wire [7:0] _GEN_363 = 8'h93 == pc[7:0] ? 8'h0 : _GEN_362; // @[Cat.scala 29:58]
  wire [7:0] _GEN_364 = 8'h94 == pc[7:0] ? 8'h0 : _GEN_363; // @[Cat.scala 29:58]
  wire [7:0] _GEN_365 = 8'h95 == pc[7:0] ? 8'h0 : _GEN_364; // @[Cat.scala 29:58]
  wire [7:0] _GEN_366 = 8'h96 == pc[7:0] ? 8'h0 : _GEN_365; // @[Cat.scala 29:58]
  wire [7:0] _GEN_367 = 8'h97 == pc[7:0] ? 8'h0 : _GEN_366; // @[Cat.scala 29:58]
  wire [7:0] _GEN_368 = 8'h98 == pc[7:0] ? 8'h0 : _GEN_367; // @[Cat.scala 29:58]
  wire [7:0] _GEN_369 = 8'h99 == pc[7:0] ? 8'h0 : _GEN_368; // @[Cat.scala 29:58]
  wire [7:0] _GEN_370 = 8'h9a == pc[7:0] ? 8'h0 : _GEN_369; // @[Cat.scala 29:58]
  wire [7:0] _GEN_371 = 8'h9b == pc[7:0] ? 8'h0 : _GEN_370; // @[Cat.scala 29:58]
  wire [7:0] _GEN_372 = 8'h9c == pc[7:0] ? 8'h0 : _GEN_371; // @[Cat.scala 29:58]
  wire [7:0] _GEN_373 = 8'h9d == pc[7:0] ? 8'h0 : _GEN_372; // @[Cat.scala 29:58]
  wire [7:0] _GEN_374 = 8'h9e == pc[7:0] ? 8'h0 : _GEN_373; // @[Cat.scala 29:58]
  wire [7:0] _GEN_375 = 8'h9f == pc[7:0] ? 8'h0 : _GEN_374; // @[Cat.scala 29:58]
  wire [7:0] _GEN_376 = 8'ha0 == pc[7:0] ? 8'h0 : _GEN_375; // @[Cat.scala 29:58]
  wire [7:0] _GEN_377 = 8'ha1 == pc[7:0] ? 8'h0 : _GEN_376; // @[Cat.scala 29:58]
  wire [7:0] _GEN_378 = 8'ha2 == pc[7:0] ? 8'h0 : _GEN_377; // @[Cat.scala 29:58]
  wire [7:0] _GEN_379 = 8'ha3 == pc[7:0] ? 8'h0 : _GEN_378; // @[Cat.scala 29:58]
  wire [7:0] _GEN_380 = 8'ha4 == pc[7:0] ? 8'h0 : _GEN_379; // @[Cat.scala 29:58]
  wire [7:0] _GEN_381 = 8'ha5 == pc[7:0] ? 8'h0 : _GEN_380; // @[Cat.scala 29:58]
  wire [7:0] _GEN_382 = 8'ha6 == pc[7:0] ? 8'h0 : _GEN_381; // @[Cat.scala 29:58]
  wire [7:0] _GEN_383 = 8'ha7 == pc[7:0] ? 8'h0 : _GEN_382; // @[Cat.scala 29:58]
  wire [7:0] _GEN_384 = 8'ha8 == pc[7:0] ? 8'h0 : _GEN_383; // @[Cat.scala 29:58]
  wire [7:0] _GEN_385 = 8'ha9 == pc[7:0] ? 8'h0 : _GEN_384; // @[Cat.scala 29:58]
  wire [7:0] _GEN_386 = 8'haa == pc[7:0] ? 8'h0 : _GEN_385; // @[Cat.scala 29:58]
  wire [7:0] _GEN_387 = 8'hab == pc[7:0] ? 8'h0 : _GEN_386; // @[Cat.scala 29:58]
  wire [7:0] _GEN_388 = 8'hac == pc[7:0] ? 8'h0 : _GEN_387; // @[Cat.scala 29:58]
  wire [7:0] _GEN_389 = 8'had == pc[7:0] ? 8'h0 : _GEN_388; // @[Cat.scala 29:58]
  wire [7:0] _GEN_390 = 8'hae == pc[7:0] ? 8'h0 : _GEN_389; // @[Cat.scala 29:58]
  wire [7:0] _GEN_391 = 8'haf == pc[7:0] ? 8'h0 : _GEN_390; // @[Cat.scala 29:58]
  wire [7:0] _GEN_392 = 8'hb0 == pc[7:0] ? 8'h0 : _GEN_391; // @[Cat.scala 29:58]
  wire [7:0] _GEN_393 = 8'hb1 == pc[7:0] ? 8'h0 : _GEN_392; // @[Cat.scala 29:58]
  wire [7:0] _GEN_394 = 8'hb2 == pc[7:0] ? 8'h0 : _GEN_393; // @[Cat.scala 29:58]
  wire [7:0] _GEN_395 = 8'hb3 == pc[7:0] ? 8'h0 : _GEN_394; // @[Cat.scala 29:58]
  wire [7:0] _GEN_396 = 8'hb4 == pc[7:0] ? 8'h0 : _GEN_395; // @[Cat.scala 29:58]
  wire [7:0] _GEN_397 = 8'hb5 == pc[7:0] ? 8'h0 : _GEN_396; // @[Cat.scala 29:58]
  wire [7:0] _GEN_398 = 8'hb6 == pc[7:0] ? 8'h0 : _GEN_397; // @[Cat.scala 29:58]
  wire [7:0] _GEN_399 = 8'hb7 == pc[7:0] ? 8'h0 : _GEN_398; // @[Cat.scala 29:58]
  wire [7:0] _GEN_400 = 8'hb8 == pc[7:0] ? 8'h0 : _GEN_399; // @[Cat.scala 29:58]
  wire [7:0] _GEN_401 = 8'hb9 == pc[7:0] ? 8'h0 : _GEN_400; // @[Cat.scala 29:58]
  wire [7:0] _GEN_402 = 8'hba == pc[7:0] ? 8'h0 : _GEN_401; // @[Cat.scala 29:58]
  wire [7:0] _GEN_403 = 8'hbb == pc[7:0] ? 8'h0 : _GEN_402; // @[Cat.scala 29:58]
  wire [7:0] _GEN_404 = 8'hbc == pc[7:0] ? 8'h0 : _GEN_403; // @[Cat.scala 29:58]
  wire [7:0] _GEN_405 = 8'hbd == pc[7:0] ? 8'h0 : _GEN_404; // @[Cat.scala 29:58]
  wire [7:0] _GEN_406 = 8'hbe == pc[7:0] ? 8'h0 : _GEN_405; // @[Cat.scala 29:58]
  wire [7:0] _GEN_407 = 8'hbf == pc[7:0] ? 8'h0 : _GEN_406; // @[Cat.scala 29:58]
  wire [7:0] _GEN_408 = 8'hc0 == pc[7:0] ? 8'h0 : _GEN_407; // @[Cat.scala 29:58]
  wire [7:0] _GEN_409 = 8'hc1 == pc[7:0] ? 8'h0 : _GEN_408; // @[Cat.scala 29:58]
  wire [7:0] _GEN_410 = 8'hc2 == pc[7:0] ? 8'h0 : _GEN_409; // @[Cat.scala 29:58]
  wire [7:0] _GEN_411 = 8'hc3 == pc[7:0] ? 8'h0 : _GEN_410; // @[Cat.scala 29:58]
  wire [7:0] _GEN_412 = 8'hc4 == pc[7:0] ? 8'h0 : _GEN_411; // @[Cat.scala 29:58]
  wire [7:0] _GEN_413 = 8'hc5 == pc[7:0] ? 8'h0 : _GEN_412; // @[Cat.scala 29:58]
  wire [7:0] _GEN_414 = 8'hc6 == pc[7:0] ? 8'h0 : _GEN_413; // @[Cat.scala 29:58]
  wire [7:0] _GEN_415 = 8'hc7 == pc[7:0] ? 8'h0 : _GEN_414; // @[Cat.scala 29:58]
  wire [7:0] _GEN_416 = 8'hc8 == pc[7:0] ? 8'h0 : _GEN_415; // @[Cat.scala 29:58]
  wire [7:0] _GEN_417 = 8'hc9 == pc[7:0] ? 8'h0 : _GEN_416; // @[Cat.scala 29:58]
  wire [7:0] _GEN_418 = 8'hca == pc[7:0] ? 8'h0 : _GEN_417; // @[Cat.scala 29:58]
  wire [7:0] _GEN_419 = 8'hcb == pc[7:0] ? 8'h0 : _GEN_418; // @[Cat.scala 29:58]
  wire [7:0] _GEN_420 = 8'hcc == pc[7:0] ? 8'h0 : _GEN_419; // @[Cat.scala 29:58]
  wire [7:0] _GEN_421 = 8'hcd == pc[7:0] ? 8'h0 : _GEN_420; // @[Cat.scala 29:58]
  wire [7:0] _GEN_422 = 8'hce == pc[7:0] ? 8'h0 : _GEN_421; // @[Cat.scala 29:58]
  wire [7:0] _GEN_423 = 8'hcf == pc[7:0] ? 8'h0 : _GEN_422; // @[Cat.scala 29:58]
  wire [7:0] _GEN_424 = 8'hd0 == pc[7:0] ? 8'h0 : _GEN_423; // @[Cat.scala 29:58]
  wire [7:0] _GEN_425 = 8'hd1 == pc[7:0] ? 8'h0 : _GEN_424; // @[Cat.scala 29:58]
  wire [7:0] _GEN_426 = 8'hd2 == pc[7:0] ? 8'h0 : _GEN_425; // @[Cat.scala 29:58]
  wire [7:0] _GEN_427 = 8'hd3 == pc[7:0] ? 8'h0 : _GEN_426; // @[Cat.scala 29:58]
  wire [7:0] _GEN_428 = 8'hd4 == pc[7:0] ? 8'h0 : _GEN_427; // @[Cat.scala 29:58]
  wire [7:0] _GEN_429 = 8'hd5 == pc[7:0] ? 8'h0 : _GEN_428; // @[Cat.scala 29:58]
  wire [7:0] _GEN_430 = 8'hd6 == pc[7:0] ? 8'h0 : _GEN_429; // @[Cat.scala 29:58]
  wire [7:0] _GEN_431 = 8'hd7 == pc[7:0] ? 8'h0 : _GEN_430; // @[Cat.scala 29:58]
  wire [7:0] _GEN_433 = 8'h1 == _T_1[7:0] ? 8'h9 : 8'h13; // @[Cat.scala 29:58]
  wire [7:0] _GEN_434 = 8'h2 == _T_1[7:0] ? 8'h0 : _GEN_433; // @[Cat.scala 29:58]
  wire [7:0] _GEN_435 = 8'h3 == _T_1[7:0] ? 8'h0 : _GEN_434; // @[Cat.scala 29:58]
  wire [7:0] _GEN_436 = 8'h4 == _T_1[7:0] ? 8'h13 : _GEN_435; // @[Cat.scala 29:58]
  wire [7:0] _GEN_437 = 8'h5 == _T_1[7:0] ? 8'h9 : _GEN_436; // @[Cat.scala 29:58]
  wire [7:0] _GEN_438 = 8'h6 == _T_1[7:0] ? 8'h19 : _GEN_437; // @[Cat.scala 29:58]
  wire [7:0] _GEN_439 = 8'h7 == _T_1[7:0] ? 8'h0 : _GEN_438; // @[Cat.scala 29:58]
  wire [7:0] _GEN_440 = 8'h8 == _T_1[7:0] ? 8'h23 : _GEN_439; // @[Cat.scala 29:58]
  wire [7:0] _GEN_441 = 8'h9 == _T_1[7:0] ? 8'h20 : _GEN_440; // @[Cat.scala 29:58]
  wire [7:0] _GEN_442 = 8'ha == _T_1[7:0] ? 8'h20 : _GEN_441; // @[Cat.scala 29:58]
  wire [7:0] _GEN_443 = 8'hb == _T_1[7:0] ? 8'h51 : _GEN_442; // @[Cat.scala 29:58]
  wire [7:0] _GEN_444 = 8'hc == _T_1[7:0] ? 8'h6f : _GEN_443; // @[Cat.scala 29:58]
  wire [7:0] _GEN_445 = 8'hd == _T_1[7:0] ? 8'hf0 : _GEN_444; // @[Cat.scala 29:58]
  wire [7:0] _GEN_446 = 8'he == _T_1[7:0] ? 8'h9f : _GEN_445; // @[Cat.scala 29:58]
  wire [7:0] _GEN_447 = 8'hf == _T_1[7:0] ? 8'hff : _GEN_446; // @[Cat.scala 29:58]
  wire [7:0] _GEN_448 = 8'h10 == _T_1[7:0] ? 8'h0 : _GEN_447; // @[Cat.scala 29:58]
  wire [7:0] _GEN_449 = 8'h11 == _T_1[7:0] ? 8'h0 : _GEN_448; // @[Cat.scala 29:58]
  wire [7:0] _GEN_450 = 8'h12 == _T_1[7:0] ? 8'h0 : _GEN_449; // @[Cat.scala 29:58]
  wire [7:0] _GEN_451 = 8'h13 == _T_1[7:0] ? 8'h0 : _GEN_450; // @[Cat.scala 29:58]
  wire [7:0] _GEN_452 = 8'h14 == _T_1[7:0] ? 8'h0 : _GEN_451; // @[Cat.scala 29:58]
  wire [7:0] _GEN_453 = 8'h15 == _T_1[7:0] ? 8'h0 : _GEN_452; // @[Cat.scala 29:58]
  wire [7:0] _GEN_454 = 8'h16 == _T_1[7:0] ? 8'h0 : _GEN_453; // @[Cat.scala 29:58]
  wire [7:0] _GEN_455 = 8'h17 == _T_1[7:0] ? 8'h0 : _GEN_454; // @[Cat.scala 29:58]
  wire [7:0] _GEN_456 = 8'h18 == _T_1[7:0] ? 8'h0 : _GEN_455; // @[Cat.scala 29:58]
  wire [7:0] _GEN_457 = 8'h19 == _T_1[7:0] ? 8'h0 : _GEN_456; // @[Cat.scala 29:58]
  wire [7:0] _GEN_458 = 8'h1a == _T_1[7:0] ? 8'h0 : _GEN_457; // @[Cat.scala 29:58]
  wire [7:0] _GEN_459 = 8'h1b == _T_1[7:0] ? 8'h0 : _GEN_458; // @[Cat.scala 29:58]
  wire [7:0] _GEN_460 = 8'h1c == _T_1[7:0] ? 8'h0 : _GEN_459; // @[Cat.scala 29:58]
  wire [7:0] _GEN_461 = 8'h1d == _T_1[7:0] ? 8'h0 : _GEN_460; // @[Cat.scala 29:58]
  wire [7:0] _GEN_462 = 8'h1e == _T_1[7:0] ? 8'h0 : _GEN_461; // @[Cat.scala 29:58]
  wire [7:0] _GEN_463 = 8'h1f == _T_1[7:0] ? 8'h0 : _GEN_462; // @[Cat.scala 29:58]
  wire [7:0] _GEN_464 = 8'h20 == _T_1[7:0] ? 8'h0 : _GEN_463; // @[Cat.scala 29:58]
  wire [7:0] _GEN_465 = 8'h21 == _T_1[7:0] ? 8'h0 : _GEN_464; // @[Cat.scala 29:58]
  wire [7:0] _GEN_466 = 8'h22 == _T_1[7:0] ? 8'h0 : _GEN_465; // @[Cat.scala 29:58]
  wire [7:0] _GEN_467 = 8'h23 == _T_1[7:0] ? 8'h0 : _GEN_466; // @[Cat.scala 29:58]
  wire [7:0] _GEN_468 = 8'h24 == _T_1[7:0] ? 8'h0 : _GEN_467; // @[Cat.scala 29:58]
  wire [7:0] _GEN_469 = 8'h25 == _T_1[7:0] ? 8'h0 : _GEN_468; // @[Cat.scala 29:58]
  wire [7:0] _GEN_470 = 8'h26 == _T_1[7:0] ? 8'h0 : _GEN_469; // @[Cat.scala 29:58]
  wire [7:0] _GEN_471 = 8'h27 == _T_1[7:0] ? 8'h0 : _GEN_470; // @[Cat.scala 29:58]
  wire [7:0] _GEN_472 = 8'h28 == _T_1[7:0] ? 8'h0 : _GEN_471; // @[Cat.scala 29:58]
  wire [7:0] _GEN_473 = 8'h29 == _T_1[7:0] ? 8'h0 : _GEN_472; // @[Cat.scala 29:58]
  wire [7:0] _GEN_474 = 8'h2a == _T_1[7:0] ? 8'h0 : _GEN_473; // @[Cat.scala 29:58]
  wire [7:0] _GEN_475 = 8'h2b == _T_1[7:0] ? 8'h0 : _GEN_474; // @[Cat.scala 29:58]
  wire [7:0] _GEN_476 = 8'h2c == _T_1[7:0] ? 8'h0 : _GEN_475; // @[Cat.scala 29:58]
  wire [7:0] _GEN_477 = 8'h2d == _T_1[7:0] ? 8'h0 : _GEN_476; // @[Cat.scala 29:58]
  wire [7:0] _GEN_478 = 8'h2e == _T_1[7:0] ? 8'h0 : _GEN_477; // @[Cat.scala 29:58]
  wire [7:0] _GEN_479 = 8'h2f == _T_1[7:0] ? 8'h0 : _GEN_478; // @[Cat.scala 29:58]
  wire [7:0] _GEN_480 = 8'h30 == _T_1[7:0] ? 8'h0 : _GEN_479; // @[Cat.scala 29:58]
  wire [7:0] _GEN_481 = 8'h31 == _T_1[7:0] ? 8'h0 : _GEN_480; // @[Cat.scala 29:58]
  wire [7:0] _GEN_482 = 8'h32 == _T_1[7:0] ? 8'h0 : _GEN_481; // @[Cat.scala 29:58]
  wire [7:0] _GEN_483 = 8'h33 == _T_1[7:0] ? 8'h0 : _GEN_482; // @[Cat.scala 29:58]
  wire [7:0] _GEN_484 = 8'h34 == _T_1[7:0] ? 8'h0 : _GEN_483; // @[Cat.scala 29:58]
  wire [7:0] _GEN_485 = 8'h35 == _T_1[7:0] ? 8'h0 : _GEN_484; // @[Cat.scala 29:58]
  wire [7:0] _GEN_486 = 8'h36 == _T_1[7:0] ? 8'h0 : _GEN_485; // @[Cat.scala 29:58]
  wire [7:0] _GEN_487 = 8'h37 == _T_1[7:0] ? 8'h0 : _GEN_486; // @[Cat.scala 29:58]
  wire [7:0] _GEN_488 = 8'h38 == _T_1[7:0] ? 8'h0 : _GEN_487; // @[Cat.scala 29:58]
  wire [7:0] _GEN_489 = 8'h39 == _T_1[7:0] ? 8'h0 : _GEN_488; // @[Cat.scala 29:58]
  wire [7:0] _GEN_490 = 8'h3a == _T_1[7:0] ? 8'h0 : _GEN_489; // @[Cat.scala 29:58]
  wire [7:0] _GEN_491 = 8'h3b == _T_1[7:0] ? 8'h0 : _GEN_490; // @[Cat.scala 29:58]
  wire [7:0] _GEN_492 = 8'h3c == _T_1[7:0] ? 8'h0 : _GEN_491; // @[Cat.scala 29:58]
  wire [7:0] _GEN_493 = 8'h3d == _T_1[7:0] ? 8'h0 : _GEN_492; // @[Cat.scala 29:58]
  wire [7:0] _GEN_494 = 8'h3e == _T_1[7:0] ? 8'h0 : _GEN_493; // @[Cat.scala 29:58]
  wire [7:0] _GEN_495 = 8'h3f == _T_1[7:0] ? 8'h0 : _GEN_494; // @[Cat.scala 29:58]
  wire [7:0] _GEN_496 = 8'h40 == _T_1[7:0] ? 8'h0 : _GEN_495; // @[Cat.scala 29:58]
  wire [7:0] _GEN_497 = 8'h41 == _T_1[7:0] ? 8'h0 : _GEN_496; // @[Cat.scala 29:58]
  wire [7:0] _GEN_498 = 8'h42 == _T_1[7:0] ? 8'h0 : _GEN_497; // @[Cat.scala 29:58]
  wire [7:0] _GEN_499 = 8'h43 == _T_1[7:0] ? 8'h0 : _GEN_498; // @[Cat.scala 29:58]
  wire [7:0] _GEN_500 = 8'h44 == _T_1[7:0] ? 8'h0 : _GEN_499; // @[Cat.scala 29:58]
  wire [7:0] _GEN_501 = 8'h45 == _T_1[7:0] ? 8'h0 : _GEN_500; // @[Cat.scala 29:58]
  wire [7:0] _GEN_502 = 8'h46 == _T_1[7:0] ? 8'h0 : _GEN_501; // @[Cat.scala 29:58]
  wire [7:0] _GEN_503 = 8'h47 == _T_1[7:0] ? 8'h0 : _GEN_502; // @[Cat.scala 29:58]
  wire [7:0] _GEN_504 = 8'h48 == _T_1[7:0] ? 8'h0 : _GEN_503; // @[Cat.scala 29:58]
  wire [7:0] _GEN_505 = 8'h49 == _T_1[7:0] ? 8'h0 : _GEN_504; // @[Cat.scala 29:58]
  wire [7:0] _GEN_506 = 8'h4a == _T_1[7:0] ? 8'h0 : _GEN_505; // @[Cat.scala 29:58]
  wire [7:0] _GEN_507 = 8'h4b == _T_1[7:0] ? 8'h0 : _GEN_506; // @[Cat.scala 29:58]
  wire [7:0] _GEN_508 = 8'h4c == _T_1[7:0] ? 8'h0 : _GEN_507; // @[Cat.scala 29:58]
  wire [7:0] _GEN_509 = 8'h4d == _T_1[7:0] ? 8'h0 : _GEN_508; // @[Cat.scala 29:58]
  wire [7:0] _GEN_510 = 8'h4e == _T_1[7:0] ? 8'h0 : _GEN_509; // @[Cat.scala 29:58]
  wire [7:0] _GEN_511 = 8'h4f == _T_1[7:0] ? 8'h0 : _GEN_510; // @[Cat.scala 29:58]
  wire [7:0] _GEN_512 = 8'h50 == _T_1[7:0] ? 8'h0 : _GEN_511; // @[Cat.scala 29:58]
  wire [7:0] _GEN_513 = 8'h51 == _T_1[7:0] ? 8'h0 : _GEN_512; // @[Cat.scala 29:58]
  wire [7:0] _GEN_514 = 8'h52 == _T_1[7:0] ? 8'h0 : _GEN_513; // @[Cat.scala 29:58]
  wire [7:0] _GEN_515 = 8'h53 == _T_1[7:0] ? 8'h0 : _GEN_514; // @[Cat.scala 29:58]
  wire [7:0] _GEN_516 = 8'h54 == _T_1[7:0] ? 8'h0 : _GEN_515; // @[Cat.scala 29:58]
  wire [7:0] _GEN_517 = 8'h55 == _T_1[7:0] ? 8'h0 : _GEN_516; // @[Cat.scala 29:58]
  wire [7:0] _GEN_518 = 8'h56 == _T_1[7:0] ? 8'h0 : _GEN_517; // @[Cat.scala 29:58]
  wire [7:0] _GEN_519 = 8'h57 == _T_1[7:0] ? 8'h0 : _GEN_518; // @[Cat.scala 29:58]
  wire [7:0] _GEN_520 = 8'h58 == _T_1[7:0] ? 8'h0 : _GEN_519; // @[Cat.scala 29:58]
  wire [7:0] _GEN_521 = 8'h59 == _T_1[7:0] ? 8'h0 : _GEN_520; // @[Cat.scala 29:58]
  wire [7:0] _GEN_522 = 8'h5a == _T_1[7:0] ? 8'h0 : _GEN_521; // @[Cat.scala 29:58]
  wire [7:0] _GEN_523 = 8'h5b == _T_1[7:0] ? 8'h0 : _GEN_522; // @[Cat.scala 29:58]
  wire [7:0] _GEN_524 = 8'h5c == _T_1[7:0] ? 8'h0 : _GEN_523; // @[Cat.scala 29:58]
  wire [7:0] _GEN_525 = 8'h5d == _T_1[7:0] ? 8'h0 : _GEN_524; // @[Cat.scala 29:58]
  wire [7:0] _GEN_526 = 8'h5e == _T_1[7:0] ? 8'h0 : _GEN_525; // @[Cat.scala 29:58]
  wire [7:0] _GEN_527 = 8'h5f == _T_1[7:0] ? 8'h0 : _GEN_526; // @[Cat.scala 29:58]
  wire [7:0] _GEN_528 = 8'h60 == _T_1[7:0] ? 8'h0 : _GEN_527; // @[Cat.scala 29:58]
  wire [7:0] _GEN_529 = 8'h61 == _T_1[7:0] ? 8'h0 : _GEN_528; // @[Cat.scala 29:58]
  wire [7:0] _GEN_530 = 8'h62 == _T_1[7:0] ? 8'h0 : _GEN_529; // @[Cat.scala 29:58]
  wire [7:0] _GEN_531 = 8'h63 == _T_1[7:0] ? 8'h0 : _GEN_530; // @[Cat.scala 29:58]
  wire [7:0] _GEN_532 = 8'h64 == _T_1[7:0] ? 8'h0 : _GEN_531; // @[Cat.scala 29:58]
  wire [7:0] _GEN_533 = 8'h65 == _T_1[7:0] ? 8'h0 : _GEN_532; // @[Cat.scala 29:58]
  wire [7:0] _GEN_534 = 8'h66 == _T_1[7:0] ? 8'h0 : _GEN_533; // @[Cat.scala 29:58]
  wire [7:0] _GEN_535 = 8'h67 == _T_1[7:0] ? 8'h0 : _GEN_534; // @[Cat.scala 29:58]
  wire [7:0] _GEN_536 = 8'h68 == _T_1[7:0] ? 8'h0 : _GEN_535; // @[Cat.scala 29:58]
  wire [7:0] _GEN_537 = 8'h69 == _T_1[7:0] ? 8'h0 : _GEN_536; // @[Cat.scala 29:58]
  wire [7:0] _GEN_538 = 8'h6a == _T_1[7:0] ? 8'h0 : _GEN_537; // @[Cat.scala 29:58]
  wire [7:0] _GEN_539 = 8'h6b == _T_1[7:0] ? 8'h0 : _GEN_538; // @[Cat.scala 29:58]
  wire [7:0] _GEN_540 = 8'h6c == _T_1[7:0] ? 8'h0 : _GEN_539; // @[Cat.scala 29:58]
  wire [7:0] _GEN_541 = 8'h6d == _T_1[7:0] ? 8'h0 : _GEN_540; // @[Cat.scala 29:58]
  wire [7:0] _GEN_542 = 8'h6e == _T_1[7:0] ? 8'h0 : _GEN_541; // @[Cat.scala 29:58]
  wire [7:0] _GEN_543 = 8'h6f == _T_1[7:0] ? 8'h0 : _GEN_542; // @[Cat.scala 29:58]
  wire [7:0] _GEN_544 = 8'h70 == _T_1[7:0] ? 8'h0 : _GEN_543; // @[Cat.scala 29:58]
  wire [7:0] _GEN_545 = 8'h71 == _T_1[7:0] ? 8'h0 : _GEN_544; // @[Cat.scala 29:58]
  wire [7:0] _GEN_546 = 8'h72 == _T_1[7:0] ? 8'h0 : _GEN_545; // @[Cat.scala 29:58]
  wire [7:0] _GEN_547 = 8'h73 == _T_1[7:0] ? 8'h0 : _GEN_546; // @[Cat.scala 29:58]
  wire [7:0] _GEN_548 = 8'h74 == _T_1[7:0] ? 8'h0 : _GEN_547; // @[Cat.scala 29:58]
  wire [7:0] _GEN_549 = 8'h75 == _T_1[7:0] ? 8'h0 : _GEN_548; // @[Cat.scala 29:58]
  wire [7:0] _GEN_550 = 8'h76 == _T_1[7:0] ? 8'h0 : _GEN_549; // @[Cat.scala 29:58]
  wire [7:0] _GEN_551 = 8'h77 == _T_1[7:0] ? 8'h0 : _GEN_550; // @[Cat.scala 29:58]
  wire [7:0] _GEN_552 = 8'h78 == _T_1[7:0] ? 8'h0 : _GEN_551; // @[Cat.scala 29:58]
  wire [7:0] _GEN_553 = 8'h79 == _T_1[7:0] ? 8'h0 : _GEN_552; // @[Cat.scala 29:58]
  wire [7:0] _GEN_554 = 8'h7a == _T_1[7:0] ? 8'h0 : _GEN_553; // @[Cat.scala 29:58]
  wire [7:0] _GEN_555 = 8'h7b == _T_1[7:0] ? 8'h0 : _GEN_554; // @[Cat.scala 29:58]
  wire [7:0] _GEN_556 = 8'h7c == _T_1[7:0] ? 8'h0 : _GEN_555; // @[Cat.scala 29:58]
  wire [7:0] _GEN_557 = 8'h7d == _T_1[7:0] ? 8'h0 : _GEN_556; // @[Cat.scala 29:58]
  wire [7:0] _GEN_558 = 8'h7e == _T_1[7:0] ? 8'h0 : _GEN_557; // @[Cat.scala 29:58]
  wire [7:0] _GEN_559 = 8'h7f == _T_1[7:0] ? 8'h0 : _GEN_558; // @[Cat.scala 29:58]
  wire [7:0] _GEN_560 = 8'h80 == _T_1[7:0] ? 8'h0 : _GEN_559; // @[Cat.scala 29:58]
  wire [7:0] _GEN_561 = 8'h81 == _T_1[7:0] ? 8'h0 : _GEN_560; // @[Cat.scala 29:58]
  wire [7:0] _GEN_562 = 8'h82 == _T_1[7:0] ? 8'h0 : _GEN_561; // @[Cat.scala 29:58]
  wire [7:0] _GEN_563 = 8'h83 == _T_1[7:0] ? 8'h0 : _GEN_562; // @[Cat.scala 29:58]
  wire [7:0] _GEN_564 = 8'h84 == _T_1[7:0] ? 8'h0 : _GEN_563; // @[Cat.scala 29:58]
  wire [7:0] _GEN_565 = 8'h85 == _T_1[7:0] ? 8'h0 : _GEN_564; // @[Cat.scala 29:58]
  wire [7:0] _GEN_566 = 8'h86 == _T_1[7:0] ? 8'h0 : _GEN_565; // @[Cat.scala 29:58]
  wire [7:0] _GEN_567 = 8'h87 == _T_1[7:0] ? 8'h0 : _GEN_566; // @[Cat.scala 29:58]
  wire [7:0] _GEN_568 = 8'h88 == _T_1[7:0] ? 8'h0 : _GEN_567; // @[Cat.scala 29:58]
  wire [7:0] _GEN_569 = 8'h89 == _T_1[7:0] ? 8'h0 : _GEN_568; // @[Cat.scala 29:58]
  wire [7:0] _GEN_570 = 8'h8a == _T_1[7:0] ? 8'h0 : _GEN_569; // @[Cat.scala 29:58]
  wire [7:0] _GEN_571 = 8'h8b == _T_1[7:0] ? 8'h0 : _GEN_570; // @[Cat.scala 29:58]
  wire [7:0] _GEN_572 = 8'h8c == _T_1[7:0] ? 8'h0 : _GEN_571; // @[Cat.scala 29:58]
  wire [7:0] _GEN_573 = 8'h8d == _T_1[7:0] ? 8'h0 : _GEN_572; // @[Cat.scala 29:58]
  wire [7:0] _GEN_574 = 8'h8e == _T_1[7:0] ? 8'h0 : _GEN_573; // @[Cat.scala 29:58]
  wire [7:0] _GEN_575 = 8'h8f == _T_1[7:0] ? 8'h0 : _GEN_574; // @[Cat.scala 29:58]
  wire [7:0] _GEN_576 = 8'h90 == _T_1[7:0] ? 8'h0 : _GEN_575; // @[Cat.scala 29:58]
  wire [7:0] _GEN_577 = 8'h91 == _T_1[7:0] ? 8'h0 : _GEN_576; // @[Cat.scala 29:58]
  wire [7:0] _GEN_578 = 8'h92 == _T_1[7:0] ? 8'h0 : _GEN_577; // @[Cat.scala 29:58]
  wire [7:0] _GEN_579 = 8'h93 == _T_1[7:0] ? 8'h0 : _GEN_578; // @[Cat.scala 29:58]
  wire [7:0] _GEN_580 = 8'h94 == _T_1[7:0] ? 8'h0 : _GEN_579; // @[Cat.scala 29:58]
  wire [7:0] _GEN_581 = 8'h95 == _T_1[7:0] ? 8'h0 : _GEN_580; // @[Cat.scala 29:58]
  wire [7:0] _GEN_582 = 8'h96 == _T_1[7:0] ? 8'h0 : _GEN_581; // @[Cat.scala 29:58]
  wire [7:0] _GEN_583 = 8'h97 == _T_1[7:0] ? 8'h0 : _GEN_582; // @[Cat.scala 29:58]
  wire [7:0] _GEN_584 = 8'h98 == _T_1[7:0] ? 8'h0 : _GEN_583; // @[Cat.scala 29:58]
  wire [7:0] _GEN_585 = 8'h99 == _T_1[7:0] ? 8'h0 : _GEN_584; // @[Cat.scala 29:58]
  wire [7:0] _GEN_586 = 8'h9a == _T_1[7:0] ? 8'h0 : _GEN_585; // @[Cat.scala 29:58]
  wire [7:0] _GEN_587 = 8'h9b == _T_1[7:0] ? 8'h0 : _GEN_586; // @[Cat.scala 29:58]
  wire [7:0] _GEN_588 = 8'h9c == _T_1[7:0] ? 8'h0 : _GEN_587; // @[Cat.scala 29:58]
  wire [7:0] _GEN_589 = 8'h9d == _T_1[7:0] ? 8'h0 : _GEN_588; // @[Cat.scala 29:58]
  wire [7:0] _GEN_590 = 8'h9e == _T_1[7:0] ? 8'h0 : _GEN_589; // @[Cat.scala 29:58]
  wire [7:0] _GEN_591 = 8'h9f == _T_1[7:0] ? 8'h0 : _GEN_590; // @[Cat.scala 29:58]
  wire [7:0] _GEN_592 = 8'ha0 == _T_1[7:0] ? 8'h0 : _GEN_591; // @[Cat.scala 29:58]
  wire [7:0] _GEN_593 = 8'ha1 == _T_1[7:0] ? 8'h0 : _GEN_592; // @[Cat.scala 29:58]
  wire [7:0] _GEN_594 = 8'ha2 == _T_1[7:0] ? 8'h0 : _GEN_593; // @[Cat.scala 29:58]
  wire [7:0] _GEN_595 = 8'ha3 == _T_1[7:0] ? 8'h0 : _GEN_594; // @[Cat.scala 29:58]
  wire [7:0] _GEN_596 = 8'ha4 == _T_1[7:0] ? 8'h0 : _GEN_595; // @[Cat.scala 29:58]
  wire [7:0] _GEN_597 = 8'ha5 == _T_1[7:0] ? 8'h0 : _GEN_596; // @[Cat.scala 29:58]
  wire [7:0] _GEN_598 = 8'ha6 == _T_1[7:0] ? 8'h0 : _GEN_597; // @[Cat.scala 29:58]
  wire [7:0] _GEN_599 = 8'ha7 == _T_1[7:0] ? 8'h0 : _GEN_598; // @[Cat.scala 29:58]
  wire [7:0] _GEN_600 = 8'ha8 == _T_1[7:0] ? 8'h0 : _GEN_599; // @[Cat.scala 29:58]
  wire [7:0] _GEN_601 = 8'ha9 == _T_1[7:0] ? 8'h0 : _GEN_600; // @[Cat.scala 29:58]
  wire [7:0] _GEN_602 = 8'haa == _T_1[7:0] ? 8'h0 : _GEN_601; // @[Cat.scala 29:58]
  wire [7:0] _GEN_603 = 8'hab == _T_1[7:0] ? 8'h0 : _GEN_602; // @[Cat.scala 29:58]
  wire [7:0] _GEN_604 = 8'hac == _T_1[7:0] ? 8'h0 : _GEN_603; // @[Cat.scala 29:58]
  wire [7:0] _GEN_605 = 8'had == _T_1[7:0] ? 8'h0 : _GEN_604; // @[Cat.scala 29:58]
  wire [7:0] _GEN_606 = 8'hae == _T_1[7:0] ? 8'h0 : _GEN_605; // @[Cat.scala 29:58]
  wire [7:0] _GEN_607 = 8'haf == _T_1[7:0] ? 8'h0 : _GEN_606; // @[Cat.scala 29:58]
  wire [7:0] _GEN_608 = 8'hb0 == _T_1[7:0] ? 8'h0 : _GEN_607; // @[Cat.scala 29:58]
  wire [7:0] _GEN_609 = 8'hb1 == _T_1[7:0] ? 8'h0 : _GEN_608; // @[Cat.scala 29:58]
  wire [7:0] _GEN_610 = 8'hb2 == _T_1[7:0] ? 8'h0 : _GEN_609; // @[Cat.scala 29:58]
  wire [7:0] _GEN_611 = 8'hb3 == _T_1[7:0] ? 8'h0 : _GEN_610; // @[Cat.scala 29:58]
  wire [7:0] _GEN_612 = 8'hb4 == _T_1[7:0] ? 8'h0 : _GEN_611; // @[Cat.scala 29:58]
  wire [7:0] _GEN_613 = 8'hb5 == _T_1[7:0] ? 8'h0 : _GEN_612; // @[Cat.scala 29:58]
  wire [7:0] _GEN_614 = 8'hb6 == _T_1[7:0] ? 8'h0 : _GEN_613; // @[Cat.scala 29:58]
  wire [7:0] _GEN_615 = 8'hb7 == _T_1[7:0] ? 8'h0 : _GEN_614; // @[Cat.scala 29:58]
  wire [7:0] _GEN_616 = 8'hb8 == _T_1[7:0] ? 8'h0 : _GEN_615; // @[Cat.scala 29:58]
  wire [7:0] _GEN_617 = 8'hb9 == _T_1[7:0] ? 8'h0 : _GEN_616; // @[Cat.scala 29:58]
  wire [7:0] _GEN_618 = 8'hba == _T_1[7:0] ? 8'h0 : _GEN_617; // @[Cat.scala 29:58]
  wire [7:0] _GEN_619 = 8'hbb == _T_1[7:0] ? 8'h0 : _GEN_618; // @[Cat.scala 29:58]
  wire [7:0] _GEN_620 = 8'hbc == _T_1[7:0] ? 8'h0 : _GEN_619; // @[Cat.scala 29:58]
  wire [7:0] _GEN_621 = 8'hbd == _T_1[7:0] ? 8'h0 : _GEN_620; // @[Cat.scala 29:58]
  wire [7:0] _GEN_622 = 8'hbe == _T_1[7:0] ? 8'h0 : _GEN_621; // @[Cat.scala 29:58]
  wire [7:0] _GEN_623 = 8'hbf == _T_1[7:0] ? 8'h0 : _GEN_622; // @[Cat.scala 29:58]
  wire [7:0] _GEN_624 = 8'hc0 == _T_1[7:0] ? 8'h0 : _GEN_623; // @[Cat.scala 29:58]
  wire [7:0] _GEN_625 = 8'hc1 == _T_1[7:0] ? 8'h0 : _GEN_624; // @[Cat.scala 29:58]
  wire [7:0] _GEN_626 = 8'hc2 == _T_1[7:0] ? 8'h0 : _GEN_625; // @[Cat.scala 29:58]
  wire [7:0] _GEN_627 = 8'hc3 == _T_1[7:0] ? 8'h0 : _GEN_626; // @[Cat.scala 29:58]
  wire [7:0] _GEN_628 = 8'hc4 == _T_1[7:0] ? 8'h0 : _GEN_627; // @[Cat.scala 29:58]
  wire [7:0] _GEN_629 = 8'hc5 == _T_1[7:0] ? 8'h0 : _GEN_628; // @[Cat.scala 29:58]
  wire [7:0] _GEN_630 = 8'hc6 == _T_1[7:0] ? 8'h0 : _GEN_629; // @[Cat.scala 29:58]
  wire [7:0] _GEN_631 = 8'hc7 == _T_1[7:0] ? 8'h0 : _GEN_630; // @[Cat.scala 29:58]
  wire [7:0] _GEN_632 = 8'hc8 == _T_1[7:0] ? 8'h0 : _GEN_631; // @[Cat.scala 29:58]
  wire [7:0] _GEN_633 = 8'hc9 == _T_1[7:0] ? 8'h0 : _GEN_632; // @[Cat.scala 29:58]
  wire [7:0] _GEN_634 = 8'hca == _T_1[7:0] ? 8'h0 : _GEN_633; // @[Cat.scala 29:58]
  wire [7:0] _GEN_635 = 8'hcb == _T_1[7:0] ? 8'h0 : _GEN_634; // @[Cat.scala 29:58]
  wire [7:0] _GEN_636 = 8'hcc == _T_1[7:0] ? 8'h0 : _GEN_635; // @[Cat.scala 29:58]
  wire [7:0] _GEN_637 = 8'hcd == _T_1[7:0] ? 8'h0 : _GEN_636; // @[Cat.scala 29:58]
  wire [7:0] _GEN_638 = 8'hce == _T_1[7:0] ? 8'h0 : _GEN_637; // @[Cat.scala 29:58]
  wire [7:0] _GEN_639 = 8'hcf == _T_1[7:0] ? 8'h0 : _GEN_638; // @[Cat.scala 29:58]
  wire [7:0] _GEN_640 = 8'hd0 == _T_1[7:0] ? 8'h0 : _GEN_639; // @[Cat.scala 29:58]
  wire [7:0] _GEN_641 = 8'hd1 == _T_1[7:0] ? 8'h0 : _GEN_640; // @[Cat.scala 29:58]
  wire [7:0] _GEN_642 = 8'hd2 == _T_1[7:0] ? 8'h0 : _GEN_641; // @[Cat.scala 29:58]
  wire [7:0] _GEN_643 = 8'hd3 == _T_1[7:0] ? 8'h0 : _GEN_642; // @[Cat.scala 29:58]
  wire [7:0] _GEN_644 = 8'hd4 == _T_1[7:0] ? 8'h0 : _GEN_643; // @[Cat.scala 29:58]
  wire [7:0] _GEN_645 = 8'hd5 == _T_1[7:0] ? 8'h0 : _GEN_644; // @[Cat.scala 29:58]
  wire [7:0] _GEN_646 = 8'hd6 == _T_1[7:0] ? 8'h0 : _GEN_645; // @[Cat.scala 29:58]
  wire [7:0] _GEN_647 = 8'hd7 == _T_1[7:0] ? 8'h0 : _GEN_646; // @[Cat.scala 29:58]
  wire [7:0] _GEN_649 = 8'h1 == _T_4[7:0] ? 8'h9 : 8'h13; // @[Cat.scala 29:58]
  wire [7:0] _GEN_650 = 8'h2 == _T_4[7:0] ? 8'h0 : _GEN_649; // @[Cat.scala 29:58]
  wire [7:0] _GEN_651 = 8'h3 == _T_4[7:0] ? 8'h0 : _GEN_650; // @[Cat.scala 29:58]
  wire [7:0] _GEN_652 = 8'h4 == _T_4[7:0] ? 8'h13 : _GEN_651; // @[Cat.scala 29:58]
  wire [7:0] _GEN_653 = 8'h5 == _T_4[7:0] ? 8'h9 : _GEN_652; // @[Cat.scala 29:58]
  wire [7:0] _GEN_654 = 8'h6 == _T_4[7:0] ? 8'h19 : _GEN_653; // @[Cat.scala 29:58]
  wire [7:0] _GEN_655 = 8'h7 == _T_4[7:0] ? 8'h0 : _GEN_654; // @[Cat.scala 29:58]
  wire [7:0] _GEN_656 = 8'h8 == _T_4[7:0] ? 8'h23 : _GEN_655; // @[Cat.scala 29:58]
  wire [7:0] _GEN_657 = 8'h9 == _T_4[7:0] ? 8'h20 : _GEN_656; // @[Cat.scala 29:58]
  wire [7:0] _GEN_658 = 8'ha == _T_4[7:0] ? 8'h20 : _GEN_657; // @[Cat.scala 29:58]
  wire [7:0] _GEN_659 = 8'hb == _T_4[7:0] ? 8'h51 : _GEN_658; // @[Cat.scala 29:58]
  wire [7:0] _GEN_660 = 8'hc == _T_4[7:0] ? 8'h6f : _GEN_659; // @[Cat.scala 29:58]
  wire [7:0] _GEN_661 = 8'hd == _T_4[7:0] ? 8'hf0 : _GEN_660; // @[Cat.scala 29:58]
  wire [7:0] _GEN_662 = 8'he == _T_4[7:0] ? 8'h9f : _GEN_661; // @[Cat.scala 29:58]
  wire [7:0] _GEN_663 = 8'hf == _T_4[7:0] ? 8'hff : _GEN_662; // @[Cat.scala 29:58]
  wire [7:0] _GEN_664 = 8'h10 == _T_4[7:0] ? 8'h0 : _GEN_663; // @[Cat.scala 29:58]
  wire [7:0] _GEN_665 = 8'h11 == _T_4[7:0] ? 8'h0 : _GEN_664; // @[Cat.scala 29:58]
  wire [7:0] _GEN_666 = 8'h12 == _T_4[7:0] ? 8'h0 : _GEN_665; // @[Cat.scala 29:58]
  wire [7:0] _GEN_667 = 8'h13 == _T_4[7:0] ? 8'h0 : _GEN_666; // @[Cat.scala 29:58]
  wire [7:0] _GEN_668 = 8'h14 == _T_4[7:0] ? 8'h0 : _GEN_667; // @[Cat.scala 29:58]
  wire [7:0] _GEN_669 = 8'h15 == _T_4[7:0] ? 8'h0 : _GEN_668; // @[Cat.scala 29:58]
  wire [7:0] _GEN_670 = 8'h16 == _T_4[7:0] ? 8'h0 : _GEN_669; // @[Cat.scala 29:58]
  wire [7:0] _GEN_671 = 8'h17 == _T_4[7:0] ? 8'h0 : _GEN_670; // @[Cat.scala 29:58]
  wire [7:0] _GEN_672 = 8'h18 == _T_4[7:0] ? 8'h0 : _GEN_671; // @[Cat.scala 29:58]
  wire [7:0] _GEN_673 = 8'h19 == _T_4[7:0] ? 8'h0 : _GEN_672; // @[Cat.scala 29:58]
  wire [7:0] _GEN_674 = 8'h1a == _T_4[7:0] ? 8'h0 : _GEN_673; // @[Cat.scala 29:58]
  wire [7:0] _GEN_675 = 8'h1b == _T_4[7:0] ? 8'h0 : _GEN_674; // @[Cat.scala 29:58]
  wire [7:0] _GEN_676 = 8'h1c == _T_4[7:0] ? 8'h0 : _GEN_675; // @[Cat.scala 29:58]
  wire [7:0] _GEN_677 = 8'h1d == _T_4[7:0] ? 8'h0 : _GEN_676; // @[Cat.scala 29:58]
  wire [7:0] _GEN_678 = 8'h1e == _T_4[7:0] ? 8'h0 : _GEN_677; // @[Cat.scala 29:58]
  wire [7:0] _GEN_679 = 8'h1f == _T_4[7:0] ? 8'h0 : _GEN_678; // @[Cat.scala 29:58]
  wire [7:0] _GEN_680 = 8'h20 == _T_4[7:0] ? 8'h0 : _GEN_679; // @[Cat.scala 29:58]
  wire [7:0] _GEN_681 = 8'h21 == _T_4[7:0] ? 8'h0 : _GEN_680; // @[Cat.scala 29:58]
  wire [7:0] _GEN_682 = 8'h22 == _T_4[7:0] ? 8'h0 : _GEN_681; // @[Cat.scala 29:58]
  wire [7:0] _GEN_683 = 8'h23 == _T_4[7:0] ? 8'h0 : _GEN_682; // @[Cat.scala 29:58]
  wire [7:0] _GEN_684 = 8'h24 == _T_4[7:0] ? 8'h0 : _GEN_683; // @[Cat.scala 29:58]
  wire [7:0] _GEN_685 = 8'h25 == _T_4[7:0] ? 8'h0 : _GEN_684; // @[Cat.scala 29:58]
  wire [7:0] _GEN_686 = 8'h26 == _T_4[7:0] ? 8'h0 : _GEN_685; // @[Cat.scala 29:58]
  wire [7:0] _GEN_687 = 8'h27 == _T_4[7:0] ? 8'h0 : _GEN_686; // @[Cat.scala 29:58]
  wire [7:0] _GEN_688 = 8'h28 == _T_4[7:0] ? 8'h0 : _GEN_687; // @[Cat.scala 29:58]
  wire [7:0] _GEN_689 = 8'h29 == _T_4[7:0] ? 8'h0 : _GEN_688; // @[Cat.scala 29:58]
  wire [7:0] _GEN_690 = 8'h2a == _T_4[7:0] ? 8'h0 : _GEN_689; // @[Cat.scala 29:58]
  wire [7:0] _GEN_691 = 8'h2b == _T_4[7:0] ? 8'h0 : _GEN_690; // @[Cat.scala 29:58]
  wire [7:0] _GEN_692 = 8'h2c == _T_4[7:0] ? 8'h0 : _GEN_691; // @[Cat.scala 29:58]
  wire [7:0] _GEN_693 = 8'h2d == _T_4[7:0] ? 8'h0 : _GEN_692; // @[Cat.scala 29:58]
  wire [7:0] _GEN_694 = 8'h2e == _T_4[7:0] ? 8'h0 : _GEN_693; // @[Cat.scala 29:58]
  wire [7:0] _GEN_695 = 8'h2f == _T_4[7:0] ? 8'h0 : _GEN_694; // @[Cat.scala 29:58]
  wire [7:0] _GEN_696 = 8'h30 == _T_4[7:0] ? 8'h0 : _GEN_695; // @[Cat.scala 29:58]
  wire [7:0] _GEN_697 = 8'h31 == _T_4[7:0] ? 8'h0 : _GEN_696; // @[Cat.scala 29:58]
  wire [7:0] _GEN_698 = 8'h32 == _T_4[7:0] ? 8'h0 : _GEN_697; // @[Cat.scala 29:58]
  wire [7:0] _GEN_699 = 8'h33 == _T_4[7:0] ? 8'h0 : _GEN_698; // @[Cat.scala 29:58]
  wire [7:0] _GEN_700 = 8'h34 == _T_4[7:0] ? 8'h0 : _GEN_699; // @[Cat.scala 29:58]
  wire [7:0] _GEN_701 = 8'h35 == _T_4[7:0] ? 8'h0 : _GEN_700; // @[Cat.scala 29:58]
  wire [7:0] _GEN_702 = 8'h36 == _T_4[7:0] ? 8'h0 : _GEN_701; // @[Cat.scala 29:58]
  wire [7:0] _GEN_703 = 8'h37 == _T_4[7:0] ? 8'h0 : _GEN_702; // @[Cat.scala 29:58]
  wire [7:0] _GEN_704 = 8'h38 == _T_4[7:0] ? 8'h0 : _GEN_703; // @[Cat.scala 29:58]
  wire [7:0] _GEN_705 = 8'h39 == _T_4[7:0] ? 8'h0 : _GEN_704; // @[Cat.scala 29:58]
  wire [7:0] _GEN_706 = 8'h3a == _T_4[7:0] ? 8'h0 : _GEN_705; // @[Cat.scala 29:58]
  wire [7:0] _GEN_707 = 8'h3b == _T_4[7:0] ? 8'h0 : _GEN_706; // @[Cat.scala 29:58]
  wire [7:0] _GEN_708 = 8'h3c == _T_4[7:0] ? 8'h0 : _GEN_707; // @[Cat.scala 29:58]
  wire [7:0] _GEN_709 = 8'h3d == _T_4[7:0] ? 8'h0 : _GEN_708; // @[Cat.scala 29:58]
  wire [7:0] _GEN_710 = 8'h3e == _T_4[7:0] ? 8'h0 : _GEN_709; // @[Cat.scala 29:58]
  wire [7:0] _GEN_711 = 8'h3f == _T_4[7:0] ? 8'h0 : _GEN_710; // @[Cat.scala 29:58]
  wire [7:0] _GEN_712 = 8'h40 == _T_4[7:0] ? 8'h0 : _GEN_711; // @[Cat.scala 29:58]
  wire [7:0] _GEN_713 = 8'h41 == _T_4[7:0] ? 8'h0 : _GEN_712; // @[Cat.scala 29:58]
  wire [7:0] _GEN_714 = 8'h42 == _T_4[7:0] ? 8'h0 : _GEN_713; // @[Cat.scala 29:58]
  wire [7:0] _GEN_715 = 8'h43 == _T_4[7:0] ? 8'h0 : _GEN_714; // @[Cat.scala 29:58]
  wire [7:0] _GEN_716 = 8'h44 == _T_4[7:0] ? 8'h0 : _GEN_715; // @[Cat.scala 29:58]
  wire [7:0] _GEN_717 = 8'h45 == _T_4[7:0] ? 8'h0 : _GEN_716; // @[Cat.scala 29:58]
  wire [7:0] _GEN_718 = 8'h46 == _T_4[7:0] ? 8'h0 : _GEN_717; // @[Cat.scala 29:58]
  wire [7:0] _GEN_719 = 8'h47 == _T_4[7:0] ? 8'h0 : _GEN_718; // @[Cat.scala 29:58]
  wire [7:0] _GEN_720 = 8'h48 == _T_4[7:0] ? 8'h0 : _GEN_719; // @[Cat.scala 29:58]
  wire [7:0] _GEN_721 = 8'h49 == _T_4[7:0] ? 8'h0 : _GEN_720; // @[Cat.scala 29:58]
  wire [7:0] _GEN_722 = 8'h4a == _T_4[7:0] ? 8'h0 : _GEN_721; // @[Cat.scala 29:58]
  wire [7:0] _GEN_723 = 8'h4b == _T_4[7:0] ? 8'h0 : _GEN_722; // @[Cat.scala 29:58]
  wire [7:0] _GEN_724 = 8'h4c == _T_4[7:0] ? 8'h0 : _GEN_723; // @[Cat.scala 29:58]
  wire [7:0] _GEN_725 = 8'h4d == _T_4[7:0] ? 8'h0 : _GEN_724; // @[Cat.scala 29:58]
  wire [7:0] _GEN_726 = 8'h4e == _T_4[7:0] ? 8'h0 : _GEN_725; // @[Cat.scala 29:58]
  wire [7:0] _GEN_727 = 8'h4f == _T_4[7:0] ? 8'h0 : _GEN_726; // @[Cat.scala 29:58]
  wire [7:0] _GEN_728 = 8'h50 == _T_4[7:0] ? 8'h0 : _GEN_727; // @[Cat.scala 29:58]
  wire [7:0] _GEN_729 = 8'h51 == _T_4[7:0] ? 8'h0 : _GEN_728; // @[Cat.scala 29:58]
  wire [7:0] _GEN_730 = 8'h52 == _T_4[7:0] ? 8'h0 : _GEN_729; // @[Cat.scala 29:58]
  wire [7:0] _GEN_731 = 8'h53 == _T_4[7:0] ? 8'h0 : _GEN_730; // @[Cat.scala 29:58]
  wire [7:0] _GEN_732 = 8'h54 == _T_4[7:0] ? 8'h0 : _GEN_731; // @[Cat.scala 29:58]
  wire [7:0] _GEN_733 = 8'h55 == _T_4[7:0] ? 8'h0 : _GEN_732; // @[Cat.scala 29:58]
  wire [7:0] _GEN_734 = 8'h56 == _T_4[7:0] ? 8'h0 : _GEN_733; // @[Cat.scala 29:58]
  wire [7:0] _GEN_735 = 8'h57 == _T_4[7:0] ? 8'h0 : _GEN_734; // @[Cat.scala 29:58]
  wire [7:0] _GEN_736 = 8'h58 == _T_4[7:0] ? 8'h0 : _GEN_735; // @[Cat.scala 29:58]
  wire [7:0] _GEN_737 = 8'h59 == _T_4[7:0] ? 8'h0 : _GEN_736; // @[Cat.scala 29:58]
  wire [7:0] _GEN_738 = 8'h5a == _T_4[7:0] ? 8'h0 : _GEN_737; // @[Cat.scala 29:58]
  wire [7:0] _GEN_739 = 8'h5b == _T_4[7:0] ? 8'h0 : _GEN_738; // @[Cat.scala 29:58]
  wire [7:0] _GEN_740 = 8'h5c == _T_4[7:0] ? 8'h0 : _GEN_739; // @[Cat.scala 29:58]
  wire [7:0] _GEN_741 = 8'h5d == _T_4[7:0] ? 8'h0 : _GEN_740; // @[Cat.scala 29:58]
  wire [7:0] _GEN_742 = 8'h5e == _T_4[7:0] ? 8'h0 : _GEN_741; // @[Cat.scala 29:58]
  wire [7:0] _GEN_743 = 8'h5f == _T_4[7:0] ? 8'h0 : _GEN_742; // @[Cat.scala 29:58]
  wire [7:0] _GEN_744 = 8'h60 == _T_4[7:0] ? 8'h0 : _GEN_743; // @[Cat.scala 29:58]
  wire [7:0] _GEN_745 = 8'h61 == _T_4[7:0] ? 8'h0 : _GEN_744; // @[Cat.scala 29:58]
  wire [7:0] _GEN_746 = 8'h62 == _T_4[7:0] ? 8'h0 : _GEN_745; // @[Cat.scala 29:58]
  wire [7:0] _GEN_747 = 8'h63 == _T_4[7:0] ? 8'h0 : _GEN_746; // @[Cat.scala 29:58]
  wire [7:0] _GEN_748 = 8'h64 == _T_4[7:0] ? 8'h0 : _GEN_747; // @[Cat.scala 29:58]
  wire [7:0] _GEN_749 = 8'h65 == _T_4[7:0] ? 8'h0 : _GEN_748; // @[Cat.scala 29:58]
  wire [7:0] _GEN_750 = 8'h66 == _T_4[7:0] ? 8'h0 : _GEN_749; // @[Cat.scala 29:58]
  wire [7:0] _GEN_751 = 8'h67 == _T_4[7:0] ? 8'h0 : _GEN_750; // @[Cat.scala 29:58]
  wire [7:0] _GEN_752 = 8'h68 == _T_4[7:0] ? 8'h0 : _GEN_751; // @[Cat.scala 29:58]
  wire [7:0] _GEN_753 = 8'h69 == _T_4[7:0] ? 8'h0 : _GEN_752; // @[Cat.scala 29:58]
  wire [7:0] _GEN_754 = 8'h6a == _T_4[7:0] ? 8'h0 : _GEN_753; // @[Cat.scala 29:58]
  wire [7:0] _GEN_755 = 8'h6b == _T_4[7:0] ? 8'h0 : _GEN_754; // @[Cat.scala 29:58]
  wire [7:0] _GEN_756 = 8'h6c == _T_4[7:0] ? 8'h0 : _GEN_755; // @[Cat.scala 29:58]
  wire [7:0] _GEN_757 = 8'h6d == _T_4[7:0] ? 8'h0 : _GEN_756; // @[Cat.scala 29:58]
  wire [7:0] _GEN_758 = 8'h6e == _T_4[7:0] ? 8'h0 : _GEN_757; // @[Cat.scala 29:58]
  wire [7:0] _GEN_759 = 8'h6f == _T_4[7:0] ? 8'h0 : _GEN_758; // @[Cat.scala 29:58]
  wire [7:0] _GEN_760 = 8'h70 == _T_4[7:0] ? 8'h0 : _GEN_759; // @[Cat.scala 29:58]
  wire [7:0] _GEN_761 = 8'h71 == _T_4[7:0] ? 8'h0 : _GEN_760; // @[Cat.scala 29:58]
  wire [7:0] _GEN_762 = 8'h72 == _T_4[7:0] ? 8'h0 : _GEN_761; // @[Cat.scala 29:58]
  wire [7:0] _GEN_763 = 8'h73 == _T_4[7:0] ? 8'h0 : _GEN_762; // @[Cat.scala 29:58]
  wire [7:0] _GEN_764 = 8'h74 == _T_4[7:0] ? 8'h0 : _GEN_763; // @[Cat.scala 29:58]
  wire [7:0] _GEN_765 = 8'h75 == _T_4[7:0] ? 8'h0 : _GEN_764; // @[Cat.scala 29:58]
  wire [7:0] _GEN_766 = 8'h76 == _T_4[7:0] ? 8'h0 : _GEN_765; // @[Cat.scala 29:58]
  wire [7:0] _GEN_767 = 8'h77 == _T_4[7:0] ? 8'h0 : _GEN_766; // @[Cat.scala 29:58]
  wire [7:0] _GEN_768 = 8'h78 == _T_4[7:0] ? 8'h0 : _GEN_767; // @[Cat.scala 29:58]
  wire [7:0] _GEN_769 = 8'h79 == _T_4[7:0] ? 8'h0 : _GEN_768; // @[Cat.scala 29:58]
  wire [7:0] _GEN_770 = 8'h7a == _T_4[7:0] ? 8'h0 : _GEN_769; // @[Cat.scala 29:58]
  wire [7:0] _GEN_771 = 8'h7b == _T_4[7:0] ? 8'h0 : _GEN_770; // @[Cat.scala 29:58]
  wire [7:0] _GEN_772 = 8'h7c == _T_4[7:0] ? 8'h0 : _GEN_771; // @[Cat.scala 29:58]
  wire [7:0] _GEN_773 = 8'h7d == _T_4[7:0] ? 8'h0 : _GEN_772; // @[Cat.scala 29:58]
  wire [7:0] _GEN_774 = 8'h7e == _T_4[7:0] ? 8'h0 : _GEN_773; // @[Cat.scala 29:58]
  wire [7:0] _GEN_775 = 8'h7f == _T_4[7:0] ? 8'h0 : _GEN_774; // @[Cat.scala 29:58]
  wire [7:0] _GEN_776 = 8'h80 == _T_4[7:0] ? 8'h0 : _GEN_775; // @[Cat.scala 29:58]
  wire [7:0] _GEN_777 = 8'h81 == _T_4[7:0] ? 8'h0 : _GEN_776; // @[Cat.scala 29:58]
  wire [7:0] _GEN_778 = 8'h82 == _T_4[7:0] ? 8'h0 : _GEN_777; // @[Cat.scala 29:58]
  wire [7:0] _GEN_779 = 8'h83 == _T_4[7:0] ? 8'h0 : _GEN_778; // @[Cat.scala 29:58]
  wire [7:0] _GEN_780 = 8'h84 == _T_4[7:0] ? 8'h0 : _GEN_779; // @[Cat.scala 29:58]
  wire [7:0] _GEN_781 = 8'h85 == _T_4[7:0] ? 8'h0 : _GEN_780; // @[Cat.scala 29:58]
  wire [7:0] _GEN_782 = 8'h86 == _T_4[7:0] ? 8'h0 : _GEN_781; // @[Cat.scala 29:58]
  wire [7:0] _GEN_783 = 8'h87 == _T_4[7:0] ? 8'h0 : _GEN_782; // @[Cat.scala 29:58]
  wire [7:0] _GEN_784 = 8'h88 == _T_4[7:0] ? 8'h0 : _GEN_783; // @[Cat.scala 29:58]
  wire [7:0] _GEN_785 = 8'h89 == _T_4[7:0] ? 8'h0 : _GEN_784; // @[Cat.scala 29:58]
  wire [7:0] _GEN_786 = 8'h8a == _T_4[7:0] ? 8'h0 : _GEN_785; // @[Cat.scala 29:58]
  wire [7:0] _GEN_787 = 8'h8b == _T_4[7:0] ? 8'h0 : _GEN_786; // @[Cat.scala 29:58]
  wire [7:0] _GEN_788 = 8'h8c == _T_4[7:0] ? 8'h0 : _GEN_787; // @[Cat.scala 29:58]
  wire [7:0] _GEN_789 = 8'h8d == _T_4[7:0] ? 8'h0 : _GEN_788; // @[Cat.scala 29:58]
  wire [7:0] _GEN_790 = 8'h8e == _T_4[7:0] ? 8'h0 : _GEN_789; // @[Cat.scala 29:58]
  wire [7:0] _GEN_791 = 8'h8f == _T_4[7:0] ? 8'h0 : _GEN_790; // @[Cat.scala 29:58]
  wire [7:0] _GEN_792 = 8'h90 == _T_4[7:0] ? 8'h0 : _GEN_791; // @[Cat.scala 29:58]
  wire [7:0] _GEN_793 = 8'h91 == _T_4[7:0] ? 8'h0 : _GEN_792; // @[Cat.scala 29:58]
  wire [7:0] _GEN_794 = 8'h92 == _T_4[7:0] ? 8'h0 : _GEN_793; // @[Cat.scala 29:58]
  wire [7:0] _GEN_795 = 8'h93 == _T_4[7:0] ? 8'h0 : _GEN_794; // @[Cat.scala 29:58]
  wire [7:0] _GEN_796 = 8'h94 == _T_4[7:0] ? 8'h0 : _GEN_795; // @[Cat.scala 29:58]
  wire [7:0] _GEN_797 = 8'h95 == _T_4[7:0] ? 8'h0 : _GEN_796; // @[Cat.scala 29:58]
  wire [7:0] _GEN_798 = 8'h96 == _T_4[7:0] ? 8'h0 : _GEN_797; // @[Cat.scala 29:58]
  wire [7:0] _GEN_799 = 8'h97 == _T_4[7:0] ? 8'h0 : _GEN_798; // @[Cat.scala 29:58]
  wire [7:0] _GEN_800 = 8'h98 == _T_4[7:0] ? 8'h0 : _GEN_799; // @[Cat.scala 29:58]
  wire [7:0] _GEN_801 = 8'h99 == _T_4[7:0] ? 8'h0 : _GEN_800; // @[Cat.scala 29:58]
  wire [7:0] _GEN_802 = 8'h9a == _T_4[7:0] ? 8'h0 : _GEN_801; // @[Cat.scala 29:58]
  wire [7:0] _GEN_803 = 8'h9b == _T_4[7:0] ? 8'h0 : _GEN_802; // @[Cat.scala 29:58]
  wire [7:0] _GEN_804 = 8'h9c == _T_4[7:0] ? 8'h0 : _GEN_803; // @[Cat.scala 29:58]
  wire [7:0] _GEN_805 = 8'h9d == _T_4[7:0] ? 8'h0 : _GEN_804; // @[Cat.scala 29:58]
  wire [7:0] _GEN_806 = 8'h9e == _T_4[7:0] ? 8'h0 : _GEN_805; // @[Cat.scala 29:58]
  wire [7:0] _GEN_807 = 8'h9f == _T_4[7:0] ? 8'h0 : _GEN_806; // @[Cat.scala 29:58]
  wire [7:0] _GEN_808 = 8'ha0 == _T_4[7:0] ? 8'h0 : _GEN_807; // @[Cat.scala 29:58]
  wire [7:0] _GEN_809 = 8'ha1 == _T_4[7:0] ? 8'h0 : _GEN_808; // @[Cat.scala 29:58]
  wire [7:0] _GEN_810 = 8'ha2 == _T_4[7:0] ? 8'h0 : _GEN_809; // @[Cat.scala 29:58]
  wire [7:0] _GEN_811 = 8'ha3 == _T_4[7:0] ? 8'h0 : _GEN_810; // @[Cat.scala 29:58]
  wire [7:0] _GEN_812 = 8'ha4 == _T_4[7:0] ? 8'h0 : _GEN_811; // @[Cat.scala 29:58]
  wire [7:0] _GEN_813 = 8'ha5 == _T_4[7:0] ? 8'h0 : _GEN_812; // @[Cat.scala 29:58]
  wire [7:0] _GEN_814 = 8'ha6 == _T_4[7:0] ? 8'h0 : _GEN_813; // @[Cat.scala 29:58]
  wire [7:0] _GEN_815 = 8'ha7 == _T_4[7:0] ? 8'h0 : _GEN_814; // @[Cat.scala 29:58]
  wire [7:0] _GEN_816 = 8'ha8 == _T_4[7:0] ? 8'h0 : _GEN_815; // @[Cat.scala 29:58]
  wire [7:0] _GEN_817 = 8'ha9 == _T_4[7:0] ? 8'h0 : _GEN_816; // @[Cat.scala 29:58]
  wire [7:0] _GEN_818 = 8'haa == _T_4[7:0] ? 8'h0 : _GEN_817; // @[Cat.scala 29:58]
  wire [7:0] _GEN_819 = 8'hab == _T_4[7:0] ? 8'h0 : _GEN_818; // @[Cat.scala 29:58]
  wire [7:0] _GEN_820 = 8'hac == _T_4[7:0] ? 8'h0 : _GEN_819; // @[Cat.scala 29:58]
  wire [7:0] _GEN_821 = 8'had == _T_4[7:0] ? 8'h0 : _GEN_820; // @[Cat.scala 29:58]
  wire [7:0] _GEN_822 = 8'hae == _T_4[7:0] ? 8'h0 : _GEN_821; // @[Cat.scala 29:58]
  wire [7:0] _GEN_823 = 8'haf == _T_4[7:0] ? 8'h0 : _GEN_822; // @[Cat.scala 29:58]
  wire [7:0] _GEN_824 = 8'hb0 == _T_4[7:0] ? 8'h0 : _GEN_823; // @[Cat.scala 29:58]
  wire [7:0] _GEN_825 = 8'hb1 == _T_4[7:0] ? 8'h0 : _GEN_824; // @[Cat.scala 29:58]
  wire [7:0] _GEN_826 = 8'hb2 == _T_4[7:0] ? 8'h0 : _GEN_825; // @[Cat.scala 29:58]
  wire [7:0] _GEN_827 = 8'hb3 == _T_4[7:0] ? 8'h0 : _GEN_826; // @[Cat.scala 29:58]
  wire [7:0] _GEN_828 = 8'hb4 == _T_4[7:0] ? 8'h0 : _GEN_827; // @[Cat.scala 29:58]
  wire [7:0] _GEN_829 = 8'hb5 == _T_4[7:0] ? 8'h0 : _GEN_828; // @[Cat.scala 29:58]
  wire [7:0] _GEN_830 = 8'hb6 == _T_4[7:0] ? 8'h0 : _GEN_829; // @[Cat.scala 29:58]
  wire [7:0] _GEN_831 = 8'hb7 == _T_4[7:0] ? 8'h0 : _GEN_830; // @[Cat.scala 29:58]
  wire [7:0] _GEN_832 = 8'hb8 == _T_4[7:0] ? 8'h0 : _GEN_831; // @[Cat.scala 29:58]
  wire [7:0] _GEN_833 = 8'hb9 == _T_4[7:0] ? 8'h0 : _GEN_832; // @[Cat.scala 29:58]
  wire [7:0] _GEN_834 = 8'hba == _T_4[7:0] ? 8'h0 : _GEN_833; // @[Cat.scala 29:58]
  wire [7:0] _GEN_835 = 8'hbb == _T_4[7:0] ? 8'h0 : _GEN_834; // @[Cat.scala 29:58]
  wire [7:0] _GEN_836 = 8'hbc == _T_4[7:0] ? 8'h0 : _GEN_835; // @[Cat.scala 29:58]
  wire [7:0] _GEN_837 = 8'hbd == _T_4[7:0] ? 8'h0 : _GEN_836; // @[Cat.scala 29:58]
  wire [7:0] _GEN_838 = 8'hbe == _T_4[7:0] ? 8'h0 : _GEN_837; // @[Cat.scala 29:58]
  wire [7:0] _GEN_839 = 8'hbf == _T_4[7:0] ? 8'h0 : _GEN_838; // @[Cat.scala 29:58]
  wire [7:0] _GEN_840 = 8'hc0 == _T_4[7:0] ? 8'h0 : _GEN_839; // @[Cat.scala 29:58]
  wire [7:0] _GEN_841 = 8'hc1 == _T_4[7:0] ? 8'h0 : _GEN_840; // @[Cat.scala 29:58]
  wire [7:0] _GEN_842 = 8'hc2 == _T_4[7:0] ? 8'h0 : _GEN_841; // @[Cat.scala 29:58]
  wire [7:0] _GEN_843 = 8'hc3 == _T_4[7:0] ? 8'h0 : _GEN_842; // @[Cat.scala 29:58]
  wire [7:0] _GEN_844 = 8'hc4 == _T_4[7:0] ? 8'h0 : _GEN_843; // @[Cat.scala 29:58]
  wire [7:0] _GEN_845 = 8'hc5 == _T_4[7:0] ? 8'h0 : _GEN_844; // @[Cat.scala 29:58]
  wire [7:0] _GEN_846 = 8'hc6 == _T_4[7:0] ? 8'h0 : _GEN_845; // @[Cat.scala 29:58]
  wire [7:0] _GEN_847 = 8'hc7 == _T_4[7:0] ? 8'h0 : _GEN_846; // @[Cat.scala 29:58]
  wire [7:0] _GEN_848 = 8'hc8 == _T_4[7:0] ? 8'h0 : _GEN_847; // @[Cat.scala 29:58]
  wire [7:0] _GEN_849 = 8'hc9 == _T_4[7:0] ? 8'h0 : _GEN_848; // @[Cat.scala 29:58]
  wire [7:0] _GEN_850 = 8'hca == _T_4[7:0] ? 8'h0 : _GEN_849; // @[Cat.scala 29:58]
  wire [7:0] _GEN_851 = 8'hcb == _T_4[7:0] ? 8'h0 : _GEN_850; // @[Cat.scala 29:58]
  wire [7:0] _GEN_852 = 8'hcc == _T_4[7:0] ? 8'h0 : _GEN_851; // @[Cat.scala 29:58]
  wire [7:0] _GEN_853 = 8'hcd == _T_4[7:0] ? 8'h0 : _GEN_852; // @[Cat.scala 29:58]
  wire [7:0] _GEN_854 = 8'hce == _T_4[7:0] ? 8'h0 : _GEN_853; // @[Cat.scala 29:58]
  wire [7:0] _GEN_855 = 8'hcf == _T_4[7:0] ? 8'h0 : _GEN_854; // @[Cat.scala 29:58]
  wire [7:0] _GEN_856 = 8'hd0 == _T_4[7:0] ? 8'h0 : _GEN_855; // @[Cat.scala 29:58]
  wire [7:0] _GEN_857 = 8'hd1 == _T_4[7:0] ? 8'h0 : _GEN_856; // @[Cat.scala 29:58]
  wire [7:0] _GEN_858 = 8'hd2 == _T_4[7:0] ? 8'h0 : _GEN_857; // @[Cat.scala 29:58]
  wire [7:0] _GEN_859 = 8'hd3 == _T_4[7:0] ? 8'h0 : _GEN_858; // @[Cat.scala 29:58]
  wire [7:0] _GEN_860 = 8'hd4 == _T_4[7:0] ? 8'h0 : _GEN_859; // @[Cat.scala 29:58]
  wire [7:0] _GEN_861 = 8'hd5 == _T_4[7:0] ? 8'h0 : _GEN_860; // @[Cat.scala 29:58]
  wire [7:0] _GEN_862 = 8'hd6 == _T_4[7:0] ? 8'h0 : _GEN_861; // @[Cat.scala 29:58]
  wire [7:0] _GEN_863 = 8'hd7 == _T_4[7:0] ? 8'h0 : _GEN_862; // @[Cat.scala 29:58]
  wire [31:0] _T_16 = pc + 32'h4; // @[IF.scala 47:14]
  assign out_pc = pc; // @[IF.scala 42:10]
  assign out_instr = {_GEN_647,_GEN_863,_GEN_215,_GEN_431}; // @[IF.scala 40:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else if (ctrl_pcEn) begin
      if (in_branch) begin
        pc <= in_pcNext;
      end else begin
        pc <= _T_16;
      end
    end
  end
endmodule
module RegFile(
  input         clock,
  input         reset,
  input  [4:0]  io_registerS1Index,
  input  [4:0]  io_registerS2Index,
  input  [4:0]  io_registerWIndex,
  input  [31:0] io_registerWData,
  input         io_writeEn,
  output [31:0] io_registerS1Data,
  output [31:0] io_registerS2Data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
  reg [31:0] _RAND_29;
  reg [31:0] _RAND_30;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] regFile_1; // @[RegFile.scala 20:24]
  reg [31:0] regFile_2; // @[RegFile.scala 20:24]
  reg [31:0] regFile_3; // @[RegFile.scala 20:24]
  reg [31:0] regFile_4; // @[RegFile.scala 20:24]
  reg [31:0] regFile_5; // @[RegFile.scala 20:24]
  reg [31:0] regFile_6; // @[RegFile.scala 20:24]
  reg [31:0] regFile_7; // @[RegFile.scala 20:24]
  reg [31:0] regFile_8; // @[RegFile.scala 20:24]
  reg [31:0] regFile_9; // @[RegFile.scala 20:24]
  reg [31:0] regFile_10; // @[RegFile.scala 20:24]
  reg [31:0] regFile_11; // @[RegFile.scala 20:24]
  reg [31:0] regFile_12; // @[RegFile.scala 20:24]
  reg [31:0] regFile_13; // @[RegFile.scala 20:24]
  reg [31:0] regFile_14; // @[RegFile.scala 20:24]
  reg [31:0] regFile_15; // @[RegFile.scala 20:24]
  reg [31:0] regFile_16; // @[RegFile.scala 20:24]
  reg [31:0] regFile_17; // @[RegFile.scala 20:24]
  reg [31:0] regFile_18; // @[RegFile.scala 20:24]
  reg [31:0] regFile_19; // @[RegFile.scala 20:24]
  reg [31:0] regFile_20; // @[RegFile.scala 20:24]
  reg [31:0] regFile_21; // @[RegFile.scala 20:24]
  reg [31:0] regFile_22; // @[RegFile.scala 20:24]
  reg [31:0] regFile_23; // @[RegFile.scala 20:24]
  reg [31:0] regFile_24; // @[RegFile.scala 20:24]
  reg [31:0] regFile_25; // @[RegFile.scala 20:24]
  reg [31:0] regFile_26; // @[RegFile.scala 20:24]
  reg [31:0] regFile_27; // @[RegFile.scala 20:24]
  reg [31:0] regFile_28; // @[RegFile.scala 20:24]
  reg [31:0] regFile_29; // @[RegFile.scala 20:24]
  reg [31:0] regFile_30; // @[RegFile.scala 20:24]
  reg [31:0] regFile_31; // @[RegFile.scala 20:24]
  wire [31:0] _GEN_65 = 5'h1 == io_registerS1Index ? $signed(regFile_1) : $signed(32'sh0); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_66 = 5'h2 == io_registerS1Index ? $signed(regFile_2) : $signed(_GEN_65); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_67 = 5'h3 == io_registerS1Index ? $signed(regFile_3) : $signed(_GEN_66); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_68 = 5'h4 == io_registerS1Index ? $signed(regFile_4) : $signed(_GEN_67); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_69 = 5'h5 == io_registerS1Index ? $signed(regFile_5) : $signed(_GEN_68); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_70 = 5'h6 == io_registerS1Index ? $signed(regFile_6) : $signed(_GEN_69); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_71 = 5'h7 == io_registerS1Index ? $signed(regFile_7) : $signed(_GEN_70); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_72 = 5'h8 == io_registerS1Index ? $signed(regFile_8) : $signed(_GEN_71); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_73 = 5'h9 == io_registerS1Index ? $signed(regFile_9) : $signed(_GEN_72); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_74 = 5'ha == io_registerS1Index ? $signed(regFile_10) : $signed(_GEN_73); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_75 = 5'hb == io_registerS1Index ? $signed(regFile_11) : $signed(_GEN_74); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_76 = 5'hc == io_registerS1Index ? $signed(regFile_12) : $signed(_GEN_75); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_77 = 5'hd == io_registerS1Index ? $signed(regFile_13) : $signed(_GEN_76); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_78 = 5'he == io_registerS1Index ? $signed(regFile_14) : $signed(_GEN_77); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_79 = 5'hf == io_registerS1Index ? $signed(regFile_15) : $signed(_GEN_78); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_80 = 5'h10 == io_registerS1Index ? $signed(regFile_16) : $signed(_GEN_79); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_81 = 5'h11 == io_registerS1Index ? $signed(regFile_17) : $signed(_GEN_80); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_82 = 5'h12 == io_registerS1Index ? $signed(regFile_18) : $signed(_GEN_81); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_83 = 5'h13 == io_registerS1Index ? $signed(regFile_19) : $signed(_GEN_82); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_84 = 5'h14 == io_registerS1Index ? $signed(regFile_20) : $signed(_GEN_83); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_85 = 5'h15 == io_registerS1Index ? $signed(regFile_21) : $signed(_GEN_84); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_86 = 5'h16 == io_registerS1Index ? $signed(regFile_22) : $signed(_GEN_85); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_87 = 5'h17 == io_registerS1Index ? $signed(regFile_23) : $signed(_GEN_86); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_88 = 5'h18 == io_registerS1Index ? $signed(regFile_24) : $signed(_GEN_87); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_89 = 5'h19 == io_registerS1Index ? $signed(regFile_25) : $signed(_GEN_88); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_90 = 5'h1a == io_registerS1Index ? $signed(regFile_26) : $signed(_GEN_89); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_91 = 5'h1b == io_registerS1Index ? $signed(regFile_27) : $signed(_GEN_90); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_92 = 5'h1c == io_registerS1Index ? $signed(regFile_28) : $signed(_GEN_91); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_93 = 5'h1d == io_registerS1Index ? $signed(regFile_29) : $signed(_GEN_92); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_94 = 5'h1e == io_registerS1Index ? $signed(regFile_30) : $signed(_GEN_93); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_95 = 5'h1f == io_registerS1Index ? $signed(regFile_31) : $signed(_GEN_94); // @[RegFile.scala 27:21]
  wire [31:0] _GEN_97 = 5'h1 == io_registerS2Index ? $signed(regFile_1) : $signed(32'sh0); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_98 = 5'h2 == io_registerS2Index ? $signed(regFile_2) : $signed(_GEN_97); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_99 = 5'h3 == io_registerS2Index ? $signed(regFile_3) : $signed(_GEN_98); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_100 = 5'h4 == io_registerS2Index ? $signed(regFile_4) : $signed(_GEN_99); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_101 = 5'h5 == io_registerS2Index ? $signed(regFile_5) : $signed(_GEN_100); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_102 = 5'h6 == io_registerS2Index ? $signed(regFile_6) : $signed(_GEN_101); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_103 = 5'h7 == io_registerS2Index ? $signed(regFile_7) : $signed(_GEN_102); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_104 = 5'h8 == io_registerS2Index ? $signed(regFile_8) : $signed(_GEN_103); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_105 = 5'h9 == io_registerS2Index ? $signed(regFile_9) : $signed(_GEN_104); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_106 = 5'ha == io_registerS2Index ? $signed(regFile_10) : $signed(_GEN_105); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_107 = 5'hb == io_registerS2Index ? $signed(regFile_11) : $signed(_GEN_106); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_108 = 5'hc == io_registerS2Index ? $signed(regFile_12) : $signed(_GEN_107); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_109 = 5'hd == io_registerS2Index ? $signed(regFile_13) : $signed(_GEN_108); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_110 = 5'he == io_registerS2Index ? $signed(regFile_14) : $signed(_GEN_109); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_111 = 5'hf == io_registerS2Index ? $signed(regFile_15) : $signed(_GEN_110); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_112 = 5'h10 == io_registerS2Index ? $signed(regFile_16) : $signed(_GEN_111); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_113 = 5'h11 == io_registerS2Index ? $signed(regFile_17) : $signed(_GEN_112); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_114 = 5'h12 == io_registerS2Index ? $signed(regFile_18) : $signed(_GEN_113); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_115 = 5'h13 == io_registerS2Index ? $signed(regFile_19) : $signed(_GEN_114); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_116 = 5'h14 == io_registerS2Index ? $signed(regFile_20) : $signed(_GEN_115); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_117 = 5'h15 == io_registerS2Index ? $signed(regFile_21) : $signed(_GEN_116); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_118 = 5'h16 == io_registerS2Index ? $signed(regFile_22) : $signed(_GEN_117); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_119 = 5'h17 == io_registerS2Index ? $signed(regFile_23) : $signed(_GEN_118); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_120 = 5'h18 == io_registerS2Index ? $signed(regFile_24) : $signed(_GEN_119); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_121 = 5'h19 == io_registerS2Index ? $signed(regFile_25) : $signed(_GEN_120); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_122 = 5'h1a == io_registerS2Index ? $signed(regFile_26) : $signed(_GEN_121); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_123 = 5'h1b == io_registerS2Index ? $signed(regFile_27) : $signed(_GEN_122); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_124 = 5'h1c == io_registerS2Index ? $signed(regFile_28) : $signed(_GEN_123); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_125 = 5'h1d == io_registerS2Index ? $signed(regFile_29) : $signed(_GEN_124); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_126 = 5'h1e == io_registerS2Index ? $signed(regFile_30) : $signed(_GEN_125); // @[RegFile.scala 28:21]
  wire [31:0] _GEN_127 = 5'h1f == io_registerS2Index ? $signed(regFile_31) : $signed(_GEN_126); // @[RegFile.scala 28:21]
  wire  _T_1 = io_registerS1Index == io_registerWIndex; // @[RegFile.scala 30:27]
  wire  _T_2 = _T_1 & io_writeEn; // @[RegFile.scala 30:49]
  wire  _T_3 = io_registerS2Index == io_registerWIndex; // @[RegFile.scala 33:27]
  wire  _T_4 = _T_3 & io_writeEn; // @[RegFile.scala 33:49]
  assign io_registerS1Data = _T_2 ? $signed(io_registerWData) : $signed(_GEN_95); // @[RegFile.scala 27:21 RegFile.scala 31:23]
  assign io_registerS2Data = _T_4 ? $signed(io_registerWData) : $signed(_GEN_127); // @[RegFile.scala 28:21 RegFile.scala 34:23]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  regFile_1 = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  regFile_2 = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  regFile_3 = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  regFile_4 = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  regFile_5 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  regFile_6 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  regFile_7 = _RAND_6[31:0];
  _RAND_7 = {1{`RANDOM}};
  regFile_8 = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  regFile_9 = _RAND_8[31:0];
  _RAND_9 = {1{`RANDOM}};
  regFile_10 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  regFile_11 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  regFile_12 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  regFile_13 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  regFile_14 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  regFile_15 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  regFile_16 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  regFile_17 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  regFile_18 = _RAND_17[31:0];
  _RAND_18 = {1{`RANDOM}};
  regFile_19 = _RAND_18[31:0];
  _RAND_19 = {1{`RANDOM}};
  regFile_20 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  regFile_21 = _RAND_20[31:0];
  _RAND_21 = {1{`RANDOM}};
  regFile_22 = _RAND_21[31:0];
  _RAND_22 = {1{`RANDOM}};
  regFile_23 = _RAND_22[31:0];
  _RAND_23 = {1{`RANDOM}};
  regFile_24 = _RAND_23[31:0];
  _RAND_24 = {1{`RANDOM}};
  regFile_25 = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  regFile_26 = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  regFile_27 = _RAND_26[31:0];
  _RAND_27 = {1{`RANDOM}};
  regFile_28 = _RAND_27[31:0];
  _RAND_28 = {1{`RANDOM}};
  regFile_29 = _RAND_28[31:0];
  _RAND_29 = {1{`RANDOM}};
  regFile_30 = _RAND_29[31:0];
  _RAND_30 = {1{`RANDOM}};
  regFile_31 = _RAND_30[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      regFile_1 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1 == io_registerWIndex) begin
        regFile_1 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_2 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h2 == io_registerWIndex) begin
        regFile_2 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_3 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h3 == io_registerWIndex) begin
        regFile_3 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_4 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h4 == io_registerWIndex) begin
        regFile_4 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_5 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h5 == io_registerWIndex) begin
        regFile_5 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_6 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h6 == io_registerWIndex) begin
        regFile_6 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_7 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h7 == io_registerWIndex) begin
        regFile_7 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_8 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h8 == io_registerWIndex) begin
        regFile_8 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_9 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h9 == io_registerWIndex) begin
        regFile_9 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_10 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'ha == io_registerWIndex) begin
        regFile_10 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_11 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'hb == io_registerWIndex) begin
        regFile_11 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_12 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'hc == io_registerWIndex) begin
        regFile_12 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_13 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'hd == io_registerWIndex) begin
        regFile_13 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_14 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'he == io_registerWIndex) begin
        regFile_14 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_15 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'hf == io_registerWIndex) begin
        regFile_15 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_16 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h10 == io_registerWIndex) begin
        regFile_16 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_17 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h11 == io_registerWIndex) begin
        regFile_17 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_18 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h12 == io_registerWIndex) begin
        regFile_18 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_19 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h13 == io_registerWIndex) begin
        regFile_19 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_20 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h14 == io_registerWIndex) begin
        regFile_20 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_21 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h15 == io_registerWIndex) begin
        regFile_21 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_22 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h16 == io_registerWIndex) begin
        regFile_22 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_23 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h17 == io_registerWIndex) begin
        regFile_23 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_24 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h18 == io_registerWIndex) begin
        regFile_24 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_25 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h19 == io_registerWIndex) begin
        regFile_25 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_26 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1a == io_registerWIndex) begin
        regFile_26 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_27 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1b == io_registerWIndex) begin
        regFile_27 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_28 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1c == io_registerWIndex) begin
        regFile_28 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_29 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1d == io_registerWIndex) begin
        regFile_29 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_30 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1e == io_registerWIndex) begin
        regFile_30 <= io_registerWData;
      end
    end
    if (reset) begin
      regFile_31 <= 32'sh0;
    end else if (io_writeEn) begin
      if (5'h1f == io_registerWIndex) begin
        regFile_31 <= io_registerWData;
      end
    end
  end
endmodule
module ImmGen(
  input  [31:0] io_instruction,
  output [31:0] io_immediate
);
  wire [2:0] funct3 = io_instruction[14:12]; // @[ImmGen.scala 13:30]
  wire [11:0] Itype = io_instruction[31:20]; // @[ImmGen.scala 19:29]
  wire [9:0] _T_45 = {io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31]}; // @[ImmGen.scala 21:71]
  wire [31:0] _T_57 = {_T_45,_T_45,Itype}; // @[ImmGen.scala 21:88]
  wire  _T_58 = funct3 == 3'h2; // @[ImmGen.scala 22:15]
  wire  _T_59 = funct3 == 3'h3; // @[ImmGen.scala 22:33]
  wire  _T_60 = _T_58 | _T_59; // @[ImmGen.scala 22:23]
  wire [11:0] _T_61 = io_instruction[31:20]; // @[ImmGen.scala 23:33]
  wire [31:0] _GEN_0 = _T_60 ? $signed({{20{_T_61[11]}},_T_61}) : $signed(_T_57); // @[ImmGen.scala 22:42]
  wire  _T_63 = 7'h37 == io_instruction[6:0]; // @[Conditional.scala 37:30]
  wire [31:0] _T_64 = {io_instruction[31:12],12'h0}; // @[ImmGen.scala 29:35]
  wire  _T_65 = 7'h17 == io_instruction[6:0]; // @[Conditional.scala 37:30]
  wire  _T_67 = 7'h6f == io_instruction[6:0]; // @[Conditional.scala 37:30]
  wire [30:0] _T_90 = {_T_45,io_instruction[31],io_instruction[19:12],io_instruction[20],io_instruction[30:22],2'h0}; // @[ImmGen.scala 35:103]
  wire  _T_91 = 7'h23 == io_instruction[6:0]; // @[Conditional.scala 37:30]
  wire [31:0] _T_133 = {_T_45,_T_45,io_instruction[31:25],io_instruction[11:7]}; // @[ImmGen.scala 38:92]
  wire  _T_134 = 7'h63 == io_instruction[6:0]; // @[Conditional.scala 37:30]
  wire [8:0] _T_161 = {io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31]}; // @[ImmGen.scala 41:75]
  wire [17:0] _T_170 = {io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],io_instruction[31],_T_161}; // @[ImmGen.scala 41:75]
  wire [30:0] _T_173 = {_T_170,io_instruction[31],io_instruction[7],io_instruction[30:25],io_instruction[11:8],1'h0}; // @[ImmGen.scala 41:103]
  wire [31:0] _GEN_1 = _T_134 ? $signed({{1{_T_173[30]}},_T_173}) : $signed(_GEN_0); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_91 ? $signed(_T_133) : $signed(_GEN_1); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_67 ? $signed({{1{_T_90[30]}},_T_90}) : $signed(_GEN_2); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_4 = _T_65 ? $signed(_T_64) : $signed(_GEN_3); // @[Conditional.scala 39:67]
  assign io_immediate = _T_63 ? $signed(_T_64) : $signed(_GEN_4); // @[ImmGen.scala 21:16 ImmGen.scala 23:18 ImmGen.scala 29:20 ImmGen.scala 32:20 ImmGen.scala 35:20 ImmGen.scala 38:20 ImmGen.scala 41:20]
endmodule
module ID(
  input         clock,
  input         reset,
  input  [31:0] in_pc,
  input  [31:0] in_instr,
  output [31:0] out_pc,
  output [31:0] out_imm,
  output [31:0] out_regOp1,
  output [31:0] out_regOp2,
  output [4:0]  out_rs1,
  output [4:0]  out_rs2,
  output [4:0]  out_rd,
  output [3:0]  out_aluOp,
  output [1:0]  out_aluSrc1,
  output [1:0]  out_aluSrc2,
  output        out_brSrc,
  output        out_pcSrc,
  output        out_wb,
  output        out_wbSrc,
  output [3:0]  out_mem,
  output        out_jump,
  output [2:0]  out_funct3,
  input  [4:0]  wb_rd,
  input  [31:0] wb_res,
  input         wb_wb,
  input         ctrl_flushID,
  output [31:0] ctrl_instr
);
  wire  regFile_clock; // @[ID.scala 21:23]
  wire  regFile_reset; // @[ID.scala 21:23]
  wire [4:0] regFile_io_registerS1Index; // @[ID.scala 21:23]
  wire [4:0] regFile_io_registerS2Index; // @[ID.scala 21:23]
  wire [4:0] regFile_io_registerWIndex; // @[ID.scala 21:23]
  wire [31:0] regFile_io_registerWData; // @[ID.scala 21:23]
  wire  regFile_io_writeEn; // @[ID.scala 21:23]
  wire [31:0] regFile_io_registerS1Data; // @[ID.scala 21:23]
  wire [31:0] regFile_io_registerS2Data; // @[ID.scala 21:23]
  wire [31:0] immGen_io_instruction; // @[ID.scala 23:22]
  wire [31:0] immGen_io_immediate; // @[ID.scala 23:22]
  wire [6:0] opcode = in_instr[6:0]; // @[ID.scala 25:24]
  wire [2:0] funct3 = in_instr[14:12]; // @[ID.scala 26:24]
  wire  _T_1 = 7'h3 == opcode; // @[Conditional.scala 37:30]
  wire  _T_2 = 3'h0 == funct3; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h4 == funct3; // @[Conditional.scala 37:30]
  wire  _T_4 = 3'h1 == funct3; // @[Conditional.scala 37:30]
  wire  _T_5 = 3'h5 == funct3; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h2 == funct3; // @[Conditional.scala 37:30]
  wire [2:0] _GEN_0 = _T_6 ? 3'h7 : 3'h0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_1 = _T_5 ? 3'h2 : _GEN_0; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_2 = _T_4 ? 3'h6 : _GEN_1; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_3 = _T_3 ? 3'h1 : _GEN_2; // @[Conditional.scala 39:67]
  wire [2:0] _GEN_4 = _T_2 ? 3'h5 : _GEN_3; // @[Conditional.scala 40:58]
  wire  _T_7 = 7'h23 == opcode; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_5 = _T_6 ? 4'hb : 4'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_6 = _T_4 ? 4'ha : _GEN_5; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_7 = _T_2 ? 4'h9 : _GEN_6; // @[Conditional.scala 40:58]
  wire  _T_11 = 7'h13 == opcode; // @[Conditional.scala 37:30]
  wire  _T_15 = 3'h3 == funct3; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_8 = in_instr[30] ? 4'h4 : 4'h3; // @[ID.scala 118:30]
  wire  _T_19 = 3'h6 == funct3; // @[Conditional.scala 37:30]
  wire  _T_20 = 3'h7 == funct3; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_9 = _T_20 ? 4'h5 : 4'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_10 = _T_19 ? 4'h6 : _GEN_9; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_11 = _T_5 ? _GEN_8 : _GEN_10; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_12 = _T_3 ? 4'h7 : _GEN_11; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_13 = _T_15 ? 4'h8 : _GEN_12; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_14 = _T_6 ? 4'h8 : _GEN_13; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_15 = _T_4 ? 4'h2 : _GEN_14; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_16 = _T_2 ? 4'h0 : _GEN_15; // @[Conditional.scala 40:58]
  wire  _T_21 = 7'h33 == opcode; // @[Conditional.scala 37:30]
  wire [3:0] _GEN_17 = in_instr[30] ? 4'h1 : 4'h0; // @[ID.scala 135:30]
  wire [3:0] _GEN_26 = _T_2 ? _GEN_17 : _GEN_15; // @[Conditional.scala 40:58]
  wire  _T_32 = 7'h17 == opcode; // @[Conditional.scala 37:30]
  wire  _T_33 = 7'h37 == opcode; // @[Conditional.scala 37:30]
  wire  _T_34 = 7'h63 == opcode; // @[Conditional.scala 37:30]
  wire  _T_35 = 7'h6f == opcode; // @[Conditional.scala 37:30]
  wire  _T_36 = 7'h67 == opcode; // @[Conditional.scala 37:30]
  wire [1:0] _GEN_28 = _T_36 ? 2'h2 : 2'h0; // @[Conditional.scala 39:67]
  wire  _GEN_29 = _T_35 | _T_36; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_30 = _T_35 ? 2'h1 : _GEN_28; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_31 = _T_35 ? 2'h2 : _GEN_28; // @[Conditional.scala 39:67]
  wire  _GEN_32 = _T_35 ? 1'h0 : _T_36; // @[Conditional.scala 39:67]
  wire  _GEN_33 = _T_34 ? 1'h0 : _GEN_29; // @[Conditional.scala 39:67]
  wire  _GEN_34 = _T_34 | _GEN_29; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_35 = _T_34 ? 2'h0 : _GEN_30; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_36 = _T_34 ? 2'h0 : _GEN_31; // @[Conditional.scala 39:67]
  wire  _GEN_37 = _T_34 ? 1'h0 : _GEN_32; // @[Conditional.scala 39:67]
  wire  _GEN_38 = _T_33 | _GEN_33; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_39 = _T_33 ? 2'h2 : _GEN_35; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_40 = _T_33 ? 2'h1 : _GEN_36; // @[Conditional.scala 39:67]
  wire  _GEN_41 = _T_33 ? 1'h0 : _GEN_34; // @[Conditional.scala 39:67]
  wire  _GEN_42 = _T_33 ? 1'h0 : _GEN_37; // @[Conditional.scala 39:67]
  wire  _GEN_43 = _T_32 | _GEN_38; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_44 = _T_32 ? 2'h1 : _GEN_39; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_45 = _T_32 ? 2'h1 : _GEN_40; // @[Conditional.scala 39:67]
  wire  _GEN_46 = _T_32 ? 1'h0 : _GEN_41; // @[Conditional.scala 39:67]
  wire  _GEN_47 = _T_32 ? 1'h0 : _GEN_42; // @[Conditional.scala 39:67]
  wire  _GEN_48 = _T_21 | _GEN_43; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_49 = _T_21 ? _GEN_26 : 4'h0; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_50 = _T_21 ? 2'h0 : _GEN_44; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_51 = _T_21 ? 2'h0 : _GEN_45; // @[Conditional.scala 39:67]
  wire  _GEN_52 = _T_21 ? 1'h0 : _GEN_46; // @[Conditional.scala 39:67]
  wire  _GEN_53 = _T_21 ? 1'h0 : _GEN_47; // @[Conditional.scala 39:67]
  wire  _GEN_54 = _T_11 | _GEN_48; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_55 = _T_11 ? 2'h1 : _GEN_51; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_56 = _T_11 ? _GEN_16 : _GEN_49; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_57 = _T_11 ? 2'h0 : _GEN_50; // @[Conditional.scala 39:67]
  wire  _GEN_58 = _T_11 ? 1'h0 : _GEN_52; // @[Conditional.scala 39:67]
  wire  _GEN_59 = _T_11 ? 1'h0 : _GEN_53; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_60 = _T_7 ? 2'h1 : _GEN_55; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_61 = _T_7 ? _GEN_7 : 4'h0; // @[Conditional.scala 39:67]
  wire  _GEN_62 = _T_7 ? 1'h0 : _GEN_54; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_63 = _T_7 ? 4'h0 : _GEN_56; // @[Conditional.scala 39:67]
  wire [1:0] _GEN_64 = _T_7 ? 2'h0 : _GEN_57; // @[Conditional.scala 39:67]
  wire  _GEN_65 = _T_7 ? 1'h0 : _GEN_58; // @[Conditional.scala 39:67]
  wire  _GEN_66 = _T_7 ? 1'h0 : _GEN_59; // @[Conditional.scala 39:67]
  wire  _GEN_67 = _T_1 | _GEN_62; // @[Conditional.scala 40:58]
  wire [3:0] _GEN_70 = _T_1 ? {{1'd0}, _GEN_4} : _GEN_61; // @[Conditional.scala 40:58]
  wire [3:0] _GEN_71 = _T_1 ? 4'h0 : _GEN_63; // @[Conditional.scala 40:58]
  wire  _GEN_73 = _T_1 ? 1'h0 : _GEN_65; // @[Conditional.scala 40:58]
  RegFile regFile ( // @[ID.scala 21:23]
    .clock(regFile_clock),
    .reset(regFile_reset),
    .io_registerS1Index(regFile_io_registerS1Index),
    .io_registerS2Index(regFile_io_registerS2Index),
    .io_registerWIndex(regFile_io_registerWIndex),
    .io_registerWData(regFile_io_registerWData),
    .io_writeEn(regFile_io_writeEn),
    .io_registerS1Data(regFile_io_registerS1Data),
    .io_registerS2Data(regFile_io_registerS2Data)
  );
  ImmGen immGen ( // @[ID.scala 23:22]
    .io_instruction(immGen_io_instruction),
    .io_immediate(immGen_io_immediate)
  );
  assign out_pc = in_pc; // @[ID.scala 50:10]
  assign out_imm = immGen_io_immediate; // @[ID.scala 45:11]
  assign out_regOp1 = regFile_io_registerS1Data; // @[ID.scala 37:14]
  assign out_regOp2 = regFile_io_registerS2Data; // @[ID.scala 38:14]
  assign out_rs1 = in_instr[19:15]; // @[ID.scala 47:11]
  assign out_rs2 = in_instr[24:20]; // @[ID.scala 48:11]
  assign out_rd = in_instr[11:7]; // @[ID.scala 49:10]
  assign out_aluOp = ctrl_flushID ? 4'h0 : _GEN_71; // @[ID.scala 54:13 ID.scala 102:21 ID.scala 105:21 ID.scala 108:21 ID.scala 111:21 ID.scala 114:21 ID.scala 117:21 ID.scala 119:23 ID.scala 123:21 ID.scala 126:21 ID.scala 134:21 ID.scala 136:23 ID.scala 140:21 ID.scala 143:21 ID.scala 146:21 ID.scala 149:21 ID.scala 152:21 ID.scala 154:23 ID.scala 158:21 ID.scala 161:21 ID.scala 197:15]
  assign out_aluSrc1 = _T_1 ? 2'h0 : _GEN_64; // @[ID.scala 52:15 ID.scala 167:19 ID.scala 172:19 ID.scala 181:19 ID.scala 188:19]
  assign out_aluSrc2 = _T_1 ? 2'h1 : _GEN_60; // @[ID.scala 53:15 ID.scala 63:19 ID.scala 84:19 ID.scala 99:19 ID.scala 168:19 ID.scala 173:19 ID.scala 182:19 ID.scala 189:19]
  assign out_brSrc = _T_1 ? 1'h0 : _GEN_66; // @[ID.scala 58:13 ID.scala 187:17]
  assign out_pcSrc = ctrl_flushID ? 1'h0 : _GEN_73; // @[ID.scala 56:13 ID.scala 177:17 ID.scala 183:17 ID.scala 190:17 ID.scala 199:15]
  assign out_wb = ctrl_flushID ? 1'h0 : _GEN_67; // @[ID.scala 51:10 ID.scala 62:14 ID.scala 98:14 ID.scala 131:14 ID.scala 166:14 ID.scala 171:14 ID.scala 176:14 ID.scala 180:14 ID.scala 186:14 ID.scala 196:12]
  assign out_wbSrc = 7'h3 == opcode; // @[ID.scala 57:13 ID.scala 64:17]
  assign out_mem = ctrl_flushID ? 4'h0 : _GEN_70; // @[ID.scala 55:11 ID.scala 67:19 ID.scala 70:19 ID.scala 73:19 ID.scala 76:19 ID.scala 79:19 ID.scala 87:19 ID.scala 90:19 ID.scala 93:19 ID.scala 198:13]
  assign out_jump = opcode[2]; // @[ID.scala 31:12]
  assign out_funct3 = in_instr[14:12]; // @[ID.scala 32:14]
  assign ctrl_instr = in_instr; // @[ID.scala 194:14]
  assign regFile_clock = clock;
  assign regFile_reset = reset;
  assign regFile_io_registerS1Index = in_instr[19:15]; // @[ID.scala 35:30]
  assign regFile_io_registerS2Index = in_instr[24:20]; // @[ID.scala 36:30]
  assign regFile_io_registerWIndex = wb_rd; // @[ID.scala 40:29]
  assign regFile_io_registerWData = wb_res; // @[ID.scala 41:28]
  assign regFile_io_writeEn = wb_wb; // @[ID.scala 42:22]
  assign immGen_io_instruction = in_instr; // @[ID.scala 44:25]
endmodule
module ALU(
  input  [31:0] io_source1,
  input  [31:0] io_source2,
  input  [3:0]  io_operation,
  output [31:0] io_output
);
  wire [31:0] _T_2 = $signed(io_source1) + $signed(io_source2); // @[ALU.scala 19:27]
  wire  _T_3 = 4'h1 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_6 = $signed(io_source1) - $signed(io_source2); // @[ALU.scala 23:31]
  wire  _T_7 = 4'h2 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_8 = io_source1; // @[ALU.scala 26:32]
  wire [62:0] _GEN_8 = {{31'd0}, _T_8}; // @[ALU.scala 26:39]
  wire [62:0] _T_11 = _GEN_8 << io_source2[4:0]; // @[ALU.scala 26:67]
  wire  _T_12 = 4'h3 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_16 = io_source1 >> io_source2[4:0]; // @[ALU.scala 29:67]
  wire  _T_17 = 4'h4 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_19 = $signed(io_source1) >>> io_source2[4:0]; // @[ALU.scala 32:32]
  wire  _T_20 = 4'h6 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_22 = $signed(io_source1) | $signed(io_source2); // @[ALU.scala 35:31]
  wire  _T_23 = 4'h5 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_25 = $signed(io_source1) & $signed(io_source2); // @[ALU.scala 38:31]
  wire  _T_26 = 4'h7 == io_operation; // @[Conditional.scala 37:30]
  wire [31:0] _T_28 = $signed(io_source1) ^ $signed(io_source2); // @[ALU.scala 41:31]
  wire  _T_29 = 4'h8 == io_operation; // @[Conditional.scala 37:30]
  wire  _T_31 = $signed(io_source1) < $signed(io_source2); // @[ALU.scala 44:52]
  wire [31:0] _GEN_0 = _T_29 ? $signed({32{_T_31}}) : $signed(_T_2); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_1 = _T_26 ? $signed(_T_28) : $signed(_GEN_0); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_23 ? $signed(_T_25) : $signed(_GEN_1); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_3 = _T_20 ? $signed(_T_22) : $signed(_GEN_2); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_4 = _T_17 ? $signed(_T_19) : $signed(_GEN_3); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_12 ? $signed(_T_16) : $signed(_GEN_4); // @[Conditional.scala 39:67]
  wire [62:0] _GEN_6 = _T_7 ? $signed(_T_11) : $signed({{31{_GEN_5[31]}},_GEN_5}); // @[Conditional.scala 39:67]
  wire [62:0] _GEN_7 = _T_3 ? $signed({{31{_T_6[31]}},_T_6}) : $signed(_GEN_6); // @[Conditional.scala 40:58]
  assign io_output = _GEN_7[31:0]; // @[ALU.scala 19:13 ALU.scala 23:17 ALU.scala 26:17 ALU.scala 29:17 ALU.scala 32:17 ALU.scala 35:17 ALU.scala 38:17 ALU.scala 41:17 ALU.scala 44:17]
endmodule
module BranchControl(
  input  [2:0]  io_funct3,
  input  [31:0] io_registerS1,
  input  [31:0] io_registerS2,
  input         io_jump,
  output        io_takeBranch
);
  wire  equal = $signed(io_registerS1) == $signed(io_registerS2); // @[BranchControl.scala 15:29]
  wire  lessThan = $signed(io_registerS1) < $signed(io_registerS2); // @[BranchControl.scala 16:32]
  wire  lessThanU = io_registerS1 < io_registerS2; // @[BranchControl.scala 17:42]
  wire  _T_2 = 3'h0 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_3 = 3'h1 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_4 = ~equal; // @[BranchControl.scala 26:24]
  wire  _T_5 = 3'h4 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_6 = 3'h5 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_7 = ~lessThan; // @[BranchControl.scala 32:24]
  wire  _T_8 = 3'h6 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_9 = 3'h7 == io_funct3; // @[Conditional.scala 37:30]
  wire  _T_10 = ~lessThanU; // @[BranchControl.scala 38:24]
  wire  _GEN_0 = _T_9 & _T_10; // @[Conditional.scala 39:67]
  wire  _GEN_1 = _T_8 ? lessThanU : _GEN_0; // @[Conditional.scala 39:67]
  wire  _GEN_2 = _T_6 ? _T_7 : _GEN_1; // @[Conditional.scala 39:67]
  wire  _GEN_3 = _T_5 ? lessThan : _GEN_2; // @[Conditional.scala 39:67]
  wire  _GEN_4 = _T_3 ? _T_4 : _GEN_3; // @[Conditional.scala 39:67]
  wire  _GEN_5 = _T_2 ? equal : _GEN_4; // @[Conditional.scala 40:58]
  assign io_takeBranch = io_jump | _GEN_5; // @[BranchControl.scala 19:17 BranchControl.scala 23:21 BranchControl.scala 26:21 BranchControl.scala 29:21 BranchControl.scala 32:21 BranchControl.scala 35:21 BranchControl.scala 38:21 BranchControl.scala 42:19]
endmodule
module EX(
  input  [31:0] in_pc,
  input  [31:0] in_imm,
  input  [31:0] in_regOp1,
  input  [31:0] in_regOp2,
  input  [4:0]  in_rs1,
  input  [4:0]  in_rs2,
  input  [4:0]  in_rd,
  input  [3:0]  in_aluOp,
  input  [1:0]  in_aluSrc1,
  input  [1:0]  in_aluSrc2,
  input         in_brSrc,
  input         in_pcSrc,
  input         in_wb,
  input         in_wbSrc,
  input  [3:0]  in_mem,
  input         in_jump,
  input  [2:0]  in_funct3,
  output [31:0] out_aluRes,
  output [31:0] out_regOp2,
  output [4:0]  out_rd,
  output        out_wb,
  output        out_wbSrc,
  output [3:0]  out_mem,
  output [4:0]  ctrl_rs1,
  output [4:0]  ctrl_rs2,
  output [4:0]  ctrl_rd,
  input  [31:0] ctrl_fwdA,
  input  [31:0] ctrl_fwdB,
  input         ctrl_fwdA_en,
  input         ctrl_fwdB_en,
  output [31:0] ctrl_branchOut_pcNext,
  output        ctrl_branchOut_branch
);
  wire [31:0] alu_io_source1; // @[EX.scala 31:19]
  wire [31:0] alu_io_source2; // @[EX.scala 31:19]
  wire [3:0] alu_io_operation; // @[EX.scala 31:19]
  wire [31:0] alu_io_output; // @[EX.scala 31:19]
  wire [2:0] branchControl_io_funct3; // @[EX.scala 32:29]
  wire [31:0] branchControl_io_registerS1; // @[EX.scala 32:29]
  wire [31:0] branchControl_io_registerS2; // @[EX.scala 32:29]
  wire  branchControl_io_jump; // @[EX.scala 32:29]
  wire  branchControl_io_takeBranch; // @[EX.scala 32:29]
  wire [31:0] fwdRegOp1 = ctrl_fwdA_en ? $signed(ctrl_fwdA) : $signed(in_regOp1); // @[EX.scala 33:22]
  wire [31:0] fwdRegOp2 = ctrl_fwdB_en ? $signed(ctrl_fwdB) : $signed(in_regOp2); // @[EX.scala 34:22]
  wire  _T = branchControl_io_takeBranch; // @[EX.scala 41:58]
  wire [31:0] _T_5 = $signed(fwdRegOp1) + $signed(in_imm); // @[EX.scala 42:72]
  wire [31:0] _T_10 = $signed(in_pc) + $signed(in_imm); // @[EX.scala 42:112]
  wire  _T_19 = 2'h0 == in_aluSrc1; // @[Conditional.scala 37:30]
  wire  _T_20 = 2'h1 == in_aluSrc1; // @[Conditional.scala 37:30]
  wire  _T_22 = 2'h2 == in_aluSrc1; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_1 = _T_22 ? $signed(32'sh0) : $signed(fwdRegOp1); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_2 = _T_20 ? $signed(in_pc) : $signed(_GEN_1); // @[Conditional.scala 39:67]
  wire  _T_23 = 2'h0 == in_aluSrc2; // @[Conditional.scala 37:30]
  wire  _T_24 = 2'h1 == in_aluSrc2; // @[Conditional.scala 37:30]
  wire  _T_25 = 2'h2 == in_aluSrc2; // @[Conditional.scala 37:30]
  wire [31:0] _GEN_4 = _T_25 ? $signed(32'sh4) : $signed(fwdRegOp2); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_5 = _T_24 ? $signed(in_imm) : $signed(_GEN_4); // @[Conditional.scala 39:67]
  ALU alu ( // @[EX.scala 31:19]
    .io_source1(alu_io_source1),
    .io_source2(alu_io_source2),
    .io_operation(alu_io_operation),
    .io_output(alu_io_output)
  );
  BranchControl branchControl ( // @[EX.scala 32:29]
    .io_funct3(branchControl_io_funct3),
    .io_registerS1(branchControl_io_registerS1),
    .io_registerS2(branchControl_io_registerS2),
    .io_jump(branchControl_io_jump),
    .io_takeBranch(branchControl_io_takeBranch)
  );
  assign out_aluRes = alu_io_output; // @[EX.scala 76:14]
  assign out_regOp2 = ctrl_fwdB_en ? $signed(ctrl_fwdB) : $signed(in_regOp2); // @[EX.scala 77:14]
  assign out_rd = in_rd; // @[EX.scala 24:10 EX.scala 29:10]
  assign out_wb = in_wb; // @[EX.scala 26:10]
  assign out_wbSrc = in_wbSrc; // @[EX.scala 28:13]
  assign out_mem = in_mem; // @[EX.scala 27:11]
  assign ctrl_rs1 = in_rs1; // @[EX.scala 22:12]
  assign ctrl_rs2 = in_rs2; // @[EX.scala 23:12]
  assign ctrl_rd = in_rd; // @[EX.scala 25:11]
  assign ctrl_branchOut_pcNext = in_brSrc ? _T_5 : _T_10; // @[EX.scala 42:25 EX.scala 46:27]
  assign ctrl_branchOut_branch = _T & in_pcSrc; // @[EX.scala 41:25]
  assign alu_io_source1 = _T_19 ? $signed(fwdRegOp1) : $signed(_GEN_2); // @[EX.scala 49:18 EX.scala 55:22 EX.scala 58:22 EX.scala 61:22]
  assign alu_io_source2 = _T_23 ? $signed(fwdRegOp2) : $signed(_GEN_5); // @[EX.scala 50:18 EX.scala 66:22 EX.scala 69:22 EX.scala 72:22]
  assign alu_io_operation = in_aluOp; // @[EX.scala 51:20]
  assign branchControl_io_funct3 = in_funct3; // @[EX.scala 36:27]
  assign branchControl_io_registerS1 = ctrl_fwdA_en ? $signed(ctrl_fwdA) : $signed(in_regOp1); // @[EX.scala 38:31]
  assign branchControl_io_registerS2 = ctrl_fwdB_en ? $signed(ctrl_fwdB) : $signed(in_regOp2); // @[EX.scala 39:31]
  assign branchControl_io_jump = in_jump; // @[EX.scala 37:25]
endmodule
module MEM(
  input         clock,
  input  [31:0] in_aluRes,
  input  [31:0] in_regOp2,
  input  [4:0]  in_rd,
  input         in_wb,
  input         in_wbSrc,
  input  [3:0]  in_mem,
  output [31:0] out_memRes,
  output [31:0] out_aluRes,
  output [4:0]  out_rd,
  output        out_wb,
  output        out_wbSrc,
  output [31:0] dataBus_addr,
  input  [7:0]  dataBus_rdData_0,
  input  [7:0]  dataBus_rdData_1,
  input  [7:0]  dataBus_rdData_2,
  input  [7:0]  dataBus_rdData_3,
  output [7:0]  dataBus_wrData_0,
  output [7:0]  dataBus_wrData_1,
  output [7:0]  dataBus_wrData_2,
  output [7:0]  dataBus_wrData_3,
  output        dataBus_we_0,
  output        dataBus_we_1,
  output        dataBus_we_2,
  output        dataBus_we_3,
  output        dataBus_w,
  output [4:0]  ctrl_rd,
  output [31:0] ctrl_aluRes
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  wire  _T_4 = 2'h1 == in_mem[1:0]; // @[Conditional.scala 37:30]
  wire  _T_6 = 2'h2 == in_mem[1:0]; // @[Conditional.scala 37:30]
  wire  _T_8 = 2'h3 == in_mem[1:0]; // @[Conditional.scala 37:30]
  wire  _GEN_4 = _T_6 | _T_8; // @[Conditional.scala 39:67]
  wire  _GEN_6 = _T_6 ? 1'h0 : _T_8; // @[Conditional.scala 39:67]
  wire  _GEN_8 = _T_4 | _GEN_4; // @[Conditional.scala 40:58]
  wire  _GEN_9 = _T_4 ? 1'h0 : _GEN_4; // @[Conditional.scala 40:58]
  wire  _GEN_10 = _T_4 ? 1'h0 : _GEN_6; // @[Conditional.scala 40:58]
  wire [31:0] _T_11 = in_regOp2; // @[MEM.scala 36:41]
  wire  _T_21 = in_mem[2] & dataBus_rdData_0[7]; // @[MEM.scala 43:56]
  wire [5:0] _T_96 = {_T_21,_T_21,_T_21,_T_21,_T_21,_T_21}; // @[MEM.scala 43:73]
  wire [11:0] _T_102 = {_T_21,_T_21,_T_21,_T_21,_T_21,_T_21,_T_96}; // @[MEM.scala 43:73]
  wire [31:0] _T_116 = {_T_21,_T_21,_T_21,_T_21,_T_21,_T_21,_T_96,_T_102,dataBus_rdData_0}; // @[MEM.scala 43:92]
  wire  _T_120 = in_mem[2] & dataBus_rdData_1[7]; // @[MEM.scala 46:56]
  wire [7:0] _T_173 = {_T_120,_T_120,_T_120,_T_120,_T_120,_T_120,_T_120,_T_120}; // @[MEM.scala 46:73]
  wire [23:0] _T_182 = {_T_120,_T_120,_T_120,_T_120,_T_120,_T_120,_T_120,_T_120,_T_173,dataBus_rdData_1}; // @[Cat.scala 29:58]
  wire [31:0] _T_184 = {_T_182,dataBus_rdData_0}; // @[MEM.scala 46:103]
  wire [31:0] _T_189 = {dataBus_rdData_3,dataBus_rdData_2,dataBus_rdData_1,dataBus_rdData_0}; // @[MEM.scala 49:72]
  wire [31:0] _GEN_16 = _T_8 ? $signed(_T_189) : $signed(32'sh0); // @[Conditional.scala 39:67]
  wire [31:0] _GEN_17 = _T_6 ? $signed(_T_184) : $signed(_GEN_16); // @[Conditional.scala 39:67]
  reg [31:0] delayedAluRes; // @[MEM.scala 53:30]
  assign out_memRes = _T_4 ? $signed(_T_116) : $signed(_GEN_17); // @[MEM.scala 40:14 MEM.scala 43:18 MEM.scala 46:18 MEM.scala 49:18]
  assign out_aluRes = delayedAluRes; // @[MEM.scala 58:14]
  assign out_rd = in_rd; // @[MEM.scala 57:10]
  assign out_wb = in_wb; // @[MEM.scala 55:10]
  assign out_wbSrc = in_wbSrc; // @[MEM.scala 56:13]
  assign dataBus_addr = in_aluRes; // @[MEM.scala 35:16]
  assign dataBus_wrData_0 = _T_11[7:0]; // @[MEM.scala 36:18]
  assign dataBus_wrData_1 = _T_11[15:8]; // @[MEM.scala 36:18]
  assign dataBus_wrData_2 = _T_11[23:16]; // @[MEM.scala 36:18]
  assign dataBus_wrData_3 = _T_11[31:24]; // @[MEM.scala 36:18]
  assign dataBus_we_0 = in_mem[3] & _GEN_8; // @[MEM.scala 20:14 MEM.scala 25:20 MEM.scala 28:20 MEM.scala 31:20]
  assign dataBus_we_1 = in_mem[3] & _GEN_9; // @[MEM.scala 20:14 MEM.scala 25:20 MEM.scala 28:20 MEM.scala 31:20]
  assign dataBus_we_2 = in_mem[3] & _GEN_10; // @[MEM.scala 20:14 MEM.scala 25:20 MEM.scala 28:20 MEM.scala 31:20]
  assign dataBus_we_3 = in_mem[3] & _GEN_10; // @[MEM.scala 20:14 MEM.scala 25:20 MEM.scala 28:20 MEM.scala 31:20]
  assign dataBus_w = in_mem[3]; // @[MEM.scala 21:13]
  assign ctrl_rd = in_rd; // @[MEM.scala 60:11]
  assign ctrl_aluRes = delayedAluRes; // @[MEM.scala 59:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  delayedAluRes = _RAND_0[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    delayedAluRes <= in_aluRes;
  end
endmodule
module WB(
  input  [31:0] in_memRes,
  input  [31:0] in_aluRes,
  input  [4:0]  in_rd,
  input         in_wb,
  input         in_wbSrc,
  output [4:0]  out_rd,
  output [31:0] out_res,
  output        out_wb,
  output [4:0]  ctrl_rd,
  output [31:0] ctrl_res
);
  assign out_rd = in_rd; // @[WB.scala 17:10]
  assign out_res = in_wbSrc ? $signed(in_memRes) : $signed(in_aluRes); // @[WB.scala 14:11]
  assign out_wb = in_wb; // @[WB.scala 18:10]
  assign ctrl_rd = in_rd; // @[WB.scala 15:11]
  assign ctrl_res = in_wbSrc ? $signed(in_memRes) : $signed(in_aluRes); // @[WB.scala 16:12]
endmodule
module ForwardingUnit(
  input  [4:0]  io_rs1,
  input  [4:0]  io_rs2,
  input  [4:0]  io_rd_MEM,
  input         io_wb_MEM,
  input  [4:0]  io_rd_WB,
  input         io_wb_WB,
  input  [31:0] io_aluRes_MEM,
  input  [31:0] io_res_WB,
  output [31:0] io_fwdA,
  output [31:0] io_fwdB,
  output        io_fwdA_en,
  output        io_fwdB_en
);
  wire  _T = io_rs1 == io_rd_MEM; // @[ForwardingUnit.scala 24:15]
  wire  _T_1 = _T & io_wb_MEM; // @[ForwardingUnit.scala 24:29]
  wire  _T_2 = io_rs1 == io_rd_WB; // @[ForwardingUnit.scala 28:21]
  wire  _T_3 = _T_2 & io_wb_WB; // @[ForwardingUnit.scala 28:34]
  wire [31:0] _GEN_1 = _T_3 ? $signed(io_res_WB) : $signed(32'sh0); // @[ForwardingUnit.scala 28:47]
  wire  _T_4 = io_rs2 == io_rd_MEM; // @[ForwardingUnit.scala 36:15]
  wire  _T_5 = _T_4 & io_wb_MEM; // @[ForwardingUnit.scala 36:29]
  wire  _T_6 = io_rs2 == io_rd_WB; // @[ForwardingUnit.scala 40:21]
  wire  _T_7 = _T_6 & io_wb_WB; // @[ForwardingUnit.scala 40:34]
  wire [31:0] _GEN_5 = _T_7 ? $signed(io_res_WB) : $signed(32'sh0); // @[ForwardingUnit.scala 40:47]
  assign io_fwdA = _T_1 ? $signed(io_aluRes_MEM) : $signed(_GEN_1); // @[ForwardingUnit.scala 26:13 ForwardingUnit.scala 30:13 ForwardingUnit.scala 32:13]
  assign io_fwdB = _T_5 ? $signed(io_aluRes_MEM) : $signed(_GEN_5); // @[ForwardingUnit.scala 38:13 ForwardingUnit.scala 42:13 ForwardingUnit.scala 44:13]
  assign io_fwdA_en = _T_1 | _T_3; // @[ForwardingUnit.scala 22:14 ForwardingUnit.scala 25:16 ForwardingUnit.scala 29:16]
  assign io_fwdB_en = _T_5 | _T_7; // @[ForwardingUnit.scala 35:14 ForwardingUnit.scala 37:16 ForwardingUnit.scala 41:16]
endmodule
module HazardDetectionUnit(
  output        io_pcEn,
  output        io_flushIF,
  output        io_flushID,
  output        io_enableIF_ID,
  input  [4:0]  io_rd_EX,
  input  [31:0] io_instr,
  input         io_wbSrc_EX,
  input         io_branch_EX
);
  wire  _T_1 = io_rd_EX == io_instr[19:15]; // @[HazardDetectionUnit.scala 22:18]
  wire  _T_3 = io_rd_EX == io_instr[24:20]; // @[HazardDetectionUnit.scala 22:51]
  wire  _T_4 = _T_1 | _T_3; // @[HazardDetectionUnit.scala 22:39]
  wire  _T_5 = _T_4 & io_wbSrc_EX; // @[HazardDetectionUnit.scala 22:73]
  wire  _GEN_0 = _T_5 ? 1'h0 : 1'h1; // @[HazardDetectionUnit.scala 22:89]
  assign io_pcEn = _T_5 ? 1'h0 : 1'h1; // @[HazardDetectionUnit.scala 17:11 HazardDetectionUnit.scala 23:13]
  assign io_flushIF = io_branch_EX; // @[HazardDetectionUnit.scala 18:14 HazardDetectionUnit.scala 29:16]
  assign io_flushID = io_branch_EX | _T_5; // @[HazardDetectionUnit.scala 19:14 HazardDetectionUnit.scala 24:16 HazardDetectionUnit.scala 30:16]
  assign io_enableIF_ID = io_branch_EX ? 1'h0 : _GEN_0; // @[HazardDetectionUnit.scala 20:18 HazardDetectionUnit.scala 25:20 HazardDetectionUnit.scala 31:20]
endmodule
module RVCore(
  input         clock,
  input         reset,
  output [31:0] io_dataBus_addr,
  input  [7:0]  io_dataBus_rdData_0,
  input  [7:0]  io_dataBus_rdData_1,
  input  [7:0]  io_dataBus_rdData_2,
  input  [7:0]  io_dataBus_rdData_3,
  output [7:0]  io_dataBus_wrData_0,
  output [7:0]  io_dataBus_wrData_1,
  output [7:0]  io_dataBus_wrData_2,
  output [7:0]  io_dataBus_wrData_3,
  output        io_dataBus_we_0,
  output        io_dataBus_we_1,
  output        io_dataBus_we_2,
  output        io_dataBus_we_3,
  output        io_dataBus_w
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
  reg [31:0] _RAND_20;
  reg [31:0] _RAND_21;
  reg [31:0] _RAND_22;
  reg [31:0] _RAND_23;
  reg [31:0] _RAND_24;
  reg [31:0] _RAND_25;
  reg [31:0] _RAND_26;
  reg [31:0] _RAND_27;
  reg [31:0] _RAND_28;
`endif // RANDOMIZE_REG_INIT
  wire  ifStage_clock; // @[RVCore.scala 18:23]
  wire  ifStage_reset; // @[RVCore.scala 18:23]
  wire [31:0] ifStage_in_pcNext; // @[RVCore.scala 18:23]
  wire  ifStage_in_branch; // @[RVCore.scala 18:23]
  wire [31:0] ifStage_out_pc; // @[RVCore.scala 18:23]
  wire [31:0] ifStage_out_instr; // @[RVCore.scala 18:23]
  wire  ifStage_ctrl_pcEn; // @[RVCore.scala 18:23]
  wire  idStage_clock; // @[RVCore.scala 19:23]
  wire  idStage_reset; // @[RVCore.scala 19:23]
  wire [31:0] idStage_in_pc; // @[RVCore.scala 19:23]
  wire [31:0] idStage_in_instr; // @[RVCore.scala 19:23]
  wire [31:0] idStage_out_pc; // @[RVCore.scala 19:23]
  wire [31:0] idStage_out_imm; // @[RVCore.scala 19:23]
  wire [31:0] idStage_out_regOp1; // @[RVCore.scala 19:23]
  wire [31:0] idStage_out_regOp2; // @[RVCore.scala 19:23]
  wire [4:0] idStage_out_rs1; // @[RVCore.scala 19:23]
  wire [4:0] idStage_out_rs2; // @[RVCore.scala 19:23]
  wire [4:0] idStage_out_rd; // @[RVCore.scala 19:23]
  wire [3:0] idStage_out_aluOp; // @[RVCore.scala 19:23]
  wire [1:0] idStage_out_aluSrc1; // @[RVCore.scala 19:23]
  wire [1:0] idStage_out_aluSrc2; // @[RVCore.scala 19:23]
  wire  idStage_out_brSrc; // @[RVCore.scala 19:23]
  wire  idStage_out_pcSrc; // @[RVCore.scala 19:23]
  wire  idStage_out_wb; // @[RVCore.scala 19:23]
  wire  idStage_out_wbSrc; // @[RVCore.scala 19:23]
  wire [3:0] idStage_out_mem; // @[RVCore.scala 19:23]
  wire  idStage_out_jump; // @[RVCore.scala 19:23]
  wire [2:0] idStage_out_funct3; // @[RVCore.scala 19:23]
  wire [4:0] idStage_wb_rd; // @[RVCore.scala 19:23]
  wire [31:0] idStage_wb_res; // @[RVCore.scala 19:23]
  wire  idStage_wb_wb; // @[RVCore.scala 19:23]
  wire  idStage_ctrl_flushID; // @[RVCore.scala 19:23]
  wire [31:0] idStage_ctrl_instr; // @[RVCore.scala 19:23]
  wire [31:0] exStage_in_pc; // @[RVCore.scala 20:23]
  wire [31:0] exStage_in_imm; // @[RVCore.scala 20:23]
  wire [31:0] exStage_in_regOp1; // @[RVCore.scala 20:23]
  wire [31:0] exStage_in_regOp2; // @[RVCore.scala 20:23]
  wire [4:0] exStage_in_rs1; // @[RVCore.scala 20:23]
  wire [4:0] exStage_in_rs2; // @[RVCore.scala 20:23]
  wire [4:0] exStage_in_rd; // @[RVCore.scala 20:23]
  wire [3:0] exStage_in_aluOp; // @[RVCore.scala 20:23]
  wire [1:0] exStage_in_aluSrc1; // @[RVCore.scala 20:23]
  wire [1:0] exStage_in_aluSrc2; // @[RVCore.scala 20:23]
  wire  exStage_in_brSrc; // @[RVCore.scala 20:23]
  wire  exStage_in_pcSrc; // @[RVCore.scala 20:23]
  wire  exStage_in_wb; // @[RVCore.scala 20:23]
  wire  exStage_in_wbSrc; // @[RVCore.scala 20:23]
  wire [3:0] exStage_in_mem; // @[RVCore.scala 20:23]
  wire  exStage_in_jump; // @[RVCore.scala 20:23]
  wire [2:0] exStage_in_funct3; // @[RVCore.scala 20:23]
  wire [31:0] exStage_out_aluRes; // @[RVCore.scala 20:23]
  wire [31:0] exStage_out_regOp2; // @[RVCore.scala 20:23]
  wire [4:0] exStage_out_rd; // @[RVCore.scala 20:23]
  wire  exStage_out_wb; // @[RVCore.scala 20:23]
  wire  exStage_out_wbSrc; // @[RVCore.scala 20:23]
  wire [3:0] exStage_out_mem; // @[RVCore.scala 20:23]
  wire [4:0] exStage_ctrl_rs1; // @[RVCore.scala 20:23]
  wire [4:0] exStage_ctrl_rs2; // @[RVCore.scala 20:23]
  wire [4:0] exStage_ctrl_rd; // @[RVCore.scala 20:23]
  wire [31:0] exStage_ctrl_fwdA; // @[RVCore.scala 20:23]
  wire [31:0] exStage_ctrl_fwdB; // @[RVCore.scala 20:23]
  wire  exStage_ctrl_fwdA_en; // @[RVCore.scala 20:23]
  wire  exStage_ctrl_fwdB_en; // @[RVCore.scala 20:23]
  wire [31:0] exStage_ctrl_branchOut_pcNext; // @[RVCore.scala 20:23]
  wire  exStage_ctrl_branchOut_branch; // @[RVCore.scala 20:23]
  wire  memStage_clock; // @[RVCore.scala 21:24]
  wire [31:0] memStage_in_aluRes; // @[RVCore.scala 21:24]
  wire [31:0] memStage_in_regOp2; // @[RVCore.scala 21:24]
  wire [4:0] memStage_in_rd; // @[RVCore.scala 21:24]
  wire  memStage_in_wb; // @[RVCore.scala 21:24]
  wire  memStage_in_wbSrc; // @[RVCore.scala 21:24]
  wire [3:0] memStage_in_mem; // @[RVCore.scala 21:24]
  wire [31:0] memStage_out_memRes; // @[RVCore.scala 21:24]
  wire [31:0] memStage_out_aluRes; // @[RVCore.scala 21:24]
  wire [4:0] memStage_out_rd; // @[RVCore.scala 21:24]
  wire  memStage_out_wb; // @[RVCore.scala 21:24]
  wire  memStage_out_wbSrc; // @[RVCore.scala 21:24]
  wire [31:0] memStage_dataBus_addr; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_rdData_0; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_rdData_1; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_rdData_2; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_rdData_3; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_wrData_0; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_wrData_1; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_wrData_2; // @[RVCore.scala 21:24]
  wire [7:0] memStage_dataBus_wrData_3; // @[RVCore.scala 21:24]
  wire  memStage_dataBus_we_0; // @[RVCore.scala 21:24]
  wire  memStage_dataBus_we_1; // @[RVCore.scala 21:24]
  wire  memStage_dataBus_we_2; // @[RVCore.scala 21:24]
  wire  memStage_dataBus_we_3; // @[RVCore.scala 21:24]
  wire  memStage_dataBus_w; // @[RVCore.scala 21:24]
  wire [4:0] memStage_ctrl_rd; // @[RVCore.scala 21:24]
  wire [31:0] memStage_ctrl_aluRes; // @[RVCore.scala 21:24]
  wire [31:0] wbStage_in_memRes; // @[RVCore.scala 22:23]
  wire [31:0] wbStage_in_aluRes; // @[RVCore.scala 22:23]
  wire [4:0] wbStage_in_rd; // @[RVCore.scala 22:23]
  wire  wbStage_in_wb; // @[RVCore.scala 22:23]
  wire  wbStage_in_wbSrc; // @[RVCore.scala 22:23]
  wire [4:0] wbStage_out_rd; // @[RVCore.scala 22:23]
  wire [31:0] wbStage_out_res; // @[RVCore.scala 22:23]
  wire  wbStage_out_wb; // @[RVCore.scala 22:23]
  wire [4:0] wbStage_ctrl_rd; // @[RVCore.scala 22:23]
  wire [31:0] wbStage_ctrl_res; // @[RVCore.scala 22:23]
  wire [4:0] forwardingUnit_io_rs1; // @[RVCore.scala 29:30]
  wire [4:0] forwardingUnit_io_rs2; // @[RVCore.scala 29:30]
  wire [4:0] forwardingUnit_io_rd_MEM; // @[RVCore.scala 29:30]
  wire  forwardingUnit_io_wb_MEM; // @[RVCore.scala 29:30]
  wire [4:0] forwardingUnit_io_rd_WB; // @[RVCore.scala 29:30]
  wire  forwardingUnit_io_wb_WB; // @[RVCore.scala 29:30]
  wire [31:0] forwardingUnit_io_aluRes_MEM; // @[RVCore.scala 29:30]
  wire [31:0] forwardingUnit_io_res_WB; // @[RVCore.scala 29:30]
  wire [31:0] forwardingUnit_io_fwdA; // @[RVCore.scala 29:30]
  wire [31:0] forwardingUnit_io_fwdB; // @[RVCore.scala 29:30]
  wire  forwardingUnit_io_fwdA_en; // @[RVCore.scala 29:30]
  wire  forwardingUnit_io_fwdB_en; // @[RVCore.scala 29:30]
  wire  hazardDetectionUnit_io_pcEn; // @[RVCore.scala 30:35]
  wire  hazardDetectionUnit_io_flushIF; // @[RVCore.scala 30:35]
  wire  hazardDetectionUnit_io_flushID; // @[RVCore.scala 30:35]
  wire  hazardDetectionUnit_io_enableIF_ID; // @[RVCore.scala 30:35]
  wire [4:0] hazardDetectionUnit_io_rd_EX; // @[RVCore.scala 30:35]
  wire [31:0] hazardDetectionUnit_io_instr; // @[RVCore.scala 30:35]
  wire  hazardDetectionUnit_io_wbSrc_EX; // @[RVCore.scala 30:35]
  wire  hazardDetectionUnit_io_branch_EX; // @[RVCore.scala 30:35]
  reg [31:0] if_id_pc; // @[RVCore.scala 32:22]
  reg [31:0] if_id_instr; // @[RVCore.scala 32:22]
  reg [31:0] id_ex_pc; // @[RVCore.scala 33:22]
  reg [31:0] id_ex_imm; // @[RVCore.scala 33:22]
  reg [31:0] id_ex_regOp1; // @[RVCore.scala 33:22]
  reg [31:0] id_ex_regOp2; // @[RVCore.scala 33:22]
  reg [4:0] id_ex_rs1; // @[RVCore.scala 33:22]
  reg [4:0] id_ex_rs2; // @[RVCore.scala 33:22]
  reg [4:0] id_ex_rd; // @[RVCore.scala 33:22]
  reg [3:0] id_ex_aluOp; // @[RVCore.scala 33:22]
  reg [1:0] id_ex_aluSrc1; // @[RVCore.scala 33:22]
  reg [1:0] id_ex_aluSrc2; // @[RVCore.scala 33:22]
  reg  id_ex_brSrc; // @[RVCore.scala 33:22]
  reg  id_ex_pcSrc; // @[RVCore.scala 33:22]
  reg  id_ex_wb; // @[RVCore.scala 33:22]
  reg  id_ex_wbSrc; // @[RVCore.scala 33:22]
  reg [3:0] id_ex_mem; // @[RVCore.scala 33:22]
  reg  id_ex_jump; // @[RVCore.scala 33:22]
  reg [2:0] id_ex_funct3; // @[RVCore.scala 33:22]
  reg [31:0] ex_mem_regOp2; // @[RVCore.scala 34:23]
  reg [4:0] ex_mem_rd; // @[RVCore.scala 34:23]
  reg  ex_mem_wb; // @[RVCore.scala 34:23]
  reg  ex_mem_wbSrc; // @[RVCore.scala 34:23]
  reg [3:0] ex_mem_mem; // @[RVCore.scala 34:23]
  reg [31:0] mem_wb_memRes; // @[RVCore.scala 35:23]
  reg [31:0] mem_wb_aluRes; // @[RVCore.scala 35:23]
  reg [4:0] mem_wb_rd; // @[RVCore.scala 35:23]
  reg  mem_wb_wb; // @[RVCore.scala 35:23]
  reg  mem_wb_wbSrc; // @[RVCore.scala 35:23]
  IF ifStage ( // @[RVCore.scala 18:23]
    .clock(ifStage_clock),
    .reset(ifStage_reset),
    .in_pcNext(ifStage_in_pcNext),
    .in_branch(ifStage_in_branch),
    .out_pc(ifStage_out_pc),
    .out_instr(ifStage_out_instr),
    .ctrl_pcEn(ifStage_ctrl_pcEn)
  );
  ID idStage ( // @[RVCore.scala 19:23]
    .clock(idStage_clock),
    .reset(idStage_reset),
    .in_pc(idStage_in_pc),
    .in_instr(idStage_in_instr),
    .out_pc(idStage_out_pc),
    .out_imm(idStage_out_imm),
    .out_regOp1(idStage_out_regOp1),
    .out_regOp2(idStage_out_regOp2),
    .out_rs1(idStage_out_rs1),
    .out_rs2(idStage_out_rs2),
    .out_rd(idStage_out_rd),
    .out_aluOp(idStage_out_aluOp),
    .out_aluSrc1(idStage_out_aluSrc1),
    .out_aluSrc2(idStage_out_aluSrc2),
    .out_brSrc(idStage_out_brSrc),
    .out_pcSrc(idStage_out_pcSrc),
    .out_wb(idStage_out_wb),
    .out_wbSrc(idStage_out_wbSrc),
    .out_mem(idStage_out_mem),
    .out_jump(idStage_out_jump),
    .out_funct3(idStage_out_funct3),
    .wb_rd(idStage_wb_rd),
    .wb_res(idStage_wb_res),
    .wb_wb(idStage_wb_wb),
    .ctrl_flushID(idStage_ctrl_flushID),
    .ctrl_instr(idStage_ctrl_instr)
  );
  EX exStage ( // @[RVCore.scala 20:23]
    .in_pc(exStage_in_pc),
    .in_imm(exStage_in_imm),
    .in_regOp1(exStage_in_regOp1),
    .in_regOp2(exStage_in_regOp2),
    .in_rs1(exStage_in_rs1),
    .in_rs2(exStage_in_rs2),
    .in_rd(exStage_in_rd),
    .in_aluOp(exStage_in_aluOp),
    .in_aluSrc1(exStage_in_aluSrc1),
    .in_aluSrc2(exStage_in_aluSrc2),
    .in_brSrc(exStage_in_brSrc),
    .in_pcSrc(exStage_in_pcSrc),
    .in_wb(exStage_in_wb),
    .in_wbSrc(exStage_in_wbSrc),
    .in_mem(exStage_in_mem),
    .in_jump(exStage_in_jump),
    .in_funct3(exStage_in_funct3),
    .out_aluRes(exStage_out_aluRes),
    .out_regOp2(exStage_out_regOp2),
    .out_rd(exStage_out_rd),
    .out_wb(exStage_out_wb),
    .out_wbSrc(exStage_out_wbSrc),
    .out_mem(exStage_out_mem),
    .ctrl_rs1(exStage_ctrl_rs1),
    .ctrl_rs2(exStage_ctrl_rs2),
    .ctrl_rd(exStage_ctrl_rd),
    .ctrl_fwdA(exStage_ctrl_fwdA),
    .ctrl_fwdB(exStage_ctrl_fwdB),
    .ctrl_fwdA_en(exStage_ctrl_fwdA_en),
    .ctrl_fwdB_en(exStage_ctrl_fwdB_en),
    .ctrl_branchOut_pcNext(exStage_ctrl_branchOut_pcNext),
    .ctrl_branchOut_branch(exStage_ctrl_branchOut_branch)
  );
  MEM memStage ( // @[RVCore.scala 21:24]
    .clock(memStage_clock),
    .in_aluRes(memStage_in_aluRes),
    .in_regOp2(memStage_in_regOp2),
    .in_rd(memStage_in_rd),
    .in_wb(memStage_in_wb),
    .in_wbSrc(memStage_in_wbSrc),
    .in_mem(memStage_in_mem),
    .out_memRes(memStage_out_memRes),
    .out_aluRes(memStage_out_aluRes),
    .out_rd(memStage_out_rd),
    .out_wb(memStage_out_wb),
    .out_wbSrc(memStage_out_wbSrc),
    .dataBus_addr(memStage_dataBus_addr),
    .dataBus_rdData_0(memStage_dataBus_rdData_0),
    .dataBus_rdData_1(memStage_dataBus_rdData_1),
    .dataBus_rdData_2(memStage_dataBus_rdData_2),
    .dataBus_rdData_3(memStage_dataBus_rdData_3),
    .dataBus_wrData_0(memStage_dataBus_wrData_0),
    .dataBus_wrData_1(memStage_dataBus_wrData_1),
    .dataBus_wrData_2(memStage_dataBus_wrData_2),
    .dataBus_wrData_3(memStage_dataBus_wrData_3),
    .dataBus_we_0(memStage_dataBus_we_0),
    .dataBus_we_1(memStage_dataBus_we_1),
    .dataBus_we_2(memStage_dataBus_we_2),
    .dataBus_we_3(memStage_dataBus_we_3),
    .dataBus_w(memStage_dataBus_w),
    .ctrl_rd(memStage_ctrl_rd),
    .ctrl_aluRes(memStage_ctrl_aluRes)
  );
  WB wbStage ( // @[RVCore.scala 22:23]
    .in_memRes(wbStage_in_memRes),
    .in_aluRes(wbStage_in_aluRes),
    .in_rd(wbStage_in_rd),
    .in_wb(wbStage_in_wb),
    .in_wbSrc(wbStage_in_wbSrc),
    .out_rd(wbStage_out_rd),
    .out_res(wbStage_out_res),
    .out_wb(wbStage_out_wb),
    .ctrl_rd(wbStage_ctrl_rd),
    .ctrl_res(wbStage_ctrl_res)
  );
  ForwardingUnit forwardingUnit ( // @[RVCore.scala 29:30]
    .io_rs1(forwardingUnit_io_rs1),
    .io_rs2(forwardingUnit_io_rs2),
    .io_rd_MEM(forwardingUnit_io_rd_MEM),
    .io_wb_MEM(forwardingUnit_io_wb_MEM),
    .io_rd_WB(forwardingUnit_io_rd_WB),
    .io_wb_WB(forwardingUnit_io_wb_WB),
    .io_aluRes_MEM(forwardingUnit_io_aluRes_MEM),
    .io_res_WB(forwardingUnit_io_res_WB),
    .io_fwdA(forwardingUnit_io_fwdA),
    .io_fwdB(forwardingUnit_io_fwdB),
    .io_fwdA_en(forwardingUnit_io_fwdA_en),
    .io_fwdB_en(forwardingUnit_io_fwdB_en)
  );
  HazardDetectionUnit hazardDetectionUnit ( // @[RVCore.scala 30:35]
    .io_pcEn(hazardDetectionUnit_io_pcEn),
    .io_flushIF(hazardDetectionUnit_io_flushIF),
    .io_flushID(hazardDetectionUnit_io_flushID),
    .io_enableIF_ID(hazardDetectionUnit_io_enableIF_ID),
    .io_rd_EX(hazardDetectionUnit_io_rd_EX),
    .io_instr(hazardDetectionUnit_io_instr),
    .io_wbSrc_EX(hazardDetectionUnit_io_wbSrc_EX),
    .io_branch_EX(hazardDetectionUnit_io_branch_EX)
  );
  assign io_dataBus_addr = memStage_dataBus_addr; // @[RVCore.scala 80:14]
  assign io_dataBus_wrData_0 = memStage_dataBus_wrData_0; // @[RVCore.scala 80:14]
  assign io_dataBus_wrData_1 = memStage_dataBus_wrData_1; // @[RVCore.scala 80:14]
  assign io_dataBus_wrData_2 = memStage_dataBus_wrData_2; // @[RVCore.scala 80:14]
  assign io_dataBus_wrData_3 = memStage_dataBus_wrData_3; // @[RVCore.scala 80:14]
  assign io_dataBus_we_0 = memStage_dataBus_we_0; // @[RVCore.scala 80:14]
  assign io_dataBus_we_1 = memStage_dataBus_we_1; // @[RVCore.scala 80:14]
  assign io_dataBus_we_2 = memStage_dataBus_we_2; // @[RVCore.scala 80:14]
  assign io_dataBus_we_3 = memStage_dataBus_we_3; // @[RVCore.scala 80:14]
  assign io_dataBus_w = memStage_dataBus_w; // @[RVCore.scala 80:14]
  assign ifStage_clock = clock;
  assign ifStage_reset = reset;
  assign ifStage_in_pcNext = exStage_ctrl_branchOut_pcNext; // @[RVCore.scala 38:14]
  assign ifStage_in_branch = exStage_ctrl_branchOut_branch; // @[RVCore.scala 38:14]
  assign ifStage_ctrl_pcEn = hazardDetectionUnit_io_pcEn; // @[RVCore.scala 39:21]
  assign idStage_clock = clock;
  assign idStage_reset = reset;
  assign idStage_in_pc = if_id_pc; // @[RVCore.scala 48:14]
  assign idStage_in_instr = if_id_instr; // @[RVCore.scala 48:14]
  assign idStage_wb_rd = wbStage_out_rd; // @[RVCore.scala 47:14]
  assign idStage_wb_res = wbStage_out_res; // @[RVCore.scala 47:14]
  assign idStage_wb_wb = wbStage_out_wb; // @[RVCore.scala 47:14]
  assign idStage_ctrl_flushID = hazardDetectionUnit_io_flushID; // @[RVCore.scala 46:24]
  assign exStage_in_pc = id_ex_pc; // @[RVCore.scala 53:14]
  assign exStage_in_imm = id_ex_imm; // @[RVCore.scala 53:14]
  assign exStage_in_regOp1 = id_ex_regOp1; // @[RVCore.scala 53:14]
  assign exStage_in_regOp2 = id_ex_regOp2; // @[RVCore.scala 53:14]
  assign exStage_in_rs1 = id_ex_rs1; // @[RVCore.scala 53:14]
  assign exStage_in_rs2 = id_ex_rs2; // @[RVCore.scala 53:14]
  assign exStage_in_rd = id_ex_rd; // @[RVCore.scala 53:14]
  assign exStage_in_aluOp = id_ex_aluOp; // @[RVCore.scala 53:14]
  assign exStage_in_aluSrc1 = id_ex_aluSrc1; // @[RVCore.scala 53:14]
  assign exStage_in_aluSrc2 = id_ex_aluSrc2; // @[RVCore.scala 53:14]
  assign exStage_in_brSrc = id_ex_brSrc; // @[RVCore.scala 53:14]
  assign exStage_in_pcSrc = id_ex_pcSrc; // @[RVCore.scala 53:14]
  assign exStage_in_wb = id_ex_wb; // @[RVCore.scala 53:14]
  assign exStage_in_wbSrc = id_ex_wbSrc; // @[RVCore.scala 53:14]
  assign exStage_in_mem = id_ex_mem; // @[RVCore.scala 53:14]
  assign exStage_in_jump = id_ex_jump; // @[RVCore.scala 53:14]
  assign exStage_in_funct3 = id_ex_funct3; // @[RVCore.scala 53:14]
  assign exStage_ctrl_fwdA = forwardingUnit_io_fwdA; // @[RVCore.scala 60:21]
  assign exStage_ctrl_fwdB = forwardingUnit_io_fwdB; // @[RVCore.scala 61:21]
  assign exStage_ctrl_fwdA_en = forwardingUnit_io_fwdA_en; // @[RVCore.scala 62:24]
  assign exStage_ctrl_fwdB_en = forwardingUnit_io_fwdB_en; // @[RVCore.scala 63:24]
  assign memStage_clock = clock;
  assign memStage_in_aluRes = exStage_out_aluRes; // @[RVCore.scala 67:15 RVCore.scala 68:22]
  assign memStage_in_regOp2 = ex_mem_regOp2; // @[RVCore.scala 67:15]
  assign memStage_in_rd = ex_mem_rd; // @[RVCore.scala 67:15]
  assign memStage_in_wb = ex_mem_wb; // @[RVCore.scala 67:15]
  assign memStage_in_wbSrc = ex_mem_wbSrc; // @[RVCore.scala 67:15]
  assign memStage_in_mem = ex_mem_mem; // @[RVCore.scala 67:15]
  assign memStage_dataBus_rdData_0 = io_dataBus_rdData_0; // @[RVCore.scala 80:14]
  assign memStage_dataBus_rdData_1 = io_dataBus_rdData_1; // @[RVCore.scala 80:14]
  assign memStage_dataBus_rdData_2 = io_dataBus_rdData_2; // @[RVCore.scala 80:14]
  assign memStage_dataBus_rdData_3 = io_dataBus_rdData_3; // @[RVCore.scala 80:14]
  assign wbStage_in_memRes = mem_wb_memRes; // @[RVCore.scala 75:14]
  assign wbStage_in_aluRes = mem_wb_aluRes; // @[RVCore.scala 75:14]
  assign wbStage_in_rd = mem_wb_rd; // @[RVCore.scala 75:14]
  assign wbStage_in_wb = mem_wb_wb; // @[RVCore.scala 75:14]
  assign wbStage_in_wbSrc = mem_wb_wbSrc; // @[RVCore.scala 75:14]
  assign forwardingUnit_io_rs1 = exStage_ctrl_rs1; // @[RVCore.scala 55:25]
  assign forwardingUnit_io_rs2 = exStage_ctrl_rs2; // @[RVCore.scala 56:25]
  assign forwardingUnit_io_rd_MEM = memStage_ctrl_rd; // @[RVCore.scala 70:28]
  assign forwardingUnit_io_wb_MEM = memStage_out_wb; // @[RVCore.scala 72:28]
  assign forwardingUnit_io_rd_WB = wbStage_ctrl_rd; // @[RVCore.scala 76:27]
  assign forwardingUnit_io_wb_WB = wbStage_out_wb; // @[RVCore.scala 78:27]
  assign forwardingUnit_io_aluRes_MEM = memStage_ctrl_aluRes; // @[RVCore.scala 71:32]
  assign forwardingUnit_io_res_WB = wbStage_ctrl_res; // @[RVCore.scala 77:28]
  assign hazardDetectionUnit_io_rd_EX = exStage_ctrl_rd; // @[RVCore.scala 57:32]
  assign hazardDetectionUnit_io_instr = idStage_ctrl_instr; // @[RVCore.scala 45:32]
  assign hazardDetectionUnit_io_wbSrc_EX = exStage_out_wbSrc; // @[RVCore.scala 59:35]
  assign hazardDetectionUnit_io_branch_EX = exStage_ctrl_branchOut_branch; // @[RVCore.scala 58:36]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  if_id_pc = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  if_id_instr = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  id_ex_pc = _RAND_2[31:0];
  _RAND_3 = {1{`RANDOM}};
  id_ex_imm = _RAND_3[31:0];
  _RAND_4 = {1{`RANDOM}};
  id_ex_regOp1 = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  id_ex_regOp2 = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  id_ex_rs1 = _RAND_6[4:0];
  _RAND_7 = {1{`RANDOM}};
  id_ex_rs2 = _RAND_7[4:0];
  _RAND_8 = {1{`RANDOM}};
  id_ex_rd = _RAND_8[4:0];
  _RAND_9 = {1{`RANDOM}};
  id_ex_aluOp = _RAND_9[3:0];
  _RAND_10 = {1{`RANDOM}};
  id_ex_aluSrc1 = _RAND_10[1:0];
  _RAND_11 = {1{`RANDOM}};
  id_ex_aluSrc2 = _RAND_11[1:0];
  _RAND_12 = {1{`RANDOM}};
  id_ex_brSrc = _RAND_12[0:0];
  _RAND_13 = {1{`RANDOM}};
  id_ex_pcSrc = _RAND_13[0:0];
  _RAND_14 = {1{`RANDOM}};
  id_ex_wb = _RAND_14[0:0];
  _RAND_15 = {1{`RANDOM}};
  id_ex_wbSrc = _RAND_15[0:0];
  _RAND_16 = {1{`RANDOM}};
  id_ex_mem = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  id_ex_jump = _RAND_17[0:0];
  _RAND_18 = {1{`RANDOM}};
  id_ex_funct3 = _RAND_18[2:0];
  _RAND_19 = {1{`RANDOM}};
  ex_mem_regOp2 = _RAND_19[31:0];
  _RAND_20 = {1{`RANDOM}};
  ex_mem_rd = _RAND_20[4:0];
  _RAND_21 = {1{`RANDOM}};
  ex_mem_wb = _RAND_21[0:0];
  _RAND_22 = {1{`RANDOM}};
  ex_mem_wbSrc = _RAND_22[0:0];
  _RAND_23 = {1{`RANDOM}};
  ex_mem_mem = _RAND_23[3:0];
  _RAND_24 = {1{`RANDOM}};
  mem_wb_memRes = _RAND_24[31:0];
  _RAND_25 = {1{`RANDOM}};
  mem_wb_aluRes = _RAND_25[31:0];
  _RAND_26 = {1{`RANDOM}};
  mem_wb_rd = _RAND_26[4:0];
  _RAND_27 = {1{`RANDOM}};
  mem_wb_wb = _RAND_27[0:0];
  _RAND_28 = {1{`RANDOM}};
  mem_wb_wbSrc = _RAND_28[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      if_id_pc <= 32'h0;
    end else if (hazardDetectionUnit_io_flushIF) begin
      if_id_pc <= 32'h0;
    end else if (hazardDetectionUnit_io_enableIF_ID) begin
      if_id_pc <= ifStage_out_pc;
    end
    if (reset) begin
      if_id_instr <= 32'sh0;
    end else if (hazardDetectionUnit_io_flushIF) begin
      if_id_instr <= 32'sh0;
    end else if (hazardDetectionUnit_io_enableIF_ID) begin
      if_id_instr <= ifStage_out_instr;
    end
    if (reset) begin
      id_ex_pc <= 32'h0;
    end else begin
      id_ex_pc <= idStage_out_pc;
    end
    if (reset) begin
      id_ex_imm <= 32'sh0;
    end else begin
      id_ex_imm <= idStage_out_imm;
    end
    if (reset) begin
      id_ex_regOp1 <= 32'sh0;
    end else begin
      id_ex_regOp1 <= idStage_out_regOp1;
    end
    if (reset) begin
      id_ex_regOp2 <= 32'sh0;
    end else begin
      id_ex_regOp2 <= idStage_out_regOp2;
    end
    if (reset) begin
      id_ex_rs1 <= 5'h0;
    end else begin
      id_ex_rs1 <= idStage_out_rs1;
    end
    if (reset) begin
      id_ex_rs2 <= 5'h0;
    end else begin
      id_ex_rs2 <= idStage_out_rs2;
    end
    if (reset) begin
      id_ex_rd <= 5'h0;
    end else begin
      id_ex_rd <= idStage_out_rd;
    end
    if (reset) begin
      id_ex_aluOp <= 4'h0;
    end else begin
      id_ex_aluOp <= idStage_out_aluOp;
    end
    if (reset) begin
      id_ex_aluSrc1 <= 2'h0;
    end else begin
      id_ex_aluSrc1 <= idStage_out_aluSrc1;
    end
    if (reset) begin
      id_ex_aluSrc2 <= 2'h0;
    end else begin
      id_ex_aluSrc2 <= idStage_out_aluSrc2;
    end
    if (reset) begin
      id_ex_brSrc <= 1'h0;
    end else begin
      id_ex_brSrc <= idStage_out_brSrc;
    end
    if (reset) begin
      id_ex_pcSrc <= 1'h0;
    end else begin
      id_ex_pcSrc <= idStage_out_pcSrc;
    end
    if (reset) begin
      id_ex_wb <= 1'h0;
    end else begin
      id_ex_wb <= idStage_out_wb;
    end
    if (reset) begin
      id_ex_wbSrc <= 1'h0;
    end else begin
      id_ex_wbSrc <= idStage_out_wbSrc;
    end
    if (reset) begin
      id_ex_mem <= 4'h0;
    end else begin
      id_ex_mem <= idStage_out_mem;
    end
    if (reset) begin
      id_ex_jump <= 1'h0;
    end else begin
      id_ex_jump <= idStage_out_jump;
    end
    if (reset) begin
      id_ex_funct3 <= 3'h0;
    end else begin
      id_ex_funct3 <= idStage_out_funct3;
    end
    if (reset) begin
      ex_mem_regOp2 <= 32'sh0;
    end else begin
      ex_mem_regOp2 <= exStage_out_regOp2;
    end
    if (reset) begin
      ex_mem_rd <= 5'h0;
    end else begin
      ex_mem_rd <= exStage_out_rd;
    end
    if (reset) begin
      ex_mem_wb <= 1'h0;
    end else begin
      ex_mem_wb <= exStage_out_wb;
    end
    if (reset) begin
      ex_mem_wbSrc <= 1'h0;
    end else begin
      ex_mem_wbSrc <= exStage_out_wbSrc;
    end
    if (reset) begin
      ex_mem_mem <= 4'h0;
    end else begin
      ex_mem_mem <= exStage_out_mem;
    end
    if (reset) begin
      mem_wb_memRes <= 32'sh0;
    end else begin
      mem_wb_memRes <= memStage_out_memRes;
    end
    if (reset) begin
      mem_wb_aluRes <= 32'sh0;
    end else begin
      mem_wb_aluRes <= memStage_out_aluRes;
    end
    if (reset) begin
      mem_wb_rd <= 5'h0;
    end else begin
      mem_wb_rd <= memStage_out_rd;
    end
    if (reset) begin
      mem_wb_wb <= 1'h0;
    end else begin
      mem_wb_wb <= memStage_out_wb;
    end
    if (reset) begin
      mem_wb_wbSrc <= 1'h0;
    end else begin
      mem_wb_wbSrc <= memStage_out_wbSrc;
    end
  end
endmodule
module RingBuffer(
  input        clock,
  input        reset,
  input        io_enq_write,
  output       io_enq_full,
  input  [7:0] io_enq_data,
  input        io_deq_read,
  output       io_deq_empty,
  output [7:0] io_deq_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [31:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] mem_0; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_1; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_2; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_3; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_4; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_5; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_6; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_7; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_8; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_9; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_10; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_11; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_12; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_13; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_14; // @[RingBuffer.scala 14:20]
  reg [7:0] mem_15; // @[RingBuffer.scala 14:20]
  reg [3:0] head; // @[RingBuffer.scala 15:21]
  reg [3:0] tail; // @[RingBuffer.scala 16:21]
  reg  wrapBitHead; // @[RingBuffer.scala 17:28]
  reg  wrapBitTail; // @[RingBuffer.scala 18:28]
  wire  _T_1 = head == tail; // @[RingBuffer.scala 27:13]
  wire  _T_2 = wrapBitHead == wrapBitTail; // @[RingBuffer.scala 28:22]
  wire  _GEN_1 = _T_2 ? 1'h0 : 1'h1; // @[RingBuffer.scala 28:39]
  wire  empty = _T_1 & _T_2; // @[RingBuffer.scala 27:23]
  wire  full = _T_1 & _GEN_1; // @[RingBuffer.scala 27:23]
  wire  _T_3 = ~full; // @[RingBuffer.scala 36:24]
  wire  _T_4 = io_enq_write & _T_3; // @[RingBuffer.scala 36:21]
  wire  _T_5 = head == 4'hf; // @[RingBuffer.scala 38:15]
  wire  _T_6 = ~wrapBitHead; // @[RingBuffer.scala 40:22]
  wire [3:0] _T_8 = head + 4'h1; // @[RingBuffer.scala 42:20]
  wire [7:0] _GEN_41 = 4'h1 == tail ? mem_1 : mem_0; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_42 = 4'h2 == tail ? mem_2 : _GEN_41; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_43 = 4'h3 == tail ? mem_3 : _GEN_42; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_44 = 4'h4 == tail ? mem_4 : _GEN_43; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_45 = 4'h5 == tail ? mem_5 : _GEN_44; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_46 = 4'h6 == tail ? mem_6 : _GEN_45; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_47 = 4'h7 == tail ? mem_7 : _GEN_46; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_48 = 4'h8 == tail ? mem_8 : _GEN_47; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_49 = 4'h9 == tail ? mem_9 : _GEN_48; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_50 = 4'ha == tail ? mem_10 : _GEN_49; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_51 = 4'hb == tail ? mem_11 : _GEN_50; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_52 = 4'hc == tail ? mem_12 : _GEN_51; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_53 = 4'hd == tail ? mem_13 : _GEN_52; // @[RingBuffer.scala 47:15]
  wire [7:0] _GEN_54 = 4'he == tail ? mem_14 : _GEN_53; // @[RingBuffer.scala 47:15]
  wire  _T_9 = ~empty; // @[RingBuffer.scala 48:23]
  wire  _T_10 = io_deq_read & _T_9; // @[RingBuffer.scala 48:20]
  wire  _T_11 = tail == 4'hf; // @[RingBuffer.scala 49:15]
  wire  _T_12 = ~wrapBitTail; // @[RingBuffer.scala 51:22]
  wire [3:0] _T_14 = tail + 4'h1; // @[RingBuffer.scala 53:20]
  assign io_enq_full = _T_1 & _GEN_1; // @[RingBuffer.scala 57:15]
  assign io_deq_empty = _T_1 & _T_2; // @[RingBuffer.scala 58:16]
  assign io_deq_data = 4'hf == tail ? mem_15 : _GEN_54; // @[RingBuffer.scala 47:15]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  mem_0 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  mem_1 = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  mem_2 = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  mem_3 = _RAND_3[7:0];
  _RAND_4 = {1{`RANDOM}};
  mem_4 = _RAND_4[7:0];
  _RAND_5 = {1{`RANDOM}};
  mem_5 = _RAND_5[7:0];
  _RAND_6 = {1{`RANDOM}};
  mem_6 = _RAND_6[7:0];
  _RAND_7 = {1{`RANDOM}};
  mem_7 = _RAND_7[7:0];
  _RAND_8 = {1{`RANDOM}};
  mem_8 = _RAND_8[7:0];
  _RAND_9 = {1{`RANDOM}};
  mem_9 = _RAND_9[7:0];
  _RAND_10 = {1{`RANDOM}};
  mem_10 = _RAND_10[7:0];
  _RAND_11 = {1{`RANDOM}};
  mem_11 = _RAND_11[7:0];
  _RAND_12 = {1{`RANDOM}};
  mem_12 = _RAND_12[7:0];
  _RAND_13 = {1{`RANDOM}};
  mem_13 = _RAND_13[7:0];
  _RAND_14 = {1{`RANDOM}};
  mem_14 = _RAND_14[7:0];
  _RAND_15 = {1{`RANDOM}};
  mem_15 = _RAND_15[7:0];
  _RAND_16 = {1{`RANDOM}};
  head = _RAND_16[3:0];
  _RAND_17 = {1{`RANDOM}};
  tail = _RAND_17[3:0];
  _RAND_18 = {1{`RANDOM}};
  wrapBitHead = _RAND_18[0:0];
  _RAND_19 = {1{`RANDOM}};
  wrapBitTail = _RAND_19[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      mem_0 <= 8'h0;
    end else if (_T_4) begin
      if (4'h0 == head) begin
        mem_0 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_1 <= 8'h0;
    end else if (_T_4) begin
      if (4'h1 == head) begin
        mem_1 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_2 <= 8'h0;
    end else if (_T_4) begin
      if (4'h2 == head) begin
        mem_2 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_3 <= 8'h0;
    end else if (_T_4) begin
      if (4'h3 == head) begin
        mem_3 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_4 <= 8'h0;
    end else if (_T_4) begin
      if (4'h4 == head) begin
        mem_4 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_5 <= 8'h0;
    end else if (_T_4) begin
      if (4'h5 == head) begin
        mem_5 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_6 <= 8'h0;
    end else if (_T_4) begin
      if (4'h6 == head) begin
        mem_6 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_7 <= 8'h0;
    end else if (_T_4) begin
      if (4'h7 == head) begin
        mem_7 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_8 <= 8'h0;
    end else if (_T_4) begin
      if (4'h8 == head) begin
        mem_8 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_9 <= 8'h0;
    end else if (_T_4) begin
      if (4'h9 == head) begin
        mem_9 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_10 <= 8'h0;
    end else if (_T_4) begin
      if (4'ha == head) begin
        mem_10 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_11 <= 8'h0;
    end else if (_T_4) begin
      if (4'hb == head) begin
        mem_11 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_12 <= 8'h0;
    end else if (_T_4) begin
      if (4'hc == head) begin
        mem_12 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_13 <= 8'h0;
    end else if (_T_4) begin
      if (4'hd == head) begin
        mem_13 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_14 <= 8'h0;
    end else if (_T_4) begin
      if (4'he == head) begin
        mem_14 <= io_enq_data;
      end
    end
    if (reset) begin
      mem_15 <= 8'h0;
    end else if (_T_4) begin
      if (4'hf == head) begin
        mem_15 <= io_enq_data;
      end
    end
    if (reset) begin
      head <= 4'h0;
    end else if (_T_4) begin
      if (_T_5) begin
        head <= 4'h0;
      end else begin
        head <= _T_8;
      end
    end
    if (reset) begin
      tail <= 4'h0;
    end else if (_T_10) begin
      if (_T_11) begin
        tail <= 4'h0;
      end else begin
        tail <= _T_14;
      end
    end
    if (reset) begin
      wrapBitHead <= 1'h0;
    end else if (_T_4) begin
      if (_T_5) begin
        wrapBitHead <= _T_6;
      end
    end
    if (reset) begin
      wrapBitTail <= 1'h0;
    end else if (_T_10) begin
      if (_T_11) begin
        wrapBitTail <= _T_12;
      end
    end
  end
endmodule
module PS2(
  input        clock,
  input        reset,
  input        ps2_clk,
  input        ps2_data,
  output [7:0] bus_data,
  output [7:0] bus_flag,
  input        bus_clear
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  wire  buffer_clock; // @[PS2.scala 16:22]
  wire  buffer_reset; // @[PS2.scala 16:22]
  wire  buffer_io_enq_write; // @[PS2.scala 16:22]
  wire  buffer_io_enq_full; // @[PS2.scala 16:22]
  wire [7:0] buffer_io_enq_data; // @[PS2.scala 16:22]
  wire  buffer_io_deq_read; // @[PS2.scala 16:22]
  wire  buffer_io_deq_empty; // @[PS2.scala 16:22]
  wire [7:0] buffer_io_deq_data; // @[PS2.scala 16:22]
  reg [10:0] shiftReg; // @[PS2.scala 19:25]
  reg [3:0] countReg; // @[PS2.scala 20:25]
  wire  _T = countReg == 4'ha; // @[PS2.scala 22:17]
  wire  _T_1 = _T & bus_clear; // @[PS2.scala 22:26]
  wire [10:0] _T_3 = {ps2_data,shiftReg[10:1]}; // @[Cat.scala 29:58]
  wire  _T_5 = ~buffer_io_deq_empty; // @[PS2.scala 29:16]
  wire  _T_6 = ~ps2_clk; // @[PS2.scala 32:8]
  reg  _T_7; // @[PS2.scala 32:27]
  wire  _T_8 = _T_6 & _T_7; // @[PS2.scala 32:17]
  wire [3:0] _T_10 = countReg + 4'h1; // @[PS2.scala 33:26]
  wire  _T_13 = countReg == 4'h9; // @[PS2.scala 35:19]
  wire  _T_14 = ~buffer_io_enq_full; // @[PS2.scala 37:12]
  wire  _GEN_3 = _T_13 & _T_14; // @[PS2.scala 35:27]
  RingBuffer buffer ( // @[PS2.scala 16:22]
    .clock(buffer_clock),
    .reset(buffer_reset),
    .io_enq_write(buffer_io_enq_write),
    .io_enq_full(buffer_io_enq_full),
    .io_enq_data(buffer_io_enq_data),
    .io_deq_read(buffer_io_deq_read),
    .io_deq_empty(buffer_io_deq_empty),
    .io_deq_data(buffer_io_deq_data)
  );
  assign bus_data = buffer_io_deq_data; // @[PS2.scala 28:12]
  assign bus_flag = {{7'd0}, _T_5}; // @[PS2.scala 29:12]
  assign buffer_clock = clock;
  assign buffer_reset = reset;
  assign buffer_io_enq_write = _T_8 & _GEN_3; // @[PS2.scala 17:23 PS2.scala 38:29]
  assign buffer_io_enq_data = _T_3[8:1]; // @[PS2.scala 26:22]
  assign buffer_io_deq_read = bus_clear; // @[PS2.scala 30:22]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  shiftReg = _RAND_0[10:0];
  _RAND_1 = {1{`RANDOM}};
  countReg = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  _T_7 = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      shiftReg <= 11'h0;
    end else if (_T_8) begin
      shiftReg <= _T_3;
    end
    if (reset) begin
      countReg <= 4'h0;
    end else if (_T_8) begin
      if (_T_13) begin
        countReg <= 4'h0;
      end else begin
        countReg <= _T_10;
      end
    end else if (_T_1) begin
      countReg <= 4'h0;
    end
    _T_7 <= ps2_clk;
  end
endmodule
module memory.RAM(
  input         clock,
  input  [31:0] io_addr,
  output [7:0]  io_rdData_0,
  output [7:0]  io_rdData_1,
  output [7:0]  io_rdData_2,
  output [7:0]  io_rdData_3,
  input  [7:0]  io_wrData_0,
  input  [7:0]  io_wrData_1,
  input  [7:0]  io_wrData_2,
  input  [7:0]  io_wrData_3,
  input         io_we_0,
  input         io_we_1,
  input         io_we_2,
  input         io_we_3,
  input         io_w
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [7:0] banks_0 [0:1023]; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_0__T_9_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_0__T_9_addr; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_0__T_78_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_0__T_78_addr; // @[memory.RAM.scala 9:30]
  wire  banks_0__T_78_mask; // @[memory.RAM.scala 9:30]
  wire  banks_0__T_78_en; // @[memory.RAM.scala 9:30]
  reg [7:0] banks_1 [0:1023]; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_1__T_18_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_1__T_18_addr; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_1__T_87_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_1__T_87_addr; // @[memory.RAM.scala 9:30]
  wire  banks_1__T_87_mask; // @[memory.RAM.scala 9:30]
  wire  banks_1__T_87_en; // @[memory.RAM.scala 9:30]
  reg [7:0] banks_2 [0:1023]; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_2__T_27_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_2__T_27_addr; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_2__T_96_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_2__T_96_addr; // @[memory.RAM.scala 9:30]
  wire  banks_2__T_96_mask; // @[memory.RAM.scala 9:30]
  wire  banks_2__T_96_en; // @[memory.RAM.scala 9:30]
  reg [7:0] banks_3 [0:1023]; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_3__T_36_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_3__T_36_addr; // @[memory.RAM.scala 9:30]
  wire [7:0] banks_3__T_105_data; // @[memory.RAM.scala 9:30]
  wire [9:0] banks_3__T_105_addr; // @[memory.RAM.scala 9:30]
  wire  banks_3__T_105_mask; // @[memory.RAM.scala 9:30]
  wire  banks_3__T_105_en; // @[memory.RAM.scala 9:30]
  reg [31:0] address; // @[memory.RAM.scala 11:24]
  wire [1:0] byteOffset = address[1:0]; // @[memory.RAM.scala 14:24]
  wire  _T_2 = byteOffset > 2'h0; // @[memory.RAM.scala 16:78]
  wire [29:0] _T_5 = address[31:2] + 30'h1; // @[memory.RAM.scala 16:100]
  wire [29:0] _T_7 = _T_2 ? _T_5 : address[31:2]; // @[memory.RAM.scala 16:63]
  wire  _T_11 = byteOffset > 2'h1; // @[memory.RAM.scala 16:78]
  wire [29:0] _T_16 = _T_11 ? _T_5 : address[31:2]; // @[memory.RAM.scala 16:63]
  wire  _T_20 = byteOffset > 2'h2; // @[memory.RAM.scala 16:78]
  wire [29:0] _T_25 = _T_20 ? _T_5 : address[31:2]; // @[memory.RAM.scala 16:63]
  wire [2:0] _T_37 = {{1'd0}, byteOffset}; // @[memory.RAM.scala 17:64]
  wire [1:0] _T_40 = byteOffset + 2'h1; // @[memory.RAM.scala 17:64]
  wire [1:0] _T_42 = byteOffset + 2'h2; // @[memory.RAM.scala 17:64]
  wire [1:0] _T_44 = byteOffset + 2'h3; // @[memory.RAM.scala 17:64]
  wire [7:0] rdPorts_0 = banks_0__T_9_data; // @[memory.RAM.scala 16:24 memory.RAM.scala 16:24]
  wire [7:0] rdPorts_1 = banks_1__T_18_data; // @[memory.RAM.scala 16:24 memory.RAM.scala 16:24]
  wire [7:0] _GEN_1 = 2'h1 == _T_37[1:0] ? rdPorts_1 : rdPorts_0; // @[memory.RAM.scala 17:23]
  wire [7:0] rdPorts_2 = banks_2__T_27_data; // @[memory.RAM.scala 16:24 memory.RAM.scala 16:24]
  wire [7:0] _GEN_2 = 2'h2 == _T_37[1:0] ? rdPorts_2 : _GEN_1; // @[memory.RAM.scala 17:23]
  wire [7:0] rdPorts_3 = banks_3__T_36_data; // @[memory.RAM.scala 16:24 memory.RAM.scala 16:24]
  wire [7:0] _GEN_5 = 2'h1 == _T_40 ? rdPorts_1 : rdPorts_0; // @[memory.RAM.scala 17:23]
  wire [7:0] _GEN_6 = 2'h2 == _T_40 ? rdPorts_2 : _GEN_5; // @[memory.RAM.scala 17:23]
  wire [7:0] _GEN_9 = 2'h1 == _T_42 ? rdPorts_1 : rdPorts_0; // @[memory.RAM.scala 17:23]
  wire [7:0] _GEN_10 = 2'h2 == _T_42 ? rdPorts_2 : _GEN_9; // @[memory.RAM.scala 17:23]
  wire [7:0] _GEN_13 = 2'h1 == _T_44 ? rdPorts_1 : rdPorts_0; // @[memory.RAM.scala 17:23]
  wire [7:0] _GEN_14 = 2'h2 == _T_44 ? rdPorts_2 : _GEN_13; // @[memory.RAM.scala 17:23]
  wire [31:0] wrData = {io_wrData_3,io_wrData_2,io_wrData_1,io_wrData_0}; // @[Cat.scala 29:58]
  wire [7:0] wrDataInVec_3 = wrData[7:0]; // @[memory.RAM.scala 28:68]
  wire [7:0] wrDataInVec_2 = wrData[15:8]; // @[memory.RAM.scala 28:68]
  wire [7:0] wrDataInVec_1 = wrData[23:16]; // @[memory.RAM.scala 28:68]
  wire [7:0] wrDataInVec_0 = wrData[31:24]; // @[memory.RAM.scala 28:68]
  wire [7:0] _GEN_17 = 2'h1 == _T_44 ? wrDataInVec_1 : wrDataInVec_0; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_18 = 2'h2 == _T_44 ? wrDataInVec_2 : _GEN_17; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_21 = 2'h1 == _T_42 ? wrDataInVec_1 : wrDataInVec_0; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_22 = 2'h2 == _T_42 ? wrDataInVec_2 : _GEN_21; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_25 = 2'h1 == _T_40 ? wrDataInVec_1 : wrDataInVec_0; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_26 = 2'h2 == _T_40 ? wrDataInVec_2 : _GEN_25; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_29 = 2'h1 == _T_37[1:0] ? wrDataInVec_1 : wrDataInVec_0; // @[memory.RAM.scala 29:34]
  wire [7:0] _GEN_30 = 2'h2 == _T_37[1:0] ? wrDataInVec_2 : _GEN_29; // @[memory.RAM.scala 29:34]
  wire  _GEN_33 = 2'h1 == _T_37[1:0] ? io_we_1 : io_we_0; // @[memory.RAM.scala 30:22]
  wire  _GEN_34 = 2'h2 == _T_37[1:0] ? io_we_2 : _GEN_33; // @[memory.RAM.scala 30:22]
  wire  enVec_0 = 2'h3 == _T_37[1:0] ? io_we_3 : _GEN_34; // @[memory.RAM.scala 30:22]
  wire  _GEN_37 = 2'h1 == _T_40 ? io_we_1 : io_we_0; // @[memory.RAM.scala 30:22]
  wire  _GEN_38 = 2'h2 == _T_40 ? io_we_2 : _GEN_37; // @[memory.RAM.scala 30:22]
  wire  enVec_1 = 2'h3 == _T_40 ? io_we_3 : _GEN_38; // @[memory.RAM.scala 30:22]
  wire  _GEN_41 = 2'h1 == _T_42 ? io_we_1 : io_we_0; // @[memory.RAM.scala 30:22]
  wire  _GEN_42 = 2'h2 == _T_42 ? io_we_2 : _GEN_41; // @[memory.RAM.scala 30:22]
  wire  enVec_2 = 2'h3 == _T_42 ? io_we_3 : _GEN_42; // @[memory.RAM.scala 30:22]
  wire  _GEN_45 = 2'h1 == _T_44 ? io_we_1 : io_we_0; // @[memory.RAM.scala 30:22]
  wire  _GEN_46 = 2'h2 == _T_44 ? io_we_2 : _GEN_45; // @[memory.RAM.scala 30:22]
  wire  enVec_3 = 2'h3 == _T_44 ? io_we_3 : _GEN_46; // @[memory.RAM.scala 30:22]
  assign banks_0__T_9_addr = _T_7[9:0];
  assign banks_0__T_9_data = banks_0[banks_0__T_9_addr]; // @[memory.RAM.scala 9:30]
  assign banks_0__T_78_data = 2'h3 == _T_44 ? wrDataInVec_3 : _GEN_18;
  assign banks_0__T_78_addr = _T_7[9:0];
  assign banks_0__T_78_mask = 1'h1;
  assign banks_0__T_78_en = io_w & enVec_0;
  assign banks_1__T_18_addr = _T_16[9:0];
  assign banks_1__T_18_data = banks_1[banks_1__T_18_addr]; // @[memory.RAM.scala 9:30]
  assign banks_1__T_87_data = 2'h3 == _T_42 ? wrDataInVec_3 : _GEN_22;
  assign banks_1__T_87_addr = _T_16[9:0];
  assign banks_1__T_87_mask = 1'h1;
  assign banks_1__T_87_en = io_w & enVec_1;
  assign banks_2__T_27_addr = _T_25[9:0];
  assign banks_2__T_27_data = banks_2[banks_2__T_27_addr]; // @[memory.RAM.scala 9:30]
  assign banks_2__T_96_data = 2'h3 == _T_40 ? wrDataInVec_3 : _GEN_26;
  assign banks_2__T_96_addr = _T_25[9:0];
  assign banks_2__T_96_mask = 1'h1;
  assign banks_2__T_96_en = io_w & enVec_2;
  assign banks_3__T_36_addr = address[11:2];
  assign banks_3__T_36_data = banks_3[banks_3__T_36_addr]; // @[memory.RAM.scala 9:30]
  assign banks_3__T_105_data = 2'h3 == _T_37[1:0] ? wrDataInVec_3 : _GEN_30;
  assign banks_3__T_105_addr = address[11:2];
  assign banks_3__T_105_mask = 1'h1;
  assign banks_3__T_105_en = io_w & enVec_3;
  assign io_rdData_0 = 2'h3 == _T_37[1:0] ? rdPorts_3 : _GEN_2; // @[memory.RAM.scala 17:13]
  assign io_rdData_1 = 2'h3 == _T_40 ? rdPorts_3 : _GEN_6; // @[memory.RAM.scala 17:13]
  assign io_rdData_2 = 2'h3 == _T_42 ? rdPorts_3 : _GEN_10; // @[memory.RAM.scala 17:13]
  assign io_rdData_3 = 2'h3 == _T_44 ? rdPorts_3 : _GEN_14; // @[memory.RAM.scala 17:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    banks_0[initvar] = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    banks_1[initvar] = _RAND_1[7:0];
  _RAND_2 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    banks_2[initvar] = _RAND_2[7:0];
  _RAND_3 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1024; initvar = initvar+1)
    banks_3[initvar] = _RAND_3[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  address = _RAND_4[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if(banks_0__T_78_en & banks_0__T_78_mask) begin
      banks_0[banks_0__T_78_addr] <= banks_0__T_78_data; // @[memory.RAM.scala 9:30]
    end
    if(banks_1__T_87_en & banks_1__T_87_mask) begin
      banks_1[banks_1__T_87_addr] <= banks_1__T_87_data; // @[memory.RAM.scala 9:30]
    end
    if(banks_2__T_96_en & banks_2__T_96_mask) begin
      banks_2[banks_2__T_96_addr] <= banks_2__T_96_data; // @[memory.RAM.scala 9:30]
    end
    if(banks_3__T_105_en & banks_3__T_105_mask) begin
      banks_3[banks_3__T_105_addr] <= banks_3__T_105_data; // @[memory.RAM.scala 9:30]
    end
    address <= io_addr;
  end
endmodule
module sevenseg.SevenSeg(
  input         clock,
  input         reset,
  input  [15:0] io_in,
  output [3:0]  io_out_anode,
  output [6:0]  io_out_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [18:0] _T; // @[sevenseg.SevenSeg.scala 20:25]
  wire  ticker = _T == 19'h7a120; // @[sevenseg.SevenSeg.scala 21:23]
  wire [18:0] _T_2 = _T + 19'h1; // @[sevenseg.SevenSeg.scala 22:37]
  reg [1:0] sevAnCounter; // @[sevenseg.SevenSeg.scala 13:25]
  wire  _T_4 = sevAnCounter == 2'h3; // @[sevenseg.SevenSeg.scala 15:28]
  wire [1:0] _T_6 = sevAnCounter + 2'h1; // @[sevenseg.SevenSeg.scala 15:51]
  wire  _T_8 = 2'h0 == sevAnCounter; // @[Conditional.scala 37:30]
  wire [6:0] _GEN_2 = 4'h1 == io_in[15:12] ? 7'h79 : 7'h40; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_3 = 4'h2 == io_in[15:12] ? 7'h24 : _GEN_2; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_4 = 4'h3 == io_in[15:12] ? 7'h30 : _GEN_3; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_5 = 4'h4 == io_in[15:12] ? 7'h19 : _GEN_4; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_6 = 4'h5 == io_in[15:12] ? 7'h12 : _GEN_5; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_7 = 4'h6 == io_in[15:12] ? 7'h2 : _GEN_6; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_8 = 4'h7 == io_in[15:12] ? 7'h78 : _GEN_7; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_9 = 4'h8 == io_in[15:12] ? 7'h0 : _GEN_8; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_10 = 4'h9 == io_in[15:12] ? 7'h10 : _GEN_9; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_11 = 4'ha == io_in[15:12] ? 7'h8 : _GEN_10; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_12 = 4'hb == io_in[15:12] ? 7'h3 : _GEN_11; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_13 = 4'hc == io_in[15:12] ? 7'h46 : _GEN_12; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_14 = 4'hd == io_in[15:12] ? 7'h21 : _GEN_13; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_15 = 4'he == io_in[15:12] ? 7'h6 : _GEN_14; // @[sevenseg.SevenSeg.scala 54:20]
  wire [6:0] _GEN_16 = 4'hf == io_in[15:12] ? 7'he : _GEN_15; // @[sevenseg.SevenSeg.scala 54:20]
  wire  _T_10 = 2'h1 == sevAnCounter; // @[Conditional.scala 37:30]
  wire [6:0] _GEN_18 = 4'h1 == io_in[11:8] ? 7'h79 : 7'h40; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_19 = 4'h2 == io_in[11:8] ? 7'h24 : _GEN_18; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_20 = 4'h3 == io_in[11:8] ? 7'h30 : _GEN_19; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_21 = 4'h4 == io_in[11:8] ? 7'h19 : _GEN_20; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_22 = 4'h5 == io_in[11:8] ? 7'h12 : _GEN_21; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_23 = 4'h6 == io_in[11:8] ? 7'h2 : _GEN_22; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_24 = 4'h7 == io_in[11:8] ? 7'h78 : _GEN_23; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_25 = 4'h8 == io_in[11:8] ? 7'h0 : _GEN_24; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_26 = 4'h9 == io_in[11:8] ? 7'h10 : _GEN_25; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_27 = 4'ha == io_in[11:8] ? 7'h8 : _GEN_26; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_28 = 4'hb == io_in[11:8] ? 7'h3 : _GEN_27; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_29 = 4'hc == io_in[11:8] ? 7'h46 : _GEN_28; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_30 = 4'hd == io_in[11:8] ? 7'h21 : _GEN_29; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_31 = 4'he == io_in[11:8] ? 7'h6 : _GEN_30; // @[sevenseg.SevenSeg.scala 58:20]
  wire [6:0] _GEN_32 = 4'hf == io_in[11:8] ? 7'he : _GEN_31; // @[sevenseg.SevenSeg.scala 58:20]
  wire  _T_12 = 2'h2 == sevAnCounter; // @[Conditional.scala 37:30]
  wire [6:0] _GEN_34 = 4'h1 == io_in[7:4] ? 7'h79 : 7'h40; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_35 = 4'h2 == io_in[7:4] ? 7'h24 : _GEN_34; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_36 = 4'h3 == io_in[7:4] ? 7'h30 : _GEN_35; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_37 = 4'h4 == io_in[7:4] ? 7'h19 : _GEN_36; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_38 = 4'h5 == io_in[7:4] ? 7'h12 : _GEN_37; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_39 = 4'h6 == io_in[7:4] ? 7'h2 : _GEN_38; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_40 = 4'h7 == io_in[7:4] ? 7'h78 : _GEN_39; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_41 = 4'h8 == io_in[7:4] ? 7'h0 : _GEN_40; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_42 = 4'h9 == io_in[7:4] ? 7'h10 : _GEN_41; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_43 = 4'ha == io_in[7:4] ? 7'h8 : _GEN_42; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_44 = 4'hb == io_in[7:4] ? 7'h3 : _GEN_43; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_45 = 4'hc == io_in[7:4] ? 7'h46 : _GEN_44; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_46 = 4'hd == io_in[7:4] ? 7'h21 : _GEN_45; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_47 = 4'he == io_in[7:4] ? 7'h6 : _GEN_46; // @[sevenseg.SevenSeg.scala 62:20]
  wire [6:0] _GEN_48 = 4'hf == io_in[7:4] ? 7'he : _GEN_47; // @[sevenseg.SevenSeg.scala 62:20]
  wire  _T_14 = 2'h3 == sevAnCounter; // @[Conditional.scala 37:30]
  wire [6:0] _GEN_50 = 4'h1 == io_in[3:0] ? 7'h79 : 7'h40; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_51 = 4'h2 == io_in[3:0] ? 7'h24 : _GEN_50; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_52 = 4'h3 == io_in[3:0] ? 7'h30 : _GEN_51; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_53 = 4'h4 == io_in[3:0] ? 7'h19 : _GEN_52; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_54 = 4'h5 == io_in[3:0] ? 7'h12 : _GEN_53; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_55 = 4'h6 == io_in[3:0] ? 7'h2 : _GEN_54; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_56 = 4'h7 == io_in[3:0] ? 7'h78 : _GEN_55; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_57 = 4'h8 == io_in[3:0] ? 7'h0 : _GEN_56; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_58 = 4'h9 == io_in[3:0] ? 7'h10 : _GEN_57; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_59 = 4'ha == io_in[3:0] ? 7'h8 : _GEN_58; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_60 = 4'hb == io_in[3:0] ? 7'h3 : _GEN_59; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_61 = 4'hc == io_in[3:0] ? 7'h46 : _GEN_60; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_62 = 4'hd == io_in[3:0] ? 7'h21 : _GEN_61; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_63 = 4'he == io_in[3:0] ? 7'h6 : _GEN_62; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_64 = 4'hf == io_in[3:0] ? 7'he : _GEN_63; // @[sevenseg.SevenSeg.scala 66:20]
  wire [6:0] _GEN_65 = _T_14 ? _GEN_64 : 7'h0; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_66 = _T_14 ? 4'he : 4'h0; // @[Conditional.scala 39:67]
  wire [6:0] _GEN_67 = _T_12 ? _GEN_48 : _GEN_65; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_68 = _T_12 ? 4'hd : _GEN_66; // @[Conditional.scala 39:67]
  wire [6:0] _GEN_69 = _T_10 ? _GEN_32 : _GEN_67; // @[Conditional.scala 39:67]
  wire [3:0] _GEN_70 = _T_10 ? 4'hb : _GEN_68; // @[Conditional.scala 39:67]
  assign io_out_anode = _T_8 ? 4'h7 : _GEN_70; // @[sevenseg.SevenSeg.scala 27:16 sevenseg.SevenSeg.scala 55:20 sevenseg.SevenSeg.scala 59:20 sevenseg.SevenSeg.scala 63:20 sevenseg.SevenSeg.scala 67:20]
  assign io_out_data = _T_8 ? _GEN_16 : _GEN_69; // @[sevenseg.SevenSeg.scala 26:15 sevenseg.SevenSeg.scala 54:20 sevenseg.SevenSeg.scala 58:20 sevenseg.SevenSeg.scala 62:20 sevenseg.SevenSeg.scala 66:20]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T = _RAND_0[18:0];
  _RAND_1 = {1{`RANDOM}};
  sevAnCounter = _RAND_1[1:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      _T <= 19'h0;
    end else if (ticker) begin
      _T <= 19'h0;
    end else begin
      _T <= _T_2;
    end
    if (reset) begin
      sevAnCounter <= 2'h0;
    end else if (ticker) begin
      if (_T_4) begin
        sevAnCounter <= 2'h0;
      end else begin
        sevAnCounter <= _T_6;
      end
    end
  end
endmodule
module Top(
  input         clock,
  input         reset,
  output [15:0] io_blink,
  output [3:0]  io_sev_anode,
  output [6:0]  io_sev_data,
  input         io_ps2_clk,
  input         io_ps2_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  wire  mp_clock; // @[Top.scala 17:18]
  wire  mp_reset; // @[Top.scala 17:18]
  wire [31:0] mp_io_dataBus_addr; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_rdData_0; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_rdData_1; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_rdData_2; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_rdData_3; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_wrData_0; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_wrData_1; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_wrData_2; // @[Top.scala 17:18]
  wire [7:0] mp_io_dataBus_wrData_3; // @[Top.scala 17:18]
  wire  mp_io_dataBus_we_0; // @[Top.scala 17:18]
  wire  mp_io_dataBus_we_1; // @[Top.scala 17:18]
  wire  mp_io_dataBus_we_2; // @[Top.scala 17:18]
  wire  mp_io_dataBus_we_3; // @[Top.scala 17:18]
  wire  mp_io_dataBus_w; // @[Top.scala 17:18]
  wire  key_clock; // @[Top.scala 19:19]
  wire  key_reset; // @[Top.scala 19:19]
  wire  key_ps2_clk; // @[Top.scala 19:19]
  wire  key_ps2_data; // @[Top.scala 19:19]
  wire [7:0] key_bus_data; // @[Top.scala 19:19]
  wire [7:0] key_bus_flag; // @[Top.scala 19:19]
  wire  key_bus_clear; // @[Top.scala 19:19]
  wire  ram_clock; // @[Top.scala 23:19]
  wire [31:0] ram_io_addr; // @[Top.scala 23:19]
  wire [7:0] ram_io_rdData_0; // @[Top.scala 23:19]
  wire [7:0] ram_io_rdData_1; // @[Top.scala 23:19]
  wire [7:0] ram_io_rdData_2; // @[Top.scala 23:19]
  wire [7:0] ram_io_rdData_3; // @[Top.scala 23:19]
  wire [7:0] ram_io_wrData_0; // @[Top.scala 23:19]
  wire [7:0] ram_io_wrData_1; // @[Top.scala 23:19]
  wire [7:0] ram_io_wrData_2; // @[Top.scala 23:19]
  wire [7:0] ram_io_wrData_3; // @[Top.scala 23:19]
  wire  ram_io_we_0; // @[Top.scala 23:19]
  wire  ram_io_we_1; // @[Top.scala 23:19]
  wire  ram_io_we_2; // @[Top.scala 23:19]
  wire  ram_io_we_3; // @[Top.scala 23:19]
  wire  ram_io_w; // @[Top.scala 23:19]
  wire  sev_clock; // @[Top.scala 49:19]
  wire  sev_reset; // @[Top.scala 49:19]
  wire [15:0] sev_io_in; // @[Top.scala 49:19]
  wire [3:0] sev_io_out_anode; // @[Top.scala 49:19]
  wire [6:0] sev_io_out_data; // @[Top.scala 49:19]
  reg  _T_2; // @[Top.scala 30:34]
  wire  _T_3 = mp_io_dataBus_w & _T_2; // @[Top.scala 30:24]
  reg  _T_5; // @[Top.scala 34:15]
  wire [7:0] _GEN_4 = _T_5 ? key_bus_flag : ram_io_rdData_0; // @[Top.scala 34:49]
  wire [7:0] _GEN_5 = _T_5 ? 8'h0 : ram_io_rdData_1; // @[Top.scala 34:49]
  wire [7:0] _GEN_6 = _T_5 ? 8'h0 : ram_io_rdData_2; // @[Top.scala 34:49]
  wire [7:0] _GEN_7 = _T_5 ? 8'h0 : ram_io_rdData_3; // @[Top.scala 34:49]
  reg  _T_7; // @[Top.scala 38:15]
  reg [15:0] blinkReg; // @[Top.scala 44:25]
  reg  _T_9; // @[Top.scala 45:34]
  wire  _T_10 = mp_io_dataBus_w & _T_9; // @[Top.scala 45:24]
  wire [31:0] _T_13 = {mp_io_dataBus_wrData_3,mp_io_dataBus_wrData_2,mp_io_dataBus_wrData_1,mp_io_dataBus_wrData_0}; // @[Cat.scala 29:58]
  RVCore mp ( // @[Top.scala 17:18]
    .clock(mp_clock),
    .reset(mp_reset),
    .io_dataBus_addr(mp_io_dataBus_addr),
    .io_dataBus_rdData_0(mp_io_dataBus_rdData_0),
    .io_dataBus_rdData_1(mp_io_dataBus_rdData_1),
    .io_dataBus_rdData_2(mp_io_dataBus_rdData_2),
    .io_dataBus_rdData_3(mp_io_dataBus_rdData_3),
    .io_dataBus_wrData_0(mp_io_dataBus_wrData_0),
    .io_dataBus_wrData_1(mp_io_dataBus_wrData_1),
    .io_dataBus_wrData_2(mp_io_dataBus_wrData_2),
    .io_dataBus_wrData_3(mp_io_dataBus_wrData_3),
    .io_dataBus_we_0(mp_io_dataBus_we_0),
    .io_dataBus_we_1(mp_io_dataBus_we_1),
    .io_dataBus_we_2(mp_io_dataBus_we_2),
    .io_dataBus_we_3(mp_io_dataBus_we_3),
    .io_dataBus_w(mp_io_dataBus_w)
  );
  PS2 key ( // @[Top.scala 19:19]
    .clock(key_clock),
    .reset(key_reset),
    .ps2_clk(key_ps2_clk),
    .ps2_data(key_ps2_data),
    .bus_data(key_bus_data),
    .bus_flag(key_bus_flag),
    .bus_clear(key_bus_clear)
  );
  memory.RAM ram ( // @[Top.scala 23:19]
    .clock(ram_clock),
    .io_addr(ram_io_addr),
    .io_rdData_0(ram_io_rdData_0),
    .io_rdData_1(ram_io_rdData_1),
    .io_rdData_2(ram_io_rdData_2),
    .io_rdData_3(ram_io_rdData_3),
    .io_wrData_0(ram_io_wrData_0),
    .io_wrData_1(ram_io_wrData_1),
    .io_wrData_2(ram_io_wrData_2),
    .io_wrData_3(ram_io_wrData_3),
    .io_we_0(ram_io_we_0),
    .io_we_1(ram_io_we_1),
    .io_we_2(ram_io_we_2),
    .io_we_3(ram_io_we_3),
    .io_w(ram_io_w)
  );
  sevenseg.SevenSeg sev ( // @[Top.scala 49:19]
    .clock(sev_clock),
    .reset(sev_reset),
    .io_in(sev_io_in),
    .io_out_anode(sev_io_out_anode),
    .io_out_data(sev_io_out_data)
  );
  assign io_blink = blinkReg; // @[Top.scala 48:12]
  assign io_sev_anode = sev_io_out_anode; // @[Top.scala 50:14]
  assign io_sev_data = sev_io_out_data; // @[Top.scala 50:14]
  assign mp_clock = clock;
  assign mp_reset = reset;
  assign mp_io_dataBus_rdData_0 = _T_7 ? key_bus_data : _GEN_4; // @[Top.scala 24:24 Top.scala 35:26 Top.scala 36:29 Top.scala 39:26 Top.scala 40:29]
  assign mp_io_dataBus_rdData_1 = _T_7 ? 8'h0 : _GEN_5; // @[Top.scala 24:24 Top.scala 35:26 Top.scala 39:26]
  assign mp_io_dataBus_rdData_2 = _T_7 ? 8'h0 : _GEN_6; // @[Top.scala 24:24 Top.scala 35:26 Top.scala 39:26]
  assign mp_io_dataBus_rdData_3 = _T_7 ? 8'h0 : _GEN_7; // @[Top.scala 24:24 Top.scala 35:26 Top.scala 39:26]
  assign key_clock = clock;
  assign key_reset = reset;
  assign key_ps2_clk = io_ps2_clk; // @[Top.scala 20:11]
  assign key_ps2_data = io_ps2_data; // @[Top.scala 20:11]
  assign key_bus_clear = _T_7; // @[Top.scala 21:17 Top.scala 41:19]
  assign ram_clock = clock;
  assign ram_io_addr = mp_io_dataBus_addr; // @[Top.scala 26:15]
  assign ram_io_wrData_0 = mp_io_dataBus_wrData_0; // @[Top.scala 27:17]
  assign ram_io_wrData_1 = mp_io_dataBus_wrData_1; // @[Top.scala 27:17]
  assign ram_io_wrData_2 = mp_io_dataBus_wrData_2; // @[Top.scala 27:17]
  assign ram_io_wrData_3 = mp_io_dataBus_wrData_3; // @[Top.scala 27:17]
  assign ram_io_we_0 = _T_3 & mp_io_dataBus_we_0; // @[Top.scala 28:13 Top.scala 31:15]
  assign ram_io_we_1 = _T_3 & mp_io_dataBus_we_1; // @[Top.scala 28:13 Top.scala 31:15]
  assign ram_io_we_2 = _T_3 & mp_io_dataBus_we_2; // @[Top.scala 28:13 Top.scala 31:15]
  assign ram_io_we_3 = _T_3 & mp_io_dataBus_we_3; // @[Top.scala 28:13 Top.scala 31:15]
  assign ram_io_w = mp_io_dataBus_w; // @[Top.scala 29:12]
  assign sev_clock = clock;
  assign sev_reset = reset;
  assign sev_io_in = blinkReg; // @[Top.scala 51:13]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_2 = _RAND_0[0:0];
  _RAND_1 = {1{`RANDOM}};
  _T_5 = _RAND_1[0:0];
  _RAND_2 = {1{`RANDOM}};
  _T_7 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  blinkReg = _RAND_3[15:0];
  _RAND_4 = {1{`RANDOM}};
  _T_9 = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    _T_2 <= mp_io_dataBus_addr <= 32'h1000;
    _T_5 <= mp_io_dataBus_addr == 32'h2100;
    _T_7 <= mp_io_dataBus_addr == 32'h2200;
    if (reset) begin
      blinkReg <= 16'h0;
    end else if (_T_10) begin
      blinkReg <= _T_13[15:0];
    end
    _T_9 <= mp_io_dataBus_addr == 32'h2000;
  end
endmodule
