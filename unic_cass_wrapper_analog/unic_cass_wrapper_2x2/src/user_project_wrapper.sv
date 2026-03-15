// SPDX-FileCopyrightText: © 2025 Leo Moser
// SPDX-License-Identifier: Apache-2.0

module user_project_wrapper (
    inout wire [35:0] analog_io
);
    wire [35:0] analog_io_padres;


    // Power/Ground IO pad instances
    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadVss_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadVdd_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadVdd sg13g2_IOPadVdd_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadVss sg13g2_IOPadVss_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    // Power/Ground IO pad IO instances
    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_south (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_east (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_north (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    (* keep *) sg13g2_IOPadIOVdd sg13g2_IOPadIOVdd_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );
    (* keep *) sg13g2_IOPadIOVss sg13g2_IOPadIOVss_west (
        `ifdef USE_POWER_PINS
        .vss    (VSS),
        .vdd    (VDD),
        .iovss  (IOVSS),
        .iovdd  (IOVDD)
        `endif
    );

    generate
    for (genvar i=0; i<36; i++) begin : sg13g2_IOPad_analog_io
        sg13g2_IOPadAnalog io (
            `ifdef USE_POWER_PINS
            .vss    (VSS),
            .vdd    (VDD),
            .iovss  (IOVSS),
            .iovdd  (IOVDD),
            `endif  
            .padres (analog_io_padres[i]), //o
            .pad (analog_io[i])  //~
        );
    end
    endgenerate

endmodule


