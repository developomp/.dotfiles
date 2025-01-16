{ pkgs, ... }:

{
  xdg.mimeApps.defaultApplications = {
    "application/pdf" = "firefox.desktop";
    "text/plain" = "code.desktop";
    "text/x-csrc" = "code.desktop";
    "application/octet-stream" = "code.desktop";
    "application/xml" = "code.desktop";
    "application/x-zerosize" = "code.desktop";
  };

  programs.vscode = {
    enable = true;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;

    userSettings = {
      # general
      "editor.rulers" = [ 80 ];
      "color-highlight.enable" = false;
      "workbench.colorTheme" = "One Dark Pro Flat";
      "security.workspace.trust.untrustedFiles" = "open";
      "window.restoreWindows" = "none";
      "extensions.autoUpdate" = false;

      # font
      "editor.fontFamily" = "'MesloLGS NF', 'Terminess Nerd Font Mono'";

      # sidebar
      "workbench.hover.delay" = 200;
      "workbench.iconTheme" = "material-icon-theme";
      "explorer.compactFolders" = false;

      # editor
      "editor.cursorBlinking" = "solid";
      "editor.largeFileOptimizations" = false;

      # terminal
      "terminal.external.linuxExec" = "kitty";
      "terminal.integrated.defaultProfile.linux" = "zsh";
      "terminal.integrated.enableMultiLinePasteWarning" = "never";
      "terminal.integrated.enablePersistentSessions" = false;

      # git
      "git.autofetch" = true;
      "git.confirmSync" = false;
      "git.openRepositoryInParentFolders" = "always";
      "diffEditor.ignoreTrimWhitespace" = false;
      "gitlens.currentLine.enabled" = false;
      "gitlens.hovers.currentLine.over" = "line";
      "gitlens.statusBar.enabled" = false;
      "gitlens.advanced.messages" = {
        "suppressCreatePullRequestPrompt" = true;
      };

      # telemetry
      "dotnetAcquisitionExtension.enableTelemetry" = false;
      "gitlens.telemetry.enabled" = false;
      "intelephense.telemetry.enabled" = false;
    };

    keybindings = [
      {
        key = "ctrl+alt+s";
        command = "git.stageSelectedRanges";
        when = "isInDiffEditor && !operationInProgress";
      }
      {
        key = "ctrl+alt+u";
        command = "git.unstageSelectedRanges";
        when = "isInDiffEditor && !operationInProgress";
      }
    ];

    # List installed extensions: codium --list-extensions
    extensions = pkgs.vscode-utils.extensionsFromVscodeMarketplace [
      # {
      #   name = "";
      #   publisher = "";
      #   version = "";
      #   sha256 = "";
      # }

      # general vscode features
      {
        # https://marketplace.visualstudio.com/items?itemName=mikestead.dotenv
        name = "dotenv";
        publisher = "mikestead";
        version = "1.0.1";
        sha256 = "sha256-dieCzNOIcZiTGu4Mv5zYlG7jLhaEsJR05qbzzzQ7RWc=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=mkxml.vscode-filesize
        name = "vscode-filesize";
        publisher = "mkxml";
        version = "3.2.2";
        sha256 = "sha256-RVhgCt/zY155oeL7EbVBokNFFBB9xvGL3j3zySdjGRg=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=wakatime.vscode-wakatime
        name = "vscode-wakatime";
        publisher = "wakatime";
        version = "25.0.0";
        sha256 = "sha256-n/7y2nbD+ziUCDmNbfuT01GK/ls8rTfghpntj6SmsbA=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=iamhyc.overleaf-workshop
        name = "overleaf-workshop";
        publisher = "iamhyc";
        version = "0.14.1";
        sha256 = "sha256-x6HBwW1Jl0FJQ/RNJ/s9MaS5/6AzVBpvJ8X8owW4dVM=";
      }

      # AI stuff
      {
        # https://marketplace.visualstudio.com/items?itemName=continue.continue
        name = "continue";
        publisher = "Continue";
        version = "0.9.250";
        sha256 = "sha256-asL4vW00+8Cfdt/0vacYGvtO89w5Rp4zP2ehOUWYmao=";
      }

      # general editing feature
      {
        # https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments
        name = "better-comments";
        publisher = "aaron-bond";
        version = "3.0.2";
        sha256 = "sha256-hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=wayou.vscode-todo-highlight
        name = "vscode-todo-highlight";
        publisher = "wayou";
        version = "1.0.5";
        sha256 = "sha256-CQVtMdt/fZcNIbH/KybJixnLqCsz5iF1U0k+GfL65Ok=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=editorconfig.editorconfig
        name = "editorconfig";
        publisher = "editorconfig";
        version = "0.16.4";
        sha256 = "sha256-j+P2oprpH0rzqI0VKt0JbZG19EDE7e7+kAb3MGGCRDk=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker
        name = "code-spell-checker";
        publisher = "streetsidesoftware";
        version = "4.0.34";
        sha256 = "sha256-XREhBFc/UxvVxA4jlcEqym1D/pA1lmU0/PHX84BL2SQ=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens
        name = "errorlens";
        publisher = "usernamehw";
        version = "3.22.0";
        sha256 = "sha256-Uu2yJr5gxyCZdMK9NSwnBZcVQbG+uS5TtQlSZpyxd50=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=christian-kohler.path-intellisense
        name = "path-intellisense";
        publisher = "christian-kohler";
        version = "2.10.0";
        sha256 = "sha256-bE32VmzZBsAqgSxdQAK9OoTcTgutGEtgvw6+RaieqRs=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=dbankier.vscode-quick-select
        name = "vscode-quick-select";
        publisher = "dbankier";
        version = "0.2.9";
        sha256 = "sha256-XeyjXU+ZdpZ7VOK4oECZp4As3MZxhExq6lXMTMJRAcA=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=earshinov.sort-lines-by-selection
        name = "sort-lines-by-selection";
        publisher = "earshinov";
        version = "1.2.0";
        sha256 = "sha256-mxwMX4r+3XuPxG9pRN7MmmvCft0fLtKxp5dv/VFOeK8=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=stkb.rewrap
        name = "rewrap";
        publisher = "stkb";
        version = "17.8.0";
        sha256 = "sha256-9t1lpVbpcmhLamN/0ZWNEWD812S6tXG6aK3/ALJCJvg=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=plievone.vscode-template-literal-editor
        name = "vscode-template-literal-editor";
        publisher = "plievone";
        version = "0.10.0";
        sha256 = "sha256-AiDtJadgEQA5Zmrk28oTfOG6eS4QYIA8GQVO6RNUM5Y=";
      }

      # Markdown/Markup
      {
        # https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml
        # https://github.com/redhat-developer/vscode-xml
        name = "vscode-xml";
        publisher = "redhat";
        version = "0.27.2";
        sha256 = "sha256-yE8PfDpdrYtegJZ/9UaljuEw/y9gokPngsFvbfMSJ2g=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml
        name = "vscode-yaml";
        publisher = "redhat";
        version = "1.15.0";
        sha256 = "sha256-NhlLNYJryKKRv+qPWOj96pT2wfkiQeqEip27rzl2C0M=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=unifiedjs.vscode-mdx
        name = "vscode-mdx";
        publisher = "unifiedjs";
        version = "1.8.13";
        sha256 = "sha256-QTIDs+HVnM+zJ3jqhiBhUTsrI44kaHInYDXLXMC1/9E=";
      }

      # General web tech
      {
        # https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss
        name = "vscode-tailwindcss";
        publisher = "bradlc";
        version = "0.13.64";
        sha256 = "sha256-JhC2hFx9I8wyBYG3YTOL7Ia/bZrHn2rixLUtutUVJpE=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint
        name = "vscode-eslint";
        publisher = "dbaeumer";
        version = "3.0.13";
        sha256 = "sha256-l5VvhQPxPaQsPhXUbFW2yGJjaqnNvijn4QkXPjf1WXo=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode
        name = "prettier-vscode";
        publisher = "esbenp";
        version = "11.0.0";
        sha256 = "sha256-pNjkJhof19cuK0PsXJ/Q/Zb2H7eoIkfXJMLZJ4lDn7k=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=formulahendry.auto-rename-tag
        name = "auto-rename-tag";
        publisher = "formulahendry";
        version = "0.1.10";
        sha256 = "sha256-uXqWebxnDwaUVLFG6MUh4bZ7jw5d2rTHRm5NoR2n0Vs=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=jock.svg
        name = "svg";
        publisher = "jock";
        version = "1.5.4";
        sha256 = "sha256-LZLKUmYSnlgypLXKFOGezMepV10t35unpEnCMaLRjeU=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=naumovs.color-highlight
        name = "color-highlight";
        publisher = "naumovs";
        version = "2.8.0";
        sha256 = "sha256-mT2P1lEdW66YkDRN6fi0rmmvvyBfXiJjAUHns8a8ipE=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=stylelint.vscode-stylelint
        name = "vscode-stylelint";
        publisher = "stylelint";
        version = "1.4.0";
        sha256 = "sha256-CsQBRoVDtNLlkHa6NLmOspkswB/JUMfMuU2dMYDlDnc=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=LorisCro.super
        name = "super";
        publisher = "LorisCro";
        version = "0.5.3";
        sha256 = "sha256-SSeCNtwiOVk6ZrKvQ8U3eoTEJETVWyymrFOWrXj88Xs=";
      }

      # JS & TS ecosystem
      {
        # https://marketplace.visualstudio.com/items?itemName=oven.bun-vscode
        name = "bun-vscode";
        publisher = "oven";
        version = "0.0.26";
        sha256 = "sha256-klMkKAorWJj2o015FWbQQfpmYe4JM0UOM+WVh+YPtI4=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=denoland.vscode-deno
        name = "vscode-deno";
        publisher = "denoland";
        version = "3.43.2";
        sha256 = "sha256-Pz9ZgmErUBNYVBDgSvzxh74yG0X9GxFrdaaCCExVIJI=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=yoavbls.pretty-ts-errors
        name = "pretty-ts-errors";
        publisher = "yoavbls";
        version = "0.6.1";
        sha256 = "sha256-LvX21nEjgayNd9q+uXkahmdYwzfWBZOhQaF+clFUUF4=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=bierner.jsdoc-markdown-highlighting
        name = "jsdoc-markdown-highlighting";
        publisher = "bierner";
        version = "0.0.1";
        sha256 = "sha256-f87gKQwEPu/aJOhz5sstW804B8hf0pQRdC3C2PAnfgQ=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=vunguyentuan.vscode-postcss
        name = "vscode-postcss";
        publisher = "vunguyentuan";
        version = "2.0.2";
        sha256 = "sha256-ttvCwxk3dMwva5LmVHq4p31INTa/T91qQISEU4gYNbg=";
      }

      # icons & themes
      {
        # https://marketplace.visualstudio.com/items?itemName=pkief.material-icon-theme
        name = "material-icon-theme";
        publisher = "pkief";
        version = "5.17.0";
        sha256 = "sha256-ohiWl/ymoWSRyL2pY9DabXfIrofL/oCDKPqvISpgUtU=";
      }
      {
        # One Dark Pro Theme
        # https://marketplace.visualstudio.com/items?itemName=zhuangtongfa.material-theme
        name = "material-theme";
        publisher = "zhuangtongfa";
        version = "3.17.7";
        sha256 = "sha256-tuPgCTGklFd/J5PCmSQTCYf0nk4nJHBXxVUtDf45Zu8=";
      }

      # git & github
      {
        # https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens
        # https://github.com/gitkraken/vscode-gitlens/releases
        name = "gitlens";
        publisher = "eamodio";
        version = "16.1.1";
        sha256 = "sha256-v9nNELeyEXLXvWPqmqQPyEA3lDPlgx8WRh4okh8568M=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=github.vscode-github-actions
        name = "vscode-github-actions";
        publisher = "github";
        version = "0.27.0";
        sha256 = "sha256-sZ831fPgy/HGsXL1gTezbTsnVcYjwxEd79JfMu1jaGo=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=vivaxy.vscode-conventional-commits
        name = "vscode-conventional-commits";
        publisher = "vivaxy";
        version = "1.26.0";
        sha256 = "sha256-Lj2+rlrKm9h21zEoXwa2TeGFNKBmlQKr7MRX0zgngdg=";
      }

      # Low level stuff
      {
        # https://marketplace.visualstudio.com/items?itemName=tintinweb.vscode-decompiler
        name = "vscode-decompiler";
        publisher = "tintinweb";
        version = "0.1.0";
        sha256 = "sha256-AyUABtVUTQi9NRjo3O8Ma+XE3rcY+NSxahKUEvxvFG8=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-vscode.hexeditor
        name = "hexeditor";
        publisher = "ms-vscode";
        version = "1.11.1";
        sha256 = "sha256-RB5YOp30tfMEzGyXpOwPIHzXqZlRGc+pXiJ3foego7Y=";
      }

      # Markdown
      {
        # https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one
        name = "markdown-all-in-one";
        publisher = "yzhang";
        version = "3.6.2";
        sha256 = "sha256-BIbgUkIuy8clq4G4x1Zd08M8k4u5ZPe80+z6fSAeLdk=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=jeff-tian.markdown-katex
        name = "markdown-katex";
        publisher = "jeff-tian";
        version = "0.1.4";
        sha256 = "sha256-NEVoT1zn9ehG/XJJyPunL3LAeiWORW/8nt+HOH5VxcI=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid
        name = "markdown-mermaid";
        publisher = "bierner";
        version = "1.27.0";
        sha256 = "sha256-09w/k1LlGYtyWWbVgoprJG/qB/zCuedF9Cu7kUXcNrE=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=bpruitt-goddard.mermaid-markdown-syntax-highlighting
        name = "mermaid-markdown-syntax-highlighting";
        publisher = "bpruitt-goddard";
        version = "1.7.0";
        sha256 = "sha256-Vjmc9tlHSFdhhcSopUG3MnyBSi//B6cpnavqFLhVRho=";
      }

      # General vscode features
      {
        # https://marketplace.visualstudio.com/items?itemName=fill-labs.dependi
        name = "dependi";
        publisher = "fill-labs";
        version = "0.7.13";
        sha256 = "sha256-Xn2KEZDQ11LDfUKbIrJtQNQXkcusyrL/grDyQxUmTbc=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=dprint.dprint
        name = "dprint";
        publisher = "dprint";
        version = "0.16.3";
        sha256 = "sha256-tK2sNLM+neYm+YXPaTKzWHcT+JE+fEbMR7MeB8gBKTI=";
      }

      # Rust
      {
        # https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
        name = "rust-analyzer";
        publisher = "rust-lang";
        version = "0.4.2259";
        sha256 = "sha256-RJQnzDtIxRGWTg49LJiFjLmLP4vXzLWbjn7P0KMflJQ=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml
        name = "even-better-toml";
        publisher = "tamasfe";
        version = "0.21.2";
        sha256 = "sha256-IbjWavQoXu4x4hpEkvkhqzbf/NhZpn8RFdKTAnRlCAg=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=DioxusLabs.dioxus
        name = "dioxus";
        publisher = "DioxusLabs";
        version = "0.6.0";
        sha256 = "sha256-UYMJf0F8YjH1s7szIdTDG7t31/xjryD3wxogQM4ywOU=";
      }

      # Python
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-python.python
        # https://github.com/microsoft/vscode-python/releases
        name = "python";
        publisher = "ms-python";
        version = "2024.22.2";
        sha256 = "sha256-uVv4kpTf0W82Gvoju0Q/HKf6SpN2mwuYO7NItlRoezI=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-python.black-formatter
        # https://github.com/microsoft/vscode-black-formatter/releases
        name = "black-formatter";
        publisher = "ms-python";
        version = "2024.4.0";
        sha256 = "sha256-swGlQAvPs5+HDrBc3ZvMEFdnimClnn6YsvkHbh/b+L8=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=charliermarsh.ruff
        name = "ruff";
        publisher = "charliermarsh";
        version = "2025.0.0";
        sha256 = "sha256-1RuXyU90vv+eSekH+Nz+U1aIaz4pN/DTPHE3enCE+Uo=";
      }

      # Go
      {
        # https://marketplace.visualstudio.com/items?itemName=golang.go
        name = "go";
        publisher = "golang";
        version = "0.45.0";
        sha256 = "sha256-w/74OCM1uAJzjlJ91eDoac6knD1+Imwfy6pXX9otHsY=";
      }

      # C++
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools
        name = "cpptools";
        publisher = "ms-vscode";
        version = "1.23.3";
        sha256 = "sha256-7c1o+4dCfhvC00XdkCuse4UVnZ4I1qM1QXwSxnL2/A0=";
      }

      # C#
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csharp
        name = "csharp";
        publisher = "ms-dotnettools";
        version = "2.61.27";
        sha256 = "sha256-/YxsXDV3UlP+jeYsIN9YbW4EjLRW6gEAtMFIQHxA+zU=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-dotnettools.csdevkit
        name = "csdevkit";
        publisher = "ms-dotnettools";
        version = "1.15.32";
        sha256 = "sha256-Pujbln1TLDTRrVPT3bZPllkbVHJl4t1zoATl8BDeTs8=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-vscode.mono-debug
        name = "mono-debug";
        publisher = "ms-vscode";
        version = "0.16.3";
        sha256 = "sha256-6IU8aP4FQVbEMZAgssGiyqM+PAbwipxou5Wk3Q2mjZg=";
      }

      # Unity
      {
        # https://marketplace.visualstudio.com/items?itemName=visualstudiotoolsforunity.vstuc
        name = "vstuc";
        publisher = "visualstudiotoolsforunity";
        version = "1.0.5";
        sha256 = "sha256-7v/f9oo+zjQ3EaVhYfswhy3Sqw3U+v53o50SvMRngFc=";
      }

      # Svelte
      {
        # https://marketplace.visualstudio.com/items?itemName=svelte.svelte-vscode
        name = "svelte-vscode";
        publisher = "svelte";
        version = "109.5.1";
        sha256 = "sha256-hEsh7UujasZBa2jlDzElRMNsH23U8rwIPP/cmt9Gnm4=";
      }

      # Shell
      {
        # https://marketplace.visualstudio.com/items?itemName=foxundermoon.shell-format
        name = "shell-format";
        publisher = "foxundermoon";
        version = "7.2.5";
        sha256 = "sha256-kfpRByJDcGY3W9+ELBzDOUMl06D/vyPlN//wPgQhByk=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=timonwong.shellcheck
        name = "shellcheck";
        publisher = "timonwong";
        version = "0.37.4";
        sha256 = "sha256-+DFoHjb5sl9s5Vqw7onsv+MKjS4+loGVnZsF9/e+7dQ=";
      }

      # Docker
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
        name = "vscode-docker";
        publisher = "ms-azuretools";
        version = "1.29.3";
        sha256 = "sha256-z0RqFos0ZG2Id/alUBZJyroX3coTcJ+x2R8v4FD2Zcg=";
      }

      # LaTeX
      {
        # https://marketplace.visualstudio.com/items?itemName=james-yu.latex-workshop
        name = "latex-workshop";
        publisher = "james-yu";
        version = "10.7.5";
        sha256 = "sha256-XdktZHSS33BJ+zq50NmGD3TgjOd2tY872+gJDubSS0E=";
      }

      # vim
      {
        # https://marketplace.visualstudio.com/items?itemName=xadillax.viml
        name = "viml";
        publisher = "xadillax";
        version = "2.2.0";
        sha256 = "sha256-WNwTWJ3fDdIc9gsfOdtAd6Rg3xH0sbs6ONo7fKjtJuI=";
      }

      # CSV
      {
        # https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv
        name = "rainbow-csv";
        publisher = "mechatroner";
        version = "3.13.0";
        sha256 = "sha256-wdXwMG5TDQx8H1nJaS8CcmCDHZ36dKgoSm4ivx3CSfE=";
      }

      # Godot
      {
        # https://marketplace.visualstudio.com/items?itemName=geequlim.godot-tools
        name = "godot-tools";
        publisher = "geequlim";
        version = "2.3.0";
        sha256 = "sha256-iuSec4PoVxyu1KB2jfCYOd98UrqQjH3q24zOR4VCPgs=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=alfish.godot-files
        name = "godot-files";
        publisher = "alfish";
        version = "0.1.2";
        sha256 = "sha256-teVQzL+Gx7cYHuvW58egEkiBoXKopNzoWTK259tvvxw=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=neikeq.godot-csharp-vscode
        name = "godot-csharp-vscode";
        publisher = "neikeq";
        version = "0.2.1";
        sha256 = "sha256-sLsP+4deo/O8NjHGGXVdSOPWQPALypW/H0oZOMMM9RE=";
      }

      # nginx
      {
        # https://marketplace.visualstudio.com/items?itemName=ahmadalli.vscode-nginx-conf
        name = "vscode-nginx-conf";
        publisher = "ahmadalli";
        version = "0.3.5";
        sha256 = "sha256-6gJtMQH2zanFt+UTaD0Vn1vDq5GY9R1CfelPCklYxYE=";
      }

      # Linux
      {
        # https://marketplace.visualstudio.com/items?itemName=coolbear.systemd-unit-file
        name = "systemd-unit-file";
        publisher = "coolbear";
        version = "1.0.6";
        sha256 = "sha256-ZhxSUT3zqdPNiHnfaDp/LQiGxTSLY1Vpc5zEbpv+gGk=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=nico-castell.linux-desktop-file
        name = "linux-desktop-file";
        publisher = "nico-castell";
        version = "0.0.21";
        sha256 = "sha256-4qy+2Tg9g0/9D+MNvLSgWUE8sc5itsC/pJ9hcfxyVzQ=";
      }

      # Tauri
      {
        # https://marketplace.visualstudio.com/items?itemName=tauri-apps.tauri-vscode
        name = "tauri-vscode";
        publisher = "tauri-apps";
        version = "0.2.9";
        sha256 = "sha256-ySfsmKAReKTLl6lHax2fnPu9paQ2pBSEMUoeGtGJelA=";
      }

      # Terraform / OpenTofu
      {
        # https://marketplace.visualstudio.com/items?itemName=gamunu.opentofu
        name = "opentofu";
        publisher = "gamunu";
        version = "0.2.1";
        sha256 = "sha256-OizdHTSGuwBRuD/qPXjmna6kZWfRp9EimhcFk3ICN9I=";
      }

      # Zig
      {
        # https://marketplace.visualstudio.com/items?itemName=ziglang.vscode-zig
        name = "vscode-zig";
        publisher = "ziglang";
        version = "0.6.3";
        sha256 = "sha256-NpsNUZKfMay/4p8NTKkL53nwklEh88J750tpiEF2ghc=";
      }

      # Nix
      {
        # https://marketplace.visualstudio.com/items?itemName=jnoortheen.nix-ide
        name = "nix-ide";
        publisher = "jnoortheen";
        version = "0.3.5";
        sha256 = "sha256-hiyFZVsZkxpc2Kh0zi3NGwA/FUbetAS9khWxYesxT4s=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=mkhl.direnv
        name = "direnv";
        publisher = "mkhl";
        version = "0.17.0";
        sha256 = "sha256-9sFcfTMeLBGw2ET1snqQ6Uk//D/vcD9AVsZfnUNrWNg=";
      }

      # Lua
      {
        # https://marketplace.visualstudio.com/items?itemName=sumneko.lua
        name = "lua";
        publisher = "sumneko";
        version = "3.13.5";
        sha256 = "sha256-1JoYV6ErUy9ew0Qw888azYdbvZmZibJhdECRXj72MtI=";
      }

      # Assembly
      {
        # https://marketplace.visualstudio.com/items?itemName=13xforever.language-x86-64-assembly
        name = "language-x86-64-assembly";
        publisher = "13xforever";
        version = "3.1.4";
        sha256 = "sha256-FJRDm1H3GLBfSKBSFgVspCjByy9m+j9OStlU+/pMfs8=";
      }

      # SQL
      {
        # https://marketplace.visualstudio.com/items?itemName=inferrinizzard.prettier-sql-vscode
        name = "prettier-sql-vscode";
        publisher = "inferrinizzard";
        version = "1.6.0";
        sha256 = "sha256-l6pf/+uv8Bn4uDMX0CbzSjydTStr73uRY550Ad9wm7Q=";
      }

      # PHP
      {
        # https://marketplace.visualstudio.com/items?itemName=bmewburn.vscode-intelephense-client
        name = "vscode-intelephense-client";
        publisher = "bmewburn";
        version = "1.13.1";
        sha256 = "sha256-eVm4x8WK9aRjKWQH2XaXCHHpc1f6qCn+PKmhyIpPJpk=";
      }

      # i18n
      {
        # https://marketplace.visualstudio.com/items?itemName=macabeus.vscode-fluent
        name = "vscode-fluent";
        publisher = "macabeus";
        version = "1.1.0";
        sha256 = "sha256-cDo8nH6hFvYNiHuoriDzgZC4xt/vm+yJdLZ1pgggpSA=";
      }

      # Makefile & Justfile
      {
        # https://marketplace.visualstudio.com/items?itemName=nefrob.vscode-just-syntax
        name = "vscode-just-syntax";
        publisher = "nefrob";
        version = "0.8.0";
        sha256 = "sha256-zuDfIxhiUKRpVRxp9BceW6WPBq5NNCuS1Si0/6kfqF8=";
      }
      {
        # https://marketplace.visualstudio.com/items?itemName=ms-vscode.makefile-tools
        name = "makefile-tools";
        publisher = "ms-vscode";
        version = "0.12.14";
        sha256 = "sha256-oH6uow3XZA/PQTdXYjtGKLN0gUGES7Wbq9iZ9p1LtdA=";
      }
    ];
  };
}
