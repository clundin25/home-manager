{ config, pkgs, ... }:

{
  home.username = "carl";
  home.homeDirectory = "/home/carl";

  home.stateVersion = "24.11";


  programs.zsh.enable = true;
  home.shell.enableZshIntegration = true;

  home.packages = [
    pkgs.git
    pkgs.zsh
    pkgs.tmux
    pkgs.ruby
    pkgs.neovim
    pkgs.alacritty
    (pkgs.writeShellScriptBin "install-scm-breeze" ''
        git clone https://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
        ~/.scm_breeze/install.sh
    '')
  ];

  home.file = {
    ".zshrc".source = dotfiles/zshrc;
    ".tmux.conf".source = dotfiles/tmuxconf;
    ".config/nvim/init.lua".source = dotfiles/nvimlua;
    ".config/alacritty/alacritty.toml".source = dotfiles/alacrittytoml;
    ".config/alacritty/darcula.toml".source = dotfiles/darculatoml;
    ".config/alacritty/paper.toml".source = dotfiles/papertoml;
    ".inputrc".source = dotfiles/inputrc;
  };

  home.sessionVariables = {
      USING_HOME_MANAGER = "true";
      EDITOR = "nvim";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Carl Lundin";
    userEmail = "carllundin55@gmail.com";
  };
}
