To activate:
1. clone repo
2. create a new branch
3. serve the api, nxApi and nxCloud apps in the ocean repo
4. Run `npm run init-cloud` in this repo
5. start up your local tunnel `ngrok http -region=us -hostname=nxcloud-github-integration-test.ngrok.io 4203`
6. submit a PR to this repo
7. App link: https://github.com/settings/apps/beta-nxcloud-bot (you can enable/disable permissions here, watch payloads)
8. You then copy some of the payloads from the app and send them directly in Intellij: `functions/src/github-bots/mock-requests/GithubNxCloud.webhook.http`
