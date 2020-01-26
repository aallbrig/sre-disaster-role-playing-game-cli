package main

import (
	"github.com/danielgtaylor/openapi-cli-generator/cli"
)

func main() {
	cli.Init(&cli.Config{
		AppName:   "disaster-role-playing",
		EnvPrefix: "DISASTER_ROLE_PLAYING",
		Version:   "1.0.0",
	})

	// TODO: Add register commands here.

	cli.Root.Execute()
}
