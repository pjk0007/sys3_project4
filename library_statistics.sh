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
		echo "not yet"
	elif [ $2 = "book" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($2=="Book") print}' >input.dat
		./start > ./result/input/book.dat

	elif [ $2 = "e-book" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($2=="E-book") print}' > input.dat
		./start > ./result/input/e-book.dat

	elif [ $2 = "magazine" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($2=="Magazine") print}' > input.dat
		./start > ./result/input/magazine.dat

	elif [ $2 = "undergraduate" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($5=="Undergraduate") print}' > input.dat
		./start > ./result/input/undergraduate.dat

	elif [ $2 = "graduate" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($5=="Graduate") print}' > input.dat
		./start > ./result/input/graduate.dat

	elif [ $2 = "faculty" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($5=="Faculty") print}' > input.dat
		./start > ./result/input/faculty.dat

	elif [ $2 = "all" ]
	then
		cat ./result/input.dat | awk -F'\t' '{if($2=="Book") print}' >input.dat
		./start > ./result/input/book.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="E-book") print}' > input.dat
		./start > ./result/input/e-book.dat
		cat ./result/input.dat | awk -F'\t' '{if($2=="Magazine") print}' > input.dat
		./start > ./result/input/magazine.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Undergraduate") print}' > input.dat
		./start > ./result/input/undergraduate.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Graduate") print}' > input.dat
		./start > ./result/input/graduate.dat
		cat ./result/input.dat | awk -F'\t' '{if($5=="Faculty") print}' > input.dat
		./start > ./result/input/faculty.dat

	fi
	rm input.dat
	mv ./result/input.dat .
	mv ./result/space.dat .

elif [ $1 = "space" ]
then
	if [ ! -d ./result/space ]
	then
		mkdir ./result/space
	fi

	if [ $2 = "date" ]
	then
		echo "not yet"

	elif [ $2 = "studyroom" ]
	then
		if [ $3 = "all" ]
		then
			cat space.dat | awk -F'\t' '{if($2=="StudyRoom") print}' > ./result/space/studyroom.dat
		
		else
			cat space.dat | awk -F'\t' '{if($2=="StudyRoom" && $3=='$3') print}' > ./result/space/studyroom.dat
		fi

	elif [ $2 = "seat" ]
	then
		if [ $3 = "all" ]
		then
			cat space.dat | awk -F'\t' '{if($2=="Seat") print}' > ./result/space/seat.dat
		
		else
			cat space.dat | awk -F'\t' '{if($2=="Seat" && $3=='$3') print}' > ./result/space/seat.dat
		fi
	elif [ $2 = "undergraduate" ]
	then
		cat space.dat | awk -F'\t' '{if($5=="Undergraduate") print}' > ./result/space/undergraduate.dat

	elif [ $2 = "graduate" ]
	then
		cat space.dat | awk -F'\t' '{if($5=="Graduate") print}' > ./result/space/graduate.dat

	elif [ $2 = "faculty" ]
	then
		cat space.dat | awk -F'\t' '{if($5=="Faculty") print}' > ./result/space/faculty.dat

	elif [ $2 = "all" ]
	then
		cat space.dat | awk -F'\t' '{if($2=="StudyRoom") print}' > ./result/space/studyroom.dat
		cat space.dat | awk -F'\t' '{if($2=="Seat") print}' > ./result/space/seat.dat
		cat space.dat | awk -F'\t' '{if($5=="Undergraduate") print}' > ./result/space/undergraduate.dat
		cat space.dat | awk -F'\t' '{if($5=="Graduate") print}' > ./result/space/graduate.dat
		cat space.dat | awk -F'\t' '{if($5=="Faculty") print}' > ./result/space/faculty.dat
	fi

elif [ $1 = "output" ]
then
	if [ $2 = "stat_table" ]
	then
		echo "not yet"
	fi
fi
