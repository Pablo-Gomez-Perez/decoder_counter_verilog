
/*module andGate(input logic a, b, output logic y);

assign y = a & b;

endmodule */

/*
    codificar en HDL un circuito de un contador de 6 bits (6 leds)
    con una frecuencia de entrada de una hz
*/

module conta_6(input logic clk_in, rst, output logic [5:0] leds2);
    logic pulso;
    logic [5:0] leds;
    always_ff@(posedge pulso)
    if(!rst) leds <= 0;
    else leds <= leds + 1;     
    blinky bx(clk_in,pulso);
    assign leds2 = ~leds;
endmodule

module blinky(input logic clk, output logic led10);

logic [23:0] conta;

always_ff@(posedge clk)

if(conta == 24'd13000000) begin
    conta <= 0;
    led10 <=~ led10;
end
else
    conta<=conta+1;
endmodule