# python-blacken

A customisable GitHub action to check the style of Python code with [black](https://github.com/psf/black).

Uses black version **20.8b1**

# Inputs
You can use inputs to alter how `black` will check your code.

## Path (optional)
This tells `black` where to look for files to check.

**Default**: `.`, i.e. looks for files in the whole repository.

## Line-length (optional)
This tells `black` how long each line of Python code can be.

# Example usage
Include this in your `.github/workflows/main.yaml`:

```yaml
uses: piotrpawlaczek/python-blacken@release/stable
```
or, if you want to override any of the defaults,

```yaml
uses: piotrpawlaczek/python-blacken@release/stable
with:
  line-length: '88'
  path: '.'
```
