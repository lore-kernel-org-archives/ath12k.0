Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E62B0C3ABC9
	for <ath12k@archiver.kernel.org>; Thu, 15 May 2025 08:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E++65UOF5tmrMaX3qnnORuCpMPsb5CliKQB6jPoS5L8=; b=Z82+J7j51QF6qM+nXYacL8hfv/
	/8XKwXdfppjb5JoQJpf3XT3ByOpCM2EOrXyLvsI1hh0TV7I8Csq6/IKjA1L6/yRfyuPG96ZrTufEZ
	3AgxdKlf6mDjUEEuFomUDZLo8ID9yB9e2TxdMUZbQcgM/m6ZrGeWEwALzNU4O3Gy3bhzdyraZzxBJ
	mxWknRVuwGyGrBD9Px1vCYa+iQQX0TeoxEXR24Ry7xmGwJJRy8if6UrvurW3nd/C9q4gG1FeH9vFD
	5JSutBIfSqBG8RO074+xB4CGuGiMc1NY9Ppm9rI88/h4rnXaprsXSCLUJINHRzJD6Q8/SbaRBeav6
	DBWZQvNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTqA-0000000HUvI-2Jpu;
	Thu, 15 May 2025 08:21:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTi8-0000000HTRn-1Rqb
	for ath12k@lists.infradead.org;
	Thu, 15 May 2025 08:13:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EL4BsM015147
	for <ath12k@lists.infradead.org>; Thu, 15 May 2025 08:12:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E++65UOF5tmrMaX3qnnORuCpMPsb5CliKQB6jPoS5L8=; b=UVG3A59JrUa7bOKQ
	luaGhRxXdD1EMbSsqhsGm0KZmKyys+yiFD7dy9rQuTbiMEeijWO0CjNG9gebE0D0
	iN60EMbZqughecCEv1bAF5a+jLFVuQdroxtUUgB8QCidg7ooDLOXGgB+c/Pbtbxh
	rjL9c6KentifVn7qvsoOR8SkVmuQNdVbYUjQnhs69+AnhoTxdEwRj/38PT02OQSm
	EAawVF3c2upPtfQoJqvd5/ezN/1cX3gPE+DI9C6I+JvEpa8XPEWWefG5gXILnsdF
	KOwoG34FnngbINQkf1/0N98eTRhxvX4A/VdNuhwpAe6TWu6ULoDuGTUHfOY73/19
	eA9eJA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr59sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 May 2025 08:12:59 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-400b3a7e434so629268b6e.0
        for <ath12k@lists.infradead.org>; Thu, 15 May 2025 01:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296778; x=1747901578;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E++65UOF5tmrMaX3qnnORuCpMPsb5CliKQB6jPoS5L8=;
        b=NcEFVUwNqfpHypeU2xwfqb/Ct6sKbpnRTsXeY6ljJ2N1rD5qmNLafAu5WKvXJjHNqB
         RKC9wpsRVP1rnS2IFn9CGUtO2e6Y6y3hzE5EbCS48SJqcfjsWD+TjSRVw0k1jL1g7xSF
         3sftd/NpYbESpYjjbxKPotpcoxLV+geQpdjQ4DvpagIz2W5MjqPTI2d/nBAicRuGsX6o
         0GzgE9WWeiHL5FT4Q3Kqu9zjXY+ar3T47lH3V3r8sgY7uTeU6EhJ8PXs26kn/0giwt7J
         TvP4Bc/gNRhdcwVn46KpWdvSk/2BOS3S+v3dVnR2rh6g9rKQS44AolwdqEHOg7dH95HA
         h17g==
X-Forwarded-Encrypted: i=1; AJvYcCXaMAAjHnUsiO5FM7I0DySiW9CKP+VrkLI0W62e4+n65+4lkQsQsb8xfSKp8DIV7DxkSCRaxhk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyWdfRzi61cVsk6xvsv7jxTn34a62vliGKTMcGaEVsjbIiFENd8
	c+mj7VRBiefOV5xC5Etjh3irRPNSEikbmYilWgJVBa9Wv+QtpNPyJdY6SBVqvQj3QXxKj3jQnnL
	UcnSsIcX/8h6c1RueD2bYOVTEx2gqt/zmEeczVjf32GTSkiJF/i2dM8NrpxE3E+ZCAv6L
X-Gm-Gg: ASbGncsZ0gbBdyVgF/PgynnC67JqVNkAmB5fWNWHiH5hubtIIlSNOVSqkpx2/jJEp4U
	Igb0wiikPGopHOrIz6slOGYJTNDRM3oqLCvN3v/1d7t0vfWNQNUA241eTlfoIll2fsWjx8vuy8N
	4k3uDZYYHmO9uPB0lvmJL2qCGbqux6vbJrjzmMLBviTAVQNcagfH0htUyhMnzkNQoEkFT+ilWXH
	xewXi8DUHtA6Ke2rI3wQqVi/UnwwlnFx7buRiSAXPaUj9h53RYkVACSmWINGeaH0S/ihiyz6aMJ
	yTP9R+huJxvyEUadCivlMcTDOT2a8huCQPgtWXHYGwtPyASev1V1ywmOsEb4B0EVpQxtxKH9Zg=
	=
X-Received: by 2002:a05:6808:3305:b0:401:16e:b8c1 with SMTP id 5614622812f47-404c1ff660cmr3766644b6e.15.1747296777862;
        Thu, 15 May 2025 01:12:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHMiBBT028vAiPRbmbnHNufIUadRwh9SpGyoaqjF82x037R2osbhu9UBvY7NfMA8j7mcksdsg==
X-Received: by 2002:a17:903:1b4b:b0:224:10a2:cad5 with SMTP id d9443c01a7336-231980bbcf9mr113045915ad.10.1747296766499;
        Thu, 15 May 2025 01:12:46 -0700 (PDT)
Received: from [10.133.33.17] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc82705e5sm112527675ad.120.2025.05.15.01.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:12:46 -0700 (PDT)
Message-ID: <e9da4ad5-52cb-416d-991a-259140469e2c@oss.qualcomm.com>
Date: Thu, 15 May 2025 16:12:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
 <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com>
 <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com>
 <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com>
 <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com>
 <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
 <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
 <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: YuPbt8YpHxmb9Lth2LX0ohsttQeU3icI
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6825a20b cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=lMMYwoh7bgqQ9NEZEYgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: YuPbt8YpHxmb9Lth2LX0ohsttQeU3icI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDA3OSBTYWx0ZWRfXy1fQ8mgiy+y8
 Inxt/PKwScb9iDC/dh61I0U9R/F5ItQEG+h7MuNUGkXCY4qLvM9PjNHdOVZ9KOk6uy3ZGF1vI8c
 oLVZbiDf5KuvwcXwY9vP9fR3eDu6+a65/rNZ9CnQdvFnnvcWqt4Nz+iueVkegJxDQGC6YT8ZZtQ
 /tZMGmgmI/SSCkkNFGR1WXG4mpK3xi8wzWSi4jQ/h7K+b6ubl2T5ChhGsjSt4TEacN9G82mc9Md
 +73Rwbh7LKh2JjqUwq9UBp+N2eKFRx10mLzyXIWwEQ4SQ4WWZkIY0LQ6ayzgKuhQSLgqhbL/p5j
 +jtzKsYEo7iXrQE1Gfwqw510XsQx9FC8fDhFb78+VRuJNaqmL0NBSKGUFNYZKwcyiJ9n+q5XDIw
 ttgPqvcDvIsgnGe+HhRXKOGhXMgLypx0jfBWpVZTJHk9WxhbbapnHcrcxx3JvYK90EkYsRV5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_03,2025-05-14_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_011300_524655_2A5EA598 
X-CRM114-Status: GOOD (  24.20  )
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


On 4/20/2025 11:18 PM, Walt Holman wrote:
> On Fri, Apr 18, 2025 at 4:18 PM Walt Holman <waltholman09@gmail.com> wrote:
>> On Tue, Apr 15, 2025 at 4:23 PM Walt Holman <waltholman09@gmail.com> wrote:
>>> On Thu, Apr 10, 2025 at 10:32 AM Walt Holman <waltholman09@gmail.com> wrote:
>>>> On Thu, Apr 10, 2025 at 3:26 AM Kang Yang <kang.yang@oss.qualcomm.com> wrote:
>>>>>
>>>>>
>>>>> On 4/10/2025 3:37 AM, Walt Holman wrote:
>>>>>> On Tue, Apr 8, 2025 at 4:17 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 4/8/2025 1:49 AM, Walt Holman wrote:
>>>>>>>> Attached is a small packet capture where I did an 'iw wlp99s0 scan'
>>>>>>>> and also deactivated and reactivated wireless while the scan was
>>>>>>>> ongoing. Hopefully there's something interesting for you in there.
>>>>>>>> Also, I've take 3 screenshots showing the configs of the wireless AP
>>>>>>>> for the 6ghz network. The first screen is just the definition of the
>>>>>>>> network. No advanced settings are used. The 2nd screen shows the
>>>>>>>> channels and radio enabled. The 3rd screen has the advanced
>>>>>>>> (professional) settings for the network. I believe I changed 'Agile
>>>>>>>> Multiband' to enabled, but other settings are their defaults. Hope
>>>>>>>> some of this helps. Let me know if you need anything else. Thanks,
>>>>>>>>
>>>>>>> Your packets are Ethernet packets. I need wireless packets.
>>>>>>>
>>>>>>>
>>>>>>> Not sure if you know how to add a seperate monitor interface to capture
>>>>>>> 6 G channels' packet on your AP(you can google for specific command).
>>>>>>>
>>>>>>>
>>>>>>> Also, please capture firmware log:
>>>>>>>
>>>>>>> 1. sudo apt install trace-cmd
>>>>>>> 2. sudo trace-cmd record -e ath12k_wmi_diag
>>>>>>> 3. run test
>>>>>>> 4. "ctrl c" to stop recording:
>>>>>>> Hit Ctrl^C to stop recording
>>>>>>> ^CCPU0 data recorded at offset=0xdf5000
>>>>>>>        2605056 bytes in size
>>>>>>> Then share the trace.dat to us.
>>>>>>>
>>>>>>> So you need to:
>>>>>>> 1. try to capture wireless packets.
>>>>>>> 2. capture firmware log(trade.data).
>>>>>>> 3. save kernel/wpa_supplicant/iw logs.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>> -Walt
>>>>>>>>
>>>>>>>> On Sun, Apr 6, 2025 at 8:58 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 4/4/2025 12:04 AM, Walt Holman wrote:
>>>>>>>>>> On Thu, Apr 3, 2025 at 3:20 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> On 4/3/2025 1:48 AM, Walt Holman wrote:
>>>>>>>>>>>> On Tue, Apr 1, 2025 at 9:48 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
>>>>>>>>>>>>> I can get 6 GHz AP and connect to it.
>>>>>>>>>>>>>
>>>>>>>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_timestamp
>>>>>>>>>>>>> 2023-12-06 04:05 fw_build_id
>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>>>>>>>>>
>>>>>>>>>>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
>>>>>>>>>>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
>>>>>>>>>>>>>               TSF: 606308271476 usec (7d, 00:25:08)
>>>>>>>>>>>>>               freq: 6275
>>>>>>>>>>>>>               beacon interval: 100 TUs
>>>>>>>>>>>>>               capability: ESS Privacy SpectrumMgmt ShortSlotTime (0x0511)
>>>>>>>>>>>>>               signal: -17.00 dBm
>>>>>>>>>>>>>               last seen: 52 ms ago
>>>>>>>>>>>>>               Information elements from Probe Response frame:
>>>>>>>>>>>>>               SSID: MLO-KANG-6G
>>>>>>>>>>>>> and other 6 GHz APs:
>>>>>>>>>>>>>              SSID: 6G-gxia
>>>>>>>>>>>>>              SSID: NETGEAR97-6G
>>>>>>>>>>>>>              ……
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>> kernel log:
>>>>>>>>>>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
>>>>>>>>>>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (local
>>>>>>>>>>>>> address=00:03:7f:37:12:54)
>>>>>>>>>>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
>>>>>>>>>>>>> [88158.041895] wls1: authenticated
>>>>>>>>>>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
>>>>>>>>>>>>> [88158.044291] wls1: determined local STA to be EHT, BW limited to 320 MHz
>>>>>>>>>>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1/3)
>>>>>>>>>>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (capab=0x511
>>>>>>>>>>>>> status=0 aid=4)
>>>>>>>>>>>>> [88158.089090] wls1: associated
>>>>>>>>>>>>>
>>>>>>>>>>>>> I can even connect to it by Ubuntu GUI.
>>>>>>>>>>>>>
>>>>>>>>>>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also please make
>>>>>>>>>>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly update to the
>>>>>>>>>>>>> latest version).
>>>>>>>>>>>>>
>>>>>>>>>>>>> If you still cannot find 6 GHz AP, you can set debug_mask to 0xffffffff
>>>>>>>>>>>>> to get ath12k logs. Then give it to us.
>>>>>>>>>>>>>
>>>>>>>>>>>>>
>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>>>
>>>>>>>>>>>> OK, I retested with the wt-ath 033125 tagged build. This included the
>>>>>>>>>>>> patch the Jeff suggested I try, but the rest of the tree was clean.
>>>>>>>>>>>> Still no 6ghz Wifi. I'm attaching a log file of the boot and first few
>>>>>>>>>>>> seconds with the debug mask turned on. I noticed that if I rmmod the
>>>>>>>>>>>> module and then modprobe it, it complains about not finding
>>>>>>>>>>>> firmware-2.bin, however, I thought that was only for the qcn based
>>>>>>>>>>>> chip? The HW info from dmesg looks like this:
>>>>>>>>>>>>
>>>>>>>>>>> I cannot find this tag...
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>      From the log, the 6 GHz channel should work. When scan is triggered, FW
>>>>>>>>>>> shall send probe req on these channels. If AP send probe resp, station
>>>>>>>>>>> shall find the AP.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
>>>>>>>>>>>> 0xdd800000-0xdd9fffff 64bit]: assigned
>>>>>>>>>>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device (0000 -> 0002)
>>>>>>>>>>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
>>>>>>>>>>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name: wcn7850 hw2.0
>>>>>>>>>>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation failed
>>>>>>>>>>>> (7077888 B type 1), will try later with sma
>>>>>>>>>>>> ll size
>>>>>>>>>>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2 chip_family 0x4
>>>>>>>>>>>> board_id 0xff soc_id 0x40170200
>>>>>>>>>>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
>>>>>>>>>>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-
>>>>>>>>>>>>
>>>>>>>>>>>> Also, I noticed when looking through the debug logs there are the
>>>>>>>>>>>> occasional WARNING statements from a BUG it appears. They trace back
>>>>>>>>>>>> to the mac.c file inside the ath12k code. There should be some in the
>>>>>>>>>>>> debug log that's attached. Let me know if I can do anything else.
>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> I have never seen this warning on my upstream setup...Not sure if you
>>>>>>>>>>> have changed anything or using the correct code base.
>>>>>>>>>>>
>>>>>>>>>>> Jeff merged this patch-set into ath-202504021602. Can you try on this
>>>>>>>>>>> branch?
>>>>>>>>>>>
>>>>>>>>>>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/
>>>>>>>>>>> git pull
>>>>>>>>>>> git reset --hard ath-202504021602
>>>>>>>>>>> compile and install...
>>>>>>>>>>>
>>>>>>>>>>> Also make sure that the firmware you used is from the same folder, don't
>>>>>>>>>>> mix with other folders:
>>>>>>>>>>> linux-firmware/ath12k/WCN7850/hw2.0
>>>>>>>>>>>
>>>>>>>>>>> 1. rmmod/insmod(debug_mask=0xffff)
>>>>>>>>>>> 2. iw reg get
>>>>>>>>>>> 3. iw reg set US
>>>>>>>>>>> 4. iw xxx scan
>>>>>>>>>>> wait and collect logs.
>>>>>>>>>>>
>>>>>>>>>>> don't do anything else.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> Also, can you show me your AP configuration.
>>>>>>>>>>> If you have another 6 GHz AP, you can have a try(better different brands).
>>>>>>>>>>>
>>>>>>>>> Thanks for testing.
>>>>>>>>>
>>>>>>>>> Could you share your AP configuration?
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>>> If you have sniffer, could please capture packets during testing?
>>>>>>>>>
>>>>>>>>> Can you capture packets during the testing? I need to check probe req
>>>>>>>>> and probe resp.
>>>>>>>>>
>>>>>>>>>>> Thanks!
>>>>>>>>>>>
>>>>>>>>>>>> -Walt
>>>>>>>>>> OK, I cloned and built the kernel based on your instructions in your
>>>>>>>>>> last email. Originally, the result was identical to my last email,
>>>>>>>>>> including the WARNINGS. The .config I use is configured for a fully RT
>>>>>>>>>> PREEMPT kernel, which I wondered if that was why I was receiving the
>>>>>>>>>> WARNING. So I configured it as a Low Latency PREEMPT Desktop without
>>>>>>>>>> the RT_PREEMPT and that eliminated the WARNING. However, still no 6Ghz
>>>>>>>>>> networks. The firmware I'm using is straight from kernel.org GIT and I
>>>>>>>>>> do a 'make install; make dedup' to install it. I believe it should be
>>>>>>>>>> good. Attached is the latest log file.
>>>>>>>>>>
>>>>>>>>>> -Walt
>>>>>>
>>>>>> Sorry for the top-post earlier. I can't figure out how to capture the
>>>>>> wireless packets as my chip/driver combo doesn't support monitor mode.
>>>>> Your AP also cannot capture wireless packets?
>>>>> log in AP by usbserial or ssh.
>>>>> Try to enter command line. use iw command to create monitor interface.
>>>>> Then use tcpdump to capture packets.
>>>>>
>>>>>> I've attached a tarball that contains the trace data and additional
>>>>>> firmware logs from the kernel.log file. Anything else you need, just
>>>>>> ask. Thanks for your help,
>>>>>
>>>>> Your AP mac address?
>>>>> Need it to help check the fw log.
>>>>>
>>>>>
>>>>>> -Walt
>>>> Sorry, the AP doesn't have tcpdump available on it. Also, this is a
>>>> mesh setup with 3 nodes total. The main AP and 2 mesh nodes. I'm
>>>> within 10 feet of one of the nodes and it's MAC for the wireless 6ghz
>>>> network is: 10:7C:61:6F:2A:CA
>>>>
>>>> -Walt
>>> The other 2 node 6ghz mac addresses are:
>>> 10:7C:61:6F:1F:11   - Router
>>> 10:7C:61:6F:32:92   - Node
>>>
>>> The first MAC address I gave you earlier was a node located
>>> approximately 5 feet from where the laptop is.
>>>
>>> -Walt
>> Well, I'm running into a brick wall it seems trying to get 6Ghz
>> enabled on this. I tried the ath-next-20250418 tag just now and still
>> don't see or connect to my 6Ghz network. I applied the patches in:
>> https://lore.kernel.org/linux-wireless/20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com/T/#t
>>
>> hoping that would help, but alas, no 6Ghz networks. I see that MLO and
>> other nice fixes are coming in 6.16, but without 6Ghz, they'll do me
>> no good. I'm really wondering if it's a firmware issue that excludes
>> my chip or something. Again, anything I can do to help, let me know.
>> Thanks,
>>
>> -Walt
> Well, I used the swiss army tools to look at the firmware, and my chip
> is listed in the firmware, so it's not excluded or anything. Really
> puzzlling issue as my other two laptops connect to the 6Ghz network
> just fine, and this laptop does in Windows, just not in Linux. I
> really don't use Windows at all though, so that does me no good.
>
> This laptop used to connect to the 6Ghz network around the Sep. - Oct.
> 2024 timeframe. Something has changed and now it doesn't. I'm going to
> boot off a live image of Ubuntu 24.10 and see if I can see the
> network. It was always hit or miss so we'll see.
> -Walt


Can you find 6 GHz AP now?




