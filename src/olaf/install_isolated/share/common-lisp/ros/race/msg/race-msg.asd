
(cl:in-package :asdf)

(defsystem "race-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "drive_values" :depends-on ("_package_drive_values"))
    (:file "_package_drive_values" :depends-on ("_package"))
    (:file "enc_values" :depends-on ("_package_enc_values"))
    (:file "_package_enc_values" :depends-on ("_package"))
    (:file "lane_info" :depends-on ("_package_lane_info"))
    (:file "_package_lane_info" :depends-on ("_package"))
    (:file "mode" :depends-on ("_package_mode"))
    (:file "_package_mode" :depends-on ("_package"))
    (:file "test" :depends-on ("_package_test"))
    (:file "_package_test" :depends-on ("_package"))
  ))