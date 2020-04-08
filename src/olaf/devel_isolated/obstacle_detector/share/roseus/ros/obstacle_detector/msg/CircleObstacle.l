;; Auto-generated. Do not edit!


(when (boundp 'obstacle_detector::CircleObstacle)
  (if (not (find-package "OBSTACLE_DETECTOR"))
    (make-package "OBSTACLE_DETECTOR"))
  (shadow 'CircleObstacle (find-package "OBSTACLE_DETECTOR")))
(unless (find-package "OBSTACLE_DETECTOR::CIRCLEOBSTACLE")
  (make-package "OBSTACLE_DETECTOR::CIRCLEOBSTACLE"))

(in-package "ROS")
;;//! \htmlinclude CircleObstacle.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass obstacle_detector::CircleObstacle
  :super ros::object
  :slots (_center _velocity _radius _true_radius ))

(defmethod obstacle_detector::CircleObstacle
  (:init
   (&key
    ((:center __center) (instance geometry_msgs::Point :init))
    ((:velocity __velocity) (instance geometry_msgs::Vector3 :init))
    ((:radius __radius) 0.0)
    ((:true_radius __true_radius) 0.0)
    )
   (send-super :init)
   (setq _center __center)
   (setq _velocity __velocity)
   (setq _radius (float __radius))
   (setq _true_radius (float __true_radius))
   self)
  (:center
   (&rest __center)
   (if (keywordp (car __center))
       (send* _center __center)
     (progn
       (if __center (setq _center (car __center)))
       _center)))
  (:velocity
   (&rest __velocity)
   (if (keywordp (car __velocity))
       (send* _velocity __velocity)
     (progn
       (if __velocity (setq _velocity (car __velocity)))
       _velocity)))
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:true_radius
   (&optional __true_radius)
   (if __true_radius (setq _true_radius __true_radius)) _true_radius)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Point _center
    (send _center :serialization-length)
    ;; geometry_msgs/Vector3 _velocity
    (send _velocity :serialization-length)
    ;; float64 _radius
    8
    ;; float64 _true_radius
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Point _center
       (send _center :serialize s)
     ;; geometry_msgs/Vector3 _velocity
       (send _velocity :serialize s)
     ;; float64 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _true_radius
       (sys::poke _true_radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Point _center
     (send _center :deserialize buf ptr-) (incf ptr- (send _center :serialization-length))
   ;; geometry_msgs/Vector3 _velocity
     (send _velocity :deserialize buf ptr-) (incf ptr- (send _velocity :serialization-length))
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _true_radius
     (setq _true_radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get obstacle_detector::CircleObstacle :md5sum-) "d23cb7e768ed09971078d4cccc3808a9")
(setf (get obstacle_detector::CircleObstacle :datatype-) "obstacle_detector/CircleObstacle")
(setf (get obstacle_detector::CircleObstacle :definition-)
      "geometry_msgs/Point center      # Central point [m]
geometry_msgs/Vector3 velocity  # Linear velocity [m/s]
float64 radius                  # Radius with added margin [m]
float64 true_radius             # True measured radius [m]

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
")



(provide :obstacle_detector/CircleObstacle "d23cb7e768ed09971078d4cccc3808a9")


