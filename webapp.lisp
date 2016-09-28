;;; -*- Mode: LISP; Syntax: COMMON-LISP; Package: WEBAPP; Base: 10 -*-
;;;
;;; Copyright (C) 2012  Anthony Green <green@spindazzle.org>
;;;                         
;;; Webapp is free software; you can redistribute it and/or modify it
;;; under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; either version 3, or (at your
;;; option) any later version.
;;;
;;; Webapp is distributed in the hope that it will be useful, but
;;; WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;;; General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with Webapp; see the file COPYING3.  If not see
;;; <http://www.gnu.org/licenses/>.

;; Top level for webapp

(in-package :webapp)

;; Our server....

(defvar *hunchentoot-server* nil)

;; Start the web app.

(defun start-webapp (&rest interactive)
  "Start the web application and have the main thread sleep forever,
  unless INTERACTIVE is non-nil."
  (format t "** Starting hunchentoot on ~A~%" 80)
  (setq *hunchentoot-server* (hunchentoot:start 
			      (make-instance 'hunchentoot:easy-acceptor 
					     :port 80)))
  (if (not interactive)
      (loop
       (sleep 3000))))

(defun stop-webapp ()
  "Stop the web application."
  (hunchentoot:stop *hunchentoot-server*))

