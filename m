Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17310C3ABBC
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 06:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Wc0hm+n6UKiWxzIYtpoET5VcgS2/mxj+ZqP6V0mNSY=; b=rJKrib6CgoJQ/iTBHFMYbl0JDN
	XZDR2mTXRG/Qr4IBZ0Vsw/wjouScfRF7ctUkFtnYnzn2bvcpMCrpZ5TL4Q2gYLwsLz2PZ2pQrWS83
	MsnqeQyWbqn8oedQP749+A2Go4p6/wfVPQl/RnqqVsGV7MeqNwR/1WSaAMC3a2Y6EgHqaVY6Qo32f
	7UsQW3QddFPpln0ctW4l/i2sO65cvM4XYi2TJDn+yyichMPzjF3KwXkH9bivC2VPAEjrjKqSry4fE
	p6O0vP17wWQgIWE69RLJQI5yRkPmeYc+L3HecnmodYkmPdBVtoELkBae+RS2m8kAsOFJ0VGAhHbgZ
	YS+10/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBqK-0000000AhB0-3J0n;
	Tue, 06 May 2025 06:31:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBHv-0000000AYD7-0AoJ
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 05:56:20 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545KTdH4029787;
	Tue, 6 May 2025 05:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Wc0hm+n6UKiWxzIYtpoET5VcgS2/mxj+ZqP6V0mNSY=; b=o5NwN9/kKWCfjNoo
	1z1IApUfTSDtvoSzul2CQK8phYzN1kk5ei5yoEUSf7C7OZMUZ00t+tgjiDk7EQ3C
	NmiihsN8PyDYaGOSZs5cbRsoOZtBFhlh1hmKCOGqjhKioibemHRFoLmafpgLFm0g
	a9q/EEj1v3SmLUUxr+oX8LxRZ6UqEbllOyRYV8HvF6owWre/2BG7v4T++Bue64+e
	HXXSBVQhzq1rmOTzh+s1iUVdAgX7zUcEAVqEz35dkxWOVngqX3BlUfZa+Fm4jDIS
	u1JFVOqvOm4hyd4sGTLiUJ9x2vdp/iV4dt7sH8UPQzv1MIGBrxOTRI6ZEwXiqM6S
	ycWEHg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rxfdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 May 2025 05:56:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5465uF9m017582
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 May 2025 05:56:15 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 May 2025
 22:56:14 -0700
Message-ID: <6ee296a1-1cb9-4187-9c74-222bea54843b@quicinc.com>
Date: Tue, 6 May 2025 13:56:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: wifi: ath12k: start-up crash with WCN7850 hw2.0 on TI AM69-SK
 board
To: Parth Panchoil <parth105105@gmail.com>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <86899b2235a59c9134603beebe08f2bb0b244ea0.camel@gmail.com>
 <a15a1557-e5fb-404c-9031-21efbaa7e679@quicinc.com>
 <c710004338102c19e5c05fb03d3256ccbdabd5f7.camel@toradex.com>
 <afe586a1acf458edcfe7cf76f4dcfa8b18ad716a.camel@gmail.com>
 <28b5436a-556b-4b0e-a66c-eec453f4f5b8@quicinc.com>
 <6aa877c8-322d-44eb-a8ca-5d00ffa63d8f@quicinc.com>
 <479bd0f6ef7fbb5f0e0d0d8f71a804002e6b5f6b.camel@gmail.com>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <479bd0f6ef7fbb5f0e0d0d8f71a804002e6b5f6b.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MdndXT9NQsdJwvqKe7i1T47MUAIfWK-8
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=6819a480 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=jdP34snFAAAA:8 a=sozttTNsAAAA:8 a=a-zRGgT0AAAA:8
 a=TuVltBlNJTVy-sdIfFsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=jlphF6vWLdwq7oh3TaWq:22 a=IkFK-M677-wC91MmSCEv:22
X-Proofpoint-GUID: MdndXT9NQsdJwvqKe7i1T47MUAIfWK-8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDA1NCBTYWx0ZWRfXx9akwq0JzSAs
 /DGBFoQMBMmw4wM8a4n5AXuAWfNseA7WtCyZmpt5nYFcZEJLQyZiVtTCTqlzNfSrBlG9Ts0wXp+
 8ykNijeWKh5RSyNehSOJGtWT8kDPGDI3OLcrIKb33qJCAqVWDWUcO3xV1vncjhZnkpzGUX1lS5J
 XsSjSwMdrsfB5cr6/V1C3aTrr6UYVBMHFeCaeHF/DTk9G10LCGth1t/W8anPvOOth/7N5g8ECQb
 AKBlpXg+oH0Io4ba7gHXXWbkQXeIbcPm9G2VZkyy5rYgW6F58Mnje6UqfmVlmP2INrjwGzEFeBq
 /nuQlAf+MKao1DGQ6rqWC8n/jSA642S7CDHpdmKceBRhnlXu/mcDREbeTJmgFQvMRuV+alyym9y
 KL00wr2hPwqvHFmnVvu9Dwvs9uCHE9YU7SqYLFgFlR7aSB6u8EakuyPTMiOuZlke4meDvNji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_03,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 clxscore=1011 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_225619_093729_68F91578 
X-CRM114-Status: GOOD (  29.19  )
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



On 4/30/2025 8:50 PM, Parth Panchoil wrote:
> On Wed, 2025-02-19 at 18:18 +0800, Baochen Qiang wrote:
>>
>>
>> On 2/5/2025 10:20 AM, Baochen Qiang wrote:
>>>
>>>
>>> On 1/27/2025 10:01 PM, Parth Panchoil wrote:
>>>> Hi,
>>>>
>>>> I am currently debugging the ath12k_pci_enable_ltssm start up
>>>> crash/bug
>>>> with the mainline kernel on my system and would like to share my
>>>> observations so far:
>>>>
>>>> The ath12k mainline driver gets stuck at this specific line: 
>>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L295
>>>> in the ath12k_pci_enable_ltssm  which attempts to read
>>>> GCC_GCC_PCIE_HOT_RST, particularly
>>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L1209
>>>
>>> thanks for the narrow down, really helpful.
>>>
>>> We internally have observed this issue, although at a different
>>> line:
>>>
>>> https://github.com/torvalds/linux/blob/9c5968db9e625019a0ee5226c7eebef5519d366a/drivers/net/wireless/ath/ath12k/pci.c#L298
>>>
>>> For now I am suspecting that GCC_GCC_PCIE_HOT_RST is not a valid
>>> register on WLAN target
>>> side, I will check internally and get back.
>>
>> Parth, could you do below change and try again?
>>
>> -#define GCC_GCC_PCIE_HOT_RST                   0x1e38338
>> +#define GCC_GCC_PCIE_HOT_RST                   0x1e40304
>>
> Hi Baochen,
> 
> Thanks for the hint regarding the change.
> I tested this change on top of the ath-202504172310 tag on the TI AM69
> platform and can confirm that the startup crash no longer occurs. 

great it helps

> Interestingly, this issue was not observed on other platforms like the
> NXP iMX8MP.
> 
> If I understand correctly, the change is related to a WLAN target
> register. 
> 

correct

> Could you help clarify why this issue only affects certain platforms
> (hosts)?

GCC_GCC_PCIE_HOT_RST is wrongly defined, normally this should not cause any critical
issue, because IMO the RC is expected to return 0xffffffff when accessing a non-exist
register. However in your case kernel crashes, so seems RC does not behave well, maybe not
following spec?

anyway I will submit a patch to fix it.

> 
> Regards,
> Parth P
> 
>>>
>>>>
>>>> Interestingly, within the same function, the line val =
>>>> ath12k_pci_read32(ab, PCIE_PCIE_PARF_LTSSM) successfully reads
>>>> the
>>>> expected value 0x111 for PCIE_PCIE_PARF_LTSSM.
>>>>
>>>> I am continuing to debug from my end, although my understanding
>>>> of the
>>>> ath12k driver is limited. Any leads, suggestions, or hints to
>>>> help
>>>> resolve this issue would be greatly appreciated.
>>>>
>>>> Thank you.
>>>>
>>>> Regards,
>>>> Parth P
>>>>
>>>>
>>>> On Fri, 2025-01-24 at 10:02 +0000, Parth Pancholi wrote:
>>>>> I appreciate your response, Baochen.
>>>>>
>>>>> I have been working on enabling mainline kernel support on my
>>>>> TI
>>>>> AM69-
>>>>> SK board to test the mainline ath12k driver on my system.
>>>>>
>>>>> Using the mainline kernel repository for the ath drivers [1], I
>>>>> made
>>>>> the following observation: 
>>>>> While the exact crash observed earlier is no longer present,
>>>>> the
>>>>> system
>>>>> hangs upon loading the ath12k mainline driver, displaying the
>>>>> messages
>>>>> below.
>>>>>
>>>>> root@am69-sk:~# modprobe ath12k debug_mask=0xffffffff
>>>>> [ 1121.996554] ath12k_pci 0000:01:00.0: BAR 0 [mem
>>>>> 0x4410200000-
>>>>> 0x44103fffff 64bit]: assigned
>>>>> [ 1122.004884] ath12k_pci 0000:01:00.0: enabling device (0000 -
>>>>>>
>>>>> 0002)
>>>>> [ 1122.011818] ath12k_pci 0000:01:00.0: MSI vectors: 16
>>>>> [ 1122.016798] ath12k_pci 0000:01:00.0: Hardware name: wcn7850
>>>>> hw2.0
>>>>> [ 1122.040183] NET: Registered PF_QIPCRTR protocol family
>>>>>
>>>>> root@am69-sk:~# uname -a
>>>>> Linux am69-sk 6.13.0-rc7-wt-ath-ge7ef944b3e2c-dirty #2 SMP
>>>>> PREEMPT
>>>>> Wed
>>>>> Jan 22 16:55:17 CET 2025 aarch64 GNU/Linux
>>>>>
>>>>> root@am69-sk:~# lspci
>>>>> 0000:00:00.0 PCI bridge: Texas Instruments Device b012
>>>>> 0000:01:00.0 Network controller: Qualcomm Technologies, Inc
>>>>> WCN785x
>>>>> Wi-
>>>>> Fi 7(802.11be) 320MHz 2x2 [FastConnect 7800] (rev 01)
>>>>> 0001:00:00.0 PCI bridge: Texas Instruments Device b012
>>>>> 0002:00:00.0 PCI bridge: Texas Instruments Device b012
>>>>>
>>>>> Do you have any insights into what might still be missing or
>>>>> incorrect
>>>>> in my setup?
>>>>>
>>>>> Regards,
>>>>> Parth P
>>>>>
>>>>> On Wed, 2025-01-22 at 15:20 +0800, Baochen Qiang wrote:
>>>>>>
>>>>>>
>>>>>> On 1/21/2025 10:19 PM, Parth Panchoil wrote:
>>>>>>> Hi All,
>>>>>>>
>>>>>>> I am performing tests on the SX-PCEBE Wi-Fi module, which
>>>>>>> utilizes
>>>>>>> the
>>>>>>> ATH12k driver, on the Texas Instruments AM69-SK board.
>>>>>>> The board is running the TI Linux Kernel from the ti-linux-
>>>>>>> 6.6.y
>>>>>>
>>>>>> 6.6 is too old, and besides we don;t support customer kernel.
>>>>>>
>>>>>> Could you try latest ath tree [1] or the mainline tree [2]?
>>>>>>
>>>>>> [1]
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>>>> [2]
>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/
>>>>>>
>>>>>> If the issue is still seen, please enable verbose ath12k log
>>>>>> using
>>>>>> below command and help
>>>>>> collect dmesg logs:
>>>>>>
>>>>>>         sudo modprobe ath12k debug_mask=0xffffffff
>>>>>>
>>>>>> One more thing, the open-WRT patch is overkill, can you
>>>>>> narrow down
>>>>>> to find which line of
>>>>>> code in ath12k_pci_enable_ltssm() is causing this issue?
>>>>>>
>>>>>>
>>>>>>> branch. During testing, I observed a kernel crash from the
>>>>>>> ATH12k
>>>>>>> driver as soon as the probe is called. The crash log is as
>>>>>>> follows:
>>>>>>>
>>>>>>> [    9.492631] Kernel panic - not syncing: Asynchronous
>>>>>>> SError
>>>>>>> Interrupt
>>>>>>> [    9.492634] CPU: 7 PID: 222 Comm: (udev-worker) Not
>>>>>>> tainted
>>>>>>> 6.6.58-
>>>>>>> 01497-ga7758da17c28-dirty #1
>>>>>>> [    9.492638] Hardware name: Texas Instruments AM69 SK
>>>>>>> (DT)
>>>>>>> [    9.492640] Call trace:
>>>>>>> [    9.492642]  dump_backtrace+0x94/0xec
>>>>>>> [    9.492658]  show_stack+0x18/0x24
>>>>>>> [    9.492662]  dump_stack_lvl+0x48/0x60
>>>>>>> [    9.492669]  dump_stack+0x18/0x24
>>>>>>> [    9.492672]  panic+0x320/0x378
>>>>>>> [    9.492677]  nmi_panic+0x8c/0x90
>>>>>>> [    9.492681]  arm64_serror_panic+0x6c/0x78
>>>>>>> [    9.492686]  do_serror+0x3c/0x78
>>>>>>> [    9.492692]  el1h_64_error_handler+0x34/0x4c
>>>>>>> [    9.492697]  el1h_64_error+0x64/0x68
>>>>>>> [    9.492700]  ath12k_pci_read32+0x1bc/0x1e8 [ath12k]
>>>>>>> [    9.492725]  ath12k_pci_power_up+0xdc/0x340 [ath12k]
>>>>>>> [    9.492747]  ath12k_core_init+0x2c/0xa8 [ath12k]
>>>>>>> [    9.492769]  ath12k_pci_probe+0x698/0x908 [ath12k]
>>>>>>> [    9.492791]  pci_device_probe+0xa8/0x16c
>>>>>>> [    9.492800]  really_probe+0x110/0x27c
>>>>>>> [    9.492805]  __driver_probe_device+0x78/0x12c
>>>>>>> [    9.492808]  driver_probe_device+0x3c/0x118
>>>>>>> [    9.492810]  __driver_attach+0x74/0x124
>>>>>>> [    9.492813]  bus_for_each_dev+0x78/0xd8
>>>>>>> [    9.492819]  driver_attach+0x24/0x30
>>>>>>> [    9.492824]  bus_add_driver+0xe4/0x208
>>>>>>> [    9.492828]  driver_register+0x60/0x128
>>>>>>> [    9.492831]  __pci_register_driver+0x44/0x50
>>>>>>> [    9.492835]  ath12k_pci_init+0x2c/0x6c [ath12k]
>>>>>>> [    9.492858]  do_one_initcall+0x70/0x1b4
>>>>>>> [    9.492861]  do_init_module+0x58/0x1e4
>>>>>>> [    9.492867]  load_module+0x19bc/0x1a8c
>>>>>>> [    9.492869]  init_module_from_file+0x88/0xc4
>>>>>>> [    9.492873]  __arm64_sys_finit_module+0x1c0/0x2ac
>>>>>>> [    9.492877]  invoke_syscall+0x44/0x108
>>>>>>> [    9.492882]  el0_svc_common.constprop.0+0xc0/0xe0
>>>>>>> [    9.492885]  do_el0_svc+0x1c/0x28
>>>>>>> [    9.492889]  el0_svc+0x2c/0x84
>>>>>>> [    9.492892]  el0t_64_sync_handler+0xc0/0xc4
>>>>>>> [    9.492895]  el0t_64_sync+0x190/0x194
>>>>>>> [    9.492899] SMP: stopping secondary CPUs
>>>>>>> [    9.492908] Kernel Offset: disabled
>>>>>>> [    9.492909] CPU features: 0x0,80000200,28020000,1000420b
>>>>>>> [    9.492913] Memory Limit: none
>>>>>>>
>>>>>>> Upon searching online, I found the OpenWRT patch that
>>>>>>> appears to
>>>>>>> address a similar issue: OpenWRT Patch: Prevent LTSSM
>>>>>>> Startup
>>>>>>> Crash.
>>>>>>> https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=package/kernel/mac80211/patches/ath12k/100-ath12k-prevent-ltssm-startup-crash.patch;h=cd85a0f6aa2652d62bfbea04e9bcca3bcf831b7f;hb=935b2b7dcef61b2893ed5dff307dd8f8a1156899
>>>>>>> With the above patch applied, I do not see the crash
>>>>>>> anymore.
>>>>>>>
>>>>>>> Could anyone confirm if this issue has been reported
>>>>>>> before/known
>>>>>>> bug
>>>>>>> or provide any insights? 
>>>>>>> Any additional information or suggestions would be greatly
>>>>>>> appreciated.
>>>>>>>
>>>>>>> Details about the test setup,
>>>>>>> TI-AM69-SK board:
>>>>>>> https://www.ti.com/tool/SK-AM69?keyMatch=am69%20sk&tisearch=universal_search
>>>>>>> Silex WiFi card SX-PCEBE:
>>>>>>> https://www.silextechnology.com/connectivity-solutions/embedded-wireless/sx-pcebe
>>>>>>> TI Linux Repo:
>>>>>>> https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/?h=ti-linux-6.6.y
>>>>>>>
>>>>>>> Thank you.
>>>>>>>
>>>>>>> Regards,
>>>>>>> Parth P
>>>>>>>
>>>>>>
>>>>>>
>>>>>
>>>>>
>>>>
>>>
>>>
>>
> 


