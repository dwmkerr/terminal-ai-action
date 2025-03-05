# terminal-ai-action

GitHub action to run AI commands as part of pipelines.

## Example Usage

Create a workflow, e.g. `.github/workflows/review.yaml`

```yaml
name: Review PR
on:
  pull_request:

jobs:
  review:
    steps:
      - name: Review with Terminal AI
        uses: dwmkerr/terminal-ai@latest
        with:
          openAiKey: ${{ secrets.OPENAI_API_KEY }}
          command: ai "review this PR"
```

The following configuration is supported:

| Configuration | Description                   |
|---------------|-------------------------------|
| `openAiKey`   | **Required.** OpenAI API Key. |
| `command`     | **Required.** An AI command. See [Examples](https://github.com/dwmkerr/terminal-ai?tab=readme-ov-file#examples)

## TODO

Quick and dirty task list:

- [ ] docs: nice example of [great README page](https://github.com/JamesIves/github-pages-deploy-action)
