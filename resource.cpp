#include <iostream>
#include <string>
#include "resource.h"
using namespace std;

resource::resource(string rn, string T)
{
	res_Name = rn;
	mem_Name = "NULL";
	Type = T;
	Type[0] = Type[0] - ('A'-'a');
	B_year = 0;
	B_month = 0;
	B_day = 0;
	R_year = 0;
	R_month = 0;
	R_day = 0;
	exist = 1;
}

string resource::getName()
{
	return res_Name;
}

string resource::getType()
{
	return Type;
}

int resource::getB_year()
{
	return B_year;
}

int resource::getB_month()
{
	return B_month;
}

int resource::getB_day()
{
	return B_day;
}

int resource::getR_year()
{
	return R_year;
}

int resource::getR_month()
{
	return R_month;
}

int resource::getR_day()
{
	return R_day;
}

int resource::borrow(string mn, int B_y, int B_m, int B_d, int R_y, int R_m, int R_d)
{
	if(exist==1){
		mem_Name = mn;
		B_year = B_y;
		B_month = B_m;
		B_day = B_d;
		R_year = R_y;
		R_month = R_m;
		R_day = R_d;
		exist = 0;
		return 0;	// Success.
	}
	else if(exist==0){
		if(mn == mem_Name){
			return 1;	// You already borrowed this Type at B_year/B_month/B_day
		}
		else{
			return 2;	//Other member already borrowed this Type. This Type will be returned at
		}
	}
}

int resource::giveBack(string mn, int N_y, int N_m, int N_d)
{
	if(mem_Name == mn && N_y*360+N_m*30+N_d < R_year*360+R_month*30+R_day){
		mem_Name = "NULL";
		exist = 1;
		return 0;	// Success.
	}
	else if(mem_Name == mn && N_y*360+N_m*30+N_d >= R_year*360+R_month*30+R_day){
		return 1;	// Delayed return. You'll be restricted untill 00/00/00 
	}
	else if(mem_Name != mn){
		return 2;	// You did not borrow this Type.
		
	}
}

int e_book::getSize()
{
	return size;
}
