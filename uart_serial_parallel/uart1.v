

module uart_8bitserial(

  input wire clk,

  input wire serial_in,

  input wire shift,

  input wire reset,

  output reg [7:0] parallel_out,  

  output reg [3:0] counter

);

  

//vieno bito isvedimas i serial

  

   

    reg [7:0] shift_register;
   
    reg stop;


always @(posedge clk or posedge reset) begin



        if (reset || stop) begin

            counter <= 8'd0;
            shift_register <= 8'b0;
            parallel_out <= 8'b0;   
            stop <= 0;

        end else if (counter == 4'd0 || counter ==4'd8 ) begin

            counter <= counter + 1;                 
      
        end else if (shift) begin

          counter <= counter +1 ;
          shift_register <= {shift_register[6:0], serial_in};
          parallel_out <= shift_register;


          
          end if (counter == 4'd9) begin

                      stop <= 1;

        end

    end
endmodule






