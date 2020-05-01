# EC500_TriangleProject

## Usage

### CyberWalk iOS version

```
git clone https://github.com/h4x0rMadness/EC500_Triangle.git
```
unzip this repo folder and go into /CyberWalk sub folder in it.

```
cd CyberWalk
```

open the CyberWalk.xcodeproj in Xcode

<p align="center">
    <img src="https://github.com/h4x0rMadness/EC500_Triangle/blob/master/pics/icon.jpg" width="20%"/>
</p>

build and run it on your iOS device (won't work for simulator)

## Introduction to the Game:

We would like to explore the possiblity combining **Augmented Reality** (AR) and **Object Detection** technologies and present them with a game, which encourages players to go outside (certainly not now, stay home!), explore certain **targets** as symbols to acquire **materials** from. 

With those materials (e.g. metal, wood and so on), players are able to upgrade their **reward**, which is a product displayed in AR way (which is really cool to show friends, right?) and owned by each user. For example, with upgrading, you can upgrade your little wood house into a huge spectacular castle, also we hope we have enough time to finish social functions, which allows people to check on their friends' rewards.


# Final Product 

<p align="center">
    <img src="https://github.com/h4x0rMadness/EC500_Triangle/blob/master/pics/demo.gif" width="40%"/>
</p>
<p align="center">
    This is iOS Version
</p>


## User Story:
- As a **game player**, I want to combine online games with real life. I not only can play games on the phone, but also can take physical activities outside.
- As a **sponsor**, I want to display my product in game to attract more customers.




## Minimum Valuable Product: 

- **Object Detection**

  - Recognize the objects and classify them by labeling. For example, if we use a camera to scan the wooden chair, and it will return what it is and label it with wood.

- **Profile page**
  - This is a visualization page for users to see what resources and the amount they have collected. Besides, they can use these resources to build their own architecture.

- **AR**
  - When users start their camera and point to the open area, the architecture will display here by AR.

## Tech: 
- Object Detection
- Augmented Reality, Unity
- Swift, C#, Python
- AWS


# Sprint 1: 

## Taskboard:

- Determine details of the game 
- Display basic (level 1) reward architecture
- Connect Object Detection
- Have at least one sample conversion from acquired object to materials
- \*Login/logout

# Sprint 2:

## Taskboard:

- Deployment on iOS
- Other pages in app
- Connect with Object Detection 
- \*Server Configuration
