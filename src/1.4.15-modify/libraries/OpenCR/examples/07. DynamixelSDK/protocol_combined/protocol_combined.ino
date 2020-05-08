/*******************************************************************************
* Copyright (c) 2016, ROBOTIS CO., LTD.
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*
* * Redistributions of source code must retain the above copyright notice, this
*   list of conditions and the following disclaimer.
*
* * Redistributions in binary form must reproduce the above copyright notice,
*   this list of conditions and the following disclaimer in the documentation
*   and/or other materials provided with the distribution.
*
* * Neither the name of ROBOTIS nor the names of its
*   contributors may be used to endorse or promote products derived from
*   this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
* AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
* FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
* DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

/* Author: Ryu Woon Jung (Leon) */

//
// *********     Protocol Combined Example      *********
//
//
// Available Dynamixel model on this example : All models using Protocol 1.0 and 2.0
// This example is tested with a Dynamixel MX-28, a Dynamixel PRO 54-200 and an USB2DYNAMIXEL
// Be sure that properties of Dynamixel MX and PRO are already set as %% MX - ID : 1 / Baudnum : 34 (Baudrate : 57600) , PRO - ID : 1 / Baudnum : 1 (Baudrate : 57600)
//

// Be aware that:
// This example configures two different control tables (especially, if it uses Dynamixel and Dynamixel PRO). It may modify critical Dynamixel parameter on the control table, if Dynamixels have wrong ID.
//

#include <DynamixelSDK.h>

// Control table address for Dynamixel MX
#define ADDR_MX_TORQUE_ENABLE           24                  // Control table address is different in Dynamixel model
#define ADDR_MX_GOAL_POSITION           30
#define ADDR_MX_PRESENT_POSITION        36

// Control table address for Dynamixel PRO
#define ADDR_PRO_TORQUE_ENABLE          562
#define ADDR_PRO_GOAL_POSITION          596
#define ADDR_PRO_PRESENT_POSITION       611

// Protocol version
#define PROTOCOL_VERSION1               1.0                 // See which protocol version is used in the Dynamixel
#define PROTOCOL_VERSION2               2.0

// Default setting
#define DXL1_ID                         1                   // Dynamixel#1 ID: 1
#define DXL2_ID                         2                   // Dynamixel#2 ID: 2
#define BAUDRATE                        57600
#define DEVICENAME                      "OpenCR_DXL_Port"   // This definition only has a symbolic meaning and does not affect to any functionality

#define TORQUE_ENABLE                   1                   // Value for enabling the torque
#define TORQUE_DISABLE                  0                   // Value for disabling the torque
#define DXL1_MINIMUM_POSITION_VALUE     100                 // Dynamixel will rotate between this value
#define DXL1_MAXIMUM_POSITION_VALUE     4000                // and this value (note that the Dynamixel would not move when the position value is out of movable range. Check e-manual about the range of the Dynamixel you use.)
#define DXL2_MINIMUM_POSITION_VALUE     -150000
#define DXL2_MAXIMUM_POSITION_VALUE     150000
#define DXL1_MOVING_STATUS_THRESHOLD    10                  // Dynamixel MX moving status threshold
#define DXL2_MOVING_STATUS_THRESHOLD    20                  // Dynamixel PRO moving status threshold

#define ESC_ASCII_VALUE                 0x1b

#define CMD_SERIAL                      Serial

int getch()
{
  while(1)
  {
    if( CMD_SERIAL.available() > 0 )
    {
      break;
    }
  }

  return CMD_SERIAL.read();
}

int kbhit(void)
{
  return CMD_SERIAL.available();
}

void setup()
{
  Serial.begin(115200);
  while(!Serial);

  Serial.println("Start..");

  // Initialize PortHandler instance
  // Set the port path
  // Get methods and members of PortHandlerLinux or PortHandlerWindows
  dynamixel::PortHandler *portHandler = dynamixel::PortHandler::getPortHandler(DEVICENAME);

  // Initialize PacketHandler instance
  // Set the protocol version
  // Get methods and members of Protocol1PacketHandler or Protocol2PacketHandler
  dynamixel::PacketHandler *packetHandler1 = dynamixel::PacketHandler::getPacketHandler(PROTOCOL_VERSION1);
  dynamixel::PacketHandler *packetHandler2 = dynamixel::PacketHandler::getPacketHandler(PROTOCOL_VERSION2);

  int index = 0;
  int dxl_comm_result = COMM_TX_FAIL;       // Communication result
  int dxl1_goal_position[2] = {DXL1_MINIMUM_POSITION_VALUE, DXL1_MAXIMUM_POSITION_VALUE};     // Goal position of Dynamixel MX
  int dxl2_goal_position[2] = {DXL2_MINIMUM_POSITION_VALUE, DXL2_MAXIMUM_POSITION_VALUE};     // Goal position of Dynamixel PRO

  uint8_t dxl_error = 0;                    // Dynamixel error
  uint16_t dxl1_present_position = 0;       // Present position of Dynamixel MX
  int32_t dxl2_present_position = 0;        // Present position of Dynamixel PRO

  // Open port
  if (portHandler->openPort())
  {
    Serial.print("Succeeded to open the port!\n");
  }
  else
  {
    Serial.print("Failed to open the port!\n");
    return;
  }

  // Set port baudrate
  if (portHandler->setBaudRate(BAUDRATE))
  {
    Serial.print("Succeeded to change the baudrate!\n");
  }
  else
  {
    Serial.print("Failed to change the baudrate!\n");
    return;
  }

  // Enable Dynamixel#1 torque
  dxl_comm_result = packetHandler1->write1ByteTxRx(portHandler, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_ENABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    Serial.print(packetHandler1->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    Serial.print(packetHandler1->getRxPacketError(dxl_error));
  }
  else
  {
    Serial.print("Dynamixel#1 has been successfully connected \n");
  }
  // Enable Dynamixel#2 torque
  dxl_comm_result = packetHandler2->write1ByteTxRx(portHandler, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_ENABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    Serial.print(packetHandler2->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    Serial.print(packetHandler2->getRxPacketError(dxl_error));
  }
  else
  {
    Serial.print("Dynamixel#2 has been successfully connected \n");
  }

  while(1)
  {
    Serial.print("Press any key to continue! (or press q to quit!)\n");
    if (getch() == 'q')
      break;

    // Write Dynamixel#1 goal position
    dxl_comm_result = packetHandler1->write2ByteTxRx(portHandler, DXL1_ID, ADDR_MX_GOAL_POSITION, dxl1_goal_position[index], &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS)
    {
      Serial.print(packetHandler1->getTxRxResult(dxl_comm_result));
    }
    else if (dxl_error != 0)
    {
      Serial.print(packetHandler1->getRxPacketError(dxl_error));
    }

    // Write Dynamixel#2 goal position
    dxl_comm_result = packetHandler2->write4ByteTxRx(portHandler, DXL2_ID, ADDR_PRO_GOAL_POSITION, dxl2_goal_position[index], &dxl_error);
    if (dxl_comm_result != COMM_SUCCESS)
    {
      Serial.print(packetHandler2->getTxRxResult(dxl_comm_result));
    }
    else if (dxl_error != 0)
    {
      Serial.print(packetHandler2->getRxPacketError(dxl_error));
    }

    do
    {
      // Read Dynamixel#1 present position
      dxl_comm_result = packetHandler1->read2ByteTxRx(portHandler, DXL1_ID, ADDR_MX_PRESENT_POSITION, &dxl1_present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS)
      {
        Serial.print(packetHandler1->getTxRxResult(dxl_comm_result));
      }
      else if (dxl_error != 0)
      {
        Serial.print(packetHandler1->getRxPacketError(dxl_error));
      }

      // Read Dynamixel#2 present position
      dxl_comm_result = packetHandler2->read4ByteTxRx(portHandler, DXL2_ID, ADDR_PRO_PRESENT_POSITION, (uint32_t*)&dxl2_present_position, &dxl_error);
      if (dxl_comm_result != COMM_SUCCESS)
      {
        Serial.print(packetHandler2->getTxRxResult(dxl_comm_result));
      }
      else if (dxl_error != 0)
      {
        Serial.print(packetHandler2->getRxPacketError(dxl_error));
      }

      Serial.print("[ID:"); Serial.print(DXL1_ID);
      Serial.print("] GoalPos:"); Serial.print(dxl1_goal_position[index]);
      Serial.print("  PresPos:"); Serial.print(dxl1_present_position);
      Serial.print("  [ID:"); Serial.print(DXL2_ID);
      Serial.print("] GoalPos:"); Serial.print(dxl2_goal_position[index]);
      Serial.print("  PresPos:"); Serial.print(dxl2_present_position);

    }while((abs(dxl1_goal_position[index] - dxl1_present_position) > DXL1_MOVING_STATUS_THRESHOLD) || (abs(dxl2_goal_position[index] - dxl2_present_position) > DXL2_MOVING_STATUS_THRESHOLD));

    // Change goal position
    if (index == 0)
    {
      index = 1;
    }
    else
    {
      index = 0;
    }
  }

  // Disable Dynamixel#1 Torque
  dxl_comm_result = packetHandler1->write1ByteTxRx(portHandler, DXL1_ID, ADDR_MX_TORQUE_ENABLE, TORQUE_DISABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    Serial.print(packetHandler1->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    Serial.print(packetHandler1->getRxPacketError(dxl_error));
  }

  // Disable Dynamixel#2 Torque
  dxl_comm_result = packetHandler2->write1ByteTxRx(portHandler, DXL2_ID, ADDR_PRO_TORQUE_ENABLE, TORQUE_DISABLE, &dxl_error);
  if (dxl_comm_result != COMM_SUCCESS)
  {
    Serial.print(packetHandler2->getTxRxResult(dxl_comm_result));
  }
  else if (dxl_error != 0)
  {
    Serial.print(packetHandler2->getRxPacketError(dxl_error));
  }

  // Close port
  portHandler->closePort();
}

void loop()
{
}
