## SRE Disaster Role Playing Game

Today I was reading through the _Site Reliability Engineering_ book and saw that in chapter 28, there is a section called "Disaster Role Playing" that details a game inspired by table top role playing games. Feeling a sense of joy at the implication that "playing D&D helps with software engineering practice", I quickly thought how this game could be driven through a CLI.

This will be my attempt at hacking this vision together!

#### The Game

Setup
---
- GM interacts with CLI to create YAML files that can be later used to run a game scenario.

Game Loop
---
- GM starts game loop by reading the read aloud text of the _incoming page_ from a customized _scenario_.
- GM listens for action from participating on call engineers
    - GM should focus collecting one action from each engineer per round

#### Technologies

- `Ansible` (for best effort "documentation" on homebrew setup)
- `GO` to drink the koolaid
- `YAML` for a terse way of providing code configs
  - `OpenAPI 3` json schema specification, to specifiy API and to generate GO code
    - Generate GO CLI from OpenAPI 3 spec: https://github.com/danielgtaylor/openapi-cli-generator
    - Generate GO REST server from OpenAPI 3 spec: https://github.com/OpenAPITools/openapi-generator

#### Entities

- Team
- Primary on call engineer
- (Optional) secondary on call engineer
- Incoming Page
    Read aloud text
    GM notes
- GM Interruption
    Read aloud text
    GM notes
- GM Actions
  - defaults
    - 'do nothing -- increase round count'
    - 'log GM note'
    - 'end scenario'
  - examples
    - for each participant 'ask {{ participant name }} for action'
    - for each available interruption 'interrupt with {{ interruption brief }}'
- User Actions
  - defaults
    - 'do nothing'
    - 'log user note'
- Scenario (combines incoming page, user actions, and GM actions to run the main game loop)
- Scenario Log
  - combines userX as GM, userY as Primary On Call, userZ as Secondary On Call, with a Scenario
  - Log of actions taken during the disaster role playing game
  - "Score" is kept
    - number of rounds
    - time of completion
- Retro
  - Pull up scenario log (keep MVP in mind)

