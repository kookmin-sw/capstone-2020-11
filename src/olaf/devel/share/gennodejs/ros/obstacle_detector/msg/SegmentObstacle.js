// Auto-generated. Do not edit!

// (in-package obstacle_detector.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class SegmentObstacle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.first_point = null;
      this.last_point = null;
    }
    else {
      if (initObj.hasOwnProperty('first_point')) {
        this.first_point = initObj.first_point
      }
      else {
        this.first_point = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('last_point')) {
        this.last_point = initObj.last_point
      }
      else {
        this.last_point = new geometry_msgs.msg.Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SegmentObstacle
    // Serialize message field [first_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.first_point, buffer, bufferOffset);
    // Serialize message field [last_point]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.last_point, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SegmentObstacle
    let len;
    let data = new SegmentObstacle(null);
    // Deserialize message field [first_point]
    data.first_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [last_point]
    data.last_point = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'obstacle_detector/SegmentObstacle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '37ecbf7e1053bae89f0770466b37c3c3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Point first_point  # First point of the segment [m]
    geometry_msgs/Point last_point   # Last point of the segment [m]
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SegmentObstacle(null);
    if (msg.first_point !== undefined) {
      resolved.first_point = geometry_msgs.msg.Point.Resolve(msg.first_point)
    }
    else {
      resolved.first_point = new geometry_msgs.msg.Point()
    }

    if (msg.last_point !== undefined) {
      resolved.last_point = geometry_msgs.msg.Point.Resolve(msg.last_point)
    }
    else {
      resolved.last_point = new geometry_msgs.msg.Point()
    }

    return resolved;
    }
};

module.exports = SegmentObstacle;
