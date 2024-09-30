Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AFCCEB2C9
	for <ath12k@archiver.kernel.org>; Mon, 30 Sep 2024 21:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pms573lxqBUzUs++iH9ZSuWuzqWOKhKMtahOq9MGFUQ=; b=Ua4d30KvHDSyTJDUqM0eDevoY5
	S1s1M20ITJw1/qeFqkkSBccf9Zmw6Faap8MOC21MxXz2A7s5hu/dhPRugdwnuJKtnbVg7dnEOCWYm
	MoMDLvdJKFMTiSRltS/3gsygp+y6j2s9ygJ9QdE+VvlE46zLZhnkmU5a7su3tB4FTAHcJgO/yl5+F
	BavN0m2r6hAJsFxFknA3/rl28yUM5F1vY40QAum6gMf784j5K9v1kdwJAtqFlV58ZF9Y9m8MkzEpa
	F36eVYbAF5chirVVyfBSPoGzDiZZuDYgz8MSNjqWu7fTgJq4+bSENdRx5d+f/hyNIMZ+R7cseQEPA
	pyVVqg+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNgT-00000000rhi-130j
	for ath12k@archiver.kernel.org;
	Mon, 30 Sep 2024 21:11:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svNaI-00000000quh-1bxv
	for ath12k@lists.infradead.org;
	Mon, 30 Sep 2024 21:05:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48UJrSYG018007;
	Mon, 30 Sep 2024 21:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pms573lxqBUzUs++iH9ZSuWuzqWOKhKMtahOq9MGFUQ=; b=h+19Aty3eCzEENfF
	hBVJ46VRCeMcwhkqkIOuT7nIgUFlmp3SkYSCnI9fADhKD1A06b+0s0rAqOJfzaoE
	TvtteqUuR/NIcjCYiY/b5VhpaS58d9w2KfG54JuKVPjapDOOlSqlflGANM4AGkJi
	84K3yyeCpWbCXLIfAnNtOhokyqj+lNWEKDabNkMRCsoYD0yLSDv0Fwo67SL4GvFc
	pWH1jrIp+7VipgkFl7IeoHyoD8iuTT+jDPlzUgahZwCTvmGZFkeu+0ez7qv7vmqf
	gUi8+Kzlbj9K9hNMlf9dP8TMmBtI30ftGOW4BKINH3wYCqj4f+n91nwI26AQIdTJ
	vhck4A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x7ge688r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:05:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48UL5W91030108
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Sep 2024 21:05:32 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 30 Sep
 2024 14:05:31 -0700
Message-ID: <5c0a95a4-99e3-4a98-b008-a71a0eaaabef@quicinc.com>
Date: Mon, 30 Sep 2024 14:05:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix use-after-free in
 ath12k_dp_cc_cleanup()
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240926020931.3424376-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240926020931.3424376-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: H4JPgAnBHfEwPmgtj4mbmZJ0AazkjyFM
X-Proofpoint-GUID: H4JPgAnBHfEwPmgtj4mbmZJ0AazkjyFM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409300152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_140534_577197_8EC0DF6D 
X-CRM114-Status: GOOD (  26.60  )
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

On 9/25/2024 7:09 PM, Rameshkumar Sundaram wrote:
> During ath12k module removal, in ath12k_core_deinit(),
> ath12k_mac_destroy() un-registers ah->hw from mac80211 and frees
> the ah->hw as well as all the ar's in it. After this
> ath12k_core_soc_destroy()-> ath12k_dp_free()-> ath12k_dp_cc_cleanup()
> tries to access one of the freed ar's from pending skb.
> 
> This is because during mac destroy, driver failed to flush few
> data packets, which were accessed later in ath12k_dp_cc_cleanup()
> and freed, but using ar from the packet led to this use-after-free.
> 
> BUG: KASAN: use-after-free in ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
> Write of size 4 at addr ffff888150bd3514 by task modprobe/8926
> CPU: 0 UID: 0 PID: 8926 Comm: modprobe Not tainted
> 6.11.0-rc2-wt-ath+ #1746
> Hardware name: Intel(R) Client Systems NUC8i7HVK/NUC8i7HVB, BIOS 
> HNKBLi70.86A.0067.2021.0528.1339 05/28/2021
> 
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x7d/0xe0
>   print_address_description.constprop.0+0x33/0x3a0
>   print_report+0xb5/0x260
>   ? kasan_addr_to_slab+0x24/0x80
>   kasan_report+0xd8/0x110
>   ? ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
>   ? ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
>   kasan_check_range+0xf3/0x1a0
>   __kasan_check_write+0x14/0x20
>   ath12k_dp_cc_cleanup.part.0+0x5e2/0xd40 [ath12k]
>   ath12k_dp_free+0x178/0x420 [ath12k]
>   ath12k_core_stop+0x176/0x200 [ath12k]
>   ath12k_core_deinit+0x13f/0x210 [ath12k]
>   ath12k_pci_remove+0xad/0x1c0 [ath12k]
>   pci_device_remove+0x9b/0x1b0
>   device_remove+0xbf/0x150
>   device_release_driver_internal+0x3c3/0x580
>   ? __kasan_check_read+0x11/0x20
>   driver_detach+0xc4/0x190
>   bus_remove_driver+0x130/0x2a0
>   driver_unregister+0x68/0x90
>   pci_unregister_driver+0x24/0x240
>   ? find_module_all+0x13e/0x1e0
>   ath12k_pci_exit+0x10/0x20 [ath12k]
>   __do_sys_delete_module+0x32c/0x580
>   ? module_flags+0x2f0/0x2f0
>   ? kmem_cache_free+0xf0/0x410
>   ? __fput+0x56f/0xab0
>   ? __fput+0x56f/0xab0
>   ? debug_smp_processor_id+0x17/0x20
>   __x64_sys_delete_module+0x4f/0x70
>   x64_sys_call+0x522/0x9f0
>   do_syscall_64+0x64/0x130
>   entry_SYSCALL_64_after_hwframe+0x4b/0x53
> RIP: 0033:0x7f8182c6ac8b
> 
> Commit 24de1b7b231c ("wifi: ath12k: fix flush failure in recovery
> scenarios") added the change to decrement the pending packets count
> in case of recovery which make sense as ah->hw as well all
> ar's in it are intact during recovery, but during core deinit there
> is no use in decrementing packets count or waking up the empty waitq
> as the module is going to be removed also ar from pending skbs
> can't be used and the packets should just be released back.
> 
> To fix this, add additional vif check before trying to use the
> ar from skb->cb, because during core_deinit mac80211 will delete
> all the vifs and ath12k will remove these vif's reference
> (ath12k_mac_vif_unref()) from pending packets.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 24de1b7b231c ("wifi: ath12k: fix flush failure in recovery scenarios")
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 61aa78d8bd8c..09363ca15701 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1203,9 +1203,14 @@ static void ath12k_dp_cc_cleanup(struct ath12k_base *ab)
>  				continue;
>  
>  			skb_cb = ATH12K_SKB_CB(skb);
> -			ar = skb_cb->ar;
> -			if (atomic_dec_and_test(&ar->dp.num_tx_pending))
> -				wake_up(&ar->dp.tx_empty_waitq);
> +			/* skb_cb's ar is valid only if the skb is associated with
> +			 * a valid vif.
> +			 */
> +			if (skb_cb->vif) {
> +				ar = skb_cb->ar;
> +				if (atomic_dec_and_test(&ar->dp.num_tx_pending))
> +					wake_up(&ar->dp.tx_empty_waitq);
> +			}
>  
>  			dma_unmap_single(ab->dev, ATH12K_SKB_CB(skb)->paddr,
>  					 skb->len, DMA_TO_DEVICE);
> 
> base-commit: d35bb26e150d7fb7434959fad9fcaeaac99906e6

dropping this since there will be a v2


