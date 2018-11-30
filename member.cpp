#include <iostream>
#include <string>
#include "member.h"
using namespace std;

member::member(string mn, string T)
{
	mem_Name = mn;
	Type = T;
	nowBorrow = 0;
	ban_year=0;
	ban_month=0;
	ban_day=0;
}

string member::getName()
{
	return mem_Name;
}

int member::getBorrow()
{
	return nowBorrow;
}

int member::getYear()
{
	return ban_year;
}

int member::getMonth()
{
	return ban_month;
}

int member::getDay()
{
	return ban_day;
}

int member::getTerm()
{
	return term;
}

void member::setBorrow(int b)
{
	nowBorrow = b;
}


void member::setYear(int y)
{
	ban_year = y;
}

void member::setMonth(int m)
{
	ban_month = m;
}

void member::setDay(int d)
{
	ban_day = d;
}

int member::borrow(int n_y, int n_m, int n_d)
{
	if(ban_year*360+ban_month*30+ban_day >= n_y*360+n_m*30+n_d){
		return 1;	// Restricted member untill ban_year/ban_month_ban_day
	}
	else if(canBorrow <= nowBorrow){
		return 2;	// Exceeds your possible number of borrow. Possible# of borrows : canBorrow
	}
	else {
		return 0;	// success
	}
}

void member::giveBack()
{
	nowBorrow--;
}

int member::getSize()
{
	return size;
}

int member::getLimitSize()
{
	return limit_size;
}

void member::setSize(int sz)
{
	size = sz;
}

