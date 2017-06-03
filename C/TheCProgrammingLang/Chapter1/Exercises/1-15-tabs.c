#include <stdio.h>

float fahrenheit_to_celsius(float f);

int main(int argc, char const *argv[]) {
	float fahr, celsius;
	int lower, upper, step;

	lower = 0;      /* lower limit of temperature table */
	upper = 300;    /* upper limit */
	step = 20;

	fahr = lower;
	while (fahr <= upper) {
		// "integer division truncates: any fractional part is discarded"
		//celsius = 5.0/9.0 * (fahr - 32.0);
		celsius = fahrenheit_to_celsius(fahr);
		// "If an arithmetic operator has one floating-point operand and
		// one integer operand, however, the integer will be converted
		// to floating point before the operation is done."

		// %3.0f : "[..] floating-point is to be printed at least three
		// characters wide, with no decimal point and no fraction digits."

		// %6.1f : ".. describes another number (celsius) that is to be
		// printed at least six characters wide, with 1 digit after the
		// decimal point."
		printf("%3.0f %6.1f\n", fahr, celsius);
		fahr = fahr + step;
	}
	return 0;
}

float fahrenheit_to_celsius(float f) {
	float ret = 5.0/9.0 * (f - 32.0);
	return ret;
}
