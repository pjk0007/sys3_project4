#include <iostream>
#include <string>
#ifndef _SPACE_H
#define _SPACE_H
using namespace std;

class space
{
	protected:
		int start_Time;
		int end_Time;
		int return_Time;
		int max_Num;
		
	public:
		space();
		int getST();
		int getET();
		int getRT();
		int Borrow(string memName, int hour, int nom, int time, int lilmit);
		int Return(string memName, int hour);
		void reset();
			
};

class study_room : public space
{
	protected:
		string user;

	public :
		study_room() : space(){
			start_Time = 9;
			end_Time = 18;
			return_Time = 0;
			max_Num=6;
			user="0";
		}
		void reset();
		int Borrow(string memName, int hour, int nom, int time, int lilmit);
		int Return(string memName, int hour);
		
};

class seat : public space
{
	protected:
		int remain;	// maximum 50 seats
		string memname[50];
		int endtime[50];
		int emptytime[50];

	public :
		seat() : space(){
			start_Time = 0;
			end_Time = 24;
			remain = 0;
			max_Num=1;
			for(int i=0;i<50;i++){
				memname[i] = "0";
			}
			for(int i=0;i<50;i++){
				endtime[i]=0;
			}
			for(int i=0;i<50;i++){
				emptytime[i]=0;
			}
			
			
		}
		void time_limit(int st, int et);
		int Borrow(string memName, int hour, int nom, int time, int lilmit);
		int Return(string memName, int hour);
		int Empty(string memName, int hour);
		int Comeback(string memName, int hour);
		void reset();
};
#endif
