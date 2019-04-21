# GitHub Action for Discord webhook sending
This GitHub action can be used to send a build status to a Discord webhook

## Usage
### Building
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "building"
}
```

### Success
Sends embed
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "success"
}
```

### Fail
```
action "Send Build Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "failure"
}
```

### Custom Status
Sends an embed with color code #00c8ff and with the title "Deployed Maven Artifact"
```
action "Send Deployed Status" {
  uses = "WalshyDev/Discord-Status-Webhook@master"
  args = "custom 3066993 "Deployed Maven Artifact""
}
```

## License
The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE.md).