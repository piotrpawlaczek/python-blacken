FROM python:3.12-slim-bookworm

LABEL "maintainer" = "Piotr Pawlaczek <info@pawlaczek.pl>"

# Install the Debian ca-certificates package from bookworm-security. Older
# versions trust the compromised eMudhra emSign CAs.
RUN apt-get -qq update \
    && apt-get -qq install -y --no-install-recommends ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# pip earlier than 26.2.2 trusts the compromised eMudhra emSign CAs through its
# vendored certifi. The hash pin makes the download safe with the old pip.
# https://discuss.python.org/t/information-for-python-users-regarding-emudhra-emsign-ca-certificate-security-incident/109576
RUN python -m pip install --no-cache-dir --root-user-action=ignore \
    "pip @ https://files.pythonhosted.org/packages/3f/06/3e4420302363fbb71be3c7f35ce042f54bfca330e3e66b3a2e3c4cca579f/pip-26.2.2-py3-none-any.whl#sha256=fd7f4dfa8190e014013b9f08f3e973f4e4c26ffd179a204895533a7254813a70"

ADD requirements.txt /requirements.txt
ADD entrypoint.sh /entrypoint.sh

RUN pip install --no-cache-dir --root-user-action=ignore -r requirements.txt

ENTRYPOINT ["/entrypoint.sh"]
