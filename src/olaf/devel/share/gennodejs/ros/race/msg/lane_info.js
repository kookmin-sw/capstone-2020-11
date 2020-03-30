// Auto-generated. Do not edit!

// (in-package race.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class lane_info {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.left_slope = null;
      this.right_slope = null;
      this.is_left = null;
      this.is_right = null;
      this.bias_from_left = null;
      this.bias_from_right = null;
    }
    else {
      if (initObj.hasOwnProperty('left_slope')) {
        this.left_slope = initObj.left_slope
      }
      else {
        this.left_slope = 0.0;
      }
      if (initObj.hasOwnProperty('right_slope')) {
        this.right_slope = initObj.right_slope
      }
      else {
        this.right_slope = 0.0;
      }
      if (initObj.hasOwnProperty('is_left')) {
        this.is_left = initObj.is_left
      }
      else {
        this.is_left = false;
      }
      if (initObj.hasOwnProperty('is_right')) {
        this.is_right = initObj.is_right
      }
      else {
        this.is_right = false;
      }
      if (initObj.hasOwnProperty('bias_from_left')) {
        this.bias_from_left = initObj.bias_from_left
      }
      else {
        this.bias_from_left = 0.0;
      }
      if (initObj.hasOwnProperty('bias_from_right')) {
        this.bias_from_right = initObj.bias_from_right
      }
      else {
        this.bias_from_right = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type lane_info
    // Serialize message field [left_slope]
    bufferOffset = _serializer.float32(obj.left_slope, buffer, bufferOffset);
    // Serialize message field [right_slope]
    bufferOffset = _serializer.float32(obj.right_slope, buffer, bufferOffset);
    // Serialize message field [is_left]
    bufferOffset = _serializer.bool(obj.is_left, buffer, bufferOffset);
    // Serialize message field [is_right]
    bufferOffset = _serializer.bool(obj.is_right, buffer, bufferOffset);
    // Serialize message field [bias_from_left]
    bufferOffset = _serializer.float32(obj.bias_from_left, buffer, bufferOffset);
    // Serialize message field [bias_from_right]
    bufferOffset = _serializer.float32(obj.bias_from_right, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type lane_info
    let len;
    let data = new lane_info(null);
    // Deserialize message field [left_slope]
    data.left_slope = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [right_slope]
    data.right_slope = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [is_left]
    data.is_left = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [is_right]
    data.is_right = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [bias_from_left]
    data.bias_from_left = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bias_from_right]
    data.bias_from_right = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 18;
  }

  static datatype() {
    // Returns string type for a message object
    return 'race/lane_info';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e5107cf654a976d33dc89cb06bf8be8e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 left_slope
    float32 right_slope
    
    bool is_left
    bool is_right
    
    float32 bias_from_left
    float32 bias_from_right
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new lane_info(null);
    if (msg.left_slope !== undefined) {
      resolved.left_slope = msg.left_slope;
    }
    else {
      resolved.left_slope = 0.0
    }

    if (msg.right_slope !== undefined) {
      resolved.right_slope = msg.right_slope;
    }
    else {
      resolved.right_slope = 0.0
    }

    if (msg.is_left !== undefined) {
      resolved.is_left = msg.is_left;
    }
    else {
      resolved.is_left = false
    }

    if (msg.is_right !== undefined) {
      resolved.is_right = msg.is_right;
    }
    else {
      resolved.is_right = false
    }

    if (msg.bias_from_left !== undefined) {
      resolved.bias_from_left = msg.bias_from_left;
    }
    else {
      resolved.bias_from_left = 0.0
    }

    if (msg.bias_from_right !== undefined) {
      resolved.bias_from_right = msg.bias_from_right;
    }
    else {
      resolved.bias_from_right = 0.0
    }

    return resolved;
    }
};

module.exports = lane_info;
