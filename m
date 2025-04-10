Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7421C369A4
	for <ath12k@archiver.kernel.org>; Thu, 10 Apr 2025 08:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfNBNePHdD1x2X0J4K/iMw0jonOAe7tEjihNs7/GXpc=; b=vpX+OrdrOCaYLZ7VKmUB0DB9bX
	kaeU7BTi1NhczzR7UzbvkxAeSdmo5XLGsHF+YdZ61g+6FznO4830nXNLuwmwiSR85YO5VqjCnP8hu
	scTMOxNC7x4eKY6cu6y5SKffVXdOvG0oTpy58HgIs4qdXEoj4cNQyY11oVq9v1v3fgewYyp1ZPAeP
	+Gw90dcLRehBTVncvstpdDkIkVVhqJpVgooeeukfGz6BaQWTaMm4QLPhfmojlzQWcaLXafa6R+xoP
	21ekrJ06NlijN92lSppslG6Wev638HV1iHsAMSVRvs2bPzjJt3m6R8kKEB7sw34N2zRaZA9WLfELN
	UXkRZ5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nc4-00000009oNO-1saV
	for ath12k@archiver.kernel.org;
	Thu, 10 Apr 2025 08:50:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nFB-00000009jtQ-205u
	for ath12k@lists.infradead.org;
	Thu, 10 Apr 2025 08:26:43 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75OgR016413
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 08:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rfNBNePHdD1x2X0J4K/iMw0jonOAe7tEjihNs7/GXpc=; b=PZklphXHV0ReG9D/
	cpW+36KKqtw+6uSEW6SAvI3D4mPe75o2H4QB16ANxRuIoxWyJwCmTlH2kDAvGwu9
	06FxK1GsTks3DSYb+nC/kcc4s6mdV9u6OZ+422XbdFcxsvkkbMkIj/fAO4/n9PuG
	VPURn7X8YdMSqIxWOs27+v/NLZlK6wZ5bIZgCY3m9mAT6A0A0cPR0QM+KgY+CuEn
	mAEPiCNN7GxzcnjuG+HajTaGkt9cebahLCy5kHKE7VUATh6P09sISKeetHCLoP6d
	9qXMZuYgxblJq7ZMvnBTNprLPH2lJsijLv0Osj8VBtPn4Qwi4GOJUSsxOe3hr5qa
	x7JC8g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1p11y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 08:26:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225974c6272so5185925ad.1
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 01:26:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744273598; x=1744878398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rfNBNePHdD1x2X0J4K/iMw0jonOAe7tEjihNs7/GXpc=;
        b=g+UzrOi/VoMdf6Wt5+waktRAFB4UtddcG6YAjae1au7PIxA7mltV0sb4mvbHth9Cii
         F5KW2/MSAjyTG4eLz1XVTW6vsEGyDYMIbEECxvDzREOm72LRzxSnzQjzcK6gJK7o0JRh
         /madSzyiD0QfbumAIbwv2ozJygF8F483WdzVH/ShhL85EqYNQtPdqD9rKKqlvaCWQaon
         ANzCNW1xTEBaficHoJ+u1aUnLuCmH+yHUvrTGBFYtpSNH+4e/Z/3sSSfh0g7jdzb+IJF
         FoY+a3zunOZvnhPSdODxr2N8DHldzisGZ6mGjQYeZp/hNsoZ7kR6V4zwtyk+cULblHmY
         jiNg==
X-Forwarded-Encrypted: i=1; AJvYcCUPbSEX0JzC4Upng3kj4KcoNwnoSDz2lQ72ml/E9C9leDD0JF6BECiGXLR8ur1c+IZcnAvLo5I=@lists.infradead.org
X-Gm-Message-State: AOJu0YxY9ckyNu5qWCt98OsBUarUMP3R3jm0l9u/5QHOrQVMgz3S3iTQ
	TTyzsJvtw51pWS8vvMnrvspLjDxZp0lpSj+eiwsdNI+aIe4r7+7qKVudLmK7HVrs+uGeE1l7E1B
	vTOa8Yj7YNRFdV24DUII4jYbaLWm3yWBZAzqB122XuqjqLtK/nLE+/ZLWxBmm
X-Gm-Gg: ASbGnctSZc8Ihaultu7rlOvz65Na38pADMf0Fhl6CbMdeLeSLBbgIyGtEYRhdjCGCCa
	H1joZlZKkHj0jQ/9hWCojfk31GQJMK16cDwm90U7ok9Am0ESqVM6HyC2OyzotI1CkgxP6aubCrK
	Tme8+DzUytWjLQRZZhtRKIiYj+4rrWcGkjE2UwHtTA6Gd1/qI/89S71znOYBwCC6XihWxs/K0hQ
	45/jhruz1BvyLAZQyAOKc6dYSxHK/e7bLyNblO5PEoAgd2eB+zlvdjRwUnyDHprNNyL/4VqnAOp
	/GWR3hODInxMfRsHCtVxJ0Bsit0UqtzJZm6Y3/YNilj47TOVqddkTetKa12oYO/1ZqHNiNWLLPA
	=
X-Received: by 2002:a17:902:e748:b0:224:3d:2ffd with SMTP id d9443c01a7336-22b7eaa354bmr22725135ad.17.1744273597551;
        Thu, 10 Apr 2025 01:26:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDkF81S2iUApR5hGZszvQmfQI1/XKGMWz4uV695X7rzvsCIRuy9yFA7+CKpCOBnvPQtrsm1w==
X-Received: by 2002:a17:902:e748:b0:224:3d:2ffd with SMTP id d9443c01a7336-22b7eaa354bmr22724845ad.17.1744273597040;
        Thu, 10 Apr 2025 01:26:37 -0700 (PDT)
Received: from [10.133.33.131] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1e6aac6sm2749453b3a.179.2025.04.10.01.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 01:26:36 -0700 (PDT)
Message-ID: <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com>
Date: Thu, 10 Apr 2025 16:26:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com>
 <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
 <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com>
 <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com>
 <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com>
 <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: BNSgwdpk1_XW7ZEqF4HDZm1O4QNlRBJa
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f780bf cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=F6XkLNLflSCCi7XoDjYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BNSgwdpk1_XW7ZEqF4HDZm1O4QNlRBJa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_012641_657051_5BB7D84C 
X-CRM114-Status: GOOD (  32.50  )
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



On 4/10/2025 3:37 AM, Walt Holman wrote:
> On Tue, Apr 8, 2025 at 4:17 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>
>>
>>
>> On 4/8/2025 1:49 AM, Walt Holman wrote:
>>> Attached is a small packet capture where I did an 'iw wlp99s0 scan'
>>> and also deactivated and reactivated wireless while the scan was
>>> ongoing. Hopefully there's something interesting for you in there.
>>> Also, I've take 3 screenshots showing the configs of the wireless AP
>>> for the 6ghz network. The first screen is just the definition of the
>>> network. No advanced settings are used. The 2nd screen shows the
>>> channels and radio enabled. The 3rd screen has the advanced
>>> (professional) settings for the network. I believe I changed 'Agile
>>> Multiband' to enabled, but other settings are their defaults. Hope
>>> some of this helps. Let me know if you need anything else. Thanks,
>>>
>>
>> Your packets are Ethernet packets. I need wireless packets.
>>
>>
>> Not sure if you know how to add a seperate monitor interface to capture
>> 6 G channels' packet on your AP(you can google for specific command).
>>
>>
>> Also, please capture firmware log:
>>
>> 1. sudo apt install trace-cmd
>> 2. sudo trace-cmd record -e ath12k_wmi_diag
>> 3. run test
>> 4. "ctrl c" to stop recording:
>> Hit Ctrl^C to stop recording
>> ^CCPU0 data recorded at offset=0xdf5000
>>       2605056 bytes in size
>> Then share the trace.dat to us.
>>
>> So you need to:
>> 1. try to capture wireless packets.
>> 2. capture firmware log(trade.data).
>> 3. save kernel/wpa_supplicant/iw logs.
>>
>>
>>
>>
>>
>>> -Walt
>>>
>>> On Sun, Apr 6, 2025 at 8:58 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 4/4/2025 12:04 AM, Walt Holman wrote:
>>>>> On Thu, Apr 3, 2025 at 3:20 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 4/3/2025 1:48 AM, Walt Holman wrote:
>>>>>>> On Tue, Apr 1, 2025 at 9:48 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>
>>>>>>>>
>>>>>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
>>>>>>>> I can get 6 GHz AP and connect to it.
>>>>>>>>
>>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_timestamp
>>>>>>>> 2023-12-06 04:05 fw_build_id
>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>>>>
>>>>>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
>>>>>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
>>>>>>>>              TSF: 606308271476 usec (7d, 00:25:08)
>>>>>>>>              freq: 6275
>>>>>>>>              beacon interval: 100 TUs
>>>>>>>>              capability: ESS Privacy SpectrumMgmt ShortSlotTime (0x0511)
>>>>>>>>              signal: -17.00 dBm
>>>>>>>>              last seen: 52 ms ago
>>>>>>>>              Information elements from Probe Response frame:
>>>>>>>>              SSID: MLO-KANG-6G
>>>>>>>> and other 6 GHz APs:
>>>>>>>>             SSID: 6G-gxia
>>>>>>>>             SSID: NETGEAR97-6G
>>>>>>>>             ……
>>>>>>>>
>>>>>>>>
>>>>>>>> kernel log:
>>>>>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
>>>>>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (local
>>>>>>>> address=00:03:7f:37:12:54)
>>>>>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
>>>>>>>> [88158.041895] wls1: authenticated
>>>>>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
>>>>>>>> [88158.044291] wls1: determined local STA to be EHT, BW limited to 320 MHz
>>>>>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1/3)
>>>>>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (capab=0x511
>>>>>>>> status=0 aid=4)
>>>>>>>> [88158.089090] wls1: associated
>>>>>>>>
>>>>>>>> I can even connect to it by Ubuntu GUI.
>>>>>>>>
>>>>>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also please make
>>>>>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly update to the
>>>>>>>> latest version).
>>>>>>>>
>>>>>>>> If you still cannot find 6 GHz AP, you can set debug_mask to 0xffffffff
>>>>>>>> to get ath12k logs. Then give it to us.
>>>>>>>>
>>>>>>>>
>>>>>>>>> -Walt
>>>>>>>>>
>>>>>>>>
>>>>>>>
>>>>>>> OK, I retested with the wt-ath 033125 tagged build. This included the
>>>>>>> patch the Jeff suggested I try, but the rest of the tree was clean.
>>>>>>> Still no 6ghz Wifi. I'm attaching a log file of the boot and first few
>>>>>>> seconds with the debug mask turned on. I noticed that if I rmmod the
>>>>>>> module and then modprobe it, it complains about not finding
>>>>>>> firmware-2.bin, however, I thought that was only for the qcn based
>>>>>>> chip? The HW info from dmesg looks like this:
>>>>>>>
>>>>>>
>>>>>> I cannot find this tag...
>>>>>>
>>>>>>
>>>>>>     From the log, the 6 GHz channel should work. When scan is triggered, FW
>>>>>> shall send probe req on these channels. If AP send probe resp, station
>>>>>> shall find the AP.
>>>>>>
>>>>>>
>>>>>>
>>>>>>
>>>>>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
>>>>>>> 0xdd800000-0xdd9fffff 64bit]: assigned
>>>>>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device (0000 -> 0002)
>>>>>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
>>>>>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name: wcn7850 hw2.0
>>>>>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation failed
>>>>>>> (7077888 B type 1), will try later with sma
>>>>>>> ll size
>>>>>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2 chip_family 0x4
>>>>>>> board_id 0xff soc_id 0x40170200
>>>>>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
>>>>>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-
>>>>>>>
>>>>>>> Also, I noticed when looking through the debug logs there are the
>>>>>>> occasional WARNING statements from a BUG it appears. They trace back
>>>>>>> to the mac.c file inside the ath12k code. There should be some in the
>>>>>>> debug log that's attached. Let me know if I can do anything else.
>>>>>>> Thanks,
>>>>>>>
>>>>>>
>>>>>>
>>>>>> I have never seen this warning on my upstream setup...Not sure if you
>>>>>> have changed anything or using the correct code base.
>>>>>>
>>>>>> Jeff merged this patch-set into ath-202504021602. Can you try on this
>>>>>> branch?
>>>>>>
>>>>>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>>>> git pull
>>>>>> git reset --hard ath-202504021602
>>>>>> compile and install...
>>>>>>
>>>>>> Also make sure that the firmware you used is from the same folder, don't
>>>>>> mix with other folders:
>>>>>> linux-firmware/ath12k/WCN7850/hw2.0
>>>>>>
>>>>>> 1. rmmod/insmod(debug_mask=0xffff)
>>>>>> 2. iw reg get
>>>>>> 3. iw reg set US
>>>>>> 4. iw xxx scan
>>>>>> wait and collect logs.
>>>>>>
>>>>>> don't do anything else.
>>>>>>
>>>>>>
>>>>>> Also, can you show me your AP configuration.
>>>>>> If you have another 6 GHz AP, you can have a try(better different brands).
>>>>>>
>>>>
>>>> Thanks for testing.
>>>>
>>>> Could you share your AP configuration?
>>>>
>>>>
>>>>>>
>>>>>> If you have sniffer, could please capture packets during testing?
>>>>
>>>>
>>>> Can you capture packets during the testing? I need to check probe req
>>>> and probe resp.
>>>>
>>>>>>
>>>>>> Thanks!
>>>>>>
>>>>>>> -Walt
>>>>>>
>>>>> OK, I cloned and built the kernel based on your instructions in your
>>>>> last email. Originally, the result was identical to my last email,
>>>>> including the WARNINGS. The .config I use is configured for a fully RT
>>>>> PREEMPT kernel, which I wondered if that was why I was receiving the
>>>>> WARNING. So I configured it as a Low Latency PREEMPT Desktop without
>>>>> the RT_PREEMPT and that eliminated the WARNING. However, still no 6Ghz
>>>>> networks. The firmware I'm using is straight from kernel.org GIT and I
>>>>> do a 'make install; make dedup' to install it. I believe it should be
>>>>> good. Attached is the latest log file.
>>>>>
>>>>> -Walt
>>>>
>>
> 
> 
> Sorry for the top-post earlier. I can't figure out how to capture the
> wireless packets as my chip/driver combo doesn't support monitor mode.

Your AP also cannot capture wireless packets?
log in AP by usbserial or ssh.
Try to enter command line. use iw command to create monitor interface.
Then use tcpdump to capture packets.

> I've attached a tarball that contains the trace data and additional
> firmware logs from the kernel.log file. Anything else you need, just
> ask. Thanks for your help,


Your AP mac address?
Need it to help check the fw log.


> 
> -Walt


