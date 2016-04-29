# Technical Requirements

##Git
Git is a version control system that is widely used for software development and other version control tasks. To deploy code to amazee.io it's necessary to use git.

**Further read: [Set Up Git](https://help.github.com/articles/set-up-git/)**

## GitHub / BitBucket
[GitHub](http://github.com) and [BitBucket](http://bitbucket.org) are web-based Git repository hosting services. Both of them are fully compatible with our automated deployment system.

The code of your Drupal website should be stored on one of those two hosters we are working on adding more hosters (i.e. Gitlab). This means the code is under your control all the time.

##Secure Socket Shell (SSH)
To keep our systems secure and access easily revokable we don't set static passwords on any amazee.io systems. Every user access is tied to a personal SSH Key. 

SSH consists of two Keys:

- A **private key** which must be kept secret by the user at all times
- A **public key** stored on the amazee.io systems

**Further read: [Generating a new SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)**

