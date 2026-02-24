module user_project_example(
    `ifdef USE_POWER_PINS
    inout VPWR,    // Common digital supply
    inout VGND,    // Common digital ground
    `endif
    input  wire clk_i,
    input  wire rst_ni,
    input  wire [16:0] ui_PAD2CORE,
    output  wire [16:0] uo_CORE2PAD
);
    //assign uo_CORE2PAD[8:1] = ui_PAD2CORE[16:9];
    assign uo_CORE2PAD[16:1] = 16'd1; 

    spm spm_inst(
    `ifdef USE_POWER_PINS
    .VPWR   (VPWR),
    .VGND   (VGND),
    `endif
    .clk(clk_i),
    .rst(rst_ni),
    .y(ui_PAD2CORE[0]),
    .x(ui_PAD2CORE[16:1]),
    .p(uo_CORE2PAD[0])
    );

endmodule