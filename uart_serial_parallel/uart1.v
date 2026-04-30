

module uart_8bitserial(

  input wire clk,

  input wire serial_in,

  input wire shift,

  input wire reset,

  output reg [7:0] parallel_out  



);

  

//vieno bito isvedimas i serial

  

   

     reg [7:0] shift_register;



always @(posedge clk or posedge reset) begin



        if (reset) begin

            shift_register <= 8'b0;

            parallel_out <= 8'b0;                    

        end else if (shift) begin

          shift_register <= {shift_register[6:0], serial_in};

            parallel_out <= shift_register;

        end

    end
endmodule






