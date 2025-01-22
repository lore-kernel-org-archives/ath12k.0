Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED75C02182
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 07:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4X7BNq01MvwoHkjIx/83HPQVqt+ifEDPn7LCKHiW0EU=; b=gg305akZL3Lsxg1VCSr5vjo8+m
	NQCHepE/rYLIY+UWVgImPDdc36FVEs4ZH7mPsGhcOn4SgDmfwekwN9IZe2Js9gXcKZ1uRydNZk6N2
	/TOsO9eBjo8jt76nAxiFu++KiHiIxw4wlJI49EBZvlUMCbkK1YEg02MHxAKyuwiTofZ62xhnhq1VQ
	Ok0JGZ1eqNTd3MXQcrAI490/FQumENbIGpOabEh83KUtQPzW1hEfs+Mt4tFLAey1DHzvwAR0YLmmt
	iTGFO4xt+jP/9Fzm/mNqP7Y5w0jhiWBEf+HYPJWjeGj9qfZjuy0kjHRYxVm/old//2ZfNLLqKMwQH
	+9oAt2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taV2g-00000009ao4-0ET4
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 07:20:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taV2d-00000009amd-1kil
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 07:20:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6I7JL023350
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 07:20:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4X7BNq01MvwoHkjIx/83HPQVqt+ifEDPn7LCKHiW0EU=; b=noeBDmey3ltJxaBk
	tenfwv7s9HRlkhRwE+D3hVV1/i1leykvCrs9IVNFBywM00Xj2XJhV2tFgMY4z5aA
	h1yrVYhiBlfNzb3bw7TzHttcVOoI1OiZHfLYlU4AlLyY+v/Bf6aZSC5DIc1RbyzS
	CyMwA2GWf+4qnZSe1zFRJUQE5lGGqoSHWp8R33RA+SR0UpsAwMRZ+2SM+mDmneiS
	fUV6EukEWxR7SAK+8KPkqnvu52OvPOVb8klXkyaicWAJHW239ChazDdjoPj/5Ie7
	WD7f3StY3Va5KtI/MdoFZODOts2KdoXLUwPXDr3ECy8cxsPsbaxJPRsbsSfm3qvR
	zaAxMw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44au9eg4s5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 07:20:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50M7Ki4L019107
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 07:20:44 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 21 Jan
 2025 23:20:44 -0800
Message-ID: <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
Date: Wed, 22 Jan 2025 15:20:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
To: <ath12k@lists.infradead.org>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QdhySPziSAEYkqBH3ddYvc46dZMQuve9
X-Proofpoint-ORIG-GUID: QdhySPziSAEYkqBH3ddYvc46dZMQuve9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_03,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_232047_598659_6D00C759 
X-CRM114-Status: GOOD (  20.70  )
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



On 1/21/2025 10:19 PM, Parth Panchoil wrote:
> Hi All,
> 
> I am performing tests on the SX-PCEBE Wi-Fi module, which utilizes the
> ATH12k driver, on the Texas Instruments AM69-SK board.
> The board is running the TI Linux Kernel from the ti-linux-6.6.y

6.6 is too old, and besides we don;t support customer kernel.

Could you try latest ath tree [1] or the mainline tree [2]?

[1] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/

If the issue is still seen, please enable verbose ath12k log using below command and help
collect dmesg logs:

	sudo modprobe ath12k debug_mask=0xffffffff

One more thing, the open-WRT patch is overkill, can you narrow down to find which line of
code in ath12k_pci_enable_ltssm() is causing this issue?


> branch. During testing, I observed a kernel crash from the ATH12k
> driver as soon as the probe is called. The crash log is as follows:
> 
> [    9.492631] Kernel panic - not syncing: Asynchronous SError
> Interrupt
> [    9.492634] CPU: 7 PID: 222 Comm: (udev-worker) Not tainted 6.6.58-
> 01497-ga7758da17c28-dirty #1
> [    9.492638] Hardware name: Texas Instruments AM69 SK (DT)
> [    9.492640] Call trace:
> [    9.492642]  dump_backtrace+0x94/0xec
> [    9.492658]  show_stack+0x18/0x24
> [    9.492662]  dump_stack_lvl+0x48/0x60
> [    9.492669]  dump_stack+0x18/0x24
> [    9.492672]  panic+0x320/0x378
> [    9.492677]  nmi_panic+0x8c/0x90
> [    9.492681]  arm64_serror_panic+0x6c/0x78
> [    9.492686]  do_serror+0x3c/0x78
> [    9.492692]  el1h_64_error_handler+0x34/0x4c
> [    9.492697]  el1h_64_error+0x64/0x68
> [    9.492700]  ath12k_pci_read32+0x1bc/0x1e8 [ath12k]
> [    9.492725]  ath12k_pci_power_up+0xdc/0x340 [ath12k]
> [    9.492747]  ath12k_core_init+0x2c/0xa8 [ath12k]
> [    9.492769]  ath12k_pci_probe+0x698/0x908 [ath12k]
> [    9.492791]  pci_device_probe+0xa8/0x16c
> [    9.492800]  really_probe+0x110/0x27c
> [    9.492805]  __driver_probe_device+0x78/0x12c
> [    9.492808]  driver_probe_device+0x3c/0x118
> [    9.492810]  __driver_attach+0x74/0x124
> [    9.492813]  bus_for_each_dev+0x78/0xd8
> [    9.492819]  driver_attach+0x24/0x30
> [    9.492824]  bus_add_driver+0xe4/0x208
> [    9.492828]  driver_register+0x60/0x128
> [    9.492831]  __pci_register_driver+0x44/0x50
> [    9.492835]  ath12k_pci_init+0x2c/0x6c [ath12k]
> [    9.492858]  do_one_initcall+0x70/0x1b4
> [    9.492861]  do_init_module+0x58/0x1e4
> [    9.492867]  load_module+0x19bc/0x1a8c
> [    9.492869]  init_module_from_file+0x88/0xc4
> [    9.492873]  __arm64_sys_finit_module+0x1c0/0x2ac
> [    9.492877]  invoke_syscall+0x44/0x108
> [    9.492882]  el0_svc_common.constprop.0+0xc0/0xe0
> [    9.492885]  do_el0_svc+0x1c/0x28
> [    9.492889]  el0_svc+0x2c/0x84
> [    9.492892]  el0t_64_sync_handler+0xc0/0xc4
> [    9.492895]  el0t_64_sync+0x190/0x194
> [    9.492899] SMP: stopping secondary CPUs
> [    9.492908] Kernel Offset: disabled
> [    9.492909] CPU features: 0x0,80000200,28020000,1000420b
> [    9.492913] Memory Limit: none
> 
> Upon searching online, I found the OpenWRT patch that appears to
> address a similar issue: OpenWRT Patch: Prevent LTSSM Startup Crash.
> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=package/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.patch;h=cd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=935b2b7dcef61b2893ed5dff307dd8f8a1156899
> With the above patch applied, I do not see the crash anymore.
> 
> Could anyone confirm if this issue has been reported before/known bug
> or provide any insights? 
> Any additional information or suggestions would be greatly appreciated.
> 
> Details about the test setup,
> TI-AM69-SK board:
> https://www.ti.com/tool/SK-AM69?keyMatch=am69%20sk&tisearch=universal_search
> Silex WiFi card SX-PCEBE:
> https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx-pcebe
> TI Linux Repo:
> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.6.y
> 
> Thank you.
> 
> Regards,
> Parth P
> 


