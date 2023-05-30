---
marp: true
theme: gradient
size: 16:9
paginate: true
style: |
  .columns {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
---

# Tutorial 02 :butterfly: 

## Community Innovation Survey 2021

Prof. Dr. Cornelia Storz
Fei Wang (Michael) :heart: AI
Goehte University Frankfurt
Summer Semester 2023


--- 

# Practice makes perfect :weight_lifting_woman: :repeat: :ok_hand:

- Continue to learn __key concepts of Regression Analysis__.
    - variable selection
    - control variables
    - model diagnostics

- We will use `Community Innovation Survey 2021` dataset for this practice.
- Data exploration with R
- Linear Regression with R


---

```
===============================================
                        Dependent variable:    
                    ---------------------------
                               medv            
-----------------------------------------------
rm                           9.102***          
                              (0.419)          
                                               
Constant                    -34.671***         
                              (2.650)          
                                               
-----------------------------------------------
Observations                    506            
R2                             0.484           
Adjusted R2                    0.483           
Residual Std. Error      6.616 (df = 504)      
F Statistic          471.847*** (df = 1; 504)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

---

```
===============================================
                        Dependent variable:    
                    ---------------------------
                               medv            
-----------------------------------------------
lstat                        -0.950***         
                              (0.039)          
                                               
Constant                     34.554***         
                              (0.563)          
                                               
-----------------------------------------------
Observations                    506            
R2                             0.544           
Adjusted R2                    0.543           
Residual Std. Error      6.216 (df = 504)      
F Statistic          601.618*** (df = 1; 504)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```


---

```
===============================================
                        Dependent variable:    
                    ---------------------------
                               medv            
-----------------------------------------------
age                          -0.123***         
                              (0.013)          
                                               
Constant                     30.979***         
                              (0.999)          
                                               
-----------------------------------------------
Observations                    506            
R2                             0.142           
Adjusted R2                    0.140           
Residual Std. Error      8.527 (df = 504)      
F Statistic           83.477*** (df = 1; 504)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```


---

```
===============================================
                        Dependent variable:    
                    ---------------------------
                               medv            
-----------------------------------------------
age                            0.069           
                              (0.071)          
                                               
I(age2)                      -0.002***         
                              (0.001)          
                                               
Constant                     26.567***         
                              (1.885)          
                                               
-----------------------------------------------
Observations                    506            
R2                             0.155           
Adjusted R2                    0.151           
Residual Std. Error      8.472 (df = 503)      
F Statistic           46.075*** (df = 2; 503)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```

---

```
===============================================
                        Dependent variable:    
                    ---------------------------
                               medv            
-----------------------------------------------
lstat                        -1.052***         
                              (0.050)          
                                               
age                           -0.045           
                              (0.052)          
                                               
I(age2)                        0.001           
                             (0.0004)          
                                               
Constant                     35.166***         
                              (1.430)          
                                               
-----------------------------------------------
Observations                    506            
R2                             0.553           
Adjusted R2                    0.551           
Residual Std. Error      6.164 (df = 502)      
F Statistic          207.425*** (df = 3; 502)  
===============================================
Note:               *p<0.1; **p<0.05; ***p<0.01
```


--- 

# Linear Regression: issue of multicollinearity

- Should we include `age` and `lstat` in the same model?
    - They are __highly correlated__.
    - We should __not__ include them in the same model.

![dag1 center height:300](dag1.png)