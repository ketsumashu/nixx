{
  systemd.coredump.settings.Coredump = {
    Storage = "external";
    Compress = true;
    ProcessSizeMax = "64M";
    ExternalSizeMax = "64M";
    JournalSizeMax = "64M";
    MaxUse = "512M";
    KeepFree = "20G";
  };
}
