#include "include/screen.h"
#include "include/kb.h"
#include "include/string.h"
#include "include/substr.h"
int kmain()
{
       clearScreen();
       print("Welcome to  operating system\n");
		string username = "admin";
	   	string password = "admin";
	   
	   	string inp = 0;
	   	while (1) {
		   uint8 uOK = 0, pOK = 0;
		   
		   print("\nusername: ");
		   inp = readStr();
		   if (strEql(inp, username)) uOK = 1;
		   
		   print("\npassword: ");
		   inp = readStr();
		   if (strEql(inp, password)) pOK = 1;
		   
		   if (uOK && pOK) {
			   print("Login Done!\n");
			   break;
		   }
		   print("pasword and username is wrong. Try again\n");
	   }
       while (1)
       {
                print("\nTanim> ");

                string ch = readStr();
                if(strEql(ch,"cmd"))
                {
                        print("\nYou are allready in cmd\n");
                }
                else if(strEql(ch,"clear"))
                {
                        clearScreen();
			updateCursor();
                }
		else if(strEql(ch,"strlen"))
                {
			print("Enter your string: ");
			string str = readStr();
                        int32 len = strlength(str);
			print("  String length: ");
			
			printnum(len);

                }
		else if(strEql(ch,"cur"))
                {
			cursorX=20;
			cursorY=15;

                        updateCursor();
                }
		else if(strEql(ch,"substr"))
		{
				print("Enter string: ");
				ch = readStr();
				screen_substr(ch);

		}
		else if(strEql(ch,"shutdown"))
		{
				print("shutting down!\n");
				break;
		}
		else if(strEql(ch,"print"))
                {
			print("\nEnter your string to print: ");
                	string ch = readStr();
                        print(ch);
			print("\n");
			
                }
		else if(strEql(ch,"clearline"))
                {
			clearLine(0,1);
			
                }
	
                else
                {
                        print("\nBad command!\n");
			
                }

                print("\n");
       }

}
