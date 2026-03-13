#!/bin/bash

# mise 런타임 설치 (Java, Maven, Gradle)
if command -v mise &>/dev/null; then
  echo "Installing runtimes via mise..."
  mise use --global java@corretto-21
  mise use --global java@corretto-17
  mise use --global java@corretto-11
  mise use --global node@lts
  mise use --global python@latest
  mise use --global maven@latest
  mise use --global gradle@latest
else
  echo "mise not found. Run 'brew bundle' first."
fi

# TPM (Tmux Plugin Manager) 설치
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed."
fi

# tmux가 실행 중이면 설정 리로드 + 플러그인 설치 + 플러그인 스크립트 실행
if command -v tmux &>/dev/null && tmux list-sessions &>/dev/null; then
  echo "Reloading tmux config and installing plugins..."
  tmux source-file ~/.tmux.conf
  tmux run-shell ~/.tmux/plugins/tpm/bin/install_plugins
  tmux run-shell ~/.tmux/plugins/tpm/bin/clean_plugins

  # 플러그인 초기화 스크립트 실행 (source-file만으로는 플러그인 키바인딩이 등록되지 않음)
  for plugin_tmux in ~/.tmux/plugins/*//*.tmux; do
    [ -x "$plugin_tmux" ] && tmux run-shell "$plugin_tmux"
  done
  echo "Done."
else
  echo "tmux 세션이 없습니다. tmux 실행 후 prefix + I 로 플러그인을 설치하세요."
fi
