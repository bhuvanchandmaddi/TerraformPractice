## Remote state locking:
When 2 or more developers trying to work on the same terraform project. We need to take special care of state file. This cann be be pushed to version control system because other developer don't know the state of file until it is pushed to remote ann it is not ideal for CI/CD pipelines as well.

If you are working on aws, you can push the state file to s3. There is another problem with this.If 2 developers works same time then satte file will be modified which makes the satte file inconsistent. We should provide a locking mechanism.This can be provided using dynamodb table.

Full details of this lab can be found [here](https://www.linkedin.com/pulse/terraform-state-remote-storage-s3-locking-dynamodb-oramu-/?trk=pulse-article)

## Additional testing
* Clone the project to other machine(assume other user is working on the project same time)
* run terraform apply(without --auto-approve) then it will ask for the yes promt.Don't click on yes
* From the users machine, try to execute any terrafom commmand i.e terraaform plan(to dryrun terraform will contact statefile, which is already locked and with user1) or terraform apply. You will get the error.The config is locked as shown in blog
