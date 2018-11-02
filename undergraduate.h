#ifndef _UNDERGRADUATE_H
#define _UNDERGRADUATE_H
#include "member.h"

class undergraduate : public member
{
	public :
		undergraduate(string rn, string T) : member(rn, T){
			canBorrow = 1;
			term = 13;
		}
};

#endif
