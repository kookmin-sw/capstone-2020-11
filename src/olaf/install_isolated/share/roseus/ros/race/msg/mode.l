;; Auto-generated. Do not edit!


(when (boundp 'race::mode)
  (if (not (find-package "RACE"))
    (make-package "RACE"))
  (shadow 'mode (find-package "RACE")))
(unless (find-package "RACE::MODE")
  (make-package "RACE::MODE"))

(in-package "ROS")
;;//! \htmlinclude mode.msg.html


(defclass race::mode
  :super ros::object
  :slots (_status _mode _spd_limit ))

(defmethod race::mode
  (:init
   (&key
    ((:status __status) 0)
    ((:mode __mode) 0)
    ((:spd_limit __spd_limit) 0)
    )
   (send-super :init)
   (setq _status (round __status))
   (setq _mode (round __mode))
   (setq _spd_limit (round __spd_limit))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:spd_limit
   (&optional __spd_limit)
   (if __spd_limit (setq _spd_limit __spd_limit)) _spd_limit)
  (:serialization-length
   ()
   (+
    ;; int8 _status
    1
    ;; int8 _mode
    1
    ;; int8 _spd_limit
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _status
       (write-byte _status s)
     ;; int8 _mode
       (write-byte _mode s)
     ;; int8 _spd_limit
       (write-byte _spd_limit s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _status
     (setq _status (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _status 127) (setq _status (- _status 256)))
   ;; int8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _mode 127) (setq _mode (- _mode 256)))
   ;; int8 _spd_limit
     (setq _spd_limit (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _spd_limit 127) (setq _spd_limit (- _spd_limit 256)))
   ;;
   self)
  )

(setf (get race::mode :md5sum-) "4d86579415141bf5b868c51e2a521f14")
(setf (get race::mode :datatype-) "race/mode")
(setf (get race::mode :definition-)
      "int8 status
int8 mode
int8 spd_limit

")



(provide :race/mode "4d86579415141bf5b868c51e2a521f14")


