
(cl:in-package :asdf)

(defsystem "obstacle_detector-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CircleObstacle" :depends-on ("_package_CircleObstacle"))
    (:file "_package_CircleObstacle" :depends-on ("_package"))
    (:file "Obstacles" :depends-on ("_package_Obstacles"))
    (:file "_package_Obstacles" :depends-on ("_package"))
    (:file "SegmentObstacle" :depends-on ("_package_SegmentObstacle"))
    (:file "_package_SegmentObstacle" :depends-on ("_package"))
  ))