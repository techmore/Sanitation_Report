#!/bin/sh

customer=$( \
    zenity --entry \
      --title="Techmore Nuke Me" \
      --text="Who are your preforming the wipe for?" \
      --width=300 \
      --entry-text="Customer Name" \
  )

if zenity --question --cancel-label="DOD Triple Pass" --ok-label="Single Pass" --text="
Please select which level nuke you would like.

   Single Pass : using /dev/zero we overwrite 0 to the first detected hard disk.
   DOD Triple Pass : first /dev/urandom, then yes \"1\"| dd=of/dev/sda, then /dev/null.

   Hard drives are overwritten with 0 last so a fresh install and image can be as compressed as possible."; then
    . ~/Downloads/TM_Nuke/Single_Pass.sh | zenity --text-info --width=900 --height=800 
else
    . ~/Downloads/TM_Nuke/Triple_Pass.sh | zenity --text-info --width=900 --height=800 
fi
