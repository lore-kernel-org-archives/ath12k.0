Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564F8C54FB3
	for <ath12k@archiver.kernel.org>; Thu, 29 May 2025 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsCiW9lboUJXMcZpORUi6cxbkbNMrPgFBmPXpcTLRLU=; b=VFvT/SOKPE+KfatakyOUQgb00B
	aIpMY4uEQHURo0HxYikaUZC9xQjlrNe0ZUTgiCRiOg0ePCMKsSuR6kF+12cY5T1FaClhM1FWW7yan
	bZYSxhm4hcxVdjAnN1g+IS+ASKFvZaAPQCaOKv+OIjgaB8KBgObB4cZUh2JaF2CTGq+xoExtweusN
	58TDfu7T3NPa6Druvqsh5qELflefptf8yjkfffz7KlVEKvvwz2LWnPhhVfiW0JUfNkDcSum8LsRbe
	DRwFpKFKaYHq3em85EAunf9lh+d5dsEiy5ZXjBvcmcj10kv+MQPK6dEkhc9yG4jHsJtcCtJ5ZgTQw
	nWNxgOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKZ6W-0000000FJBf-3nlr;
	Thu, 29 May 2025 08:59:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKYYi-0000000FFeT-1Nyo
	for ath12k@lists.infradead.org;
	Thu, 29 May 2025 08:24:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T7RWkF005124
	for <ath12k@lists.infradead.org>; Thu, 29 May 2025 08:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsCiW9lboUJXMcZpORUi6cxbkbNMrPgFBmPXpcTLRLU=; b=M91P5eJSvUy5duGO
	p/R1LJkF7MB90nSANFLpmFo2MsQCp7sjxBYCXMO2ran7qId5wVVkGekzhOunjYkP
	tUudzaZax0JEZqCpLbpghdrn2wHs1ZSq1pN0nV19o3oomIUpa6RAToqZnrf1yRgK
	WBhGXxQAH414HK7dq5XkqaLy9AZEYRX8SpWwSOmbAlKhC/oDRVO4u01C43X9PwkF
	xN7TVkaqVAlMNWaW+DAggv6Z64JPjYlw2mXHrFFh8PXHLwP+Km2b4pTnHc9T8ppi
	oHZvxw25iPI8gCWizB5ioNKNygfcFY1E4Kws18f4pVcIPRahs7u+RwzBu0HRKoeJ
	6arUdA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x8d79pm1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 May 2025 08:24:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23494a515e3so6183505ad.2
        for <ath12k@lists.infradead.org>; Thu, 29 May 2025 01:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748507054; x=1749111854;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsCiW9lboUJXMcZpORUi6cxbkbNMrPgFBmPXpcTLRLU=;
        b=U5RS8A8xCXhFdlFOoAhCtRN87cKSgRlF3bso6YIeun22+8omImohPONwBgPb4jrYMB
         l4fTtGZDsQPDArIlCGwkmh2DgwUIAslvPjN/PzjFH1eEaf3x57QQmklL3dCdOHRera8v
         2FKDdd5DE6dF2LKTizPh6RK9I7DooX+YIfYZHqnmz4/9htZDzVNqKjh/eOiSdNEaagPJ
         vXIsRh8d2VYikZkPDqVoFw9SU1DIXJqJewYFPqO+VHv+fuDYj7Z/mrxeP4sXU+M9p1wX
         fmajmTWe7qgN7h/VnFZ1Ae6zkEENQvbmwO2FXHydTuAkIM4tOTcHWds+q9FZ4RlVUljG
         AG3w==
X-Forwarded-Encrypted: i=1; AJvYcCWrI07l9fE1MzXguotwIRykArE7zYYFSGcNoQ+y9a1kNNpZW3NPywMwQUkqdLu9tuE75sUzKz8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ03ycwra/byRFTNlYMaZLXPJNK66yHkGKxAlw+vOlBEtlm0bX
	CxiJ9FyLODArrtNw897LaSacUCAheAgXbrzUXlZ72F1Nqjhneo8dZKNU05gaPgHXa0YmEhQbcd6
	v3dQwPsia/SGMiVEyu3DE2kwL/JT1+xwxXUYbju5Cn+K4qKm8wwJEI7ttfUoVerjz
X-Gm-Gg: ASbGncsSUA2EkHCYoqX0fctRVneqjiAFdpqnyA3B2vypGqEknU7ZWuTxgs42gwGHU7r
	IlcqDb9bBeXe8PImBc7yywFgTvu2DgfPhhlwbFRNQVPRK4U34GveUOk6oyvhsarhL/DtL+fzI6f
	FtJcA3MqC/ogIxqlk+FP1hKKhuhZLSLDgwWS6HA53OCa2NadyNaMx+u0Suta/ee7MXf0NSymDOP
	Ja+/gHty8/XD2Uy/pqnUqEGNFEmVIwvLCTVYQgb8PJEBsX9r08+qbKL4fp5U4Tw0LLbzDQW6Q7N
	sxSN7qSsP3izoqQgoA7hG+gO6eEBzkGid2kK
X-Received: by 2002:a17:902:d4d0:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-234d2a79d8amr74446495ad.13.1748507053496;
        Thu, 29 May 2025 01:24:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHifFN5PcYBExNHsPdu8fXhFA2ZeV9b4aV3kovsSHTyYJpaOUMYiLMzY6Z+FZ2FVIxi6Zgo9w==
X-Received: by 2002:a17:902:d4d0:b0:233:d1e6:4d12 with SMTP id d9443c01a7336-234d2a79d8amr74446155ad.13.1748507052884;
        Thu, 29 May 2025 01:24:12 -0700 (PDT)
Received: from [10.231.194.107] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506d2570bsm7530245ad.213.2025.05.29.01.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 01:24:12 -0700 (PDT)
Message-ID: <b9f1d650-336b-4af6-a17f-e9e8a76e6200@oss.qualcomm.com>
Date: Thu, 29 May 2025 16:24:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>,
        Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com>
 <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
 <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
 <CAMb39_=YPYg0q7Lf0sMgTx5QwKOqcyJrZR7kTspyXEDa6qz9Bw@mail.gmail.com>
 <e9da4ad5-52cb-416d-991a-259140469e2c@oss.qualcomm.com>
 <87774003-d0a5-4408-b710-20bd3c194cec@quicinc.com>
 <CAMb39_ntK9Zv3pOuMSza5hRfs_KZBhya=GAPnpBWjN2wZDst9w@mail.gmail.com>
 <c7c0dfd4-bda9-4a63-84f9-a47b716c6ddd@quicinc.com>
 <CAMb39_k6bkaU9ED+iUVFT33e3S1UU+U49bYpp-qyFW-wjSd4RQ@mail.gmail.com>
 <d432fd29-316a-4ba8-aefa-eb4c22482e34@quicinc.com>
 <CAMb39_mSN_HQ+78NVzVWSDaY4c2Lv1Xb1prnmV177Fn9H6WEVw@mail.gmail.com>
 <be026084-0906-4609-9e00-8b1fa6808eb3@quicinc.com>
 <CAMb39_=RHns4CtjFa960ck57oXn7nSJcR1Jk=SHhmU0o+iyNew@mail.gmail.com>
Content-Language: en-US
From: Kang Yang <kang.yang@oss.qualcomm.com>
In-Reply-To: <CAMb39_=RHns4CtjFa960ck57oXn7nSJcR1Jk=SHhmU0o+iyNew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V95CPqdnB7Yb76ZP4amwxEH9AMAKy_hR
X-Proofpoint-ORIG-GUID: V95CPqdnB7Yb76ZP4amwxEH9AMAKy_hR
X-Authority-Analysis: v=2.4 cv=X8pSKHTe c=1 sm=1 tr=0 ts=683819af cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=pGLkceISAAAA:8 a=Z25kUzbyljjlu5b6Mp8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA4MCBTYWx0ZWRfX8fXvkDfkQdXG
 nDxLLJvZh6WvkrBACySN/PrLMrQBlidEY7klPhvzoGP7+8sGGMGNh3Rv3Wlx10HmU9ZGoXWK8Q+
 rg+nOu4yKtMNJldQfhpVd/jy+LfSCuuaRGk9J+qhwcbiVAVbZtKTTFGXPJAqou0rhEjhXBHJxQf
 q7CfjZl9qT1kqvnLS+n5xbPwbFMWbqvIyI92Y9VkknxluhEkY42sCFPxUf4Fw8jEuS2GKZ0c4mH
 i3sUB6boKF9nmW0NYoL+MPF3e7UP/feFL7bEmHlTkWAMlW54yAI09ZvgK65WteCFUKmPHkVDwJX
 8zui0tmkSXUqwI4LgZL+xCt6GQ8+GcHu6wSJ5Ygkb70/QUonbV6kueehr0Rw3boQsAwjesPMOIQ
 Sg0fGZF5BIMl3uu5ErUoCX6EbxHd0djbUsj1y3MA1zZ5iPLVcg9Qn946D8ArLGQFU9F8Ym8X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_012416_494251_E70DE503 
X-CRM114-Status: GOOD (  20.73  )
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


On 5/28/2025 5:03 AM, Walt Holman wrote:
> On Thu, May 22, 2025 at 9:12 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>
>>
>> On 5/23/2025 1:48 AM, Walt Holman wrote:
>>> On Wed, May 21, 2025 at 1:07 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>
>>>>
>>>> On 5/21/2025 1:05 PM, Walt Holman wrote:
>>>>> On Thu, May 15, 2025 at 10:06 PM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>> On 5/16/2025 1:47 AM, Walt Holman wrote:
>>>>>>> On Thu, May 15, 2025 at 4:22 AM Kang Yang <quic_kangyang@quicinc.com> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>> On 5/15/2025 4:12 PM, Kang Yang wrote:
>>>>>>>>> On 4/20/2025 11:18 PM, Walt Holman wrote:
>>>>>>>>>> On Fri, Apr 18, 2025 at 4:18 PM Walt Holman <waltholman09@gmail.com>
>>>>>>>>>> wrote:
>>>>>>>>>>> On Tue, Apr 15, 2025 at 4:23 PM Walt Holman <waltholman09@gmail.com>
>>>>>>>>>>> wrote:
>>>>>>>>>>>> On Thu, Apr 10, 2025 at 10:32 AM Walt Holman
>>>>>>>>>>>> <waltholman09@gmail.com> wrote:
>>>>>>>>>>>>> On Thu, Apr 10, 2025 at 3:26 AM Kang Yang
>>>>>>>>>>>>> <kang.yang@oss.qualcomm.com> wrote:
>>>>>>>>>>>>>>
>>>>>>>>>>>>>> On 4/10/2025 3:37 AM, Walt Holman wrote:
>>>>>>>>>>>>>>> On Tue, Apr 8, 2025 at 4:17 AM Kang Yang
>>>>>>>>>>>>>>> <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> On 4/8/2025 1:49 AM, Walt Holman wrote:
>>>>>>>>>>>>>>>>> Attached is a small packet capture where I did an 'iw wlp99s0
>>>>>>>>>>>>>>>>> scan'
>>>>>>>>>>>>>>>>> and also deactivated and reactivated wireless while the scan was
>>>>>>>>>>>>>>>>> ongoing. Hopefully there's something interesting for you in there.
>>>>>>>>>>>>>>>>> Also, I've take 3 screenshots showing the configs of the
>>>>>>>>>>>>>>>>> wireless AP
>>>>>>>>>>>>>>>>> for the 6ghz network. The first screen is just the definition
>>>>>>>>>>>>>>>>> of the
>>>>>>>>>>>>>>>>> network. No advanced settings are used. The 2nd screen shows the
>>>>>>>>>>>>>>>>> channels and radio enabled. The 3rd screen has the advanced
>>>>>>>>>>>>>>>>> (professional) settings for the network. I believe I changed
>>>>>>>>>>>>>>>>> 'Agile
>>>>>>>>>>>>>>>>> Multiband' to enabled, but other settings are their defaults. Hope
>>>>>>>>>>>>>>>>> some of this helps. Let me know if you need anything else. Thanks,
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Your packets are Ethernet packets. I need wireless packets.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Not sure if you know how to add a seperate monitor interface to
>>>>>>>>>>>>>>>> capture
>>>>>>>>>>>>>>>> 6 G channels' packet on your AP(you can google for specific
>>>>>>>>>>>>>>>> command).
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> Also, please capture firmware log:
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> 1. sudo apt install trace-cmd
>>>>>>>>>>>>>>>> 2. sudo trace-cmd record -e ath12k_wmi_diag
>>>>>>>>>>>>>>>> 3. run test
>>>>>>>>>>>>>>>> 4. "ctrl c" to stop recording:
>>>>>>>>>>>>>>>> Hit Ctrl^C to stop recording
>>>>>>>>>>>>>>>> ^CCPU0 data recorded at offset=0xdf5000
>>>>>>>>>>>>>>>>            2605056 bytes in size
>>>>>>>>>>>>>>>> Then share the trace.dat to us.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>> So you need to:
>>>>>>>>>>>>>>>> 1. try to capture wireless packets.
>>>>>>>>>>>>>>>> 2. capture firmware log(trade.data).
>>>>>>>>>>>>>>>> 3. save kernel/wpa_supplicant/iw logs.
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>> On Sun, Apr 6, 2025 at 8:58 PM Kang Yang
>>>>>>>>>>>>>>>>> <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> On 4/4/2025 12:04 AM, Walt Holman wrote:
>>>>>>>>>>>>>>>>>>> On Thu, Apr 3, 2025 at 3:20 AM Kang Yang
>>>>>>>>>>>>>>>>>>> <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> On 4/3/2025 1:48 AM, Walt Holman wrote:
>>>>>>>>>>>>>>>>>>>>> On Tue, Apr 1, 2025 at 9:48 PM Kang Yang
>>>>>>>>>>>>>>>>>>>>> <quic_kangyang@quicinc.com> wrote:
>>>>>>>>>>>>>>>>>>>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
>>>>>>>>>>>>>>>>>>>>>> I can get 6 GHz AP and connect to it.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1
>>>>>>>>>>>>>>>>>>>>>> fw_build_timestamp
>>>>>>>>>>>>>>>>>>>>>> 2023-12-06 04:05 fw_build_id
>>>>>>>>>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-
>>>>>>>>>>>>>>>>>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
>>>>>>>>>>>>>>>>>>>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
>>>>>>>>>>>>>>>>>>>>>>                   TSF: 606308271476 usec (7d, 00:25:08)
>>>>>>>>>>>>>>>>>>>>>>                   freq: 6275
>>>>>>>>>>>>>>>>>>>>>>                   beacon interval: 100 TUs
>>>>>>>>>>>>>>>>>>>>>>                   capability: ESS Privacy SpectrumMgmt
>>>>>>>>>>>>>>>>>>>>>> ShortSlotTime (0x0511)
>>>>>>>>>>>>>>>>>>>>>>                   signal: -17.00 dBm
>>>>>>>>>>>>>>>>>>>>>>                   last seen: 52 ms ago
>>>>>>>>>>>>>>>>>>>>>>                   Information elements from Probe Response frame:
>>>>>>>>>>>>>>>>>>>>>>                   SSID: MLO-KANG-6G
>>>>>>>>>>>>>>>>>>>>>> and other 6 GHz APs:
>>>>>>>>>>>>>>>>>>>>>>                  SSID: 6G-gxia
>>>>>>>>>>>>>>>>>>>>>>                  SSID: NETGEAR97-6G
>>>>>>>>>>>>>>>>>>>>>>                  ……
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> kernel log:
>>>>>>>>>>>>>>>>>>>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
>>>>>>>>>>>>>>>>>>>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64
>>>>>>>>>>>>>>>>>>>>>> (local
>>>>>>>>>>>>>>>>>>>>>> address=00:03:7f:37:12:54)
>>>>>>>>>>>>>>>>>>>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
>>>>>>>>>>>>>>>>>>>>>> [88158.041895] wls1: authenticated
>>>>>>>>>>>>>>>>>>>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
>>>>>>>>>>>>>>>>>>>>>> [88158.044291] wls1: determined local STA to be EHT, BW
>>>>>>>>>>>>>>>>>>>>>> limited to 320 MHz
>>>>>>>>>>>>>>>>>>>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try
>>>>>>>>>>>>>>>>>>>>>> 1/3)
>>>>>>>>>>>>>>>>>>>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64
>>>>>>>>>>>>>>>>>>>>>> (capab=0x511
>>>>>>>>>>>>>>>>>>>>>> status=0 aid=4)
>>>>>>>>>>>>>>>>>>>>>> [88158.089090] wls1: associated
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> I can even connect to it by Ubuntu GUI.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry?
>>>>>>>>>>>>>>>>>>>>>> Also please make
>>>>>>>>>>>>>>>>>>>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly
>>>>>>>>>>>>>>>>>>>>>> update to the
>>>>>>>>>>>>>>>>>>>>>> latest version).
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>> If you still cannot find 6 GHz AP, you can set debug_mask
>>>>>>>>>>>>>>>>>>>>>> to 0xffffffff
>>>>>>>>>>>>>>>>>>>>>> to get ath12k logs. Then give it to us.
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> OK, I retested with the wt-ath 033125 tagged build. This
>>>>>>>>>>>>>>>>>>>>> included the
>>>>>>>>>>>>>>>>>>>>> patch the Jeff suggested I try, but the rest of the tree
>>>>>>>>>>>>>>>>>>>>> was clean.
>>>>>>>>>>>>>>>>>>>>> Still no 6ghz Wifi. I'm attaching a log file of the boot
>>>>>>>>>>>>>>>>>>>>> and first few
>>>>>>>>>>>>>>>>>>>>> seconds with the debug mask turned on. I noticed that if I
>>>>>>>>>>>>>>>>>>>>> rmmod the
>>>>>>>>>>>>>>>>>>>>> module and then modprobe it, it complains about not finding
>>>>>>>>>>>>>>>>>>>>> firmware-2.bin, however, I thought that was only for the
>>>>>>>>>>>>>>>>>>>>> qcn based
>>>>>>>>>>>>>>>>>>>>> chip? The HW info from dmesg looks like this:
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> I cannot find this tag...
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>          From the log, the 6 GHz channel should work. When scan
>>>>>>>>>>>>>>>>>>>> is triggered, FW
>>>>>>>>>>>>>>>>>>>> shall send probe req on these channels. If AP send probe
>>>>>>>>>>>>>>>>>>>> resp, station
>>>>>>>>>>>>>>>>>>>> shall find the AP.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
>>>>>>>>>>>>>>>>>>>>> 0xdd800000-0xdd9fffff 64bit]: assigned
>>>>>>>>>>>>>>>>>>>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device
>>>>>>>>>>>>>>>>>>>>> (0000 -> 0002)
>>>>>>>>>>>>>>>>>>>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
>>>>>>>>>>>>>>>>>>>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name:
>>>>>>>>>>>>>>>>>>>>> wcn7850 hw2.0
>>>>>>>>>>>>>>>>>>>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation
>>>>>>>>>>>>>>>>>>>>> failed
>>>>>>>>>>>>>>>>>>>>> (7077888 B type 1), will try later with sma
>>>>>>>>>>>>>>>>>>>>> ll size
>>>>>>>>>>>>>>>>>>>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2
>>>>>>>>>>>>>>>>>>>>> chip_family 0x4
>>>>>>>>>>>>>>>>>>>>> board_id 0xff soc_id 0x40170200
>>>>>>>>>>>>>>>>>>>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
>>>>>>>>>>>>>>>>>>>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
>>>>>>>>>>>>>>>>>>>>> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-
>>>>>>>>>>>>>>>>>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> Also, I noticed when looking through the debug logs there
>>>>>>>>>>>>>>>>>>>>> are the
>>>>>>>>>>>>>>>>>>>>> occasional WARNING statements from a BUG it appears. They
>>>>>>>>>>>>>>>>>>>>> trace back
>>>>>>>>>>>>>>>>>>>>> to the mac.c file inside the ath12k code. There should be
>>>>>>>>>>>>>>>>>>>>> some in the
>>>>>>>>>>>>>>>>>>>>> debug log that's attached. Let me know if I can do anything
>>>>>>>>>>>>>>>>>>>>> else.
>>>>>>>>>>>>>>>>>>>>> Thanks,
>>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> I have never seen this warning on my upstream setup...Not
>>>>>>>>>>>>>>>>>>>> sure if you
>>>>>>>>>>>>>>>>>>>> have changed anything or using the correct code base.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Jeff merged this patch-set into ath-202504021602. Can you
>>>>>>>>>>>>>>>>>>>> try on this
>>>>>>>>>>>>>>>>>>>> branch?
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/
>>>>>>>>>>>>>>>>>>>> ath/ath.git/
>>>>>>>>>>>>>>>>>>>> git pull
>>>>>>>>>>>>>>>>>>>> git reset --hard ath-202504021602
>>>>>>>>>>>>>>>>>>>> compile and install...
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Also make sure that the firmware you used is from the same
>>>>>>>>>>>>>>>>>>>> folder, don't
>>>>>>>>>>>>>>>>>>>> mix with other folders:
>>>>>>>>>>>>>>>>>>>> linux-firmware/ath12k/WCN7850/hw2.0
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> 1. rmmod/insmod(debug_mask=0xffff)
>>>>>>>>>>>>>>>>>>>> 2. iw reg get
>>>>>>>>>>>>>>>>>>>> 3. iw reg set US
>>>>>>>>>>>>>>>>>>>> 4. iw xxx scan
>>>>>>>>>>>>>>>>>>>> wait and collect logs.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> don't do anything else.
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Also, can you show me your AP configuration.
>>>>>>>>>>>>>>>>>>>> If you have another 6 GHz AP, you can have a try(better
>>>>>>>>>>>>>>>>>>>> different brands).
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Thanks for testing.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>> Could you share your AP configuration?
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> If you have sniffer, could please capture packets during
>>>>>>>>>>>>>>>>>>>> testing?
>>>>>>>>>>>>>>>>>> Can you capture packets during the testing? I need to check
>>>>>>>>>>>>>>>>>> probe req
>>>>>>>>>>>>>>>>>> and probe resp.
>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>> Thanks!
>>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>>>>>>>> OK, I cloned and built the kernel based on your instructions
>>>>>>>>>>>>>>>>>>> in your
>>>>>>>>>>>>>>>>>>> last email. Originally, the result was identical to my last
>>>>>>>>>>>>>>>>>>> email,
>>>>>>>>>>>>>>>>>>> including the WARNINGS. The .config I use is configured for a
>>>>>>>>>>>>>>>>>>> fully RT
>>>>>>>>>>>>>>>>>>> PREEMPT kernel, which I wondered if that was why I was
>>>>>>>>>>>>>>>>>>> receiving the
>>>>>>>>>>>>>>>>>>> WARNING. So I configured it as a Low Latency PREEMPT Desktop
>>>>>>>>>>>>>>>>>>> without
>>>>>>>>>>>>>>>>>>> the RT_PREEMPT and that eliminated the WARNING. However,
>>>>>>>>>>>>>>>>>>> still no 6Ghz
>>>>>>>>>>>>>>>>>>> networks. The firmware I'm using is straight from kernel.org
>>>>>>>>>>>>>>>>>>> GIT and I
>>>>>>>>>>>>>>>>>>> do a 'make install; make dedup' to install it. I believe it
>>>>>>>>>>>>>>>>>>> should be
>>>>>>>>>>>>>>>>>>> good. Attached is the latest log file.
>>>>>>>>>>>>>>>>>>>
>>>>>>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>>>> Sorry for the top-post earlier. I can't figure out how to capture
>>>>>>>>>>>>>>> the
>>>>>>>>>>>>>>> wireless packets as my chip/driver combo doesn't support monitor
>>>>>>>>>>>>>>> mode.
>>>>>>>>>>>>>> Your AP also cannot capture wireless packets?
>>>>>>>>>>>>>> log in AP by usbserial or ssh.
>>>>>>>>>>>>>> Try to enter command line. use iw command to create monitor
>>>>>>>>>>>>>> interface.
>>>>>>>>>>>>>> Then use tcpdump to capture packets.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> I've attached a tarball that contains the trace data and additional
>>>>>>>>>>>>>>> firmware logs from the kernel.log file. Anything else you need, just
>>>>>>>>>>>>>>> ask. Thanks for your help,
>>>>>>>>>>>>>> Your AP mac address?
>>>>>>>>>>>>>> Need it to help check the fw log.
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>
>>>>>>>>>>>>>>> -Walt
>>>>>>>>>>>>> Sorry, the AP doesn't have tcpdump available on it. Also, this is a
>>>>>>>>>>>>> mesh setup with 3 nodes total. The main AP and 2 mesh nodes. I'm
>>>>>>>>>>>>> within 10 feet of one of the nodes and it's MAC for the wireless 6ghz
>>>>>>>>>>>>> network is: 10:7C:61:6F:2A:CA
>>>>>>>>>>>>>
>>>>>>>>>>>>> -Walt
>>>>>>>>>>>> The other 2 node 6ghz mac addresses are:
>>>>>>>>>>>> 10:7C:61:6F:1F:11   - Router
>>>>>>>>>>>> 10:7C:61:6F:32:92   - Node
>>>>>>>>>>>>
>>>>>>>>>>>> The first MAC address I gave you earlier was a node located
>>>>>>>>>>>> approximately 5 feet from where the laptop is.
>>>>>>>>>>>>
>>>>>>>>>>>> -Walt
>>>>>>>>>>> Well, I'm running into a brick wall it seems trying to get 6Ghz
>>>>>>>>>>> enabled on this. I tried the ath-next-20250418 tag just now and still
>>>>>>>>>>> don't see or connect to my 6Ghz network. I applied the patches in:
>>>>>>>>>>> https://lore.kernel.org/linux-wireless/20250418-ath12k-6g-lp-vlp-
>>>>>>>>>>> v1-0-c869c86cad60@quicinc.com/T/#t
>>>>>>>>>>>
>>>>>>>>>>> hoping that would help, but alas, no 6Ghz networks. I see that MLO and
>>>>>>>>>>> other nice fixes are coming in 6.16, but without 6Ghz, they'll do me
>>>>>>>>>>> no good. I'm really wondering if it's a firmware issue that excludes
>>>>>>>>>>> my chip or something. Again, anything I can do to help, let me know.
>>>>>>>>>>> Thanks,
>>>>>>>>>>>
>>>>>>>>>>> -Walt
>>>>>>>>>> Well, I used the swiss army tools to look at the firmware, and my chip
>>>>>>>>>> is listed in the firmware, so it's not excluded or anything. Really
>>>>>>>>>> puzzlling issue as my other two laptops connect to the 6Ghz network
>>>>>>>>>> just fine, and this laptop does in Windows, just not in Linux. I
>>>>>>>>>> really don't use Windows at all though, so that does me no good.
>>>>>>>>>>
>>>>>>>>>> This laptop used to connect to the 6Ghz network around the Sep. - Oct.
>>>>>>>>>> 2024 timeframe. Something has changed and now it doesn't. I'm going to
>>>>>>>>>> boot off a live image of Ubuntu 24.10 and see if I can see the
>>>>>>>>>> network. It was always hit or miss so we'll see.
>>>>>>>>>> -Walt
>>>>>>>>>
>>>>>>>>> Can you find 6 GHz AP now?
>>>>>>>>>
>>>>>>>> Our firmware team said you station device sent the probe request but
>>>>>>>> didn't receive the probe resp or beacon.
>>>>>>>>
>>>>>>>> Since your current configuration is single 6 GHz AP. Could you change
>>>>>>>> your AP configuration to 6 GHz + 2/5 GHz to have a retry?
>>>>>>>>
>>>>>>> I adedd another network with 2.4 / 5 / 6Ghz settings and still only
>>>>>>> connect to the 5Ghz network portion. This is verified through wavemon
>>>>>>> and the AP. I saw some patches recently to address 6 Ghz operatoins in
>>>>>>> various modes (https://lore.kernel.org/linux-wireless/1692f2f8-c77e-87ce-db70-00b4d9fc7c95@oss.qualcomm.com/),
>>>>>>> but the patch doesn't apply cleanly to current or ath-pending. Don't
>>>>>>> know that it would help, but it seemed interesting.
>>>>>>>
>>>>>>> When I went back to the older kernel / distro I still could not see
>>>>>>> the 6 Ghz band nor connect to it. I think something has changed on the
>>>>>>> AP as well, as this used to work intermittently. I think I have
>>>>>>> mentioned this before, but I have a dual-boot setup on this laptop and
>>>>>>> in Windows 11, it does see and connect to the 6 Ghz band and MLO works
>>>>>>> as well. Also, I have about 5 other devices (phones and laptops) that
>>>>>>> can all connect to the 6 Ghz band. I think it's a combination of the
>>>>>>> AP and the driver / firmware.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Do you have another WCN7850?
>>>>>> Our monitor mode is now in pending branch, and one fix is coming so that
>>>>>> you can use WCN7850 to capture 6 GHz management packects. So that our
>>>>>> firmware team can do further research.
>>>>> I've successfully put the wifi into monitor mode and captured some
>>>>> traffic. I used freq. 6615, which is the frequency my Holman-6G runs
>>>>> at with a width of 320Mhz. I can see beacons and other wifi related
>>>>> traffic, however, I did not have an encryption key set, so any traffic
>>>>> should still be encrypted. Hopefully the beacons and other things
>>>>> help.
>>>>> I took a chance that the patches were ready and used the most recent
>>>>> tag: ath-pending-202505201841 and it appeared to work OK. Let me know
>>>>> if this helps and if you need anything else. Thanks,
>>>>
>>>> This is what we needed.
>>>>
>>>> But i didn't see probe req in this file.
>>>> Not sure if you didn't run the test?
>>>>
>>>> Can you put this monitor mode device between your test station device
>>>> and AP device(Try to ensure that it is on the connection line between
>>>> the two device), then start the full test?
>>>> Remember run "iw reg set US" before connecting step.
>>>>
>>>>
>>>> Also, please provide us the host/firmware log and the packets.
>>>> All logs/packets come from the same test, will make it easier for our
>>>> firmware team to debug.
>>>> 🙂
>>> OK, I think I've got something here and I hope it's useful. I did a
>>> packet capture of the wifi traffic on Freq. 6615 @ 160Mhz from another
>>> host and then loaded the ath12k module on the problem host and logged
>>> it all. The wifi adapter for the ath12k is a Quectel model. Also, I
>>> shut off both mesh nodes so that only the AP was running to ensure we
>>> were on the same node.
>> This is great, thanks.
>>
>>
>>> Please let me know if you need anything else. I
>>> did see some packets from the ath12k module in the source field of the
>>> capture so hopefully this  helps.
>> Oh... you missed the firmware log.
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
>>
>>
>> Total three files:
>> trace.dat, kernel.log, wifi-capture.pcapng
>> 🙂It's a little complicated, but they are necessary, thanks.
> Sorry about that, was in a hurry for the holiday and forgot about it.
> Here's the 3 files.


Thanks!


According to your logs, it is 6G non_transmitted MBSSID and with 
wildcard ssid. Offiline sync with firmware team.

For this kind of AP, station shuold add SSID in scan so that we can 
receive probe resp from this AP.

So can you test again and collect the wpa_supplicant log? Also, remember 
to collect the trace.dat/capture packets.


1.Please add some logs in ath12k_wmi_send_scan_start_cmd().

     if (arg->num_ssids) {
         ssid = ptr;
         for (i = 0; i < arg->num_ssids; ++i) {
             ssid->ssid_len = cpu_to_le32(arg->ssid[i].ssid_len);
             memcpy(ssid->ssid, arg->ssid[i].ssid,
                    arg->ssid[i].ssid_len);
             ssid++;
         }
     }


Firmware team needs to check the "ssid->ssid"🙂  thanks!

2. add network config in wpa_supplicant.conf like:

network={
         ssid="Holman-6G"
         psk="1234567890"
         scan_ssid=1
         key_mgmt=SAE
         disabled=0
}

ideally, you will see wpa_supplicant logs like:
wls1: nl80211: New scan results available
nl80211: Scan probed for SSID 'Holman-6G'
nl80211: Scan probed for SSID ''

Step 2 is necessary because we won't send probe req to these hidden AP 
unless it is configured in wpa_supplicant.

There may be slight differences in the wpa_supplicant configuration, 
please make changes according to your AP's configuration.




>
> -Walt

