/*******************************************************************************
*
* Purpose: Prints the maximum number of any number of int command-line 
* arguments that are provided.  So if this program is run with:
*   ./max 5 10 20 25 15
* then we can expect it to print 25.
*
*******************************************************************************/
#include <stdio.h>
#include <stdlib.h>
#include "library.h"

int main(int argc, char *argv[])
{
  // if no arguments provided, output error message and exit
  if (argc < 2) 
  {
    printf("Error: Please provide at least one integer argument.\n");
    return 0;
  }

  // create an array to hold the integers
  int numbers[argc-1];

  // read the integers from the command line and store them in the array
  for (int i = 1; i < argc; i++)
  {
    numbers[i-1] = atoi(argv[i]);
  }

  // find the maximum value using the max function from library.h
  int maximum = max(numbers, argc-1);

  // output the maximum value
  printf("%d\n", maximum);

  return 0;
}