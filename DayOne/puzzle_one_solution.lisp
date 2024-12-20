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

(defun get-sum-of-differences-between-list-elements (list1 list2)
  (let ((sum 0))
  (loop for i from 0 to (1- (length list1))
    do (setq sum (+ sum (abs (- (elt list1 i) (elt list2 i))))))
  sum))

(defun solve ()
  (let ((list1 (first (extract-lists-from-file *filename*)))
        (list2 (second (extract-lists-from-file *filename*))))
    (print (get-sum-of-differences-between-list-elements
              (order-list-ascending list1)
              (order-list-ascending list2)))))

(solve)
