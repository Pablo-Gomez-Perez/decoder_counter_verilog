/**
 *  Blinky funciona como generador de pulsos
 */
module blinky(input logic clk, output logic pulso_1hz);

logic [23:0] conta;
always_ff@(posedge clk)

if(conta == 24'd13500000) begin 
    conta <=0;
    pulso_1hz <= ~pulso_1hz;
end
else 
    conta <= conta + 1;

endmodule


module contador(input logic clk_in, rset, output logic[5:0] conta);

always_ff@(posedge clk_in)
conta <= conta + 1;


endmodule


module decoder(input logic [5:0]A, output logic [5:0]Y);

always_comb

case(A)

    6'd0 : Y <= 6'b000001;
    6'd1 : Y <= 6'b000011;
    6'd2 : Y <= 6'b000111;
    6'd3 : Y <= 6'b001111;
    6'd4 : Y <= 6'b011111;
    6'd5 : Y <= 6'b111111;
	6'd6 : Y <= 6'b111100;
	6'd7 : Y <= 6'b111000;
	6'd8 : Y <= 6'b110000;
	6'd9 : Y <= 6'b100000;	
	6'd10 : Y <= 6'b000001;
    6'd11 : Y <= 6'b000011;
    6'd12 : Y <= 6'b000111;
    6'd13 : Y <= 6'b001111;
    6'd14 : Y <= 6'b011111;
    6'd15 : Y <= 6'b111111;
	6'd16 : Y <= 6'b111100;
	6'd17 : Y <= 6'b111000;
	6'd18 : Y <= 6'b110000;
	6'd19 : Y <= 6'b100000;
	6'd20 : Y <= 6'b000001;
    6'd21 : Y <= 6'b000011;
    6'd22 : Y <= 6'b000111;
    6'd23 : Y <= 6'b001111;
    6'd24 : Y <= 6'b011111;
    6'd25 : Y <= 6'b111111;
	6'd26 : Y <= 6'b111100;
	6'd27 : Y <= 6'b111000;
	6'd28 : Y <= 6'b110000;
	6'd29 : Y <= 6'b100000;
	6'd30 : Y <= 6'b000001;
    6'd31 : Y <= 6'b000011;
    6'd32 : Y <= 6'b000111;
    6'd33 : Y <= 6'b001111;
    6'd34 : Y <= 6'b011111;
    6'd35 : Y <= 6'b111111;
	6'd36 : Y <= 6'b111100;
	6'd37 : Y <= 6'b111000;
	6'd38 : Y <= 6'b110000;
	6'd39 : Y <= 6'b100000;
	6'd30 : Y <= 6'b000001;
    6'd31 : Y <= 6'b000011;
    6'd32 : Y <= 6'b000111;
    6'd33 : Y <= 6'b001111;
    6'd34 : Y <= 6'b011111;
    6'd35 : Y <= 6'b111111;
	6'd36 : Y <= 6'b111100;
	6'd37 : Y <= 6'b111000;
	6'd38 : Y <= 6'b110000;
	6'd39 : Y <= 6'b100000;
	6'd40 : Y <= 6'b000001;
    6'd41 : Y <= 6'b000011;
    6'd42 : Y <= 6'b000111;
    6'd43 : Y <= 6'b001111;
    6'd44 : Y <= 6'b011111;
    6'd45 : Y <= 6'b111111;
	6'd46 : Y <= 6'b111100;
	6'd47 : Y <= 6'b111000;
	6'd48 : Y <= 6'b110000;
	6'd49 : Y <= 6'b100000;
	6'd50 : Y <= 6'b000001;
    6'd51 : Y <= 6'b000011;
    6'd52 : Y <= 6'b000111;
    6'd53 : Y <= 6'b001111;
    6'd54 : Y <= 6'b011111;
    6'd55 : Y <= 6'b111111;
	6'd56 : Y <= 6'b111100;
	6'd57 : Y <= 6'b111000;
	6'd58 : Y <= 6'b110000;
	6'd59 : Y <= 6'b100000;
	6'd60 : Y <= 6'b000001;
    6'd61 : Y <= 6'b000011;
    6'd62 : Y <= 6'b000111;
    6'd63 : Y <= 6'b001111;    

endcase

endmodule


module decodificador(input logic clk, rst, output logic [5:0] leds);

logic [5:0] conta_deco, X;
logic pulso_conta;

blinky b1(clk, pulso_conta);
contador cnta(pulso_conta,rst,conta_deco);
assign leds = ~X;
decoder dec(conta_deco,X);

endmodule