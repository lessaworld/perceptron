1 REM ######################################
2 REM #  Program: ZX Spectrum Perceptrons  #
3 REM #  Author:  Andre Lessa              #
4 REM #  Website: LessaWorld.com           #
5 REM #  License: MIT License              #
6 REM #  Version: 1.0                      #
7 REM ######################################

10 CLS
11 PRINT "Choose logic gate to train."
12 REM # Learn Sinclair ZX Spectrum BASIC: string variable names require single characters followed by "$".
13 INPUT "Options are: OR / AND / NOT", g$
14 IF g$ = "OR" OR g$ = "AND" OR g$= "NOT" THEN GO TO 20
15 GO TO 10

20 REM ##############################################
21 REM # Define variables and other hyperparameters #
22 REM ##############################################

30 REM # Weights are stored in the "w" array and are initialized with random values.
31 REM # Learn Sinclair ZX Spectrum BASIC: array variables need to be named as single characters.
32 REM # Learn Sinclair ZX Spectrum BASIC: array indexes start with 1 and are referenced using parentheses.
33 DIM w(2)
34 REM # Randomize initial weights.
35 LET w(1)=RND
36 LET w(2)=RND
37 REM # Initialize the array for the input values
38 DIM x(2)
39 REM # Learn Sinclair ZX Spectrum BASIC: Variable names are case insensitive
40 REM # Define the perceptron hyperparameters
41 LET learningRate = 0.1
42 LET epochs = 30
43 LET bias = 1

100 REM ######################
101 REM # Main training loop #
102 REM ######################

105 CLS
106 PRINT "Training '" + g$ + "' gate."
107 FOR e = 1 TO epochs
108 IF e = 1 OR (e/10) = INT (e/10) THEN PRINT "Epoch:" , e
109 REM # Call subroutine that reads the training data
110 GO SUB 400
111 READ numberOfInputs, numberOfUseCases
112 LET numberOfSuccessfulTests=0
113 FOR j=1 TO numberOfUseCases
114 FOR k=1 TO numberOfInputs
115 READ x(k)
116 NEXT k
117 READ expectedOutput
118 REM # Run the training subroutine for the current use case
119 GO SUB 200
120 NEXT j
121 REM # Exit if training is successful or number of iteration reaches max value
122 IF numberOfSuccessfulTests<numberOfUseCases AND e<(epochs) THEN NEXT e
123 PRINT "Training finished in " + STR$ e + " step(s)"
124 IF numberOfSuccessfulTests<numberOfUseCases THEN PRINT "Training failed."

130 REM ########################################
131 REM # Evaluates Inputs using Final Weights #
132 REM ########################################

133 PRINT "Evaluating predictions for input values:"
134 GO SUB 400
135 READ numberOfInputs, numberOfUseCases
136 FOR j=1 TO numberOfUseCases
137 FOR k=1 TO numberOfInputs
138 READ x(k)
139 NEXT k
140 READ skip
141 REM # Runs the prediction subroutine for each use case
142 GO SUB 300
143 NEXT j

150 REM ################
151 REM # Debug Output #
152 REM ################
153 PRINT
154 PRINT "Linear equation:"
155 LET b$ = STR$ bias
160 IF numberOfInputs = 1 THEN PRINT "Y = X1 * " ; STR$ w(1) ; " + (" + b$ + ")"
161 IF numberOfInputs = 2 THEN PRINT "Y = X1 * " ; STR$ w(1) ; " + X2 * " ; STR$ w(2) ; " + (" + b$ + ")"
162 PRINT

165 INPUT "Train another Perceptron?", r$
166 IF r$ = "Y" OR r$ = "y" OR r$ = "YES" OR r$ = "yes" THEN GO TO 10

169 REM # End of program.
170 PRINT "Exiting program. Thank you."
172 PRINT
175 STOP

200 REM ########################
210 REM # Subroutine: Training #
220 REM ########################
230 REM
231 REM # Learn Sinclair ZX Spectrum BASIC: subroutines use global scope for variables
232 LET weightedSum = 0
233 FOR k=1 TO numberOfInputs
234 LET weightedSum = weightedSum + x(k) * w(k)
235 NEXT k
236 LET computedValue = weightedSum + bias
237 REM # Evaluate the Activation Function
238 LET activationThreshold = 0
239 IF computedValue > activationThreshold THEN LET prediction = 1
240 IF computedValue <= activationThreshold THEN LET prediction = 0
241 REM # Learn Sinclair ZX Spectrum BASIC: "IF" statements have no "ELSE" clauses
243 IF expectedOutput = prediction THEN LET numberOfSuccessfulTests = numberOfSuccessfulTests + 1
245 IF expectedOutput <> prediction THEN GO SUB 250
247 RETURN

250 REM ##################
251 REM # Update weights #
252 REM ##################
253 REM
254 LET error = expectedOutput - prediction
256 FOR k=1 TO numberOfInputs
258 LET w(k) = w(k) + (learningRate * error * x(k))
259 NEXT k
260 LET bias = bias + (learningRate * error)
270 RETURN

300 REM ##########################
310 REM # Subroutine: Prediction #
320 REM ##########################
330 REM
351 LET weightedSum = 0
352 FOR k=1 TO numberOfInputs
353 LET weightedSum = weightedSum + x(k) * w(k)
354 NEXT k
355 LET prediction = weightedSum + bias
356 REM # Evaluate the Activation Function
357 IF prediction > 0 THEN LET prediction = 1
358 IF prediction <= 0 THEN LET prediction = 0
359 LET o$ = "For "
360 FOR k=1 TO numberOfInputs
361 LET o$ = o$ + STR$ x(k)
362 IF k < numberOfInputs THEN LET o$ = o$ + ", "
363 NEXT k
364 LET o$ = o$ + " the output is " + STR$ prediction
365 PRINT o$
366 RETURN

400 REM ###################################################
410 REM # Subroutine: Set memory pointer to training data #
420 REM ###################################################
430 REM # Data location is dependent on the selected logic gate.
431 IF g$ = "OR" THEN GO TO 440
432 IF g$ = "AND" THEN GO TO 442
433 IF g$ = "NOT" THEN GO TO 444
440 RESTORE 500
441 RETURN
442 RESTORE 600
443 RETURN
444 RESTORE 700
445 RETURN

450 REM #################
455 REM # Training data #
460 REM #################

500 REM # Training Data: OR gate
501 REM # First line sets numberOfInputs=2 and numberOfUseCases=4
502 REM # If both inputs are 1 then the output should be 1
503 REM # If inputs are 1 and 0 then the output should be 1
504 REM # If inputs are 0 and 1 then the output should be 1
505 REM # If both inputs are 0 then the output should be 0
506 DATA 2, 4
507 DATA 1, 1, 1
508 DATA 1, 0, 1
509 DATA 0, 1, 1
510 DATA 0, 0, 0

600 REM # Training Data: AND gate
601 REM # First line sets numberOfInputs=2 and numberOfUseCases=4
603 REM # If both inputs are 1 then the output should be 1
604 REM # If inputs are 1 and 0 then the output should be 0
605 REM # If inputs are 0 and 1 then the output should be 0
606 REM # If both inputs are 0 then the output should be 0
607 DATA 2, 4
608 DATA 1, 1, 1
609 DATA 1, 0, 0
610 DATA 0, 1, 0
611 DATA 0, 0, 0

700 REM # Training Data: NOT gate
701 REM # First line sets numberOfInputs=1 and numberOfUseCases=2
703 REM # If input is 1 then the output should be 0
704 REM # If input is 0 then the output should be 1
705 DATA 1, 2
706 DATA 1, 0
707 DATA 0, 1
