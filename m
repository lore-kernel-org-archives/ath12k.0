Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5F5D46C01
	for <ath12k@archiver.kernel.org>; Thu, 29 Jan 2026 02:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v8l+S9ANwleyd185ZC23J/8eHolw2Si4CnB7avBT2P0=; b=yRYeb/FCJsIZ4LKkocVtQefM2h
	LZMR6y3HF/8ZSj90Afq1p75Mpm24M8Jj3XT7sp0uE71fsn8K1rbU0CoPTS12UZl7G6KMnCV4UAcMn
	zVJWM5VDfRJpiEDVRoR+zQtK+ls+lCjipRXfEb5xUaM3RyXy+7Y125SliyA2N1tmbqNnX0kmaY4Gc
	79zLU6QsWe0n0Rcb2p69EJzGXlyrsJr94AEIaDJIzjMLnW6eJbnXDSDH3zOb25qgvSy3NX04AuJ/C
	j44Ys2nimW/yAR7cX/+TbBdaSE4cWOrenyl7SIqhfx2Ny8vp4xcHvyUqI0fsBhWz/scu9ggdV6sgk
	pvRwrHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHl6-0000000H7zd-2wme;
	Thu, 29 Jan 2026 02:27:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlHl3-0000000H7zI-4BAA
	for ath12k@lists.infradead.org;
	Thu, 29 Jan 2026 02:27:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SK9x1e546849
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v8l+S9ANwleyd185ZC23J/8eHolw2Si4CnB7avBT2P0=; b=WQmQ+ZQPyV+TKGln
	JOMfGfaP4rI8lRJSzf6/DEZit9uLAjMNzgfvh5JlZi4JhgufTxQ01A8pEp5lM78h
	lB+XUcKCm2KVORj4Q0EckHmtsVV23l0P/CX3M13x/F3C7/lb4cqvyyM5xXbj/2yl
	70ScYirBfjJ0V3cSISDDm5+4hOSoOjwQa7TLlTmpCyqHN2BPnC4lUq7jVctWd3h1
	DoTPo+CbonYJT2BukpPmE3JYt204Jd9dFkWVVcN2Jv230mtLOoYUeE0iYkPBc2i5
	4IFsodAgW+WYfmhXhXZVMedjDArZBe73/R3ZYdHHuDI+WvimwWQZQNO8RF+Onavs
	uTzEUw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bydfk3s99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Jan 2026 02:27:44 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a863be8508so5314285ad.2
        for <ath12k@lists.infradead.org>; Wed, 28 Jan 2026 18:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769653663; x=1770258463; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8l+S9ANwleyd185ZC23J/8eHolw2Si4CnB7avBT2P0=;
        b=YHHDahHxnfmPAb3rXwVgl7h9XdEtrL0fpbJg0lMIp/p8RZHCuMafyOROLyNwL5QqC0
         5MMYIDXmT9OoLYQEYOM87xUigUBj+MgIX15EQfcyHIQxrLK3IPGq3scPHbt9TT48LYD6
         dLIpOUnirUQe9TfeF7w+oUPEAtdu+PHQlcUifgvkM/GNTDovERT5hy88E21Ibte9hUGH
         CC06HiJrV7jjZD0gz6GP+gstkqyJ1rOd9lWYYAB4NKtGpv6tR8/j7oCd2wdK9ayUmtVl
         uf8l9z4Y5TzcbYRw8QS20L/pttdOAH3qUFab+HaJiK7nh76sXnt5vhxT1R3E1qlC2yK/
         8IKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769653663; x=1770258463;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v8l+S9ANwleyd185ZC23J/8eHolw2Si4CnB7avBT2P0=;
        b=EfcWI0zNpmoB/plDW+M1EI0ZeYCINwJCgIBuyxTQheVXivbqQgH/oHiQOPGmwKFMoX
         7Z473g8P/uS2Ty3n2uxVwixepvvdHhTXbgb61UsKLYVZpfb3v77zbL1QZmztSh7i5OWW
         p9uAyP0FZLisv+U5+4yGjJ8EnIsZjYfTL/xicUa+a9EsBc38B1XUDadT9KVcJxo2vx4s
         D0j7Os2jteyaTXA/eCyIOO9/bMo8LfYKLJcVT3ROB45JL/UvTySGJvB3banHVSmBWdGN
         wSeBy4nIyen3WjGsnZAULHQEfIYvAFD4J0D0Y3U3aPYn4e/Jfxt6SOs5zNobKicvbCm1
         Lpmg==
X-Gm-Message-State: AOJu0YwR9KbowBpot/ZirUWWzo+uE0G50gwunaK4M4GxPsz5RGGjCuP3
	JgMh4bCQ9SltB8His/HJayL+TVj6CzijWJJMhOdyPzhbeojmZbuAD/B8CmAzC0tu89vwa/mz+Ek
	7c/nJC5Fxd4NjCJwtx/vaQuqXngTq15veZX/w56cpMqpUAHelI56HXkDD1+neR089
X-Gm-Gg: AZuq6aJHEzsNKKiKZB6LawGMIEw8kKzWtzrZA9yq2zg13vwTPoPgQIwNyyebesGPXhc
	oaqv8GiQY76Vxi1BlETc036MwGgZ7oIIl+89K14082X39fDsJR2hz9jF0QLs0jms9xybTavDQSK
	SnnlUINdC1QqKUFDITIlAp0vla69qSObuUDVZB0rUIQEnM7kmCy6TelEaff9J9yaevqrXadR2VZ
	sk5op9G1EMhwavpZ7EE7vrntAo/1/c8b/2cBHzJusoQ/HNxmWZWWJ2UFVlRVzXs20totLG3o+SI
	InT77PZuDsTMExrBeLimfn2s1t4OVmN60ZjVaUatInXw/gK1bX3Z9n1U9c/vaWgsJajQ7mSWMvf
	EKMZG8LEkqVZjXIEJlqtZAqsD0KmW8uXwRrZt5b2Cf2P31OZlc4l5AMMGXDJJe9Amo7z9PLXk2p
	alBiBAHNE=
X-Received: by 2002:a17:903:3504:b0:2a7:6460:74f9 with SMTP id d9443c01a7336-2a870dd5466mr62599405ad.24.1769653663127;
        Wed, 28 Jan 2026 18:27:43 -0800 (PST)
X-Received: by 2002:a17:903:3504:b0:2a7:6460:74f9 with SMTP id d9443c01a7336-2a870dd5466mr62599245ad.24.1769653662608;
        Wed, 28 Jan 2026 18:27:42 -0800 (PST)
Received: from [10.133.33.202] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e5ac4sm33022645ad.86.2026.01.28.18.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 18:27:42 -0800 (PST)
Message-ID: <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 10:27:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Saikiran B <bjsaikiran@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
 <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDAxNiBTYWx0ZWRfX9oHV+h97H3DH
 F0pVyP9oFoIoExR+EbYz43I0OC4q7ye8M+nxg3tfzocY1c8bQQg+JK9Y9ow4cW9HNd+6dhLd72s
 jaMtD2hkzRB5AiIKieFnS8tciB2U4US3T9XqkbtMpsvLPcMNOILYjMopHlcWouW/BpFFSkXf4xQ
 lEeDz5pL0YLkR5akuykAtziN6oyukoCgwLl8/0DoSVayvg5JIAme3W48cjrVz9CjmDECMjzPJVL
 O2uu/Ncig5QchiX27zVzPqcZeqeXt2oj5t9J1HCemnSIgp/ODycsnXiQf9LhFjB8+bqctztsQAU
 SyQLnZciruygoWsBMvF9xcsbhVL9jQC50DJGmh8sy8RcM5maxRvCl93+FWWHF5Ds4w0ljCeQJGA
 vHkKdWJQTNY06c4uHT/UIY0mfT4wrDpl7YUJynJj9tJc3Cw38kE3fjNhXNZhYFYA2v21uaV5+Zk
 UM5beVCn05tmXxSKCqQ==
X-Authority-Analysis: v=2.4 cv=XfWEDY55 c=1 sm=1 tr=0 ts=697ac5a0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=danhDmx_AAAA:8
 a=pGLkceISAAAA:8 a=wpMiBxZ-6fOymbzk10oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: pq3UKHWP1_vFSB1o-hbsk6WCbk1a3VlL
X-Proofpoint-ORIG-GUID: pq3UKHWP1_vFSB1o-hbsk6WCbk1a3VlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_06,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_182746_182878_14CD346B 
X-CRM114-Status: GOOD (  31.11  )
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



On 1/27/2026 12:40 PM, Saikiran B wrote:
> I have analyzed the logs and code flow in depth to provide more
> definitive answers for your questions.
> 
> The log entries showing the failure are:
> [  563.574076] ath12k_pci 0004:01:00.0: failed to pull fw stats: -71
> [  564.575896] ath12k_pci 0004:01:00.0: time out while waiting for get fw stats
> 
> 1. Why are other stats populated?
> The "failed to pull fw stats: -71" error is not the initial failure
> but a symptom that appears after repeated operations. The leak happens
> during *successful* calls prior to this error.
> 
> Code flow proving the leak:
> - ath12k_mac_get_fw_stats() sends WMI_REQUEST_PDEV_STAT.
> - Firmware responds. ath12k_update_stats_event() parses the response.
> - ath12k_wmi_fw_stats_process() is called, which splices 'vdevs' and
> 'beacon' stats into ar->fw_stats.vdevs/bcn.
> - ath12k_mac_get_fw_stats() returns 0 (Success).
> - In ath12k_mac_op_get_txpower(), the check `if (!pdev)` fails if the
> pdev-specific list is empty (but vdev list is NOT empty).
> - The function exits via `err_fallback` WITHOUT calling ath12k_fw_stats_reset().
> - Result: The 'vdev' and 'beacon' stats that were spliced into
> ar->fw_stats remain there, leaking memory and accumulating with every
> call.
> 
> 2. Exact place where -71 is printed:
> The error "failed to pull fw stats: -71" is printed in
> [ath12k_update_stats_event()](drivers/net/wireless/ath/ath12k/wmi.c).
> It corresponds to "ret = ath12k_wmi_pull_fw_stats()" returning -EPROTO.
> This propagates from
> [ath12k_wmi_tlv_fw_stats_data_parse()](drivers/net/wireless/ath/ath12k/wmi.c),
> when buffer validation checks (like `len < sizeof(*src)`) fail.
> 
> Conclusion:
> The fix in my patch (resetting stats when `!pdev`) is critical because
> it ensures that the accumulated 'vdev' and 'beacon' stats are freed
> even when the 'pdev' list ends up empty.
> 
> Let me know if you need anything else.

can you please try below to see if it can fix your issue?

https://lore.kernel.org/r/20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com

> 
> Thanks & Regards,
> Saikiran
> 
> On Tue, Jan 27, 2026 at 9:47 AM Saikiran B <bjsaikiran@gmail.com> wrote:
>>
>> Hi Baochen,
>>
>> Regarding your questions:
>>
>> "Are other stats populated?"
>>
>> Yes. When ath12k_mac_get_fw_stats() returns success (0), it means the
>> firmware response was received and valid WMI events were processed.
>> The firmware response to WMI_REQUEST_PDEV_STAT typically includes
>> multiple stats TLVs (vdev stats, beacon stats, etc.). Even if the
>> "pdev stats" list ends up empty (e.g., due to specific filtering or
>> availability), the firmware should have populated other lists (like
>> vdevs or beacons) in the ar->fw_stats structure. If we don't reset,
>> these valid entries leak and accumulate.
>>
>> "Where exactly is -71 (EPROTO) printed?"
>>
>> The log "failed to pull fw stats: -71" is printed in
>> ath12k_update_stats_event() (wmi.c line 8500 in my tree). This error
>> code (-EPROTO) propagates from ath12k_wmi_tlv_fw_stats_data_parse(),
>> where it is returned when buffer validation checks fail (e.g., if (len
>> < sizeof(*src))). This failure suggests that the accumulated state or
>> memory corruption from the leak eventually causes the parser to fail
>> on subsequent events.
>>
>> So, fixing the leak is necessary for correctness regardless of the
>> specific side-effect error code.
>>
>> Thanks & Regards,
>> Saikiran
>>
>> On Tue, Jan 27, 2026 at 8:57 AM Baochen Qiang
>> <baochen.qiang@oss.qualcomm.com> wrote:
>>>
>>>
>>>
>>> On 1/26/2026 5:52 PM, Saikiran wrote:
>>>> The commits bd6ec8111e65 and 2977567b244f changed firmware stats handling
>>>> to be caller-driven, requiring explicit ath12k_fw_stats_reset() calls
>>>> after using ath12k_mac_get_fw_stats().
>>>>
>>>> In ath12k_mac_op_get_txpower(), when ath12k_mac_get_fw_stats() succeeds
>>>> but the pdev stats list is empty, the function exits without calling
>>>> ath12k_fw_stats_reset(). Even though the pdev list is empty, the firmware
>>>> may have populated other stats lists (vdevs, beacons, etc.) in the
>>>
>>> 'may' is not enough, we need to be 100% sure whether other stats are populated. This is
>>> critical for us to find the root cause.
>>>
>>>> ar->fw_stats structure.
>>>>
>>>> Without resetting the stats buffer, this data accumulates across multiple
>>>> calls, eventually causing the stats buffer to overflow and leading to
>>>> firmware communication failures (error -71/EPROTO) during subsequent
>>>> operations.
>>>>
>>>> The issue manifests during 5GHz scanning which triggers multiple TX power
>>>> queries. Symptoms include:
>>>> - "failed to pull fw stats: -71" errors in dmesg
>>>
>>> still, can you please check the logs to see at which exact place is this printed?
>>>
>>>> - 5GHz networks not detected despite hardware support
>>>> - 2.4GHz networks work normally
>>>>
>>>> Fix by calling ath12k_fw_stats_reset() when the pdev list is empty,
>>>> ensuring the stats buffer is properly cleaned up even when only partial
>>>> stats data is received from firmware.
>>>>
>>>> Fixes: bd6ec8111e65 ("wifi: ath12k: Make firmware stats reset caller-driven")
>>>> Link: https://bugs.launchpad.net/ubuntu-concept/+bug/2138308
>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>>> ---
>>>>  drivers/net/wireless/ath/ath12k/mac.c | 1 +
>>>>  1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
>>>> index e0e49f782bf8..6e35c3ee9864 100644
>>>> --- a/drivers/net/wireless/ath/ath12k/mac.c
>>>> +++ b/drivers/net/wireless/ath/ath12k/mac.c
>>>> @@ -5169,6 +5169,7 @@ static int ath12k_mac_op_get_txpower(struct ieee80211_hw *hw,
>>>>                                       struct ath12k_fw_stats_pdev, list);
>>>>       if (!pdev) {
>>>>               spin_unlock_bh(&ar->data_lock);
>>>> +             ath12k_fw_stats_reset(ar);
>>>>               goto err_fallback;
>>>>       }
>>>>
>>>


