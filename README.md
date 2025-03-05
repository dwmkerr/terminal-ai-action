# terminal-ai-action
GitHub action to run AI commands as part of pipelines.



## Inputs
- `openAiKey`: Your OpenAI API key (required).
- `multilineYAML`: The YAML string to process with AI (required).

## Example Usage
```yaml
name: Run AI Action
on:
  push:
    branches:
      - main

jobs:
  ai:
    runs-on: ubuntu-latest
    steps:
      - name: Run AI
        uses: yourusername/github-action-python-ai@v1
        with:
          openAiKey: ${{ secrets.OPENAI_API_KEY }}
          multilineYAML: |
            
            another_key: another_value
