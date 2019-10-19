# Contributing

When contributing to this repository, please feel free to discuss the change you wish to make via issue,
email, or any other method with the [owners](https://github.com/orgs/DiscordTime/people) of this repository. Also, feel free to work on any open [issue](https://github.com/DiscordTime/sticky-sessions-ios/issues).

## Development Process

We use a adapted version of a [Gitflow Workflow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) where instead of a single master branch, we have two branches to record the history of the project. The [master](https://github.com/DiscordTime/sticky-sessions-ios/tree/master) branch stores the official release history, and the [dev](https://github.com/DiscordTime/sticky-sessions-ios/tree/dev) branch serves as an integration branch for features.

When working on a new feature you should create a new branch, which can be pushed the repository for backup/collaboration or fork the repository and push your feature branch there. But, instead of branching off of master, feature branches use dev as their parent branch. If a PR is merged into dev before your feature is completed you need to rebase your feature branch with dev. When a feature is complete, you may open a Pull Request to merge your feature branch back into dev. Features should never interact directly with master.

## Pull Request Process

1. Ensure any install or build dependencies are removed before the end of the layer when doing a 
   build and properly added to [Podfile](Podfile).
2. Update the [README](README.md) with details of changes that include new environment 
   variables, build settings and installation process.
3. You may merge the Pull Request in once you have requested review and got approved from at least one other developer.
    If you do not have permission to merge the PR, you may request the reviewer to merge it for you.
