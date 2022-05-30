read -r -p "You are about to delete the data for this world. Are you sure? [Y/n] " response
if [[ "$response" =~ ^([Y])$ ]]
then
    # cd /home/minecraft/servers/MarcusModpack/world
    rm -rv \
    advancements/ \
    astralsorcery/ \
    bagofyurting/ \
    data/ \
    datapacks/ \
    deaths/ \
    DIM-1/ \
    DIM1/ \
    DimStorage/ \
    dimensions/ \
    EnderStorage/ \
    ftbchunks/ \
    ftbessentials/ \
    ftbquests/ \
    ftbteams/ \
    minecolonies/ \
    observerlib/ \
    playerdata/ \
    poi/ \
    region/ \
    stats/ \
    structurize/ \
    tombstone/ \
    kubejs_persistent_data.nbt \
    level.dat \
    level.dat_old \
    session.lock \
    touchfile
else
    echo "Aborting"
fi
