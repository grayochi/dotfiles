function pubkey
  if test -f ~/.ssh/id_rsa.pub
    bat ~/.ssh/id_rsa.pub | pbcopy; and echo '=> Public key copied to clipboard.'
  else if test -f ~/.ssh/id_ed25519.pub
    bat ~/.ssh/id_ed25519.pub | pbcopy; and echo '=> Public key copied to clipboard.'
  else
    echo 'No public key found.'
  end
end
