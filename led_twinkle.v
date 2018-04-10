module led_twinkle(
        input clk,
        output reg [3:0] led );

    reg[24:0] counter;  
    
    always@(posedge clk)
    begin 
        counter<=counter+1;  
        
        if(counter==25'd25000000)
        begin    
            led<=~led;    
            counter<=0;   
        end   
    end
endmodule
