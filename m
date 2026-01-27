Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241DAD2D8E6
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 10:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qmsmh2t6G90Bz/lts6CDSJg+tdpDYEK6R8xt5FrdQIU=; b=UVISG9Q8KfkoqIE2BMPGQXZtSp
	vsr45yXijdm7sSuPClV79nDFaujIgemw5PHFTdhw8u9milD0OOTl3i4mflWjiyWTTccnPcuPW1rk1
	nfWen+DSYqtUwWqnSo6Pf7OS6HziFLn3QQia/+9R3NnSMjHhOpVwieSssIjwJKh+uxRl6xCItpWqm
	bYRhRb2I6D9r7nUsdpL2zacritETQwn712h5Y9PlHWqcQgCDproV6OpbSJ6uFDml49NPGOeQz4Oh0
	ZNmVQd0DeHoNmfTTdvh9ciJUTes1XpgZ14k6NT339FI3hCVApsAhLwn5vF49QKgwRQ+kofJBQ85GE
	jkcV9Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgCx-0000000E2x2-3IBy;
	Tue, 27 Jan 2026 10:22:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgCu-0000000E2wL-3mSt
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 10:22:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UPlW185217
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 10:22:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qmsmh2t6G90Bz/lts6CDSJg+tdpDYEK6R8xt5FrdQIU=; b=LCOHFv4srlxzFGCE
	vfq3MABVaYWAnhVLCyqTWcwMNX3Ub9Y0Zo7JLTBvizvjVA+kNuitzdR3Jwd8KJxP
	4LHOZSdsq65XLv2vfkBxNpxxZuk+hD5NpmMzYyhKsv33BiLVfDyZQoE3/6KF5Qza
	OBf1rgMXqgefBVOXqyVEAyx5JLvwIm2tuKJmD02byY8y8RyTQPJ07JnXGe3HO8Dm
	uvnxphtVme1+u+2+btm2CJhydIgVXvJmDSocw+ENy5dPyz8dNEG4GVbWPBnAADkd
	2N5mdah+seniGiv4IcQ6ma38RWcVRjDmbzukhMmqtDU5gy5e5JgiHCxvREnuiQie
	g+W8dg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv9jng5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 10:21:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-352e1a8603bso5688050a91.1
        for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 02:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509319; x=1770114119; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qmsmh2t6G90Bz/lts6CDSJg+tdpDYEK6R8xt5FrdQIU=;
        b=AuH0nc7vIU6QpA8MRKPFJYSnYFc4WInkekfl7Ct9bGWMOSgzAE+wak6MH8dMJyKTyH
         ZGcxv4Wb1nqOwEPTViwHsdlMipu9J2Kp/ThhjaokCCexc2iMF7J3hFHwe0Ag+q6lMrmu
         F7FYsqIwge5TOxKNdnJEM5TFG3yg45uLjsWie5ZR5nf8bUTQNXNaGja+HqkxCC2e4cGH
         jJyzPw1CXAlPA7vpVLcyn0qBYt8tZ7ctGc1meptYIJRvaGxqNNkRcK4OW3244GmCNiSB
         1i3GXV+rxbvXIsvmzIFdqh3zmyXAKm73e1NxBR8ALUNKWfaTSLW8V0vRv/n9kkDNrRDN
         qHtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509319; x=1770114119;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qmsmh2t6G90Bz/lts6CDSJg+tdpDYEK6R8xt5FrdQIU=;
        b=EiSWSK8KNlVSTIyyBTqDh3YBey8K8IWROgsyhrGlO3AM1vCk5bWIkWiE+y8+Z2dtDS
         ajP/WaFPfMF9MA7ylWZeaT1u89/gmKmMfVMhN7hltZ57bCAGv3O6wvOZEERh/wiSHRSs
         nw2ZlDdkp4uVBalaplk0k43hgS6YJeJICEPFWuNRUAwzmHsQE7UTUidiZb3/qmsvsUQS
         HNXOAtAyNuqfMQTXScaff4CKSlj6RjpkZZiyeAcZq5DAhapCBfpOCP+mTKhV+LNrKKfr
         E7o9btVK1MNdyVvAy1vGmGTFSy/eKGA678FvjyPysgU1/vEsl6/04kysXJVQQQlguZek
         EJ3A==
X-Gm-Message-State: AOJu0Yy29r9DoZrsqoF7QcM9hdz3MjJtfKkPhocHbXrOLB8v2Cddj/jx
	w1Fhn+yM6mihNR4dSZky2NbsJbXTr1hp/RTg6/x0nmgLuaWv5A4Geo40TgQcZnZbhU++cG3oDyg
	izVPlUMc7FiqyQ7rnR5fDVV4Ou0Z0KNe3s3dDUX5hyhQXeS7DojQiFc3CYrC6/0Wu
X-Gm-Gg: AZuq6aJzNljj4NrBbjC+qTh8T0vPHpixi4i4dvuCmgWfC8Q0adXvNfVwnqxQ5IJStNW
	AJdrWVn5lf+jmXJ9ToHtwuweAFkz7hGnwF2f2aBFUnoZcnpqua6f/JC1yQnGipAv62WNd8DKQ8z
	lBzmtlrfRm5wM5hk9saibDJq+QwnH1Z6BUQag8mwN3Hj5OuZ8sjNKprF862wOK+tt8PBW8CHBQN
	/HP8vhLUf65ooWePiyDJ99qKNsMSvjpJ8qTDC/N0JHtipJdeftfnL0LScmKq48eq3MqYNDE1m1e
	ch0pZcitTvLWC8ZYIlWUbng6dUpeqEf94oXmWjP+212OaMDJBa9ZKCDyR4y+zE2Rw+dlvlvw06a
	b3gn+wiTYke4HKSpyR/boPVbur48o+G5qKU+yokkG7dtN4RRKGTKmaXYm60LBjXzEZRWo0OI=
X-Received: by 2002:a17:90b:3b8c:b0:341:88ba:bdd9 with SMTP id 98e67ed59e1d1-353fed870c0mr1048653a91.25.1769509318577;
        Tue, 27 Jan 2026 02:21:58 -0800 (PST)
X-Received: by 2002:a17:90b:3b8c:b0:341:88ba:bdd9 with SMTP id 98e67ed59e1d1-353fed870c0mr1048635a91.25.1769509318046;
        Tue, 27 Jan 2026 02:21:58 -0800 (PST)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c635a4135e6sm10445191a12.25.2026.01.27.02.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 02:21:57 -0800 (PST)
Message-ID: <d6910fe4-cd35-4696-9a0e-13904f512ff8@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 18:21:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: Remove frequency range filtering for
 single-phy devices
To: Saikiran B <bjsaikiran@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-2-bjsaikiran@gmail.com>
 <776ae681-9db7-4051-abe1-07530f87d485@oss.qualcomm.com>
 <CAAFDt1sgAC6bHOVtELmcQVx=L1dTXDsQFtO+N3R_C2C35VOxhA@mail.gmail.com>
 <45061c9a-6f01-4228-9737-0222b4b49059@oss.qualcomm.com>
 <CAAFDt1sdE3Wpp5CByTZmBk=YnQxFhAwmbC5XpYaqYq0Wdx547A@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1sdE3Wpp5CByTZmBk=YnQxFhAwmbC5XpYaqYq0Wdx547A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OYOVzxTY c=1 sm=1 tr=0 ts=697891c7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=YKakg7jpQT0hG2YQ7QYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: rMXRS3-hCZc3PrrXiECsCwYTjcquOBiB
X-Proofpoint-ORIG-GUID: rMXRS3-hCZc3PrrXiECsCwYTjcquOBiB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NCBTYWx0ZWRfX0qaGIzsghb13
 XBcy71iXz+WtjkB7Wt5a9RTAb0Vw//9GgMWuDEh4tmMokzjW0F1jilWzTqc5SYyHBwnL5GWqIwX
 hBVqtrhwDF4R2W5UqK246jfhpcegF+8jqS6wsys40mknaF5i6AYjGkmsTFIMLwpkGMF+l3wR+CA
 Qniv+UVkouBMknaCAsG8kLnMPV66uoKbYPDU7YQUAABtOb9kMjUtikuh2e/8bcULxpj5DcHAS/C
 Khz2gGPyNLekPvLXHScuFKhl/0VnsfFUJJOfYB37gFPI3g94NyA18SVOaaPIbp1cx+9a33AkCO8
 PadXckpK9joEvlJgsoE83TQqU7m4hi0/KtRh19Mw0ierkkyGOOGnCnft5h0JX46Ss/WeNhlxZHc
 NI+TXiG8vTK5Md0aS7a7cxkSBpmvmnLqOSck8/0EqlHr2k723iwhQKJ7TUmwnoCofOPzKY1VEqR
 m/6ckLdi5BqjHX3xS9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_022201_067176_7E046E1F 
X-CRM114-Status: GOOD (  31.48  )
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



On 1/27/2026 4:58 PM, Saikiran B wrote:
> Hi Baochen,
> 
> 1. Here are the MD5 sums from my /lib/firmware/ath12k/WCN7850/hw2.0/
> (sourced from linux-firmware 20250901):

this is a bit old. Please try the latest board-2.bin from linux-firmware repo:


commit 1d588f106ceea113c4c650b43d948da5746e704c
Author: Jeff Johnson <jjohnson@qti.qualcomm.com>
Date:   Thu Sep 18 11:03:58 2025 -0700

    ath12k: WCN7850 hw2.0: update board-2.bin

    Signed-off-by: Jeff Johnson <jjohnson@qti.qualcomm.com>


$ md5sum board-2.bin
74878eeb4ea01b8ea6bd19b57c99d702  board-2.bin


> 
> 2fa9a691f199b25aafce48967d93c85b  amss.bin.zst
> 7cd6eb50e9a6ad98e658a53033214c9e  board-2.bin.zst
> 62c117046e52cb78c922635bea177afe  m3.bin.zst
> 953ba9719c55664a5d91d99b412caee1  Notice.txt.zst
> 
> 2. Logs: I realized CONFIG_ATH12K_DEBUG was disabled in my recent
> build. I am rebuilding the kernel now with the debug mask enabled and
> will provide the verbose logs in a follow-up email once tested.
> 
> 3. Regarding the Frequency Logic: While I gather the logs, I'd like to
> highlight that the issue likely persists regardless of the firmware
> behavior.
> 
> The freq_range filter assumes ar has a single contiguous range (e.g.,
> start=5150, end=5850). For a Single-PHY device like WCN7850 that
> supports disjoint bands (2.4GHz + 5GHz), a single start/end pair
> cannot correctly represent the capabilities.
> 
> If we set it to cover 2.4GHz, it filters 5GHz.
> 
> If we set it to cover both (e.g., 2.4GHz to 7GHz), the filter allows
> everything and becomes redundant.
> 
> I will get back to you shortly with the logs to confirm the firmware state.
> 
> Thanks & Regards,
> Saikiran
> 
> On Tue, Jan 27, 2026 at 1:11 PM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/27/2026 12:04 PM, Saikiran B wrote:
>>> Hi Baochen,
>>>
>>> I checked the logs again.
>>>
>>> The issue seems to be coming from how
>>> [ath12k_regd_update()](drivers/net/wireless/ath/ath12k/reg.c) handles
>>> frequency range updates for this device. WCN7850 is a single-phy
>>> device (single [ar](drivers/net/wireless/ath/ath12k/mac.c) that
>>> supports both 2.4GHz and 5GHz/6GHz.
>>>
>>> In ath12k_regd_update():
>>>
>>> 1. It updates the range for 2GHz capabilities (sets range to ~2.4GHz).
>>> 2. It then attempts to update for 5GHz capabilities.
>>> 3. Because `ar->supports_6ghz` is true, it uses the 6GHz path logic.
>>> 4. However, `ab->reg_freq_6ghz` appears to be uninitialized/invalid at
>>
>> Hmm, this seems like a known firmware bug. Are you using the latest board-2.bin? please
>> share md5sum of your firmware binaries under /lib/firmware/ath12k/WCN7850/hw2.0
>>
>> If you are using the latest, please help collect verbose ath12k dmesg log:
>>
>> modprobe ath12k debug_mask=0xffffffff
>> modprobe ath12k_wifi7
>>
>>> this stage (possibly due to regulatory init timing or country code
>>> issues, On Lenovo Yoga Slim 7x, SMBIOS does not seem to provide a
>>> valid country code. The driver attempts to set an invalid country code
>>> which the firmware rejects. This inturn triggers this issue. Fixing
>>> SMBIOS parsing/defaults is a separate, complex issue that varies by
>>> vendor.), causing the 5GHz range update to be skipped or invalid.
>>>
>>> [ 11.699027] ath12k_pci 0004:01:00.0: Failed to set the requested
>>> Country regulatory setting
>>> [ 31.111995] ath12k_pci 0004:01:00.0: Failed to set the requested
>>> Country regulatory setting
>>>
>>> As a result, `ar->freq_range` remains effectively set for only the 2.4GHz band.
>>>
>>> When ath12k_reg_update_chan_list() runs:
>>>
>>> It compares 5GHz channels (e.g., 5180 MHz) against a
>>> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) that only covers
>>> 2.4GHz.
>>> Result: `center_freq > end_freq` is TRUE -> Channel is filtered out.
>>>
>>> The filtering logic added in acc152f9be20 works for split-phy topology
>>> where each host ar covers a specific range. For WCN7850, where a
>>> single host ar covers disjoint bands (2.4G + 5G), [freq_range] but
>>> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) (start/end) cannot
>>> represent multiple disjoint bands at the same time.
>>>
>>> Removing this driver-level filter allows the firmware (which knows the
>>> true capabilities) to handle the channel list correctly.
>>>
>>> Thanks & Regards,
>>> Saikiran
>>>
>>> On Tue, Jan 27, 2026 at 8:52 AM Baochen Qiang
>>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>>
>>>>
>>>>
>>>> On 1/26/2026 5:52 PM, Saikiran wrote:
>>>>> The frequency range filtering added in commit acc152f9be20 was designed
>>>>> for split-phy devices where multiple radios with overlapping frequency
>>>>> ranges within the same band are combined into a single wiphy. Each radio
>>>>> in such setups handles only a subset of channels within a band (e.g., two
>>>>> 5GHz radios covering 5GHz-low and 5GHz-high separately).
>>>>>
>>>>> However, this filtering breaks single-phy devices like WCN7850 that use
>>>>> a single radio to handle both 2.4GHz and 5GHz bands. On these devices,
>>>>
>>>> To be accurate, WCN7850 still gets two phys in hardware, it is just in host that we treat
>>>> it as single.
>>>>
>>>>> the freq_range is set to cover the entire supported spectrum, but the
>>>>
>>>> exactly
>>>>
>>>>> filtering logic incorrectly restricts channels, causing 5GHz to become
>>>>> completely unusable.
>>>>
>>>> how? what are the actual values of freq_range when you hit the issue and how are they
>>>> calculated?
>>>>
>>>>>
>>>>> The issue manifests as:
>>>>> - All 5GHz channels filtered out during channel list updates
>>>>> - No 5GHz SSIDs visible in scans
>>>>> - Only 2.4GHz networks functional
>>>>>
>>>>> Remove the frequency range filtering entirely and rely on the firmware
>>>>> to handle frequency restrictions based on actual hardware capabilities.
>>>>> This approach works correctly for both split-phy and single-phy devices,
>>>>> as the firmware has complete knowledge of what the hardware supports.
>>>>>
>>>>> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>>>> ---
>>>>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>>>>>  1 file changed, 13 deletions(-)
>>>>>
>>>>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
>>>>> index 7898f6981e5a..48c362a86524 100644
>>>>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>>>>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>>>>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>>>>>                       if (bands[band]->channels[i].flags &
>>>>>                           IEEE80211_CHAN_DISABLED)
>>>>>                               continue;
>>>>> -                     /* Skip Channels that are not in current radio's range */
>>>>> -                     if (bands[band]->channels[i].center_freq <
>>>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>>>> -                         bands[band]->channels[i].center_freq >
>>>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>>>> -                             continue;
>>>>>
>>>>>                       num_channels++;
>>>>>               }
>>>>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>>>>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
>>>>>                               continue;
>>>>>
>>>>> -                     /* Skip Channels that are not in current radio's range */
>>>>> -                     if (bands[band]->channels[i].center_freq <
>>>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>>>> -                         bands[band]->channels[i].center_freq >
>>>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>>>> -                             continue;
>>>>> -
>>>>>                       /* TODO: Set to true/false based on some condition? */
>>>>>                       ch->allow_ht = true;
>>>>>                       ch->allow_vht = true;
>>>>
>>


