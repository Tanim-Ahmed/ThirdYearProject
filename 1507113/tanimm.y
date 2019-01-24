%{
    
    #include<stdio.h>
    #include<stdlib.h>
    int count=1,countt=0,val,count2=0;
    typedef struct A{

     char *str;
     int n;

    }obj;
    obj valu[1001],symb[1001];

    void insrt1(obj *o,char *s,int n);

    void insrt2(obj *o,char *s,int n);
	


%}

/* The purpose of the union is to allow storing different kind of objects into nodes emitted by flex */

%union {
	int number;
	char *string;

}

/*BISON Declaration */

%token <number>NUM
%token <string VAR
%token <string> MAIN IF ELSE INT FLOAT CHARACTER LP RP LB RB CM SM PLUS
 MINUS MULT DIV ASSIGN FOR COLON WHILE BREAK COLON DEFAULT CASE SWITCH 
 inc importtt inpit

%type <string> statement
%type <number> expression
%nonassoc IFX
%nonassoc ELSE
%left LT GT
%left PLUS MINUS
%left MULT DIV

%%




















int yywrap()
{
	
	return 1;
}

/*Error Function */

yyerror(char *s)
{
	printf("%s\n",s);
}