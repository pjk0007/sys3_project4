#ifndef _RESOURCE_H
#define _RESOURCE_H
#include <string>
using namespace std;
class resource
{
	protected:
		string res_Name;
		string mem_Name;
		string Type;
		int B_year;
		int B_month;
		int B_day;
		int R_year;
		int R_month;
		int R_day;
		int exist;	// 0 is already borrowed, 1 is exist in library
	
	public:
		resource(string rn, string T);
		string getName();
		string getType();
		int getB_year();
		int getB_month();
		int getB_day();
		int getR_year();
		int getR_month();
		int getR_day();
		int borrow(string mn, int B_y, int B_m, int B_d, int R_y, int R_m, int R_d);
		int giveBack(string mn, int N_y, int N_m, int N_d);
	
};


class book : public resource
{
	public :
		book(string rn, string T) : resource(rn, T){}
};

class magazine : public resource
{
	public :
		magazine(string rn, string T) :resource(rn,T){}
};

class e_book : public resource
{
	protected :
		int size;
	
	public :
		e_book(string rn, string T, int sz) : resource(rn, T){
			size = sz;
		}
		int borrow(string mn, int B_y, int B_m, int B_d, int R_y, int R_m, int R_d){
			resource :: borrow(mn, B_y, B_m, B_d, R_y, R_m, R_d);
			exist=1;
		}
		int getSize();

};

#endif
