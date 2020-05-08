﻿/*******************************************************************************
* Copyright 2018 ROBOTIS CO., LTD.
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*     http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*******************************************************************************/

/* Authors: Darby Lim, Hye-Jong KIM, Ryan Shim, Yong-Ho Na */

#ifndef SCARA_KINEMATICS_H_
#define SCARA_KINEMATICS_H_

#if defined(__OPENCR__)
  #include <RobotisManipulator.h>
#else
  #include <robotis_manipulator/robotis_manipulator.h>
#endif

using namespace Eigen;
using namespace robotis_manipulator;

namespace scara_kinematics
{

/*****************************************************************************
** Kinematics Solver Using CHain Rule and Geometry
*****************************************************************************/
class SolverUsingCRAndGeometry : public robotis_manipulator::Kinematics
{
private:
  void forwardKinematicsSolverUsingChainRule(Manipulator *manipulator, Name component_name);
  bool inverseKinematicsSolverUsingGeometry(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_value);

public:
  SolverUsingCRAndGeometry() {}
  virtual ~SolverUsingCRAndGeometry() {}

  virtual void setOption(const void *arg);
  virtual MatrixXd jacobian(Manipulator *manipulator, Name tool_name);
  virtual void solveForwardKinematics(Manipulator *manipulator);
  virtual bool solveInverseKinematics(Manipulator *manipulator, Name tool_name, Pose target_pose, std::vector<JointValue>* goal_joint_value);
};

} // namespace scara_kinematics

#endif // SCARA_KINEMATICS_H_
