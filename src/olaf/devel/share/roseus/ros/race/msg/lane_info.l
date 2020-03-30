;; Auto-generated. Do not edit!


(when (boundp 'race::lane_info)
  (if (not (find-package "RACE"))
    (make-package "RACE"))
  (shadow 'lane_info (find-package "RACE")))
(unless (find-package "RACE::LANE_INFO")
  (make-package "RACE::LANE_INFO"))

(in-package "ROS")
;;//! \htmlinclude lane_info.msg.html


(defclass race::lane_info
  :super ros::object
  :slots (_left_slope _right_slope _is_left _is_right _bias_from_left _bias_from_right ))

(defmethod race::lane_info
  (:init
   (&key
    ((:left_slope __left_slope) 0.0)
    ((:right_slope __right_slope) 0.0)
    ((:is_left __is_left) nil)
    ((:is_right __is_right) nil)
    ((:bias_from_left __bias_from_left) 0.0)
    ((:bias_from_right __bias_from_right) 0.0)
    )
   (send-super :init)
   (setq _left_slope (float __left_slope))
   (setq _right_slope (float __right_slope))
   (setq _is_left __is_left)
   (setq _is_right __is_right)
   (setq _bias_from_left (float __bias_from_left))
   (setq _bias_from_right (float __bias_from_right))
   self)
  (:left_slope
   (&optional __left_slope)
   (if __left_slope (setq _left_slope __left_slope)) _left_slope)
  (:right_slope
   (&optional __right_slope)
   (if __right_slope (setq _right_slope __right_slope)) _right_slope)
  (:is_left
   (&optional __is_left)
   (if __is_left (setq _is_left __is_left)) _is_left)
  (:is_right
   (&optional __is_right)
   (if __is_right (setq _is_right __is_right)) _is_right)
  (:bias_from_left
   (&optional __bias_from_left)
   (if __bias_from_left (setq _bias_from_left __bias_from_left)) _bias_from_left)
  (:bias_from_right
   (&optional __bias_from_right)
   (if __bias_from_right (setq _bias_from_right __bias_from_right)) _bias_from_right)
  (:serialization-length
   ()
   (+
    ;; float32 _left_slope
    4
    ;; float32 _right_slope
    4
    ;; bool _is_left
    1
    ;; bool _is_right
    1
    ;; float32 _bias_from_left
    4
    ;; float32 _bias_from_right
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _left_slope
       (sys::poke _left_slope (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_slope
       (sys::poke _right_slope (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; bool _is_left
       (if _is_left (write-byte -1 s) (write-byte 0 s))
     ;; bool _is_right
       (if _is_right (write-byte -1 s) (write-byte 0 s))
     ;; float32 _bias_from_left
       (sys::poke _bias_from_left (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _bias_from_right
       (sys::poke _bias_from_right (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _left_slope
     (setq _left_slope (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_slope
     (setq _right_slope (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; bool _is_left
     (setq _is_left (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; bool _is_right
     (setq _is_right (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; float32 _bias_from_left
     (setq _bias_from_left (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _bias_from_right
     (setq _bias_from_right (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get race::lane_info :md5sum-) "e5107cf654a976d33dc89cb06bf8be8e")
(setf (get race::lane_info :datatype-) "race/lane_info")
(setf (get race::lane_info :definition-)
      "float32 left_slope
float32 right_slope

bool is_left
bool is_right

float32 bias_from_left
float32 bias_from_right

")



(provide :race/lane_info "e5107cf654a976d33dc89cb06bf8be8e")


