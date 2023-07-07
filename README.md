# Anomaly_Detection_PSO_MATLAB

**Project:** ANOMALY IN PERSON’S SMS SENDING BEHAVIOUR DETECTION BY PSO ALGORITHM USING MATLAB

**Scenario:** Given 120 days of data on the number of SMS sent by a person to another person. 
Knowing some unfortunate event occurred to the person within 120 days, the objective is to find the day of the event from the daily SMS frequency data.

**Approach:**  
* SMS frequency per day is assumed to follow approximately Poisson distribution by observing a pattern.
* Let the event occur after day n, hence, up to the nth day SMS frequency follows $Poisson(\lambda_1)$ and for n=1 to 120th day or for 120-n days SMS frequency follows $Poisson(\lambda_2)$ are assumed.
* Define objective function: Total RMSE error between generated random numbers from respective Poisson distributions and the actual SMS frequency.
* PSO applied to minimize objective function with n = [0,120], $\lambda_1$ = [0, max(observed SMS frequencies)], $\lambda_2$ = [0, max(observed SMS frequencies)]
* PSO simulated for 20 runs and results with the lowest RMSE are retained.

**Result:** Lowest RMSE error = 3.544, n = 39 or event occurred at 40th day, $\lambda_1 = 6.598, \lambda_2 = 11.801$.

**_Input:_** sms_data.txt

**_Output:_** output.txt
