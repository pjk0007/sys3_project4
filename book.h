#ifndef _BOOK_H
#define _BOOK_H
#include "resource.h"

class book : public resource
{
	public :
		book(string rn, string T) : resource(rn, T){}
};

#endif
