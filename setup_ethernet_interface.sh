#!/bin/bash

# XML 파일 경로
XML_FILE="cyclonedds.xml"

# 동적으로 네트워크 인터페이스 이름 가져오기
INTERFACE_NAME=$(ip link | grep -E "^[0-9]+: e" | awk -F': ' '{print $2}' | head -n 1)

# XML 파일의 name 속성 업데이트
sed -i "s/name=\"[^\"]*\"/name=\"$INTERFACE_NAME\"/" "$XML_FILE"

echo "Updated XML file with interface name: $INTERFACE_NAME"
