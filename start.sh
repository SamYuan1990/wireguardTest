#!/bin/bash

export LOG_LEVEL=debug
/wireguard-go/wireguard-go w0
wg genkey > /wireguard-go/private
chmod 077 /wireguard-go/private 
wg set w0 /wireguard-go/private-key private

tail -f /dev/null