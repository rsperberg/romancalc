# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
# require 'bundler'
# require 'motion-support/concern'
# Bundler.require

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.icons = ['icon_iphone.png','icon_iphone_retina.png']
  app.prerendered_icon = true
  app.name = 'romancalc'
  app.device_family = [:iphone]
  app.identifier="ws.spress.romancalc"
  app.interface_orientations = [:portrait]
  app.sdk_version="6.1"
  app.deployment_target = "6.1"
  app.detect_dependencies = false
  app.version = "0.5"
#  following two lines are for version to run on ipad running version 5.1.1
#  app.sdk_version="5.1"
#  app.deployment_target = "5.1"
end

# Track and specify files and their mutual dependencies within the :motion Bundler group
# MotionBundler.setup
