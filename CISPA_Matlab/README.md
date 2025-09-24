# CIS I - Programming Assignment (Matlab)

## Introduction

This is the starting code for the programming assignment in CIS I. This document provides instructions on how to set up your environment, use the provided code, and submit your work.

## SSH and GitHub Setup
Note: This project will be distributed as a zip file. The following instructions for setting up SSH and GitHub are provided to help you collaborate with your partner. You are expected to work in groups of two and can use a private GitHub repository for your collaboration.

### SSH Key Generation
1. Open a terminal or Git Bash.
2. Run the following command to generate a new SSH key. Replace `"your_email@jhu.edu"` with your JHU email address.
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@jhu.edu"
   ```
3. When prompted to "Enter a file in which to save the key," press Enter to accept the default file location.
4. At the prompt, type a secure passphrase.

### Adding your SSH key to the ssh-agent
1. Start the ssh-agent in the background.
   ```bash
   eval "$(ssh-agent -s)"
   ```
2. Add your SSH private key to the ssh-agent.
   ```bash
   ssh-add ~/.ssh/id_rsa
   ```

### Adding a new SSH key to your GitHub account
1. Copy the SSH key to your clipboard.
   - **macOS**: `pbcopy < ~/.ssh/id_rsa.pub`
   - **Windows (Git Bash)**: `cat ~/.ssh/id_rsa.pub | clip`
   - **Linux**: `sudo apt-get install xclip` (if you don't have it), then `xclip -sel clip < ~/.ssh/id_rsa.pub`
2. Go to your GitHub account settings.
3. Click on "SSH and GPG keys."
4. Click "New SSH key" or "Add SSH key."
5. In the "Title" field, add a descriptive label for the new key.
6. Paste your key into the "Key" field.
7. Click "Add SSH key."

## Dependencies

To run the Matlab code, you will need:
- Matlab installed on your system.

## How to Run

All your source code (`.m` files) should be placed in the `programs/` directory.

### Running
1. Open Matlab.
2. In the Matlab command window, navigate to the root directory of this project.
3. Add the `programs` directory to the Matlab path:
   ```matlab
   addpath('programs');
   ```
4. Run your main script. For example, if your main script is `main.m`:
   ```matlab
   main
   ```
Your main script should be placed in the root folder. All output files should be written to the `output/` directory.

## How to Use

The main Matlab script should be run from the root directory of the project. The program will read any necessary input files and write its output to the `output/` directory. The `logging/` directory is available for any logging your program might do.

## Unit Testing

Matlab has a built-in unit testing framework. You can create test scripts and functions to verify your code.

1. Create a test script, for example, `programs/tests/my_test.m`.
2. Write your tests using the `assert` function or by creating a test class that inherits from `matlab.unittest.TestCase`.

Example of a simple test script:
```matlab
% programs/tests/my_test.m

% Add the path to your functions
addpath('../'); 

% Test 1
result = 1 + 1;
assert(result == 2);

disp('All tests passed!');
```

To run the test, you would execute the script from the Matlab command window.
```matlab
run('programs/tests/my_test.m')
```
