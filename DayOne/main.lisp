(load "puzzle_one_solution.lisp")

(defun main ()
  (let ((array1 (first (extract-arrays-from-file "day_one_input.txt")))
        (array2 (second (extract-arrays-from-file "day_one_input.txt"))))
    (print (get-sum-of-differences-between-array-elements 
              (order-array-ascending array1)
              (order-array-ascending array2)))))
(main)