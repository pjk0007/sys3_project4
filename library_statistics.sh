#!/bin/bash
if [ ! -d result ]
then
	mkdir result
fi

if [ $1 = "resource" ]
then

	if [ ! -d ./result/resource ]
	then
		mkdir ./result/resource
	fi

	if [ $2 = "book" ]
	then
		cat resource.dat | awk -F'\t' '{if($1=="Book") print}' > ./result/resource/book.dat

	elif [ $2 = "e-book" ]
	then
		cat resource.dat | awk -F'\t' '{if($1=="E-book") print}' > ./result/resource/e-book.dat

	elif [ $2 = "magazine" ]
	then
		cat resource.dat | awk -F'\t' '{if($1=="Magazine") print}' > ./result/resource/magazine.dat

	elif [ $2 = "all" ]
	then
		cat resource.dat | awk -F'\t' '{if($1=="Book") print}' > ./result/resource/book.dat
		cat resource.dat | awk -F'\t' '{if($1=="E-book") print}' > ./result/resource/e-book.dat
		cat resource.dat | awk -F'\t' '{if($1=="Magazine") print}' > ./result/resource/magazine.dat

	fi

elif [ $1 = "input" ]
then
	mv input.dat result
	mv space.dat result
	if [ ! -d ./result/input ]
	then
		mkdir ./result/input
	fi

	if [ $2 = "date" ]
	then
		head -n 1 ./result/input.dat > input.dat 
		echo "$3" | awk -F'/' '{print $1*360+$2*30+$3}' | bc > from.dat
		read from < from.dat
		echo "$4" | awk -F'/' '{print $1*360+$2*30+$3}' | bc > to.dat
		read to < to.dat
		cat ./result/input.dat | awk -F '\/' '{if($1*360+$2*30+$3 >= '$from' && $1*360+$2*30+$3 <= '$to') print}' >> input.dat
		./start > ./result/input/date.dat
		rm from.dat
		rm to.dat
	elif [ $2 = "book" ]
	then
		head -n 1 ./result/input.dat > input.dat 
		cat ./result/input.dat | awk -F'\t' '{if($2=="Book") print}' >>input.dat
		./start > ./result/input/book.dat

	elif [ $2 = "e-book" ]
	then
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="E-book") print}' >> input.dat
		./start > ./result/input/e-book.dat

	elif [ $2 = "magazine" ]
	then
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="Magazine") print}' >> input.dat
		./start > ./result/input/magazine.dat

	elif [ $2 = "undergraduate" ]
	then
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Undergraduate") print}' >> input.dat
		./start > ./result/input/undergraduate.dat

	elif [ $2 = "graduate" ]
	then
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Graduate") print}' >> input.dat
		./start > ./result/input/graduate.dat

	elif [ $2 = "faculty" ]
	then
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Faculty") print}' >> input.dat
		./start > ./result/input/faculty.dat

	elif [ $2 = "all" ]
	then
		head -n 1 ./result/input.dat > input.dat 
		cat ./result/input.dat | awk -F'\t' '{if($2=="Book") print}' >>input.dat
		./start > ./result/input/book.dat
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="E-book") print}' >> input.dat
		./start > ./result/input/e-book.dat
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="Magazine") print}' >> input.dat
		./start > ./result/input/magazine.dat
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Undergraduate") print}' >> input.dat
		./start > ./result/input/undergraduate.dat
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Graduate") print}' >> input.dat
		./start > ./result/input/graduate.dat
		head -n 1 ./result/input.dat > input.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Faculty") print}' >> input.dat
		./start > ./result/input/faculty.dat

	fi
	rm input.dat
	mv ./result/input.dat .
	mv ./result/space.dat .

elif [ $1 = "space" ]
then
	mv input.dat result
	mv space.dat result
	if [ ! -d ./result/space ]
	then
		mkdir ./result/space
	fi

	if [ $2 = "date" ]
	then
		head -n 1 ./result/space.dat > space.dat
		echo "$3" | awk -F'/' '{print 20$1$2$3$4}' | bc > from.dat 
		read from < from.dat
		echo "$4" | awk -F'/' '{print 20$1$2$3$4}' | bc > to.dat
		read to < to.dat
		cat ./result/space.dat | awk -F '\/' '{if($1$2$3$4 >= '$from' && $1$2$3$4 <= '$to') print}' >> space.dat
		./start > ./result/space/date.dat
		rm from.dat
		rm to.dat

	elif [ $2 = "studyroom" ]
	then
		if [ $3 = "all" ]
		then
			head -n 1 ./result/space.dat > space.dat
			cat ./result/space.dat | awk -F'\t' '{if($2=="StudyRoom") print}' >> space.dat
			./start > ./result/space/studyroom.dat
		
		else
			head -n 1 ./result/space.dat > space.dat
			cat ./result/space.dat | awk -F'\t' '{if($2=="StudyRoom" && $3=='$3') print}' >> space.dat
			./start > ./result/space/studyroom.dat
		fi

	elif [ $2 = "seat" ]
	then
		if [ $3 = "all" ]
		then
			head -n 1 ./result/space.dat > space.dat
			cat ./result/space.dat | awk -F'\t' '{if($2=="Seat") print}' >> space.dat
			./start > ./result/space/seat.dat
		
		else
			head -n 1 ./result/space.dat > space.dat
			cat ./result/space.dat | awk -F'\t' '{if($2=="Seat" && $3=='$3') print}' >> space.dat
			./start > ./result/space/seat.dat
		fi
	elif [ $2 = "undergraduate" ]
	then
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Undergraduate") print}' >> space.dat
		./start > ./result/space/undergraduate.dat

	elif [ $2 = "graduate" ]
	then
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Graduate") print}' >> space.dat
		./start > ./result/space/greaduate.dat

	elif [ $2 = "faculty" ]
	then
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Faculty") print}' >> space.dat
		./start > ./result/space/faculty.dat

	elif [ $2 = "all" ]
	then
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($2=="StudyRoom") print}' >> space.dat
		./start > ./result/space/studyroom.dat
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($2=="Seat") print}' >> space.dat
		./start > ./result/space/seat.dat
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Undergraduate") print}' >> space.dat
		./start > ./result/space/undergraduate.dat
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Graduate") print}' >> space.dat
		./start > ./result/space/graduate.dat
		head -n 1 ./result/space.dat > space.dat
		cat ./result/space.dat | awk -F'\t' '{if($5=="Faculty") print}' >> space.dat
		./start > ./result/space/faculty.dat

	fi
	rm space.dat
	mv ./result/input.dat .
	mv ./result/space.dat .

elif [ $1 = "output" ]
then
	if [ ! -d ./result/output ]
	then
		mkdir ./result/output
	fi
	if [ $2 = "stat_table" ]
	then
		echo "Return_code	Number" > ./result/output/stat_table.dat
		./start > output.dat
		x=0
		until [ $x -gt 16 ]
		do
			sum=0
			cat output.dat | awk 'BEGIN {X=0} {if($2=='$x') X++ } END{print '$x'"\t"X}' >> ./result/output/stat_table.dat
			((x++))
		done
	fi
fi
