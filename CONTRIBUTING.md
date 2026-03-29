# Contributing to XC-Manager Community Vaults

I welcome community-curated vaults! To ensure your contributions work seamlessly with the `xc sync` engine and the v0.7.0 placeholder logic, please follow these guidelines.

## 1. File Naming & Structure
* **File Extension**: All vault files must end in `.txt` (e.g., `kubernetes.txt`).
* **Format**: Each line must follow the standard XC-Manager format:
  `command --flags -> Clear, concise description of the command`
* **Encoding**: Ensure files are UTF-8 encoded with Unix-style line endings (LF).

## 2. Interactive Templating
I encourage the use of placeholders to make commands dynamic.
* Use double curly braces for variables: `{{variable_name}}`.
* **Global Naming**: If a command requires the same value in multiple places, use the exact same variable name. XC-Manager will only prompt the user once.
  * *Example*: `cp {{file}} {{file}}.bak`
* **Unique Naming**: If a command requires different values, use distinct names.
  * *Example*: `mv {{old_name}} {{new_name}}`

## 3. Adding to the Index
For your vault to appear in the `xc sync` list, it must be added to `community-vaults/index.txt`.
* **Format**: `filename_without_extension:UK English description`
* *Example*: `docker-dev:Container orchestration and development environment cleanup.`

## 4. Submission Process
1. Fork the repository.
2. Add your `.txt` vault to the `community-vaults/` directory.
3. Update `community-vaults/index.txt` with your vault name and description.
4. Submit a Pull Request with a brief summary of the added commands.

Thank you for helping make XC-Manager a more powerful tool for everyone!
