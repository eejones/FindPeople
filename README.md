FindPeople
=========

This program is meant to help people connect when quickly putting together independent film projects, shorts, etc

Functionality
------------
FindPeople is a website that allows users to choose their interests as well as add pictures and videos that someone looking to put together a small independent film would use to find people to staff their project. Users have secure passwords and can easily add and maintain pictures videos and interests on this site. Users looking for people can then easily filter and find people to staff their projects.

User Interface for Members
------------

To add pictures, interests and videos, users will see a straightforward screen when creating a new profile:
![FindPeople signupform](/app/assets/images/signupform.png)

Users can also add and edit after creating their profile.
Before adding a video:
![FindPeople prevideoentry](/app/assets/images/prevideoentry.png)

After adding a video:
![FindPeople postvideoentry](/app/assets/images/postvideoentry.png)

Views also change depending upon whether a user is signed in:

Signed in:
![FindPeople signedindropdown](/app/assets/images/signedindropdown.png)

Signed out:
![FindPeople Notsignedin](/app/assets/images/Notsignedin.png)

User Interface for Film Producers
------------
Members can be found through filtering for specific criteria. Multiple filters can be applied at once.

Before filtering:
![FindPeople indexbeforefilter](/app/assets/images/indexbeforefilter.png)

After filtering:
![FindPeople indexafterfilter](/app/assets/images/indexafterfilter.png)

Users will also notice that there are default avatars if users haven't added them.

There is also a sidebar that can be configured and will expand/contract from hovering:
![FindPeople expandsidebar](/app/assets/images/expandsidebar.png)

Users can also show their location and find local people with similar interests in their area, sorting by the other members' distance from the user:
![FindPeople mapsandlocations](/app/assets/images/mapsandlocations.png)

Users can find out how far other users are when searching by hovering over their locations:
![FindPeople hoverfordistance](/app/assets/images/hoverfordistance.png)

Additional Setup 
------------
To add videos , functionality from the embed_logic gem is used to easily convert normal urls to to their embedding code:

Adding embed_logic:

```ruby
gem "embed_logic"
```

This allows users to easily embed videos:
![FindPeople withvideo](/app/assets/images/withvideo.png)
