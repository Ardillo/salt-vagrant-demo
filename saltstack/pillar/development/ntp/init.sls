ntp:
  config:
    contents: |
      driftfile /var/lib/ntp/ntp.drift
      statistics loopstats peerstats clockstats
      filegen loopstats file loopstats type day enable
      filegen peerstats file peerstats type day enable
      filegen clockstats file clockstats type day enable
      server debian.pool.ntp.org
      restrict -4 default kod notrap nomodify nopeer noquery limited
      restrict -6 default kod notrap nomodify nopeer noquery limited
      restrict 127.0.0.1
      restrict ::1
      restrict source notrap nomodify noquery

