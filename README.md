# Class Mentors

## Table of Contents
1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview
### Description
This is an IOS app designed to connect students and mentors to discuss helpful tips regarding classes, professors, interviews and more.

### App Evaluation
- **Category:** Productivity, Education.
- **Mobile:** Designed for IOS.
- **Story:** This app functions as a way to connect students and mentors using threads and messaging to discuss helpful tips about classes.
- **Market:** Students ranging from high school through college.
- **Habit:** This app can be used multiple times a day whenever help is needed such as for homework, class registration, etc.
- **Scope:** First we will have a thread board users will be able to follow and comment in. Users can also create their own threads and navigate to user profiles
to reach out and connect.

## Product-Spec
### User Stories

The following **required** functionality is completed:

- [x] User can log in & register an account.
- [x] User can create a profile containing classes taken, bio, classification, etc.
- [x] User can view posted threads
- [] Users can direct message other students and mentors
- [] Users can post on a discussion board about a class


The following **bonus** features are implemented:

- [] User can schedule meetings with other people

### Screen Archetypes
* Login
   * User can login to their account
* Register
   * User can set up profile information
* Messaging
   * User can direct message mentors and other students
* Profile
   * User can view authored threads and view personal info
* Discussion/Thread Board
   * User can view threads and create new ones

### Navigation

**Flow Navigation**
* Login Screen => Thread Board (Stream Screen)
* Thread Board (Stream Screen) => Detail Screen / Creation Screen
* Creation Screen => Stream Screen / Detail Screen
* Detail Screen => Stream Screen

**Tab Navigation**
* Discussion Board
* Profile
* Messaging

## Wireframes
<img src="https://github.com/Jagato/classs-mentors/blob/main/Wireframe.jpeg" width=1000>


## Schema
### Models
#### Thread
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | objectId      | String   | unique id for the thread (default field) |
   | author        | Pointer to User| image author |
   | image         | File     | image that user posts |
   | title         | String   | title that user writes |
   | commentsCount | Number   | number of comments that has been posted to a thread |
   | description   | String   | text description of the thread |
   | createdAt     | DateTime | date when post is created (default field) |
   | updatedAt     | DateTime | date when post is last updated (default field) |

### User
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | username      | String   | username user chooses|
   | name          | String   | actual name |
   | image         | File     | profile image  |
   | password      | String   | password |
   | email         | String   | email associated with account |
   | bio           | String   | biographic info |
   | classification| String   | year classification for user |
   | school        | String   | name of school user is attending |
   | major         | String   | user's major |
   | classList     | String List | list of classes taken |

### Networking
#### List of network requests by screen
   - Profile Screen
      - (Read/GET) Query all threads where user is author
      - (Create/POST) Create a new thread
      - (Delete) Delete existing thread
   - Create Thread Screen
      - (Create/POST) Create a new thread
   - Home Screen
      - (Read/GET) Query all threads user is following
   - Messaging Screen
      - (Read/GET) Query all recent user contacts & messages
      - (Create) New text messages
## Video Walkthrough

Here's a walkthrough of implemented user stories:
Sprint 1:

<img src='https://i.imgur.com/Aq4OM6c.gif' title='Video Walkthrough' width='' alt='Video Walkthrough' />


