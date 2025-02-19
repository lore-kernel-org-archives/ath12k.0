Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53EBFC021B1
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 10:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SF5CzQBpmgp2/e2cwZylR7sML3sJuTUwc9XfDJMocI0=; b=ndsPhBjyTxAhODTdx400/eTDMS
	pOnOWeauTIGQbmyh2Gri+LGWYCDSJdnNTxrHnd0VRyxw0CLgA4b30bWpC52o8+YmVU6H+tQYpmuR9
	0V3Yqm3NYaD2+N/8jsA/lgaY8khfm/Va7prlJmByunDVdQ7w4HyslPSWjZYJFfYLyoBv6zUWIvy4n
	isuM2eSyr6gVkQixtDG0CYYzzQhliPZdz2LVIXlTiIkGgz6olCATOFNvqQxH+JNXJ2D5ejDrRd0Iw
	ioWWvTGJvP0OeeFQa8ssD5OGoVfzBuRGWzYtQfsfIVRj5V+C+dCXobCTnvemujVUzHuuWKkfLlDIb
	Cte9k+bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkhZu-0000000CDK8-01nM
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 10:45:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh9r-0000000C6bA-3b76
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 10:18:25 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J8KPDB002627;
	Wed, 19 Feb 2025 10:18:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SF5CzQBpmgp2/e2cwZylR7sML3sJuTUwc9XfDJMocI0=; b=ZKsfbByA+zPmWLfM
	C9zrH9o8JDv3R3h4KEPi5LDQT8q/nxSrOTOlTHObQ53RUZQw6rZtyAKIJtTMe4oG
	03MWWRCeLcOpzAIM0IojmGulx9J9Xx/YGdMX8PTlRcgzfNPh4mhQ5MbHiNM3Dgv6
	1T0Few+KU52BfGecpW0rP2rfrKAyULP6ljMXLOhXcEAokdapKolnkE96Qdykn3qq
	/K69m6KvIQqmb2EjvCq5h0cPRmcm43Ps0DV6OT+qKPlOlu2c+9ls60/DNcjPtNYV
	LL3TLIcq96mMYn2SkHCcwCEquGItc6OWabjJ3OJqDi+KyAZ9R6rTz6Z1MRuJraff
	OlA0vg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2a325-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:18:21 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51JAIKuR020581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 10:18:20 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Feb
 2025 02:18:19 -0800
Message-ID: <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
Date: Wed, 19 Feb 2025 18:18:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: Parth Panchoil <parth105105@gmail.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
 <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
Content-Language: en-US
In-Reply-To: <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: O_rU_xugMZ6vu_ay3SFOzPD4IW4zTzJC
X-Proofpoint-GUID: O_rU_xugMZ6vu_ay3SFOzPD4IW4zTzJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_04,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_021823_902693_1E27E6B6 
X-CRM114-Status: GOOD (  25.58  )
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



On 2/5/2025 10:20 AM, Baochen Qiang wrote:
> 
> 
> On 1/27/2025 10:01 PM, Parth Panchoil wrote:
>> Hi,
>>
>> I am currently debugging the ath12k_pci_enable_ltssm start up crash/bug
>> with the mainline kernel on my system and would like to share my
>> observations so far:
>>
>> The ath12k mainline driver gets stuck at this specific line: 
>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
>> in the ath12k_pci_enable_ltssm  which attempts to read
>> GCC_GCC_PCIE_HOT_RST, particularly
>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209
> 
> thanks for the narrow down, really helpful.
> 
> We internally have observed this issue, although at a different line:
> 
> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L298
> 
> For now I am suspecting that GCC_GCC_PCIE_HOT_RST is not a valid register on WLAN target
> side, I will check internally and get back.

Parth, could you do below change and try again?

-#define GCC_GCC_PCIE_HOT_RST			0x1e38338
+#define GCC_GCC_PCIE_HOT_RST			0x1e40304

> 
>>
>> Interestingly, within the same function, the line val =
>> ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM) successfully reads the
>> expected value 0x111 for PCIE_PCIE_PARF_LTSSM.
>>
>> I am continuing to debug from my end, although my understanding of the
>> ath12k driver is limited. Any leads, suggestions, or hints to help
>> resolve this issue would be greatly appreciated.
>>
>> Thank you.
>>
>> Regards,
>> Parth P
>>
>>
>> On Fri, 2025-01-24 at 10:02 +0000, Parth Pancholi wrote:
>>> I appreciate your response, Baochen.
>>>
>>> I have been working on enabling mainline kernel support on my TI
>>> AM69-
>>> SK board to test the mainline ath12k driver on my system.
>>>
>>> Using the mainline kernel repository for the ath drivers [1], I made
>>> the following observation: 
>>> While the exact crash observed earlier is no longer present, the
>>> system
>>> hangs upon loading the ath12k mainline driver, displaying the
>>> messages
>>> below.
>>>
>>> root@am69-sk:~# modprobe ath12k debug_mask=0xffffffff
>>> [ 1121.996554] ath12k_pci 0000:01:00.0: BAR 0 [mem 0x4410200000-
>>> 0x44103fffff 64bit]: assigned
>>> [ 1122.004884] ath12k_pci 0000:01:00.0: enabling device (0000 ->
>>> 0002)
>>> [ 1122.011818] ath12k_pci 0000:01:00.0: MSI vectors: 16
>>> [ 1122.016798] ath12k_pci 0000:01:00.0: Hardware name: wcn7850 hw2.0
>>> [ 1122.040183] NET: Registered PF_QIPCRTR protocol family
>>>
>>> root@am69-sk:~# uname -a
>>> Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #2 SMP PREEMPT
>>> Wed
>>> Jan 22 16:55:17 CET 2025 aarch64 GNU/Linux
>>>
>>> root@am69-sk:~# lspci
>>> 0000:00:00.0 PCI bridge: Texas Instruments Device b012
>>> 0000:01:00.0 Network controller: Qualcomm Technologies, Inc WCN785x
>>> Wi-
>>> Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
>>> 0001:00:00.0 PCI bridge: Texas Instruments Device b012
>>> 0002:00:00.0 PCI bridge: Texas Instruments Device b012
>>>
>>> Do you have any insights into what might still be missing or
>>> incorrect
>>> in my setup?
>>>
>>> Regards,
>>> Parth P
>>>
>>> On Wed, 2025-01-22 at 15:20 +0800, Baochen Qiang wrote:
>>>>
>>>>
>>>> On 1/21/2025 10:19 PM, Parth Panchoil wrote:
>>>>> Hi All,
>>>>>
>>>>> I am performing tests on the SX-PCEBE Wi-Fi module, which
>>>>> utilizes
>>>>> the
>>>>> ATH12k driver, on the Texas Instruments AM69-SK board.
>>>>> The board is running the TI Linux Kernel from the ti-linux-6.6.y
>>>>
>>>> 6.6 is too old, and besides we don;t support customer kernel.
>>>>
>>>> Could you try latest ath tree [1] or the mainline tree [2]?
>>>>
>>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>> [2]
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>
>>>> If the issue is still seen, please enable verbose ath12k log using
>>>> below command and help
>>>> collect dmesg logs:
>>>>
>>>>         sudo modprobe ath12k debug_mask=0xffffffff
>>>>
>>>> One more thing, the open-WRT patch is overkill, can you narrow down
>>>> to find which line of
>>>> code in ath12k_pci_enable_ltssm() is causing this issue?
>>>>
>>>>
>>>>> branch. During testing, I observed a kernel crash from the ATH12k
>>>>> driver as soon as the probe is called. The crash log is as
>>>>> follows:
>>>>>
>>>>> [    9.492631] Kernel panic - not syncing: Asynchronous SError
>>>>> Interrupt
>>>>> [    9.492634] CPU: 7 PID: 222 Comm: (udev-worker) Not tainted
>>>>> 6.6.58-
>>>>> 01497-ga7758da17c28-dirty #1
>>>>> [    9.492638] Hardware name: Texas Instruments AM69 SK (DT)
>>>>> [    9.492640] Call trace:
>>>>> [    9.492642]  dump_backtrace+0x94/0xec
>>>>> [    9.492658]  show_stack+0x18/0x24
>>>>> [    9.492662]  dump_stack_lvl+0x48/0x60
>>>>> [    9.492669]  dump_stack+0x18/0x24
>>>>> [    9.492672]  panic+0x320/0x378
>>>>> [    9.492677]  nmi_panic+0x8c/0x90
>>>>> [    9.492681]  arm64_serror_panic+0x6c/0x78
>>>>> [    9.492686]  do_serror+0x3c/0x78
>>>>> [    9.492692]  el1h_64_error_handler+0x34/0x4c
>>>>> [    9.492697]  el1h_64_error+0x64/0x68
>>>>> [    9.492700]  ath12k_pci_read32+0x1bc/0x1e8 [ath12k]
>>>>> [    9.492725]  ath12k_pci_power_up+0xdc/0x340 [ath12k]
>>>>> [    9.492747]  ath12k_core_init+0x2c/0xa8 [ath12k]
>>>>> [    9.492769]  ath12k_pci_probe+0x698/0x908 [ath12k]
>>>>> [    9.492791]  pci_device_probe+0xa8/0x16c
>>>>> [    9.492800]  really_probe+0x110/0x27c
>>>>> [    9.492805]  __driver_probe_device+0x78/0x12c
>>>>> [    9.492808]  driver_probe_device+0x3c/0x118
>>>>> [    9.492810]  __driver_attach+0x74/0x124
>>>>> [    9.492813]  bus_for_each_dev+0x78/0xd8
>>>>> [    9.492819]  driver_attach+0x24/0x30
>>>>> [    9.492824]  bus_add_driver+0xe4/0x208
>>>>> [    9.492828]  driver_register+0x60/0x128
>>>>> [    9.492831]  __pci_register_driver+0x44/0x50
>>>>> [    9.492835]  ath12k_pci_init+0x2c/0x6c [ath12k]
>>>>> [    9.492858]  do_one_initcall+0x70/0x1b4
>>>>> [    9.492861]  do_init_module+0x58/0x1e4
>>>>> [    9.492867]  load_module+0x19bc/0x1a8c
>>>>> [    9.492869]  init_module_from_file+0x88/0xc4
>>>>> [    9.492873]  __arm64_sys_finit_module+0x1c0/0x2ac
>>>>> [    9.492877]  invoke_syscall+0x44/0x108
>>>>> [    9.492882]  el0_svc_common.constprop.0+0xc0/0xe0
>>>>> [    9.492885]  do_el0_svc+0x1c/0x28
>>>>> [    9.492889]  el0_svc+0x2c/0x84
>>>>> [    9.492892]  el0t_64_sync_handler+0xc0/0xc4
>>>>> [    9.492895]  el0t_64_sync+0x190/0x194
>>>>> [    9.492899] SMP: stopping secondary CPUs
>>>>> [    9.492908] Kernel Offset: disabled
>>>>> [    9.492909] CPU features: 0x0,80000200,28020000,1000420b
>>>>> [    9.492913] Memory Limit: none
>>>>>
>>>>> Upon searching online, I found the OpenWRT patch that appears to
>>>>> address a similar issue: OpenWRT Patch: Prevent LTSSM Startup
>>>>> Crash.
>>>>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=package/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.patch;h=cd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=935b2b7dcef61b2893ed5dff307dd8f8a1156899
>>>>> With the above patch applied, I do not see the crash anymore.
>>>>>
>>>>> Could anyone confirm if this issue has been reported before/known
>>>>> bug
>>>>> or provide any insights? 
>>>>> Any additional information or suggestions would be greatly
>>>>> appreciated.
>>>>>
>>>>> Details about the test setup,
>>>>> TI-AM69-SK board:
>>>>> https://www.ti.com/tool/SK-AM69?keyMatch=am69%20sk&tisearch=universal_search
>>>>> Silex WiFi card SX-PCEBE:
>>>>> https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx-pcebe
>>>>> TI Linux Repo:
>>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.6.y
>>>>>
>>>>> Thank you.
>>>>>
>>>>> Regards,
>>>>> Parth P
>>>>>
>>>>
>>>>
>>>
>>>
>>
> 
> 


