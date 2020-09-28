FROM reactnativecommunity/react-native-android:latest

ENV WATCHMAN_VERSION=4.9.0

# Install Watchman
RUN apt-get update \
  && apt-get install -y python python-dev pkg-config libssl-dev autoconf automake libtool \
  && cd /tmp \
  && git clone https://github.com/facebook/watchman.git \
  && cd watchman \
  && git checkout v${WATCHMAN_VERSION} \
  && ./autogen.sh \
  && ./configure --without-python  --without-pcre --enable-lenient \
  && make \
  && make install \
  && cd $HOME \
  && rm -rf /tmp/watchman

WORKDIR /app

CMD bash
