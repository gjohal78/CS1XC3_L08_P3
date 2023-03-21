# Variables
CC = gcc
CFLAGS = -Wall
BUILD_DIR = build
SRC_DIR = src
TEST_DIR = test


# Create build directory
$(shell mkdir -p $(BUILD_DIR))

# Compile library.c to an object file
$(BUILD_DIR)/library.o: $(SRC_DIR)/library.c
	$(CC) $(CFLAGS) -c $< -o $@

# Compile multiply.c, max.c and square.c using library.o
$(BUILD_DIR)/multiply: $(SRC_DIR)/multiply.c $(BUILD_DIR)/library.o
	$(CC) $(CFLAGS) $^ -o $@
	
$(BUILD_DIR)/max: $(SRC_DIR)/max.c $(BUILD_DIR)/library.o
	$(CC) $(CFLAGS) $^ -o $@
	
$(BUILD_DIR)/square: $(SRC_DIR)/square.c $(BUILD_DIR)/library.o
	$(CC) $(CFLAGS) $^ -o $@

# Build all final targets
all: $(BUILD_DIR)/multiply $(BUILD_DIR)/max $(BUILD_DIR)/square

test: all
	$(shell mkdir -p $(TEST_DIR))
    
	$(BUILD_DIR)/square inches < ./test_data/square_input.txt > test/square_output.txt && \
	diff test_data/square_expected.txt test/square_output.txt

	$(BUILD_DIR)/multiply 2 < ./test_data/multiply_input.txt > test/multiply_output.txt && \
	diff test_data/multiply_expected.txt test/multiply_output.txt

	$(BUILD_DIR)/max 4 3 2 1 5 7 8 10 6 > test/max_output.txt && \
	diff test_data/max_expected.txt test/max_output.txt
	
	@echo "All tests passed successfully!"
	rm -rf $(TEST_DIR)


# Delete build directory and everything in it
clean:
	rm -rf $(BUILD_DIR) $(TEST_DIR)
	

.PHONY: all clean test

