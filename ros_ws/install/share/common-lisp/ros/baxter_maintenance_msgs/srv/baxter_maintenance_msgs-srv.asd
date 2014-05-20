
(cl:in-package :asdf)

(defsystem "baxter_maintenance_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RMCores" :depends-on ("_package_RMCores"))
    (:file "_package_RMCores" :depends-on ("_package"))
    (:file "LSCores" :depends-on ("_package_LSCores"))
    (:file "_package_LSCores" :depends-on ("_package"))
  ))