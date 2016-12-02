# Grant amazee.io access to your git repository

Amazee.io needs **read access** on the git repositories which need to be deployed. Also you need to setup a **Webhook** to inform Amazee.io about repository pushes. To support you in getting this permissions aligned please follow following guide:

<!-- toc -->

## Github - Code Access
1. Navigate to the Github Repository which will be deployed to amazee.io
  ![](giving-access/github1.png)

2. Navigate to `Settings`
  ![](giving-access/github2.png)

3. On the Settings page navigate to `Collaborators`
  ![](giving-access/github3.png)

4. Grant `amazeeio-deploy` access to the repository
  ![](giving-access/github4.png)

5. Afterwards it will take several minutes until the invitation for the repository has been accepted
  ![](giving-access/github5.png)

6. If everything is okay you'll see that the `Copy invite link` button has disappeared now you're good to start deploying to amazee.io
![](giving-access/github6.png)

7. Yay! amazee.io can now access your sourcecode. You are not quite done yet. Read on and add also the Webhook to the repository.


## Github - Webhook
You need to add a webhook to your Github repository to inform amazee.io that code has been pushed.

1. Click on `Webhooks`
![](giving-access/github_webhook1.png)

2. Click `Add webhook`
![](giving-access/github_webhook2.png)

3. Add the Payload URL : `https://deploy.amazeeio.cloud/github-webhook/` and click `Add webhook`
![](giving-access/github_webhook3.png)

4. Check that there is a green checkmark next to your newly created webhook. This tells you that everything works as planned and the creation of the webhook has been successful.
![](giving-access/github_webhook4.png)

## Gitlab - Code Access
1. Navigate to the Gitlab Repository which will be deployed to amazee.io
  ![](giving-access/gitlab1.png)

2. On the top right corner slick on the wrench icon and then `Members`
  ![](giving-access/gitlab2.png)

3. Search for the user `amazeeio-deploy`
  ![](giving-access/gitlab4.png)

4. Select user `amazeeio-deploy` and grant `reporter` privileges
  ![](giving-access/gitlab5.png)

5. Verify that the user has been added to your git repository. you're good to go ahead and start you first deployment
  ![](giving-access/gitlab6.png)

## Bitbucket - Code Access
1. Navigate to the Bitbucket Repository which will be deployed to Amazee.io
  ![](giving-access/bitbucket1.png)

2. On the left side click on `Settings`
  ![](giving-access/bitbucket2.png)

3. Navigate to `Access management`
![](giving-access/bitbucket3.png)

4. Under Users add the user `amazeeio-deploy` and add `read` permission for that user
![](giving-access/bitbucket4.png)

5. Afterwards you should see the User in the List with the appropriate access permission
![](giving-access/bitbucket5.png)

6. Yay! amazee.io can now access your sourcecode. You are not quite done yet. Read on and add also the Webhook to the repository.

## Bitbucket - Webhook
You need to add a webhook to your Bitbucket repository to inform amazee.io that code has been pushed.

1. Click on Webhooks
![](giving-access/bitbucket_webhook1.png)
2. Click on `Add Webhook`
![](giving-access/bitbucket_webhook2.png)
3. Choose a Title and add the Webhook url `https://deploy.amazeeio.cloud/bitbucket-hook/`
You don't need to change SSL/TLS or Triggers default values are fine.
When you're done click `Save`
![](giving-access/bitbucket_webhook3.png)
4. You get back to the overview where you can see the newly created webhook.
![](giving-access/bitbucket_webhook4.png)


## Other / Generic Git Hosting
You're using a private installation of GitLab, AWS Git repositories or something else we didn't come up with yet?

No worries, we only need read access on the repository so we will provide you with a SSH Public Key which then needs to be granted access.

Feel free to get in touch with us on slack or via [support@amazee.io](mailto:support@amazee.io) and we help you getting the repository access in line.
