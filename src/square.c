/*******************************************************************************
*
* Purpose: Square area calculator.  Outputs caculated square areas from 
* side length provided via standard input... outputs them with a unit 
* provided as 2nd argv values.  i.e. if we run with ""./square inches" expect 
* output of the format: 50 inches
*
*******************************************************************************/
#include <stdio.h>
#include "library.h"

int main(int argc, char *argv[])
{

  int side = 0;

// if argument number is incorrect output this notice
  if (argc != 2) 
  {
    printf("Incorrect number of arguments provided.\n");
    return 0;
  }

// read in side lengths one at a time and calculate square area
  while (scanf("%d", &side) != EOF) 
  {
    printf("%d %s\n", square_area(side), argv[1]);
  }

  return 0;
}