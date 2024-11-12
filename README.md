# **Soft Robot Kinematic Model-Based Controller**

This repository contains lab activities and exercises related to the implementation of a model-based kinematic controller for soft robots under the assumption of Piecewise Constant Curvature (PCC). The exercises aim to control soft robots composed of 1-segment and 2-segment configurations to reach specified target locations in space.

## **Overview**

### **Description**
This project implements a model-based kinematic control approach for soft robots using the PCC assumption. The lab focuses on controlling robots in a flexible environment by manipulating arcs and evaluating their position through forward kinematics and controllers.

### **Key Concepts**
- **Model-Based Kinematic Controller:** Control strategy based on mathematical models for accurately determining and controlling robot configurations.
- **Piecewise Constant Curvature (PCC) Model:** Assumes soft robots as segments with continuous curvatures for simplicity and computational modeling.
- **Multi-Segment Control:** Extends the modeling to multiple segments for more complex and precise movements.

## **Contents**

### **PCC Model and Augmented Model**
The control relies on the PCC model, utilizing transformations and mappings that dictate the in-plane and out-of-plane behavior of soft robot segments. This model also considers rotational effects for 1-segment and 2-segment cases.
