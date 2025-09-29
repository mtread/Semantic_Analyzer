// Date: 09/25/25
// Author: Mackenzie Treadway
//
// values.cc
// -----------------------
// This file contains the math and logic evaluation functions.
// Basically: it calculates the results of operations.

#include <string>
#include <cmath>

using namespace std;

#include "values.h"
#include "listing.h"

double evaluateArithmetic(double left, Operators operator_, double right) {
	double result;
	switch (operator_) {
		case ADD:
			result = left + right;
			break;
		case MULTIPLY:
			result = left * right;
			break;
	}
	return result;
}

double evaluateRelational(double left, Operators operator_, double right) {
	double result;
	switch (operator_) {
		case LESS:
			result = left < right;
			break;
	}
	return result;
}
