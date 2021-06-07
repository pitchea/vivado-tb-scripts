// ========================================================================================
//
// File:             tb_bit_alignment.sv
// Description:      Testbench for the adc bit alignment module
// Author:           Aaron Pitcher (pitchea@mcmaster.ca)
// Date:             07-Jun-2021 03:18:11 PM
//
// Vivado Version:   2018.3
//
// Copyright 2021 Aaron Pitcher
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// ========================================================================================
`timescale 1ns / 100ps

`define     MULT_WIDTH  32

module tb();
    logic clk, enable, resetn;
    logic [1:0][`MULT_WIDTH-1:0] m1_op, m2_op;
    logic [1:0][`MULT_WIDTH-1:0] result, result_reg;

    // 100 MHz Clock Generator
    always begin
        #5; clk = ~clk;
    end

    // Randomly generated input values into our multipliers otherwise the inputs just count
    always_ff @(posedge clk or negedge resetn) begin
        if(~resetn) begin
            m1_op[1:0] <= {(2){32'd0}};
            m2_op[1:0] <= {(2){32'd0}};
        end else begin
            if (enable) begin
                m1_op[0] <= $random() % 100000;
                m1_op[1] <= $random() % 100000;
                m2_op[0] <= $random() % 100000;
                m2_op[1] <= $random() % 100000;
            end else begin
                m1_op[0] <= m1_op[0] + 32'd1;
                m1_op[1] <= m1_op[1] + 32'd1;
                m2_op[0] <= m2_op[0] + 32'd1;
                m2_op[1] <= m2_op[1] - 32'd1;
            end
        end
    end

    multiplier #(`MULT_WIDTH) m1 (
        .op1(m1_op[0]),
        .op2(m1_op[1]),
        .result(result[0])
    );

    multiplier #(`MULT_WIDTH) m2 (
        .op1(m2_op[0]),
        .op2(m2_op[1]),
        .result(result[1])
    );

    // saving result to a register
    always_ff @(posedge clk or negedge resetn) begin
        if(~resetn) begin
            result_reg[1:0] <= {(2){32'd0}};
        end else begin
            result_reg[0] <= result[0];
            result_reg[1] <= result[1];
        end
    end

    initial begin : sequence_of_events
        $timeformat(-6, 2, "us", 10);
        $write("\n\n%t: Start of simulation\n\n", $realtime);
        clk = 1'b0;
        resetn = 1'b1;
        enable = 1'b0;

        repeat (5) @ (negedge clk);
        resetn = 1'b0;
        repeat (5) @ (negedge clk);
        resetn = 1'b1;

        // ===== enable = 0 =====
        enable = 1'b0;
        #20000;

        // ===== enable = 1 =====
        enable = 1'b1;
        #20000;

        $write("\n%t: End of simulation\n\n", $realtime);
        $stop;
    end

    // Monitors
    always @ (enable) begin
        $write("%t: enable set to: %b\n", $realtime, enable);
    end
    always @ (resetn) begin
        $write("%t: resetn set to: %b\n", $realtime, resetn);
    end

endmodule

// ========================================================================================
// EoF
// ========================================================================================