;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detector::SegmentObstacle)
  (if (not (find-package "OBSTACLE_DETECTOR"))
    (make-package "OBSTACLE_DETECTOR"))
  (shadow 'SegmentObstacle (find-package "OBSTACLE_DETECTOR")))
(unless (find-package "OBSTACLE_DETECTOR::SEGMENTOBSTACLE")
  (make-package "OBSTACLE_DETECTOR::SEGMENTOBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude SegmentObstacle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass obstacle_detector::SegmentObstacle
  :super ros::object
  :slots (_first_point _last_point ))

(defmethod obstacle_detector::SegmentObstacle
  (:init
   (&key
    ((:first_point __first_point) (instance geometry_msgs::Point :init))
    ((:last_point __last_point) (instance geometry_msgs::Point :init))
    )
   (send-super :init)
   (setq _first_point __first_point)
   (setq _last_point __last_point)
   self)
  (:first_point
   (&rest __first_point)
   (if (keywordp (car __first_point))
       (send* _first_point __first_point)
     (progn
       (if __first_point (setq _first_point (car __first_point)))
       _first_point)))
  (:last_point
   (&rest __last_point)
   (if (keywordp (car __last_point))
       (send* _last_point __last_point)
     (progn
       (if __last_point (setq _last_point (car __last_point)))
       _last_point)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _first_point
    (send _first_point :serialization-length)
    ;; geometry_msgs/Point _last_point
    (send _last_point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _first_point
       (send _first_point :serialize s)
     ;; geometry_msgs/Point _last_point
       (send _last_point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _first_point
     (send _first_point :deserialize buf ptr-) (incf ptr- (send _first_point :serialization-length))
   ;; geometry_msgs/Point _last_point
     (send _last_point :deserialize buf ptr-) (incf ptr- (send _last_point :serialization-length))
   ;;
   self)
  )

(setf (get obstacle_detector::SegmentObstacle :md5sum-) "37ecbf7e1053bae89f0770466b37c3c3")
(setf (get obstacle_detector::SegmentObstacle :datatype-) "obstacle_detector/SegmentObstacle")
(setf (get obstacle_detector::SegmentObstacle :definition-)
      "geometry_msgs/Point first_point  # First point of the segment [m]
geometry_msgs/Point last_point   # Last point of the segment [m]

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

")



(provide :obstacle_detector/SegmentObstacle "37ecbf7e1053bae89f0770466b37c3c3")


