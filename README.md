# ZX Spectrum Perceptrons

## Overview

This project implements a simple perceptron-based AI in Sinclair ZX Spectrum BASIC. The program allows you to train perceptrons on basic logic gates (AND, OR, NOT) using fundamental machine learning concepts such as weights, bias, and learning rate. The goal is to demonstrate how a perceptron learns through training iterations, updating its weights based on training data, and evaluating predictions.

### Key Features:
- Train a perceptron to solve basic logic gates: **OR**, **AND**, **NOT**.
- Implemented in ZX Spectrum BASIC, showcasing the early days of computing and machine learning concepts.
- Adjustable hyperparameters such as learning rate, epochs, and bias.
- Training is done in a simple loop, where weights are adjusted based on error feedback.

## Setup Instructions

1. **Run the Program:**
   - Load the BASIC code into your ZX Spectrum emulator or real ZX Spectrum.
   - After execution, you'll be prompted to select a logic gate (OR, AND, NOT) to train.

2. **Training the Perceptron:**
   - The perceptron will go through multiple epochs, adjusting weights and biases as it learns from the training data.
   - After training, the model will make predictions based on input data and output the results.

3. **Test with Different Logic Gates:**
   - You can train and evaluate the perceptron with different gates using the provided datasets.

## Hyperparameters:
- **Learning Rate:** Determines how quickly the model adjusts its weights during training. It is set to 0.1 by default.
- **Epochs:** The total number of times the training dataset is processed. The default is set to 30.
- **Bias:** A parameter that helps improve model accuracy by allowing the function to shift away from the origin.

## How It Works:
1. The program starts by asking you to choose a logic gate (OR, AND, or NOT).
2. It initializes random weights and the bias.
3. The perceptron is trained using the selected gate's training data, adjusting its weights over several epochs.
4. Once training is complete, the model evaluates predictions for new input data.

## Code Documentation:
The code is **heavily documented** with detailed comments throughout. Specific callouts to the syntax of the Sinclair ZX Spectrum BASIC language are provided, marked with the prefix **"Learn Sinclair ZX Spectrum BASIC"**. These comments explain important language features such as:
- Variable naming conventions
- Array indexing (starting at 1)
- Specific nuances of BASIC on the ZX Spectrum
- How to structure subroutines and handle global variables

This documentation makes it easier to understand the unique characteristics of Sinclair ZX Spectrum BASIC and serves as a helpful guide for anyone learning or revisiting this vintage language.

## Links:
- [Blog Post on Running a Perceptron on an 8-bit computer](https://blog.lessaworld.com/2025/03/09/running-a-perceptron-on-an-8-bit-computer/#more-917) - My original post covering this program, which contains a brief explanation of how the perceptron algorithm works.
- [YouTube Video: Running a Perceptron on an 8-bit computer](https://www.youtube.com/watch?v=B470k0TOHqA) - A step-by-step video guide on running the program on a great ZX Spectrum emulator.

## License
This project is licensed under the MIT License - see the [LICENSE](https://github.com/lessaworld/perceptron/blob/main/LICENSE) file for details.

## Credits:
- **Author:** Andre Lessa
- **Website:** [LessaWorld.com](https://www.lessaworld.com)
