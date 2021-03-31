module VGA_Timer(
  input   clock,
  input   reset,
  output  io_hSync,
  output  io_vSync,
  output  io_display
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] tickGenReg; // @[VGA_Timer.scala 50:30]
  wire  pixelTick = tickGenReg == 2'h3; // @[VGA_Timer.scala 51:34]
  wire [1:0] _T_1 = tickGenReg + 2'h1; // @[VGA_Timer.scala 53:48]
  reg [9:0] hCounterReg; // @[VGA_Timer.scala 56:28]
  reg  hSyncReg; // @[VGA_Timer.scala 57:25]
  wire  lineCompleted = hCounterReg == 10'h31f; // @[VGA_Timer.scala 60:35]
  wire [9:0] _T_4 = hCounterReg + 10'h1; // @[VGA_Timer.scala 63:56]
  wire  _T_6 = hCounterReg == 10'h28f; // @[VGA_Timer.scala 66:20]
  wire  _T_7 = hCounterReg == 10'h2ef; // @[VGA_Timer.scala 67:20]
  wire  _T_8 = _T_7 ? 1'h0 : hSyncReg; // @[Mux.scala 98:16]
  wire  _T_9 = _T_6 | _T_8; // @[Mux.scala 98:16]
  reg [9:0] vCounterReg; // @[VGA_Timer.scala 73:28]
  reg  vSyncReg; // @[VGA_Timer.scala 74:25]
  wire  frameCompleted = vCounterReg == 10'h20c; // @[VGA_Timer.scala 76:36]
  wire  _T_10 = pixelTick & lineCompleted; // @[VGA_Timer.scala 79:20]
  wire [9:0] _T_12 = vCounterReg + 10'h1; // @[VGA_Timer.scala 80:59]
  wire  _T_14 = vCounterReg == 10'h1e9; // @[VGA_Timer.scala 84:20]
  wire  _T_15 = vCounterReg == 10'h1eb; // @[VGA_Timer.scala 85:20]
  wire  _T_16 = _T_15 ? 1'h0 : vSyncReg; // @[Mux.scala 98:16]
  wire  _T_17 = _T_14 | _T_16; // @[Mux.scala 98:16]
  wire  _T_18 = hCounterReg < 10'h280; // @[VGA_Timer.scala 89:30]
  wire  _T_19 = vCounterReg < 10'h1e0; // @[VGA_Timer.scala 89:70]
  assign io_hSync = hSyncReg; // @[VGA_Timer.scala 93:12]
  assign io_vSync = vSyncReg; // @[VGA_Timer.scala 92:12]
  assign io_display = _T_18 & _T_19; // @[VGA_Timer.scala 89:14]
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
  tickGenReg = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  hCounterReg = _RAND_1[9:0];
  _RAND_2 = {1{`RANDOM}};
  hSyncReg = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  vCounterReg = _RAND_3[9:0];
  _RAND_4 = {1{`RANDOM}};
  vSyncReg = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      tickGenReg <= 2'h0;
    end else if (pixelTick) begin
      tickGenReg <= 2'h0;
    end else begin
      tickGenReg <= _T_1;
    end
    if (reset) begin
      hCounterReg <= 10'h0;
    end else if (pixelTick) begin
      if (lineCompleted) begin
        hCounterReg <= 10'h0;
      end else begin
        hCounterReg <= _T_4;
      end
    end
    if (reset) begin
      hSyncReg <= 1'h0;
    end else if (pixelTick) begin
      hSyncReg <= _T_9;
    end
    if (reset) begin
      vCounterReg <= 10'h0;
    end else if (lineCompleted) begin
      if (_T_10) begin
        if (frameCompleted) begin
          vCounterReg <= 10'h0;
        end else begin
          vCounterReg <= _T_12;
        end
      end
    end
    if (reset) begin
      vSyncReg <= 1'h0;
    end else if (lineCompleted) begin
      vSyncReg <= _T_17;
    end
  end
endmodule
module Test(
  input         clock,
  input         reset,
  output [3:0]  out_red,
  output [3:0]  out_green,
  output [3:0]  out_blue,
  output        out_hsync,
  output        out_vsync,
  output [11:0] led,
  input  [11:0] sw
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  timer_clock; // @[Test.scala 16:21]
  wire  timer_reset; // @[Test.scala 16:21]
  wire  timer_io_hSync; // @[Test.scala 16:21]
  wire  timer_io_vSync; // @[Test.scala 16:21]
  wire  timer_io_display; // @[Test.scala 16:21]
  reg [11:0] counter; // @[Test.scala 13:24]
  reg [11:0] _T; // @[Test.scala 14:21]
  VGA_Timer timer ( // @[Test.scala 16:21]
    .clock(timer_clock),
    .reset(timer_reset),
    .io_hSync(timer_io_hSync),
    .io_vSync(timer_io_vSync),
    .io_display(timer_io_display)
  );
  assign out_red = timer_io_display ? counter[11:8] : 4'h0; // @[Test.scala 21:11]
  assign out_green = timer_io_display ? counter[7:4] : 4'h0; // @[Test.scala 22:13]
  assign out_blue = timer_io_display ? counter[3:0] : 4'h0; // @[Test.scala 23:12]
  assign out_hsync = timer_io_hSync; // @[Test.scala 19:13]
  assign out_vsync = timer_io_vSync; // @[Test.scala 20:13]
  assign led = counter; // @[Test.scala 24:7]
  assign timer_clock = clock;
  assign timer_reset = reset;
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
  counter = _RAND_0[11:0];
  _RAND_1 = {1{`RANDOM}};
  _T = _RAND_1[11:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      counter <= 12'h0;
    end else begin
      counter <= _T;
    end
    _T <= sw;
  end
endmodule
