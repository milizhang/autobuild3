#!/bin/bash
##20-ruby.sh: Builds Ruby GEMs
##@copyright GPL-2.0+
abtryexe ruby gem || ((!ABSTRICT)) || ablibret

build_ruby_probe(){
  [ -f *.gem ]
}

build_ruby_build(){
  GEMDIR="$(ruby -e'puts Gem.default_dir')"
  gem install --ignore-dependencies --no-user-install \
    -i "$PKGDIR/$GEMDIR" -n "$PKGDIR/usr/bin" $PKGNAME-$PKGVER.gem
  rm "$PKGDIR/$GEMDIR/cache/$PKGNAME-$PKGVER.gem"
}

ABBUILDS+=' ruby'
