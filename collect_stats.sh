### collect wireless TX radio level stats ###
while true; 
    do 
    wifistats wifi1 0 1 ; 
    wifistats wifi1 0 9 ; 
    sleep 1;
    echo "==================";
    echo `date`; 
    wifistats wifi1 1 | grep -e msdu_count_tqm -e mpdu_count_tqm -e num_data_ppdus_tried_ota -e tx_xretry -e mpdus_ack_failed -e tx_time_dur_data;
    wifistats wifi1 9 | grep -e tx_mcs;
    echo "";
    done > /tmp/wifistats1_9.log &

### collect wireless RX radio level stats ###
while true; 
    do 
    wifistats wifi1 0 2 ; 
    wifistats wifi1 0 10 ; 
    sleep 1;
    echo "==================";
    echo `date`; 
    wifistats wifi1 2 | grep -e ppdu_recvd -e mpdu_cnt_fcs_ok -e mpdu_cnt_fcs_err -e tcp_msdu_cnt -e tcp_ack_msdu_cnt -e udp_msdu_cnt -e other_msdu_cnt;
    wifistats wifi1 10 | grep -e rx_mcs -e rx_ulofdma_non_data_ppdu -e rx_ulofdma_data_ppdu -e rx_ulofdma_mpdu_ok -e rx_ulofdma_mpdu_fail;
    echo "";
    done > /tmp/wifistats2_10.log &

#-e ppdu_recvd -e mpdu_cnt_fcs_ok -e mpdu_cnt_fcs_err -e tcp_msdu_cnt -e tcp_ack_msdu_cnt -e udp_msdu_cnt -e other_msdu_cnt
#### collect wireless TX radio level rate stats ###
#while true; 
    #do 
    #sleep 10;
    #echo "==================";
    #echo `date`; 
    #echo "";
    #done > /tmp/wifistats9.log &

#### collect wireless RX radio level rate stats ###
#while true; 
    #do 
    #wifistats wifi1 0 10 ; 
    #sleep 10;
    #echo "==================";
    #echo `date`; 
    #wifistats wifi1 10 | grep -v " = 0" | grep -v -e '^[[:space:]]*$'; 
    #echo "";
    #done > /tmp/wifistats10.log &

#### collect wireless FW sounding stats ###
#while true; 
    #do 
    #wifistats wifi1 0 12 ; 
    #sleep 10;
    #echo "==================";
    #echo `date`; 
    #wifistats wifi1 12 | grep -v " = 0" | grep -v -e '^[[:space:]]*$'; 
    #echo "";
    #done > /tmp/wifistats12.log &

#### collect wireless MIMO stats ###
#while true; 
    #do 
    #wifistats wifi1 0 17;
    #sleep 1;
    #echo "==================";
    #echo `date`;
    #wifistats wifi1 17 | grep -v " = 0" | grep -v -e '^[[:space:]]*$';
    #echo "";
    #done > /tmp/wifistats17.log&

### collect wireless client level stats ###
### TODO : replace !mac_addr_client! with the MAC address of the client for which stats needs logging, 
### in the format ab:cd:ef:11:22:33 ###
#while true;
    #do
    #echo `date`;
    #echo "==================";
#---->    wifistats wifi1 11 --mac !mac_addr_client! | grep -v " = 0" | grep -v -e '^[[:space:]]*$';
    #sleep 10;
    #echo "";
#---->   done > /tmp/wifistats11_!mac_addr_client!.log &
#nodestats wifi1 | grep -E '([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})' | awk '{print " while true; do echo `date` >> /tmp/wifistats11_" $3 ".log; wifistats wifi1 11 --mac " $3 " |  grep -v " = 0" | grep -v -e "^[[:space:]]*$" >> /tmp/wifistats11_" $3 ".log; sleep 1; done&"}' | ash

### collect NSS stats ###
#while true; 
    #do 
    #echo "==================" >> /tmp/nss_stats.log;
    #echo `date` >> /tmp/nss_stats.log;
    #cat /sys/kernel/debug/qca-nss-drv/stats/eth_rx | grep -v " = 0" | grep -v -e '^[[:space:]]*$'>> /tmp/nss_stats.log;
    #cat /sys/kernel/debug/qca-nss-drv/stats/ipv4 | grep -v " = 0" | grep -v -e '^[[:space:]]*$'>> /tmp/nss_stats.log;
    #cat /sys/kernel/debug/qca-nss-drv/stats/n2h | grep -v " = 0" | grep -v -e '^[[:space:]]*$'>> /tmp/nss_stats.log;
    #cat /sys/kernel/debug/qca-nss-drv/stats/wifili | grep -v " = 0" | grep -v -e '^[[:space:]]*$'>> /tmp/nss_stats.log;
    #echo "==================" >> /tmp/nss_stats.log; 
    #sleep 10;
    #done &
