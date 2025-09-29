// Date: 09/25/25
// Author: Mackenzie Treadway
//
// values.h
// -----------------------
// Holds type definitions and function declarations.

typedef char* CharPtr;

enum Operators {ADD, MULTIPLY, LESS, AND};

double evaluateArithmetic(double left, Operators operator_, double right);
double evaluateRelational(double left, Operators operator_, double right);
