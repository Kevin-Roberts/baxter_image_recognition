"""autogenerated by genpy from baxter_core_msgs/AssemblyStates.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import baxter_core_msgs.msg

class AssemblyStates(genpy.Message):
  _md5sum = "75940630f2f408c2b7f433e9ceb232dc"
  _type = "baxter_core_msgs/AssemblyStates"
  _has_header = False #flag to mark the presence of a Header object
  _full_text = """string[] names
AssemblyState[] states
================================================================================
MSG: baxter_core_msgs/AssemblyState
bool enabled             # true if enabled
bool stopped             # true if stopped -- e-stop asserted
bool error               # true if a component of the assembly has an error
#
# The following are specific to the robot top-level assembly:
uint8  estop_button      # One of the following:
  uint8   ESTOP_BUTTON_UNPRESSED = 0   # Robot is not stopped and button is not pressed
  uint8   ESTOP_BUTTON_PRESSED   = 1
  uint8   ESTOP_BUTTON_UNKNOWN   = 2   # STATE_UNKNOWN when estop was asserted by a non-user source
  uint8   ESTOP_BUTTON_RELEASED  = 3   # Was pressed, is now known to be released, but robot is still stopped.
#
uint8  estop_source      # If stopped is true, the source of the e-stop.  One of the following:
  uint8  ESTOP_SOURCE_NONE      = 0   # e-stop is not asserted
  uint8  ESTOP_SOURCE_USER      = 1   # e-stop source is user input (the red button)
  uint8  ESTOP_SOURCE_UNKNOWN   = 2   # e-stop source is unknown
  uint8  ESTOP_SOURCE_FAULT     = 3   # MotorController asserted e-stop in response to a joint fault
  uint8  ESTOP_SOURCE_BRAIN     = 4   # MotorController asserted e-stop in response to a lapse of the brain heartbeat

"""
  __slots__ = ['names','states']
  _slot_types = ['string[]','baxter_core_msgs/AssemblyState[]']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       names,states

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(AssemblyStates, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.names is None:
        self.names = []
      if self.states is None:
        self.states = []
    else:
      self.names = []
      self.states = []

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
      length = len(self.names)
      buff.write(_struct_I.pack(length))
      for val1 in self.names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.states)
      buff.write(_struct_I.pack(length))
      for val1 in self.states:
        _x = val1
        buff.write(_struct_5B.pack(_x.enabled, _x.stopped, _x.error, _x.estop_button, _x.estop_source))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.states is None:
        self.states = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.states = []
      for i in range(0, length):
        val1 = baxter_core_msgs.msg.AssemblyState()
        _x = val1
        start = end
        end += 5
        (_x.enabled, _x.stopped, _x.error, _x.estop_button, _x.estop_source,) = _struct_5B.unpack(str[start:end])
        val1.enabled = bool(val1.enabled)
        val1.stopped = bool(val1.stopped)
        val1.error = bool(val1.error)
        self.states.append(val1)
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
      length = len(self.names)
      buff.write(_struct_I.pack(length))
      for val1 in self.names:
        length = len(val1)
        if python3 or type(val1) == unicode:
          val1 = val1.encode('utf-8')
          length = len(val1)
        buff.write(struct.pack('<I%ss'%length, length, val1))
      length = len(self.states)
      buff.write(_struct_I.pack(length))
      for val1 in self.states:
        _x = val1
        buff.write(_struct_5B.pack(_x.enabled, _x.stopped, _x.error, _x.estop_button, _x.estop_source))
    except struct.error as se: self._check_types(se)
    except TypeError as te: self._check_types(te)

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.states is None:
        self.states = None
      end = 0
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.names = []
      for i in range(0, length):
        start = end
        end += 4
        (length,) = _struct_I.unpack(str[start:end])
        start = end
        end += length
        if python3:
          val1 = str[start:end].decode('utf-8')
        else:
          val1 = str[start:end]
        self.names.append(val1)
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      self.states = []
      for i in range(0, length):
        val1 = baxter_core_msgs.msg.AssemblyState()
        _x = val1
        start = end
        end += 5
        (_x.enabled, _x.stopped, _x.error, _x.estop_button, _x.estop_source,) = _struct_5B.unpack(str[start:end])
        val1.enabled = bool(val1.enabled)
        val1.stopped = bool(val1.stopped)
        val1.error = bool(val1.error)
        self.states.append(val1)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_5B = struct.Struct("<5B")
