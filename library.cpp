#include <iostream>
#include <string>
#include <vector>
#include <iomanip>
#include "library.h"
#include "member.h"
#include "resource.h"
using namespace std;


library::library()
{
	resource* tempRes;
	member* tempMem;

	char input1[100], input2[100];
	char buf1[100], buf2[100];
	FILE* fp;
	int year, month, day, i;
	int cnt=1, exist=0;
	int b_year, b_month, b_day;
	string resName, resType, memName, memType;
	char BorR[3];
	int result;


	fp = fopen("resource.dat", "r");
	fscanf(fp, "%s", buf1);
	fscanf(fp, "%s", buf2);
	
	while(fscanf(fp, "%s", buf1)!=EOF)
	{
		resType = buf1;
		fscanf(fp, "%s", buf2);
		if(resType=="Book"){
			RESLIST.push_back(new book(buf2, buf1));
		}
	}
	fclose(fp);

	fp = fopen("input.dat", "r");
	for(i=0;i<6;i++){
		fscanf(fp, "%s", buf1);
	}

	cout << "Op_#	Return_code	Description"<<endl;
	while(fscanf(fp, "%s", buf1)!=EOF)
	{
		cout << cnt << "	";
		buf2[0]=buf1[0];
		buf2[1]=buf1[1];
		buf2[3]='\0';
		year = atoi(buf2);
		
		buf2[0]=buf1[3];
		buf2[1]=buf1[4];
		buf2[3]='\0';
		month = atoi(buf2);
		
		buf2[0]=buf1[6];
		buf2[1]=buf1[7];
		buf2[3]='\0';
		day = atoi(buf2);
	
		fscanf(fp, "%s", buf1);
		fscanf(fp, "%s", buf2);
		resName = buf2;
		resType = buf1;
		exist = 0;
		for(i=0;i<RESLIST.size();i++){
			if(RESLIST.at(i)->getName() == resName){
				tempRes = RESLIST.at(i);
				exist++;
				break;
			}
		}
		fscanf(fp, "%s", BorR);

		fscanf(fp, "%s", buf1);
		fscanf(fp, "%s", buf2);
		memName = buf2;
		memType = buf1;

		if(MEMLIST.size()==0){
			if(memType=="Undergraduate"){
				MEMLIST.push_back(new undergraduate(buf2, buf1));
			}
			tempMem = MEMLIST.back();
		}
		else{
			for(i=0;i<MEMLIST.size();i++){
				if(MEMLIST.at(i)->getName() == memName){
					tempMem = MEMLIST.at(i);
					break;
				}
				else if(i==MEMLIST.size()-1){
					if(memType=="Undergraduate"){
						MEMLIST.push_back(new undergraduate(buf2, buf1));
					}
					tempMem = MEMLIST.back();
				}
			}
		}

		if(BorR[0]=='B'){
			if(exist==0){
				cout << "1	";	// return code 1
				cout << "Non exist resource." <<endl;
			}
			else if(tempMem->borrow(year, month, day)==2){
				cout << "2	";
				cout << "Exceeds your possible number of borrow. Possible # of borrows: ";
				cout << tempMem->getBorrow() << endl;
			}
			else if(tempMem->borrow(year, month, day)==0){
				b_year = (year*360+month*30+day + tempMem->getTerm()) / 360;
				b_month = ((year*360+month*30+day + tempMem->getTerm()) - b_year*360) / 30;
				b_day = ((year*360+month*30+day + tempMem->getTerm()) - b_year*360 - b_month*30);
				if(tempRes->borrow(tempMem->getName(), year, month, day, b_year, b_month, b_day)==1){
					cout << "4	";
					cout << "You already borrowed this ";
					cout << setw(2) << setfill('0') << tempRes->getB_year() <<"/";
					cout << setw(2) << setfill('0') << tempRes->getB_month() <<"/";
					cout << setw(2) << setfill('0') << tempRes->getB_day() << endl;
				}
				else if(tempRes->borrow(tempMem->getName(), year, month, day, b_year, b_month, b_day)==2){
					cout << "5	";
					cout << "Other member already borrowed this ";
					cout << tempRes->getType()<<". This " << tempRes->getType() <<" will be returned at ";
					cout << setw(2) << setfill('0') << tempRes->getR_year() <<"/";
					cout << setw(2) << setfill('0') << tempRes->getR_month()<<"/";
					cout << setw(2) << setfill('0') << tempRes->getR_day() <<endl;
				}
				else {
					tempMem->setBorrow(tempMem->getBorrow()+1);
					cout << "0	Success." <<endl;
				}
			
			}
			else if(tempMem->borrow(year, month, day)==1){
				cout << "6	";
				cout << "Restricted member until ";
				cout << setw(2) << setfill('0') << tempMem->getYear()<<"/";
				cout << setw(2) << setfill('0') << tempMem->getMonth()<<"/";
				cout << setw(2) << setfill('0') << tempMem->getDay()<<endl;
			}
		}
		else if(BorR[0]=='R'){
			if(tempRes->giveBack(tempMem->getName(), year, month, day) == 0){
				tempMem->giveBack();
				cout << "0	Success." <<endl;
			}
			else if(tempRes->giveBack(tempMem->getName(), year, month, day) == 2){
				cout << "3	You did not borrow this "<< tempRes->getType() <<"."<<endl;
			}
			else{
				result = year*360 + month*30 + day - tempRes->getR_year()*360 - tempRes->getR_month()*30 - tempRes->getR_day();
				b_year = (year*360+month*30+day + result) / 360;
				b_month = ((year*360+month*30+day + result) - b_year*360) / 30;
				b_day = ((year*360+month*30+day + result) - b_year*360 - b_month*30);

				tempMem->setYear(b_year);
				tempMem->setMonth(b_month);
				tempMem->setDay(b_day);
				tempMem->giveBack();

				cout << "7	Delayed return. You'll be restricted until ";
				cout << setw(2) << setfill('0') << tempMem->getYear() <<"/";	
				cout << setw(2) << setfill('0') << tempMem->getMonth() <<"/";	
				cout << setw(2) << setfill('0') << tempMem->getDay()<<endl;
			}
		}

		cnt++;
	}
	fclose(fp);
}
