#ifndef _LIBRARY_H
#define _LIBRARY_H
#include <vector>
#include "member.h"
#include "resource.h"

class library
{
	private:
		vector<resource*> RESLIST;
		vector<member*> MEMLIST;
	public:
		library();
};

#endif
