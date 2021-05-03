const String login = r'''
  mutation authLogin ($email: String!, $password: String!) {
    authLogin(email: $email, password: $password) {
      accessToken
      expiresAt
    }
  }
''';

const String currentUser = r'''
  query currentUser {
    currentUser{
    id
    }
  }
''';

const String currentUserFull = r'''
  query currentUser {
    currentUser{
    id
    fullName
    firstName
    lastName
    locations{
      name
      id
   }
    firebaseRegistrationToken
    email
    about
    onboarded
    linkedInUrl
    isPublic
    position
    specialSkills
    profilePicture{
      filename
      url
      id
    }
    company{
      id
      name
      passCount
      passesUsed
      individualSponsorshipPackagePasses{
        name
        passesAvailable
      }
      bookedEvents{
        event{
          id
          name
          location{ 
            name
             id
              }
          scheduledFrom
        }
        passCount
      }
    }
    tickets{
      id
      passCount
      event{
        id
        name
        location{
           name
        id 
        }
        scheduledFrom
      }
    }
    topics{
      name
      id
    }
    mobileNumber
  }
  }
''';
