(ql:quickload "cl-ppcre")
(ql:quickload "str")

(setq *filename* "puzzle_one_input.txt")

(defun extract-lists-from-file (filename)
  (let ((list1 nil)
        (list2 nil))
      (loop for line in (str:lines (str:from-file filename))
            do (let ((numbers (mapcar #'parse-integer (cl-ppcre:split "\\s+" line))))
                     (push (first numbers) list1)
                     (push (second numbers) list2)
                      ))
      (list list1 list2)))

(defun order-list-ascending (unsorted-list)
  (sort unsorted-list #'<)
  )

(defun alter-list-by-similarity (list1 list2)
  (loop for number1 in list1
        do ((let ((score 0))
            (loop for number2 in list2
                  do (if (number1 == number2)
                          (incf score)
                          (if (number1 > number2)
                              (return))))
            (setq number1  (* number1 score)))))
  list1)

(defun sum-list (list)
  (reduce #'+ list :initial-value 0))

(defun solve ()
  (let ((list1 (first (extract-lists-from-file *filename*)))
        (list2 (second (extract-lists-from-file *filename*))))
    (print (sum-list (alter-list-by-similarity (order-list-ascending list1) 
                                              (order-list-ascending list2))))))

; (solve)
