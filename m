Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AA9CF3188
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+R9xUtQWR+Sw1XdO5QF5AXylA7stnEwUMbRSf4or5M=; b=CgONdz85zKLv9cckchUuiuF1pZ
	aEDoAZrkqEs44tCcsY6xQnrGEX45u0G5A5a0G5jLs6lgFF0iZ5/ML8o8p1kpkle3PIxKZgWWXPKS5
	GnPNXNvFsTIBQXI8lk93aFk95NtjlqgdXVuxlv435dJYucnGZVB1nLjt+Y+NokAMrNtKhox2vkqqS
	tsyR+blQB0dE1Jd/idqItTPEov6g80mY5c47LaNF7tj5lCGuVMEWjZ3+5WfyGPI/Ih2LBflUkQIJ1
	u8QrnKWCRpqZmW4TDX7+bOCFDhx6mm3O27eAuV5F0BZw0K7glvTJv4wpWoRfOb+UcGUM7QMBlph2Z
	hSsRQiuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svlAt-00000004BnH-0EVX
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 22:16:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlAp-00000004BmY-3pxa
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 22:16:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 491BTbjc008088;
	Tue, 1 Oct 2024 22:16:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p+R9xUtQWR+Sw1XdO5QF5AXylA7stnEwUMbRSf4or5M=; b=U/2/B+3lqTCU3nc2
	PRIvUxyo07oztN0ftkdC226BU5kiqgvK4CBsmJB7IvGCUQwjAvW1O0sjKTsbtCo8
	yEIfV0UZhJZOT6lavV1iav2H0DgI89z3iPME2BkDDpWFS71jh3aj9Y6M8d+W2L9J
	vwCgMNGfQ1xVXly3PbdARMk3lFbqoyhejx+MdImcUwMb62GdNv8QV217ctH3BxxM
	VJeZI6sgB6lSHe6TKptt4L8ZacaMSZjc+njCFqAFsKh8Ie+cHXiH/Mjg+4ZORiUP
	JcO/l5lsXaeZYx0dDZ4fNsLGxmpEIfhBUJT92xF1jAxVpwSWF22J6rkZ1xPTtNgv
	/khaoQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xa679tqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 22:16:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 491MGliv020504
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 22:16:47 GMT
Received: from [10.111.183.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 1 Oct 2024
 15:16:46 -0700
Message-ID: <14db82b4-dfc0-4f21-a6aa-d6ed80f42638@quicinc.com>
Date: Tue, 1 Oct 2024 15:16:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix use-after-free in
 ath12k_dp_cc_cleanup()
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241001092652.3134334-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241001092652.3134334-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bekQMfh69v7Qf9libl6MpJg52gyuMD6P
X-Proofpoint-ORIG-GUID: bekQMfh69v7Qf9libl6MpJg52gyuMD6P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=901 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_151652_188975_EE2770A1 
X-CRM114-Status: GOOD (  16.59  )
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

On 10/1/2024 2:26 AM, Rameshkumar Sundaram wrote:
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
> as the module is going to be removed also ar's from pending skb's
> can't be used and the packets should just be released back.
> 
> To fix this, avoid accessing ar from skb->cb when driver is being
> unregistered.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 24de1b7b231c ("wifi: ath12k: fix flush failure in recovery scenarios")
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


