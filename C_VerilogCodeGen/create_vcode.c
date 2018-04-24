/*
 * =====================================================================================
 *
 *       Filename:  create_vcode.c
 *
 *    Description:  Verilog Code Generator 
 *
 *        Version:  1.0
 *        Created:  04/19/18 02:22:18
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  Dr. Fritz Mehner (mn), mehner@fh-swf.de
 *        Company:  FH Südwestfalen, Iserlohn
 *
 * =====================================================================================
 */

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

void create_vcode(char *m_name, char *i_name, char *output, int num); // generate verilog module code
void create_tcode(char *m_name, char *i_name, char *output, int num); // generate verilog testbench code

void main()
{
    char m_name[20];        
    int num=4;
    int i;
    char *i_name;
    char output[2];
    printf("input module name : ");
    scanf("%s", m_name);

    i_name = (char *)malloc(sizeof(char)*num);
    for (i = 0; i < num; i++) {
          printf("%d's input name : ", i+1);
          scanf("%s", i_name+i); 
    }

    printf("output name : ");
    scanf("%s", output);

    create_vcode(m_name, i_name, output, num);
    create_tcode(m_name, i_name, output, num);
}

void create_vcode(char *m_name, char *i_name, char *output, int num){
        char Vcode[256];
        char buf[2];
        FILE *fp;
        int i = 0;
        char input[15] = "";

        while(i<=num){
                sprintf(buf, "%c", *(i_name+i));
                strcat(input, buf);
                if(i==num-1)
                        break;
                strcat(input, ", ");
                i++;
        }
        sprintf(Vcode, "module ");
        strcat(Vcode, m_name);
        strcat(Vcode, " (");
        strcat(Vcode, input);
        strcat(Vcode, ", ");
        strcat(Vcode, output);
        strcat(Vcode, ");\n");

        strcat(Vcode, "\tinput ");
        strcat(Vcode, input);

        strcat(Vcode, ";\n\toutput ");
        strcat(Vcode, output);

        strcat(Vcode, ";\n\n\tand u1 (");

        strcat(Vcode, output);
        strcat(Vcode, ", ");
        strcat(Vcode, input);
        strcat(Vcode, ");\n");
        
        strcat(Vcode, "\nendmodule\n");
        printf("\n\nverilog code : \n");
        puts(Vcode);

        sprintf(input, "./%s.v", m_name);
        fp = fopen(input, "w");
        if((fputs(Vcode, fp))){
                printf("\nverilog code gen Success !!!\n");
        } else
                printf("\nverilog code gen Failed !!!\n");
        fclose(fp);
}

void create_tcode(char *m_name, char *i_name, char *output, int num){
        char Tcode[1024];
        int i;
        char input[6];
        char buf[100];
        FILE *fp;

        sprintf(Tcode, "module ");
        strcat(Tcode, m_name);
        strcat(Tcode, "_tb;\n");
        strcat(Tcode, "reg ");

        for(i=0;i<4;i++){
                sprintf(buf, "%c", *(i_name+i));
                strcat(Tcode, buf);
                if(i == num-1){
                        strcat(Tcode, ";\n");
                        break;
                }
                strcat(Tcode, ",");
        }

        strcat(Tcode, "wire ");
        strcat(Tcode, output);
        strcat(Tcode, ";\n");
        strcat(Tcode, m_name);
        strcat(Tcode, " u1 (");
        for(i=0; i<num; i++){
               sprintf(buf, " .%c(%c),", *(i_name+i), *(i_name+i)); 
               strcat(Tcode, buf);
        }
        sprintf(buf, " .%s(%s) );\n", output, output);
        strcat(Tcode, buf);

        strcat(Tcode, "initial begin\n");

        for(i=0; i<16; i++){
                sprintf(buf, "\ta = %d; b = %d; c = %d; d = %d; #50;\n", i&(1<<3)?1:0,i&(1<<2)?1:0,i&(1<<1)?1:0,i&(1<<0)?1:0);
                strcat(Tcode, buf);
        }
        strcat(Tcode, "end\n");
        strcat(Tcode, "endmodule\n");
        printf("\n\ntestbench code : \n");
        puts(Tcode);
        sprintf(buf, "./%s_tb.v", m_name);
        fp = fopen(buf, "w");
        if((fputs(Tcode, fp))){
                printf("\n testbench code gen Success !!!\n");
        } else
                printf("\n testbench code gen Failed !!!\n");
        fclose(fp);

}
