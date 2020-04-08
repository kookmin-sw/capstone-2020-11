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

class enc_values {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.steering = null;
      this.enc_val = null;
    }
    else {
      if (initObj.hasOwnProperty('steering')) {
        this.steering = initObj.steering
      }
      else {
        this.steering = 0;
      }
      if (initObj.hasOwnProperty('enc_val')) {
        this.enc_val = initObj.enc_val
      }
      else {
        this.enc_val = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type enc_values
    // Serialize message field [steering]
    bufferOffset = _serializer.int16(obj.steering, buffer, bufferOffset);
    // Serialize message field [enc_val]
    bufferOffset = _serializer.int32(obj.enc_val, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type enc_values
    let len;
    let data = new enc_values(null);
    // Deserialize message field [steering]
    data.steering = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [enc_val]
    data.enc_val = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'race/enc_values';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '261c425b19fc3c9973e23fc0e2a83f33';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16 steering
    int32 enc_val
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new enc_values(null);
    if (msg.steering !== undefined) {
      resolved.steering = msg.steering;
    }
    else {
      resolved.steering = 0
    }

    if (msg.enc_val !== undefined) {
      resolved.enc_val = msg.enc_val;
    }
    else {
      resolved.enc_val = 0
    }

    return resolved;
    }
};

module.exports = enc_values;
