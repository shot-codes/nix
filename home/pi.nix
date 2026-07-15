{
  inputs,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.pi.homeModules.default
  ];

  programs.pi.coding-agent = {
    enable = true;

    # opt into the Bun-built package instead of the npm-built default
    package = inputs.pi.packages.${pkgs.system}.coding-agent-bun;

    # appended to the system prompt
    # rules = ''
    #   # AGENTS.md
    #   Be concise.
    # '';

    # extra skills
    # skills = [ ./skills/my-skill ];

    # ~/.pi/agent/models.json
    # models = ./models.json;

    # settings.json overrides
    # settings.model = "gpt-5";

    # environment variables (e.g. provider API keys)
    # environment.OPENAI_API_KEY = config.age.secrets.openai.path;
  };
}
