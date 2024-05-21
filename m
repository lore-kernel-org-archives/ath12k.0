Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340BAC25B75
	for <ath12k@archiver.kernel.org>; Tue, 21 May 2024 10:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2y/Bbukbdv3IkRYknhKEfP9uux18FBeNNZ3K+QFIt4Y=; b=1NKHSoDQkGrJKgnKtG6Oi+LGiT
	YVzgrcNHxeRhsf0RDOjT5e0Ia/u4ChclqsXRcfDhr/OYdxhWxPuSKoz2KzAdwfcxsj+gdADEwSroR
	MB10+SU1qHpvL/qxCNkHt8qkVoa3ONnD1v3SmLQVS1Um9jsOqh1FrJxI0uATGlc+DtPcL+wuhqCP0
	kw9NRIZyZYE+3oVY+PpXFETjQsPT0EOx6xC9zxr3B+zuEY4pc1/iK8RjqVHAGN2KaoXDj25jcDSo/
	ylJrbP/KxLdVEyHS9uYH1DWIcpFcfLtgx+6pgEN896J2ogzRYnUMQFAmFp23L1DyJ58oWLiPaNedY
	ikPnqbjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NBt-0000000HCrR-3mRh
	for ath12k@archiver.kernel.org;
	Tue, 21 May 2024 10:57:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9NBr-0000000HCpc-11sX
	for ath12k@lists.infradead.org;
	Tue, 21 May 2024 10:57:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44LAgn3r022405
	for <ath12k@lists.infradead.org>; Tue, 21 May 2024 10:57:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=2y/Bbukbdv3IkRYknhKEfP9uux18FBeNNZ3K+QFIt4Y=; b=EN
	aQy+afb+vpXslJUH6L96ong3o2LetGJ+PgH+H22Ukgc/PLSkzH2gEoQF0W3sfuIi
	knT6QGmuypt4urjwoKCFjRthgvVmeBc4WvMp+ScNJ+5AEaL+fEcWNTa0tO1F5ihD
	JfHYpJzV6FckBibIPD93ybilafOXta5s9qaZanjqRb8osRYYnMouEa1hghf1xq96
	3sgsSPRuLBYVqT8XMOd37nCHKv06v58RTLIatKw+PTC3nknRTUoDDbERJj2472CS
	ljlgtEsFrjiB/LAcMzTW8i1njzxAKBYjg6FOLD/23h56YjUzdWPCGLPn9qsP6IKX
	uTx6Kjj7w19G+SLpkXqw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3te7jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 May 2024 10:57:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44LAvpse025925
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 21 May 2024 10:57:51 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 May
 2024 03:57:50 -0700
Message-ID: <fcde8606-d986-4fe3-9b91-8ed997ac9f5d@quicinc.com>
Date: Tue, 21 May 2024 18:57:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] wifi: ath12k: add support for WoW
To: <ath12k@lists.infradead.org>
References: <20240510064748.369452-1-quic_bqiang@quicinc.com>
 <87h6ercx4t.fsf@kernel.org>
 <5e82ff7c-e14a-44e8-b8e7-c63c832719b3@quicinc.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <5e82ff7c-e14a-44e8-b8e7-c63c832719b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: S_Pst4E-y7RnugJF_2MQO7UIk_eWTBEX
X-Proofpoint-ORIG-GUID: S_Pst4E-y7RnugJF_2MQO7UIk_eWTBEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-21_06,2024-05-21_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405210082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_035755_495790_D70C986F 
X-CRM114-Status: GOOD (  18.57  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org



On 5/21/2024 6:45 PM, Baochen Qiang wrote:
> 
> 
> On 5/21/2024 5:49 PM, Kalle Valo wrote:
>> Baochen Qiang <quic_bqiang@quicinc.com> writes:
>>
>>> Add support for WoW (Wakeup on Wireless) funtionalities, this including
>>> magic-pattern, net-detect, disconnect and patterns, HW data filter, ARP
>>> and NS offload, GTK rekey offload.
>>>
>>> Also enable keepalive before suspend to avoid unexpected kick out by AP.
>>
>> There was a simple conflict in ath12k_core_suspend() but I fixed that
>> (tag ath-pending-202405210818). But I see new warnings:
>>
>> ./include/linux/fortify-string.h:97:33: warning: '__builtin_memcpy' accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Wrestrict]
>> ./include/linux/fortify-string.h:97:33: warning: '__builtin_memcpy' accessing 18446744073709551605 or more bytes at offsets 0 and 0 overlaps 9223372036854775787 bytes at offset -9223372036854775798 [-Wrestrict]
> I suppose this is run-time warning, right? I don't see them while testing, am I missing something? any configuration or special GCC version?
Sorry, I was meaning build time warning :)

> 
>> drivers/net/wireless/ath/ath12k/core.c:69:5: warning: context imbalance in 'ath12k_core_suspend' - different lock contexts for basic block
> This is because the conflict you mentioned above is not fixed in a right way: rcu_read_lock() should not be added there in ath12k_core_suspend() in commit https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/drivers?h=ath-pending-202405210818&id=2f77ceb7ece056f20d98519f0b1b696711c88908
> 
>>
>> And in my suspend tests with WCN7850 the kernel crashes (tried two times
>> and crashed in both):
>>
>> [  854.087911] wlan0: associated
>> [  854.139498] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by <censored>
>> [  854.481975] BUG: sleeping function called from invalid context at include/linux/sched/mm.h:315
>> [  854.483069] in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 1694, name: wpa_supplicant
>> [  854.483524] preempt_count: 0, expected: 0
>> [  854.484010] RCU nest depth: 1, expected: 0
>> [  854.484416] 2 locks held by wpa_supplicant/1694:
>> [  854.484914]  #0: ffffffff9c9e2650 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x2c8/0xbf0
>> [  854.485512]  #1: ffffffff9c0cd960 (rcu_read_lock){....}-{1:2}, at: atomic_notifier_call_chain+0x28/0x140
>> [  854.486290] CPU: 1 PID: 1694 Comm: wpa_supplicant Not tainted 6.9.0-wt-ath+ #1525
>> [  854.486707] Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
>> [  854.487195] Call Trace:
>> [  854.487467]  <TASK>
>> [  854.487734]  dump_stack_lvl+0xa4/0xe0
>> [  854.488049]  dump_stack+0x10/0x20
>> [  854.488335]  __might_resched+0x363/0x5a0
>> [  854.488628]  ? kmalloc_trace+0x4b/0x2d0
>> [  854.488978]  __might_sleep+0xad/0x160
>> [  854.489282]  kmalloc_trace+0x264/0x2d0
>> [  854.489574]  ? ath12k_mac_arvif_get_arp_ns_offload+0x72/0xd0 [ath12k]
>> [  854.490071]  ath12k_mac_arvif_get_arp_ns_offload+0x72/0xd0 [ath12k]
>> [  854.490543]  ath12k_mac_op_ipv6_changed+0xc7/0x1470 [ath12k]
>> [  854.491117]  ? ieee80211_emulate_change_chanctx+0xe0/0xe0 [mac80211]
>> [  854.491909]  ieee80211_ifa6_changed+0x1c7/0x3a0 [mac80211]
>> [  854.492663]  notifier_call_chain+0x97/0x310
>> [  854.492997]  atomic_notifier_call_chain+0x5d/0x140
>> [  854.493322]  inet6addr_notifier_call_chain+0x16/0x20
>> [  854.493650]  ipv6_add_addr+0x10ec/0x2160
>> [  854.493946]  ? reacquire_held_locks+0x4d0/0x4d0
>> [  854.494294]  ? inet6_dump_ifaddr+0x10/0x10
>> [  854.494599]  ? ip6_route_add+0x75/0x130
>> [  854.494910]  ? __kasan_check_write+0x14/0x20
>> [  854.495214]  ? ip6_route_add+0x8b/0x130
>> [  854.495525]  addrconf_add_linklocal+0xd6/0x300
>> [  854.495965]  ? addrconf_add_linklocal+0xd6/0x300
>> [  854.496297]  ? addrconf_dad_start+0x110/0x110
>> [  854.499635]  ? addrconf_addr_eui48_base+0x80/0xa0
>> [  854.503094]  addrconf_addr_gen.constprop.0+0x155/0x260
>> [  854.506223]  ? mutex_unlock+0xd/0x10
>> [  854.508461]  ? addrconf_add_linklocal+0x300/0x300
>> [  854.510681]  addrconf_init_auto_addrs+0x194/0x4e0
>> [  854.512414]  addrconf_notify+0xabe/0xdd0
>> [  854.514073]  notifier_call_chain+0x97/0x310
>> [  854.515733]  ? __unwind_start+0x1f3/0x3d0
>> [  854.517070]  raw_notifier_call_chain+0x11/0x20
>> [  854.518407]  call_netdevice_notifiers_info+0x8b/0xf0
>> [  854.521761]  netdev_state_change+0xe8/0x120
>> [  854.522882]  ? call_netdevice_notifiers_info+0xf0/0xf0
>> [  854.524019]  netdev_set_operstate+0xdf/0x130
>> [  854.525139]  ? rtnl_put_cacheinfo+0x260/0x260
>> [  854.526216]  set_operstate+0x8a/0x150
>> [  854.527175]  do_setlink+0xf0e/0x2550
>> [  854.528130]  ? rtnl_bridge_getlink+0x870/0x870
>> [  854.529078]  ? check_prev_add+0x2330/0x2330
>> [  854.530011]  ? mark_lock+0xe6/0x1470
>> [  854.530919]  ? check_prev_add+0x2330/0x2330
>> [  854.531710]  ? __lock_acquire+0xd43/0x1dd0
>> [  854.532491]  ? kasan_print_address_stack_frame+0x1d2/0x230
>> [  854.533277]  ? nla_get_range_signed+0x340/0x340
>> [  854.534046]  ? __kasan_check_read+0x11/0x20
>> [  854.534808]  ? mark_lock+0xe6/0x1470
>> [  854.535573]  ? __kasan_check_read+0x11/0x20
>> [  854.536292]  ? __nla_validate_parse+0x1d0/0x400
>> [  854.536980]  rtnl_setlink+0x217/0x330
>> [  854.537650]  ? do_setlink+0x2550/0x2550
>> [  854.538355]  ? rtnetlink_rcv_msg+0x2c8/0xbf0
>> [  854.539010]  ? mutex_lock_io_nested+0x1270/0x1270
>> [  854.539657]  ? reacquire_held_locks+0x4d0/0x4d0
>> [  854.540290]  ? lock_sync+0x1a0/0x1a0
>> [  854.540981]  ? __this_cpu_preempt_check+0x13/0x20
>> [  854.541598]  rtnetlink_rcv_msg+0x315/0xbf0
>> [  854.542278]  ? check_prev_add+0x2330/0x2330
>> [  854.542894]  ? rtnl_link_fill+0x900/0x900
>> [  854.543446]  ? __lock_acquire+0xd43/0x1dd0
>> [  854.544037]  netlink_rcv_skb+0x14c/0x400
>> [  854.544581]  ? rtnl_link_fill+0x900/0x900
>> [  854.545132]  ? netlink_ack+0xd70/0xd70
>> [  854.545851]  ? debug_smp_processor_id+0x17/0x20
>> [  854.546369]  ? __lock_release.isra.0+0x49c/0xae0
>> [  854.546939]  ? netlink_deliver_tap+0x143/0x350
>> [  854.547478]  ? netlink_deliver_tap+0x143/0x350
>> [  854.548062]  ? __this_cpu_preempt_check+0x13/0x20
>> [  854.548620]  ? netlink_deliver_tap+0xc8/0x350
>> [  854.549149]  rtnetlink_rcv+0x10/0x20
>> [  854.549708]  netlink_unicast+0x45c/0x790
>> [  854.550211]  ? netlink_attachskb+0x7f0/0x7f0
>> [  854.550802]  netlink_sendmsg+0x7eb/0xdb0
>> [  854.551302]  ? netlink_unicast+0x790/0x790
>> [  854.551847]  ? unix_ioctl+0x358/0x400
>> [  854.552338]  ? selinux_socket_sendmsg+0x31/0x40
>> [  854.552873]  ? netlink_unicast+0x790/0x790
>> [  854.553360]  __sock_sendmsg+0xc9/0x160
>> [  854.553901]  ? sock_do_ioctl+0xcf/0x1e0
>> [  854.554387]  __sys_sendto+0x1ca/0x290
>> [  854.554925]  ? __ia32_sys_getpeername+0xa0/0xa0
>> [  854.555413]  ? ioctl_has_perm.constprop.0.isra.0+0x276/0x430
>> [  854.556005]  ? sock_ioctl+0x24d/0x540
>> [  854.556497]  ? br_ioctl_call+0x90/0x90
>> [  854.557047]  ? selinux_file_ioctl+0x108/0x250
>> [  854.557538]  ? debug_smp_processor_id+0x17/0x20
>> [  854.558076]  __x64_sys_sendto+0xdb/0x1a0
>> [  854.558588]  ? __this_cpu_preempt_check+0x13/0x20
>> [  854.559170]  ? lockdep_hardirqs_on+0x7d/0x100
>> [  854.559716]  x64_sys_call+0x8a2/0x9e0
>> [  854.560209]  do_syscall_64+0x65/0x130
>> [  854.560807]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
>> [  854.561300] RIP: 0033:0x7f0ef17cb750
>> [  854.561848] Code: ff eb bc 0f 1f 80 00 00 00 00 f3 0f 1e fa 41 89 ca 64 8b 04 25 18 00 00 00 85 c0 75 1d 45 31 c9 45 31 c0 b8 2c 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 68 c3 0f 1f 80 00 00 00 00 55 48 83 ec 20 48
>> [  854.562946] RSP: 002b:00007ffc4306af98 EFLAGS: 00000246 ORIG_RAX: 000000000000002c
>> [  854.563506] RAX: ffffffffffffffda RBX: 0000000000000006 RCX: 00007f0ef17cb750
>> [  854.564122] RDX: 0000000000000028 RSI: 00007ffc4306afb0 RDI: 0000000000000005
>> [  854.564738] RBP: 0000556901de3960 R08: 0000000000000000 R09: 0000000000000000
>> [  854.565298] R10: 0000000000000000 R11: 0000000000000246 R12: 00000000ffffffff
>> [  854.565945] R13: 00007ffc4306afb0 R14: 0000000000000005 R15: 0000556901e2b1f1
>> [  854.566522]  </TASK>
> Thanks. there is a race here: ath12k_mac_arvif_get_arp_ns_offload() is called by two functions and it allocate memory in the first call. So if it is called firstly by ath12k_mac_op_ipv6_changed(), above bug shows. But if it is called firstly by ath12k_mac_bss_info_changed(), there is no issue. This explains why I did not hit it before.
> 
> Anyway, will fix it in next version.
> 
>>
>>
> 

