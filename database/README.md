- database:
  - schema: schedulebuilder
  - tables:
    - User
      - iduser
      - userName
      - pass
    -  Major
      - idmajor
      - majorName
    - Course
      - idcourse
      - courseName
      - idmajor
    - CourseTaken
      - idct
      - iduser
      - idcourse
    - Friend
      - idfriend
      - iduser1
      - iduser2