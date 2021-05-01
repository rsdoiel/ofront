#!/bin/bash

ls -1 man1/*.1 | while read FNAME; do
  BNAME=$(basename $FNAME ".1")".md"
  echo "Converting ${FNAME} to ${BNAME}"
  if ! pandoc -f man -t markdown "${FNAME}" >"${BNAME}"; then
      rm "${BNAME}"
      echo "Pandoc not installed or you need a newer version of Pandoc"
      exit 1
  else
    git add "${BNAME}"
  fi
done

