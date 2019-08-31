## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


makeCacheMatrix <- function(matrix = matrix()) {
  #this matrix takes the input and sets the matrix and returns a list of 4 functions. this list is the special matrix. 
  #this list is also used by the other functions. 
  #inverse and matrix are values that are accessed from outside the environment
  inverse<-NULL
  #we start off by setting the inverse as Null so that we can set the inverse later
  #now we create a set function that sets the matrix value
  set<-function(y){
    matrix<<-y 
    #when set function is called it sets the input matrix or updates it
    inverse<<-NULL 
    #obviously when the matrix value is updated the inverse has to be calculated
    #again. Hence along with setting the matrix value the inverse is reset to NULL
    #Note. This function is defined here and called later. Also note that <<- sign is used to 
    #set values outside this environment
  }
  #now we write the get function that gets the original matrix 
  get<-function()matrix 
  #Note now we have "got" the matrix
  #now we write a function that sets the inverse
  set_inverse<-function(inv)inverse<<-inv
  #Note this function takes the inv value and sets it to inverse which is outside its environment
  #Now we write a fucntion to get the inverse value
  get_inverse<-function()inverse
  #Now we return a list
  list(set=set,get=get,set_inverse=set_inverse,get_inverse=get_inverse)
  #this is list is also called the special_matrix
}


## Write a short comment describing this function
#Now we write a function that takes the list created by the above function and used it. 

cacheSolve <- function(special_matrix, ...) {
  
        ## Return a matrix that is the inverse of 'special_matrix'
        inverse<-special_matrix$get_inverse() 
        #this gets the inverse from the cache
        if(!is.null(inverse)){
          message("Getting cached data...")
          return(inverse)
          #this if statement check if inverse is already in the cache. If true it return the inverse
          #from the cache
        }
        #Suppose there is no inverse value in the cache so we need to calculate it 
        data<-special_matrix$get()
        #we get the matrix
        #now we create inverse
        inverse<-solve(data)
        # now we set the inverse 
        special_matrix$set_inverse(inverse)
        #now we return it
        inverse
        #Note we are not calling the set function here. 
}
