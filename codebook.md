# Code Book

This code book describes the variables, the data, and any transformations or work that is performed to clean up the data.
 
The resulting tidy data are in a text file called `FinalData.txt`, which is 180 rows and 69 columns. The 69 columns or variables in the data consists of 3 identifier variables which identifies subjects and activities. The rest 66 variables are measurement variables, only on the mean and standard deviation for each measurement, extracted as required for this assignment. Each row in the final data is the average for each activity and each subject.

## Identifiers

- subject - The ID of the test subject
- activityCode - Numeric codes (1-6) for various activities
- activityType - The type of activity performed when the corresponding measurements were taken
  - WALKING (code 1): subject was walking during the test
  - WALKING_UPSTAIRS (code 2): subject was walking up a staircase during the test
  - WALKING_DOWNSTAIRS (code 3): subject was walking down a staircase during the test
  - SITTING (code 4): subject was sitting during the test
  - STANDING (code 5): subject was standing during the test
  - LAYING (code 6): subject was laying down during the test

## Measurements

66 measurement variables, only on the mean (Mean) and standard (Std) deviation for each measurement, extracted as required for this assignment. 


 1. TimeBodyAccelerometer Mean-X                    
 2. TimeBodyAccelerometer Mean-Y                    
 3. TimeBodyAccelerometer Mean-Z                    
 4. TimeGravityAccelerometer Mean-X                 
 5. TimeGravityAccelerometer Mean-Y                 
 6. TimeGravityAccelerometer Mean-Z                 
 7. TimeBodyAccelerometerJerk Mean-X                
 8. TimeBodyAccelerometerJerk Mean-Y                
 9. TimeBodyAccelerometerJerk Mean-Z                
10. TimeBodyGyroscope Mean-X                        
11. TimeBodyGyroscope Mean-Y                        
12. TimeBodyGyroscope Mean-Z                        
13. TimeBodyGyroscopeJerk Mean-X                    
14. TimeBodyGyroscopeJerk Mean-Y                    
15. TimeBodyGyroscopeJerk Mean-Z                    
16. TimeBodyAccelerometerMagnitude Mean             
17. TimeGravityAccelerometerMagnitude Mean          
18. TimeBodyAccelerometerJerkMagnitude Mean         
19. TimeBodyGyroscopeMagnitude Mean                 
20. TimeBodyGyroscopeJerkMagnitude Mean             
21. FrequencyBodyAccelerometer Mean-X               
22. FrequencyBodyAccelerometer Mean-Y               
23. FrequencyBodyAccelerometer Mean-Z               
24. FrequencyBodyAccelerometerJerk Mean-X           
25. FrequencyBodyAccelerometerJerk Mean-Y           
26. FrequencyBodyAccelerometerJerk Mean-Z           
27. FrequencyBodyGyroscope Mean-X                   
28. FrequencyBodyGyroscope Mean-Y                   
29. FrequencyBodyGyroscope Mean-Z                   
30. FrequencyBodyAccelerometerMagnitude Mean        
31. FrequencyBodyBodyAccelerometerJerkMagnitude Mean
32. FrequencyBodyBodyGyroscopeMagnitude Mean        
33. FrequencyBodyBodyGyroscopeJerkMagnitude Mean    
34. TimeBodyAccelerometer Std-X                     
35. TimeBodyAccelerometer Std-Y                     
36. TimeBodyAccelerometer Std-Z                     
37. TimeGravityAccelerometer Std-X                  
38. TimeGravityAccelerometer Std-Y                  
39. TimeGravityAccelerometer Std-Z                  
40. TimeBodyAccelerometerJerk Std-X                 
41. TimeBodyAccelerometerJerk Std-Y                 
42. TimeBodyAccelerometerJerk Std-Z                 
43. TimeBodyGyroscope Std-X                         
44. TimeBodyGyroscope Std-Y                         
45. TimeBodyGyroscope Std-Z                         
46. TimeBodyGyroscopeJerk Std-X                     
47. TimeBodyGyroscopeJerk Std-Y                     
48. TimeBodyGyroscopeJerk Std-Z                     
49. TimeBodyAccelerometerMagnitude Std              
50. TimeGravityAccelerometerMagnitude Std           
51. TimeBodyAccelerometerJerkMagnitude Std          
52. TimeBodyGyroscopeMagnitude Std                  
53. TimeBodyGyroscopeJerkMagnitude Std              
54. FrequencyBodyAccelerometer Std-X                
55. FrequencyBodyAccelerometer Std-Y                
56. FrequencyBodyAccelerometer Std-Z                
57. FrequencyBodyAccelerometerJerk Std-X            
58. FrequencyBodyAccelerometerJerk Std-Y            
59. FrequencyBodyAccelerometerJerk Std-Z            
60. FrequencyBodyGyroscope Std-X                    
61. FrequencyBodyGyroscope Std-Y                    
62. FrequencyBodyGyroscope Std-Z                    
63. FrequencyBodyAccelerometerMagnitude Std         
64. FrequencyBodyBodyAccelerometerJerkMagnitude Std 
65. FrequencyBodyBodyGyroscopeMagnitude Std         
66. FrequencyBodyBodyGyroscopeJerkMagnitude Std


## Transformations or work that is performed to clean up the data

The analysis file, `run_analysis.R` downloads and transforms the data in the following steps. Each step is spelled out in detail in the analysis file.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


