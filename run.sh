SHORT_VERSION=2.48
VERSION=2.48.2
JAR_FILE=selenium-server-standalone-$VERSION.jar
CACHE_DIR="${WERCKER_CACHE_DIR}/wercker/selenium-server"

[ ! -d "${CACHE_DIR}" ] && mkdir -p $CACHE_DIR

cd $CACHE_DIR

if [[ ! -f "${CACHE_DIR}/${JAR_FILE}" ]]; then
  # Download Selenium Standalone Server
  wget http://selenium-release.storage.googleapis.com/$SHORT_VERSION/selenium-server-standalone-$VERSION.jar
fi

# Start Selenium and wait for port 4444 to become available
nohup java -jar $JAR_FILE & while ! nc -vz localhost 4444; do sleep 1; done
