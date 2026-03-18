module user_project_example(
    `ifdef USE_POWER_PINS
    inout VPWR,    // Common digital supply
    inout VGND,    // Common digital ground
    `endif
    input  wire clk_i,
    input  wire rst_ni,
    input  wire y,
    input  wire [15:0] x,
    output wire p
);

    spm spm_inst(
    `ifdef USE_POWER_PINS
    .VPWR   (VPWR),
    .VGND   (VGND),
    `endif
    .clk(clk_i),
    .rst(rst_ni),
    .y(y),
    .x(x),
    .p(p)
    );

endmodule