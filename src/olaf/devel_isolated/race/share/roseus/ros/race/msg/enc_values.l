;; Auto-generated. Do not edit!


(when (boundp 'race::enc_values)
  (if (not (find-package "RACE"))
    (make-package "RACE"))
  (shadow 'enc_values (find-package "RACE")))
(unless (find-package "RACE::ENC_VALUES")
  (make-package "RACE::ENC_VALUES"))

(in-package "ROS")
;;//! \htmlinclude enc_values.msg.html


(defclass race::enc_values
  :super ros::object
  :slots (_steering _enc_val ))

(defmethod race::enc_values
  (:init
   (&key
    ((:steering __steering) 0)
    ((:enc_val __enc_val) 0)
    )
   (send-super :init)
   (setq _steering (round __steering))
   (setq _enc_val (round __enc_val))
   self)
  (:steering
   (&optional __steering)
   (if __steering (setq _steering __steering)) _steering)
  (:enc_val
   (&optional __enc_val)
   (if __enc_val (setq _enc_val __enc_val)) _enc_val)
  (:serialization-length
   ()
   (+
    ;; int16 _steering
    2
    ;; int32 _enc_val
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _steering
       (write-word _steering s)
     ;; int32 _enc_val
       (write-long _enc_val s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _steering
     (setq _steering (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; int32 _enc_val
     (setq _enc_val (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get race::enc_values :md5sum-) "261c425b19fc3c9973e23fc0e2a83f33")
(setf (get race::enc_values :datatype-) "race/enc_values")
(setf (get race::enc_values :definition-)
      "int16 steering
int32 enc_val
")



(provide :race/enc_values "261c425b19fc3c9973e23fc0e2a83f33")


