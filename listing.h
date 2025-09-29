// Date: 09/25/25
// Author: Mackenzie Treadway
//
// listing.h
// -----------------------
// Function prototypes for compiler listing and errors.

enum ErrorCategories {LEXICAL, SYNTAX, GENERAL_SEMANTIC, DUPLICATE_IDENTIFIER,
	UNDECLARED};

void firstLine();
void nextLine();
int lastLine();
void appendError(ErrorCategories errorCategory, string message);
