# CON Grammar

Battlefield's script grammar definition.

This definition together with ANTLR's tool allows generating a powerful parser for this scripts.

## Quick Start
As mentioned, this is just the definition required for [ANTLR](https://www.antlr.org/) to build the actual parser.

Download the latest version of ANTLR and execute the following command:

```
java -cp antlr-4.13.0-complete.jar org.antlr.v4.Tool ConGrammar.g4
```

### VS Code
Visual Studio code does provide a good ANTLR editing/testing experience. 

Just install `mike-lischke.vscode-antlr4` entension and with the provided `launch.json` configuration, VS will generate the parser/lexer, read the contents present in  `input.txt` and finally generate a graphic representation of the syntax tree.

## Grammar

More information about the actual grammar here: https://bf2tech.uturista.pt/index.php/Console_Script_Grammar.