`timescale 1ns / 1ps

module speed_select(
                input wire clk,     // 50 MHz
                input wire rst_n,
                input wire bps_start,
                output wire clk_bps
            );

        /*
        parameter       bps9600      = 5207,    
                        bps19200     = 2603,    
                        bps38400     = 1301,    
                        bps57600     = 867,    
                        bps115200    = 433;    

        parameter       bps9600_2    = 2603,
                        bps19200_2   = 1301,
                        bps38400_2   = 650,
                        bps57600_2   = 433,
                        bps115200_2  = 216;  
        */
            
        `define     BPS_PARA          5207    
        `define     BPS_PARA_2        2603    

        reg[12:0] cnt;            
        reg clk_bps_r;            

        //----------------------------------------------------------
        reg[2:0] uart_ctrl;    
        //----------------------------------------------------------

        assign clk_bps = clk_bps_r;

        always @ (posedge clk or negedge rst_n)
        begin
            if(!rst_n) 
                cnt <= 13'd0;
            else if((cnt == `BPS_PARA) || !bps_start) 
                cnt <= 13'd0;    
            else 
                cnt <= cnt+1'b1;            
        end

        always @ (posedge clk or negedge rst_n)
        begin
            if(!rst_n) 
                clk_bps_r <= 1'b0; // bps_start
            else if(cnt == `BPS_PARA_2 && bps_start) 
                clk_bps_r <= 1'b1;    // clk_bps_r
            else 
                clk_bps_r <= 1'b0;
        end

endmodule



