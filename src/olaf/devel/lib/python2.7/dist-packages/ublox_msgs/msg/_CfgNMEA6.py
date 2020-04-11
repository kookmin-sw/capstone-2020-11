# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from ublox_msgs/CfgNMEA6.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class CfgNMEA6(genpy.Message):
  _md5sum = "9ffbd21c832ce4472519430326bb44e3"
  _type = "ublox_msgs/CfgNMEA6"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """# CFG-NMEA (0x06 0x17)
# NMEA protocol configuration
#
# Set/Get the NMEA protocol configuration. See section NMEA Protocol 
# Configuration for a detailed description of the configuration effects on 
# NMEA output
#
# Supported on u-blox 6 from firmware version 6.00 up to version 7.03.
#

uint8 CLASS_ID = 6
uint8 MESSAGE_ID = 23 

uint8 filter                  # filter flags
uint8 FILTER_POS = 1          # Disable position filtering
uint8 FILTER_MSK_POS = 2      # Disable masked position filtering
uint8 FILTER_TIME = 4         # Disable time filtering
uint8 FILTER_DATE = 8         # Disable date filtering
uint8 FILTER_SBAS_FILT = 16   # Enable SBAS filtering
uint8 FILTER_TRACK = 32       # Disable track filtering

uint8 version             # NMEA version
uint8 NMEA_VERSION_2_3 = 35     # Version 2.3
uint8 NMEA_VERSION_2_1 = 33     # Version 2.1

uint8 numSV                   # Maximum Number of SVs to report in NMEA
                              # protocol.
                              # This does not affect the receiver's operation.
                              # It only limits the number of SVs reported in
                              # NMEA mode (this might be needed with older
                              # mapping applications which only support 8- or
                              # 12-channel receivers)

uint8 flags                   # flags
uint8 FLAGS_COMPAT = 1          # enable compatibility mode.
                                # This might be needed for certain applications  
                                # when customer's NMEA parser expects a fixed 
                                # number of  digits in position coordinates
uint8 FLAGS_CONSIDER = 2        # enable considering mode
"""
  # Pseudo-constants
  CLASS_ID = 6
  MESSAGE_ID = 23
  FILTER_POS = 1
  FILTER_MSK_POS = 2
  FILTER_TIME = 4
  FILTER_DATE = 8
  FILTER_SBAS_FILT = 16
  FILTER_TRACK = 32
  NMEA_VERSION_2_3 = 35
  NMEA_VERSION_2_1 = 33
  FLAGS_COMPAT = 1
  FLAGS_CONSIDER = 2

  __slots__ = ['filter','version','numSV','flags']
  _slot_types = ['uint8','uint8','uint8','uint8']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       filter,version,numSV,flags

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(CfgNMEA6, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.filter is None:
        self.filter = 0
      if self.version is None:
        self.version = 0
      if self.numSV is None:
        self.numSV = 0
      if self.flags is None:
        self.flags = 0
    else:
      self.filter = 0
      self.version = 0
      self.numSV = 0
      self.flags = 0

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_4B().pack(_x.filter, _x.version, _x.numSV, _x.flags))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.filter, _x.version, _x.numSV, _x.flags,) = _get_struct_4B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_4B().pack(_x.filter, _x.version, _x.numSV, _x.flags))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      end = 0
      _x = self
      start = end
      end += 4
      (_x.filter, _x.version, _x.numSV, _x.flags,) = _get_struct_4B().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_4B = None
def _get_struct_4B():
    global _struct_4B
    if _struct_4B is None:
        _struct_4B = struct.Struct("<4B")
    return _struct_4B