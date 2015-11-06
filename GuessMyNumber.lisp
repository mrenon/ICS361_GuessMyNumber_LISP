;;;; Mauricio Renon
;;; ICS 361 Into to A.I.
;;; This is a guess my number game,
;;; who’s code is take from the “Land of Lisp” book.
;;; The program guesses the user’s number and adjusts its guesses
;;; based on the user’s input of “bigger” or “smaller.”

;;;; This is where the top level definition is
;;; Asterisks surrounding variable names denote globals -
;;; They're totally optional and arbitrary. Lispers affectionately
;;; call them "earmuffs".

(defparameter *small* 1) ;SMALL is a global variable that is set to 1.
(defparameter *big* 100) ;BIG is a global variable that is set to 100.

;;;;GUESS-MY-NUMBER function.
;;; This function is used to begin the game

(defun guess-my-number ()	
     (ash (+ *small* *big*) -1))	;SMALL is 1; BIG is 100
	;; ash is the arithmetic shift function, built into common lisp
	;; it looks at a number in binary form, and then shifts its binary
	;; bits to the left of right, dropping any bits lost in the process.

;;;;SMALLER function.
;;; This function is used to set a different
;;; big number variable because the user’s number
;;; is smaller than the one guessed.

(defun smaller ()
     (setf *big* (1- (guess-my-number))) 
	;;BIG is double of what it originally was
	;; because of ash, the bit shift to the right
	;; in the guess-my-number function.
	;; setf is used to change the values of the global variables.
     (guess-my-number))
	;;call the guess-my-number function

;;;;BIGGER function.
;;; This function is used to set a different
;;; smaller number variable because the user’s number
;;; is bigger than the one guessed.

(defun bigger ()
     (setf *small* (1+ (guess-my-number))) 
	;;SMALL is double of what it originally was
	;; because of ash, the bit shift to the left
	;; in the guess-my-number function.
	;; setf is used to change the values of the global variables.
     (guess-my-number))
	;;call the guess-my-number function


;;;;START-OVER function.
;;; This function is used to begin the game

(defun start-over ()
   (defparameter *small* 1)
	;; set the global variable SMALL back to 1.
   (defparameter *big* 100)
	;; set the global variable BIG back to 100.
   (guess-my-number))
	;; call on the guess-my-number function.