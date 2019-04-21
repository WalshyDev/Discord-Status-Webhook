# GitHub Action for Discord webhook sending
This GitHub action can be used to send a build status to a Discord webhook

## Usage
Set the environment variable `WEBHOOK_URL` to your Discord webhook.

### Building
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "building"
  secrets = ["WEBHOOK_URL"]
}
```

### Success
Sends embed
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "success"
  secrets = ["WEBHOOK_URL"]
}
```

### Fail
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "failure"
  secrets = ["WEBHOOK_URL"]
}
```

### Custom Status
Sends an embed with color code #00c8ff and with the title "Deployed Maven Artifact"
```
action "Send Deployed Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "custom 51455 Deployed"
  secrets = ["WEBHOOK_URL"]
}
```

## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).