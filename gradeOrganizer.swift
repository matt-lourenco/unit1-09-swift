//
//  gradeOrganizer.swift
//  This program creates a 4 x 6 array of students and grades (4 students and
//      6 assignments). It then finds the average of these grades.
//
//  Created by Matthew Lourenco on 23/02/18.
//  Copyright © 2018 MTHS. All rights reserved.
//

import Foundation
srand(UInt32(time(nil)))

func randomSkewedNumber()->Int {
	//This method generates two random numbers and returns the larger one
	var randomNumber1: Int = Int(random()%(99) + 1)
	var randomNumber2: Int = Int(random()%(99) + 1)
	if randomNumber1>randomNumber2 {
		return randomNumber1
	} else {
		return randomNumber2
	}
} 

func findAverage(array: [[Double]])->Double {
	//finds the average of a 2D array (a class of students)

	var studentAverages: [Double] = []
	var studentScore: Double = 0
	var overallScore: Double = 0.0

	//find average of each student
	for student in 0..<array.count {
		studentScore = 0
		for assignment in array[student] {
			studentScore += Double(assignment)
		}
		studentAverages.append(studentScore / Double(array[student].count))
	}

	//find average of entire class
	for studentAverage in studentAverages {
		overallScore += studentAverage
	}
	//return the class average
	return Double(round(overallScore / Double(studentAverages.count) * 100)) / 100
}

// Generate a 4 x 6 array and fills with randomSkewedNumber()s

var classroom: [[Double]] = []

//fill with random skewed numbers
for student in 0..<4 {
	classroom.append([])
	for assignment in 0..<6 {
		classroom[student].append(Double(randomSkewedNumber()))
	}
}

//print each student's score
for student in 0..<classroom.count {
	print("Student \(student):", terminator: "")
	for assignment in classroom[student] {
		print(" \(Int(assignment))", terminator: "")
	}
	print("")
}
print("The class average is \(findAverage(array: classroom))");