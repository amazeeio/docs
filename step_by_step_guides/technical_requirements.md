# Technical Requirements

## Git

Git is a version control system that is widely used for software development and other version control tasks. To deploy code to amazee.io it is necessary to use git.

**Further read: [Set Up Git](https://help.github.com/articles/set-up-git/)**

## Git Repositories

amazee.io needs access to your Git repository in order to deploy the code. There are some widely used cloud Git repository services like [GitHub](http://github.com), [BitBucket](http://bitbucket.org) and [Gitlab](https://gitlab.com). amazee.io has currently sites hosted which uses one of these.

amazee.io is capable of using your own hosted Git Repository or on-premises versions of the mentioned Cloud Git repositories. Please check with support@amazee.io to connect amazee.io to these Git Repositories (tldr; If you can send us a Webhook on each push, it's all perfect)


## Secure Socket Shell (SSH)

To keep our systems secure and access easily revocable we don't set static passwords on any amazee.io systems. Every user access is tied to a personal SSH Key.

SSH consists of two Keys:

- A **private key** which must be kept secret by the user at all times
- A **public key** stored on the amazee.io systems, that authenticates each user individually

**Further read: [Generating a new SSH key](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)**
