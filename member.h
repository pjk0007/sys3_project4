#include <iostream>
#include <string>
#ifndef _MEMBER_H
#define _MEMBER_H
using namespace std;

class member
{
	protected:
		string mem_Name;
		string Type;
		int canBorrow;
		int nowBorrow;
		int ban_year;
		int ban_month;
		int ban_day;
		int term;
		
	public:
		member(string mn, string T);
		string getName();
		int getBorrow();
		int getYear();
		int getMonth();
		int getDay();
		int getTerm();
		void setBorrow(int b);
		void setYear(int y);
		void setMonth(int m);
		void setDay(int d);
		int borrow(int n_y, int n_m, int n_d);
		void giveBack();
};

#endif
