Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D3BC36002
	for <ath12k@archiver.kernel.org>; Mon,  7 Apr 2025 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rp+vGUdcc9UaV7Dknggwd4mmV+RchYzySSvjgovJMLk=; b=Wui8enqTNN79rwWErP3yi5k6KS
	FmpuAoybAMYWhRhatiHHH61KTGHFnSg7K1Dwb3o4vEqgPjPdUmis08ivmzWYUDsswlBcPC6mQrvYI
	FU5smzKDxWljo1CenDnO9kn4LeeAyDtxgGSeH4JXpgHLR+mF2FAw0qbuEtdcPimHl2IPcmtA+Aq0/
	7IA9MjrsbH3jvBBy+Q6VQ11DG7w9+Ct5pTbLZHwvlb05rrqRDua7HVBzZM5C1Yvg5BOqMNMWI8uJZ
	DC9zeLb+T1/b7xluxNbvawBxhNqH76CJ0NYV5pXYRAIwDIGOmH975FuhtbDo9L++Ku12I+hU+xREY
	AZfhv6Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bkX-0000000G9K8-3JDU
	for ath12k@archiver.kernel.org;
	Mon, 07 Apr 2025 01:58:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1bkU-0000000G9JM-1apS
	for ath12k@lists.infradead.org;
	Mon, 07 Apr 2025 01:58:07 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 536NpmgB028977;
	Mon, 7 Apr 2025 01:58:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rp+vGUdcc9UaV7Dknggwd4mmV+RchYzySSvjgovJMLk=; b=SqMd9K2Df3OltLYj
	sL7/jh5bFql5qh7LpVojzhtY6l4ZXjAkVpu4h5hS0v5fo/kwhoPYC0fJaMDLBMHk
	q6+8MmSFLAlCzjJ1cf1+3EPYkFMMomGGmr/Ae81Sng7YYWktsiWP1jXvaXR/gWix
	23brFriPM5Z6FecNy4v4JAPrBFUnrCg0q5jePPTUpgwDQJb60snkVFSPq7V2GSPs
	9Kvh7IJxT6fl5H0w7szlvx8E52Zlvbs1FBsnE5ChnXu8cJQFx3bkula9gixfzjpK
	Ye5E3SrWCnWFzE2UuOFzGN03BfKrTWQcIyVMcxd0wxFkehRZZ9ZJSp1fN8Actz4y
	mzWrCw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbuamyb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 01:58:03 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5371w3Qf006220
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 7 Apr 2025 01:58:03 GMT
Received: from [10.133.33.125] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 6 Apr 2025
 18:58:01 -0700
Message-ID: <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com>
Date: Mon, 7 Apr 2025 09:57:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com>
 <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
 <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com>
 <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <quic_kangyang@quicinc.com>
In-Reply-To: <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5cdAuy2NaE_J43h6-F665JbD2KS_LifF
X-Proofpoint-ORIG-GUID: 5cdAuy2NaE_J43h6-F665JbD2KS_LifF
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f3312b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=vI87WSy5pIeuF_aSIUcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_01,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504070013
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_185806_443121_A2054C16 
X-CRM114-Status: GOOD (  26.36  )
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



On 4/4/2025 12:04 AM, Walt Holman wrote:
> On Thu, Apr 3, 2025 at 3:20 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>
>>
>>
>> On 4/3/2025 1:48 AM, Walt Holman wrote:
>>> On Tue, Apr 1, 2025 at 9:48 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>
>>>>
>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
>>>> I can get 6 GHz AP and connect to it.
>>>>
>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_timestamp
>>>> 2023-12-06 04:05 fw_build_id
>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>
>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
>>>>            TSF: 606308271476 usec (7d, 00:25:08)
>>>>            freq: 6275
>>>>            beacon interval: 100 TUs
>>>>            capability: ESS Privacy SpectrumMgmt ShortSlotTime (0x0511)
>>>>            signal: -17.00 dBm
>>>>            last seen: 52 ms ago
>>>>            Information elements from Probe Response frame:
>>>>            SSID: MLO-KANG-6G
>>>> and other 6 GHz APs:
>>>>           SSID: 6G-gxia
>>>>           SSID: NETGEAR97-6G
>>>>           ……
>>>>
>>>>
>>>> kernel log:
>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (local
>>>> address=00:03:7f:37:12:54)
>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
>>>> [88158.041895] wls1: authenticated
>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
>>>> [88158.044291] wls1: determined local STA to be EHT, BW limited to 320 MHz
>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1/3)
>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (capab=0x511
>>>> status=0 aid=4)
>>>> [88158.089090] wls1: associated
>>>>
>>>> I can even connect to it by Ubuntu GUI.
>>>>
>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also please make
>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly update to the
>>>> latest version).
>>>>
>>>> If you still cannot find 6 GHz AP, you can set debug_mask to 0xffffffff
>>>> to get ath12k logs. Then give it to us.
>>>>
>>>>
>>>>> -Walt
>>>>>
>>>>
>>>
>>> OK, I retested with the wt-ath 033125 tagged build. This included the
>>> patch the Jeff suggested I try, but the rest of the tree was clean.
>>> Still no 6ghz Wifi. I'm attaching a log file of the boot and first few
>>> seconds with the debug mask turned on. I noticed that if I rmmod the
>>> module and then modprobe it, it complains about not finding
>>> firmware-2.bin, however, I thought that was only for the qcn based
>>> chip? The HW info from dmesg looks like this:
>>>
>>
>> I cannot find this tag...
>>
>>
>>   From the log, the 6 GHz channel should work. When scan is triggered, FW
>> shall send probe req on these channels. If AP send probe resp, station
>> shall find the AP.
>>
>>
>>
>>
>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
>>> 0xdd800000-0xdd9fffff 64bit]: assigned
>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device (0000 -> 0002)
>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name: wcn7850 hw2.0
>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation failed
>>> (7077888 B type 1), will try later with sma
>>> ll size
>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2 chip_family 0x4
>>> board_id 0xff soc_id 0x40170200
>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-
>>>
>>> Also, I noticed when looking through the debug logs there are the
>>> occasional WARNING statements from a BUG it appears. They trace back
>>> to the mac.c file inside the ath12k code. There should be some in the
>>> debug log that's attached. Let me know if I can do anything else.
>>> Thanks,
>>>
>>
>>
>> I have never seen this warning on my upstream setup...Not sure if you
>> have changed anything or using the correct code base.
>>
>> Jeff merged this patch-set into ath-202504021602. Can you try on this
>> branch?
>>
>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>> git pull
>> git reset --hard ath-202504021602
>> compile and install...
>>
>> Also make sure that the firmware you used is from the same folder, don't
>> mix with other folders:
>> linux-firmware/ath12k/WCN7850/hw2.0
>>
>> 1. rmmod/insmod(debug_mask=0xffff)
>> 2. iw reg get
>> 3. iw reg set US
>> 4. iw xxx scan
>> wait and collect logs.
>>
>> don't do anything else.
>>
>>
>> Also, can you show me your AP configuration.
>> If you have another 6 GHz AP, you can have a try(better different brands).
>>

Thanks for testing.

Could you share your AP configuration?


>>
>> If you have sniffer, could please capture packets during testing?


Can you capture packets during the testing? I need to check probe req 
and probe resp.

>>
>> Thanks!
>>
>>> -Walt
>>
> OK, I cloned and built the kernel based on your instructions in your
> last email. Originally, the result was identical to my last email,
> including the WARNINGS. The .config I use is configured for a fully RT
> PREEMPT kernel, which I wondered if that was why I was receiving the
> WARNING. So I configured it as a Low Latency PREEMPT Desktop without
> the RT_PREEMPT and that eliminated the WARNING. However, still no 6Ghz
> networks. The firmware I'm using is straight from kernel.org GIT and I
> do a 'make install; make dedup' to install it. I believe it should be
> good. Attached is the latest log file.
> 
> -Walt


