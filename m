Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8247C55175
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjThdsrRvBwAqWGyegRKxv4Br4zYVqQV4JHJU+RqtaE=; b=SBN/o5V3PS7ri7jh+vR/gLi04t
	yvqqFwfEX3RdLOYWhhckXfsDvIX+NttLyphyPYS1GpMqX4nbnh7tDSP8+/RvK/hEqOD9u6KiGVVW7
	L6eGcuDlrPu/RdromPhdafbO/2IJmPXkFfxjdo7uGxlzt4XLrqkJYz/WiO5+BXEaWN8SgIqbK/Kga
	CeNDzaSiU1Hj6Pv88d13eDhgkvvXn8JXqHJeggZjAMNITnk8sQynvjlpPpStKiMXT7x4qsn6Zwg4j
	0T20yNJF1n24iXidUQad3q3koD6XN0ArPMQiMx2SKdrRDMhDY2KnbsDWCjuodPwaxBEee1Sj+cK1o
	A/54uxhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqoA8-0000000GcEZ-21N7;
	Mon, 03 Aug 2026 08:36:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqoA5-0000000GcEB-1gMn
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 08:36:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6736sVKR3790743
	for <ath12k@lists.infradead.org>; Mon, 3 Aug 2026 08:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjThdsrRvBwAqWGyegRKxv4Br4zYVqQV4JHJU+RqtaE=; b=e+WuAAjCOfzuWhOe
	/O8/xFLxFApII8I/hUD96r5/LwjI/Eqn+enXpqVEUWWtYsqhCms3k4gW1nYpF3yc
	jXkciE8BHIjytEZGezh3NK8zKvGCMRnoZ5WGuUUAAvG8kBE22LZlwQ7j/3l2paer
	NTzHXGwed95aM+3PyRtATt43FdAOQRpjRDhGTqZZL4gGo9/nECAFM0/MARJ7CabL
	xosED+OOaIB0wr2kItp9RztR/PiYhK2uiM0yaPiHWDax1d42pIJUW5VAgbxf1buE
	mVcFun2gW2KmafyGlXD9RwYj+3KH0GJNVpVkIh0YtNXTuH7+qswvG7V8UUkkodd9
	SwSUpA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp4r0e23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 08:36:39 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso5153036b3a.1
        for <ath12k@lists.infradead.org>; Mon, 03 Aug 2026 01:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785746199; x=1786350999; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjThdsrRvBwAqWGyegRKxv4Br4zYVqQV4JHJU+RqtaE=;
        b=JSDZ4KcgOrHletiNbC33mWCa3IUpBTHkKndnFPlTct3LwqdKCp+WcGPP0XzMX0GYvz
         EmPB3H/75KMXa7v4mZaHSs+tGpsiUKhbtvnylmVsBhV28l2d5XXF7PiUpKYfp9i4MkgX
         fnEWMn6Xs0btlBe6jN7hwvnFyDk6Lv/aD7R2e+FtzPlCuNdIN0F1v3Kx/B+VMbtiGaV/
         vcq4qISCo1CWycsBK8YkTM6cs4aP1WQF7NucRblQ+mDwYSe4erGpRTwnDeRUsT/ZFzf/
         rdgfIREOfu5jok3l+Y2OfbHYuaVSuJxeevQaqqcGQZsRBOPzOystv2XlbCw0y3TurRLs
         VLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785746199; x=1786350999;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjThdsrRvBwAqWGyegRKxv4Br4zYVqQV4JHJU+RqtaE=;
        b=tYNSUPPzWFYsEbaY8+qMo+2ox2kgmvI6r+prKRPXkKOK6B8N3LdK/SyYIHI6ZdQvJ0
         VKW2UDlyVV34e6gKoDLdDWLtNP6EhxtCWmW5X8dn3CPs8AQIW++tMsGvhLyzc0tw5AA0
         tRiLH1nvEMBGgAmIcGFxgXdl6ny05apeOXuKY1OTuNZmwvIh3xfZnFf+8bRQGyyw5x4k
         lJ/nPWdv32eeegI4xnMd4p4dtkscmZ2Qj2AP3T/zBvU6gywFQe50ClxX2/oF1mFohsfu
         TUL3+pQm1H5x1IWz2NQrq8nDqhAhpalmiD7JtRUFe/fMvU0GRxIRHP/Q6mItV5rLxcL5
         WBjQ==
X-Forwarded-Encrypted: i=1; AHgh+RqKbsxZ9BJleEGg2Ch2nNQrc1mMnHWxLZ6DcOGWhIlPq1SjhWM4g6Aw4iM/cMRCMdK1AzCg5Os=@lists.infradead.org
X-Gm-Message-State: AOJu0YwiJhoEXr1j+rDB1hn45jXuecMqjR+qAcJ/123dSDOUmHXmFcO/
	v25+uYJkHPaG/uZvyl60xRVw6njjBBd/VW4yhT+Bawhiv/rsrhfwYTXBQO6Y+LBQr/XDmQkhhfU
	iROl1UcedODqXf2+emgBkcyuFjLTysVzO4+mUlVfwT6TmJQlRl8nDzG7W92DfWOca
X-Gm-Gg: AR+sD10jsAPW1OGE2kHDPhYR/DXjgZFZEvMvpp4AuAy+3g8uBUWiRK5mhppQGwMzhgD
	yfFpcReiue89LRuOL6PGolclxsRKd6Q+bRGE+Ba6lzUTSx3gjCRIzJ9OdgeoT/l4bOUF9sDGfoM
	oPVuU4u/f/tCOBgXXZgI7FjshzeO9uIjqKPXKaNiXMQ6oaJS48FTMp+zHuwcVtCp4nULeO1zLKt
	vKMyLITuxXuShlwBZIj2iQeBhlmaMLLY+/PrhS3pyHnCPEEyEmpfJYs1Uo7hDBUUUNXpQLyXpOo
	38M7SjiC/LBa3Zfr54nZ/d4O+cLYcBFZKh4K7p8IU6exo9S9B3pN6bscnYhJ9RytGPG8rxyPVEs
	wrzrJfSFKJJyCXlLkcD4r6LdM/513HTdXX5lOvq0PqECBAuVxI4SkbJot5aR4z4Hj+b5Vyx9EeQ
	==
X-Received: by 2002:a05:6a00:13a1:b0:847:717b:cf6b with SMTP id d2e1a72fcca58-84ed726129dmr9744207b3a.13.1785746198694;
        Mon, 03 Aug 2026 01:36:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a1:b0:847:717b:cf6b with SMTP id d2e1a72fcca58-84ed726129dmr9744169b3a.13.1785746198057;
        Mon, 03 Aug 2026 01:36:38 -0700 (PDT)
Received: from [10.133.33.236] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc29ebbcsm3359846b3a.34.2026.08.03.01.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 01:36:37 -0700 (PDT)
Message-ID: <9dd4e992-5810-429f-bc54-036c4eb276a7@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:36:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: fix frequency range for
 single-pdev devices
To: Shenghan Gao <gsh20040816@gmail.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260715065218.41232-1-gsh20040816@gmail.com>
 <5ca16013-e8a0-4403-a2b3-b3b43ea2bb2d@oss.qualcomm.com>
 <CAMVcGaDKC626A6=VC+10vtw3KVNm2NM_yPXTbgnA9Efd5eyL7A@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMVcGaDKC626A6=VC+10vtw3KVNm2NM_yPXTbgnA9Efd5eyL7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X9Ri7mTe c=1 sm=1 tr=0 ts=6a705317 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=V-hb4gzNiQ0U6DL70VsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: uY_hDmlwiWpE8MeUd-J4AjD8e1BIOC6x
X-Proofpoint-GUID: uY_hDmlwiWpE8MeUd-J4AjD8e1BIOC6x
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX2cSt2kU2adwx
 JjJQuuWWxsySNlriPFoKPWmK14salYicEJ4El4hndLVL78b7MpQY1Yrw+O97kt1pVbTM6TGIpzy
 OT3gtRMyCvB8LOt8r8Jrld7XVbGD6Fk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA3NiBTYWx0ZWRfX57Cu4Hbx788c
 SLqp1YXEJSs1bo7jPGfzIjRbOVbsF4a+IAJIRZ8HAYgMvHxqHZaGJVUAwzwrBUlsYorU3XLbURz
 8T3F0euNJvaIjMuhngm1UAjW7S3rA9/OGfw/XTwna1fQXv0rlFnUhUEhxXwol8zXMxJBaeDWZaq
 K24IUNZZ/nroCrAM1NfuNDi93t36YZVno2O0XvxVryXAbjKWGHTRzVpo5zTJXXqJwKgMOlUzmJo
 J8k++9roHKRt5dxG9SqYX56oTZDfgQFA00ch3CNNHJsQjUUb191hTTCJRVahME8buf2MIS34gFT
 KvwGM6XTA+CM+yy0w5/XyY+SQp/jwdnMJ2emWvrK+ijhus7TiDrlx8LPV62H0rcycev8g4CW+LB
 aYdRiIl2Lh9uk1ASW2HghMhnRrfXe4wW50iq+AfYy8FOLWDfj+VO0ha2ye1ECYpJFmSDsk9Q7Py
 lUsJtbxwOt01PiXeBHw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_013641_558477_6C6033A7 
X-CRM114-Status: GOOD (  26.51  )
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



On 7/20/2026 5:25 PM, Shenghan Gao wrote:
> The update sequence is as follows.
> 
> ath12k_regd_update() first resets ar->freq_range to zero. On the
> tested WCN7850 under the CN regulatory domain, the 2 GHz branch
> calculates a valid range, so the first call to
> ath12k_mac_update_freq_range() sets ar->freq_range to 2402-2482 MHz.
> 
> The existing 5 GHz branch is skipped because ar->supports_6ghz is true.
> 
> When the new regulatory domain is built, reg_freq_6ghz.end_freq is
> reset to zero. Since the CN regulatory event contains no 6 GHz rules,
> it remains zero. The 6 GHz branch therefore calculates freq_high as
> zero, and ath12k_mac_update_freq_range() returns without extending the
> existing range.
> 
> Consequently, ar->freq_range remains 2402-2482 MHz, and the subsequent
> channel-list update filters out all 5 GHz channels.

Thanks, now I get the root cause.

However the change of this patch looks more like a workaround rather than a proper fix:

Current radio frequency logic has been architecturally wrong from the start. Ever since
657b0c72c4ad introduced reg_freq_*, the entire purpose of this code has been to compute a
per-radio frequency range (to advertise each radio's own Frequency Range to user space —
Idx 0/Idx 1 in iw phyX info). Since the quantity is per-radio, reg_freq_2ghz/5ghz/6ghz
should not live in struct ath12k_base (per-device). Storing a per-radio quantity in a
per-device field is a layer mismatch, and every problem below derives from it.

Two problems caused by keeping them in ath12k_base:

(a) A cross-phy race that silently drops a range. Firmware sends WMI_REG_CHAN_LIST_CC_EXT
per phy. build_regd() resets all three ab->reg_freq_* to {INT_MAX, 0} and refills only its
own phy's band on every event, while regd_update() runs per-ar off a workqueue reading
that shared per-device state. A later phy's event can reset, e.g., reg_freq_5ghz back to
{INT_MAX, 0} before an earlier radio's regd_update_work runs; that radio then computes
freq_high = min(high_5ghz_chan, 0) = 0 and the range is silently dropped by
ath12k_mac_update_freq_range(). This is a real shared-state race.

(b) It forces the ar->supports_6ghz proxy — which is where your change comes from. Because
ab->reg_freq_* is per-device, regd_update() can't tell from it which band this radio
covers, so it falls back to ar->supports_6ghz to guess whether this is the 6 GHz-only
radio. That proxy only holds on split-pdev; on single-pdev (one pdev covers 5+6 GHz,
supports_6ghz=true) it breaks, which is exactly why you had to add the || single_pdev_only
exception to rescue 5 GHz. The awkward compound gate is rooted in using a per-device proxy
to decide per-radio band ownership.

Based on above, I would suggest making reg_freq_2ghz/5ghz/6ghz per-radio, in struct
ath12k_pdev. ath12k_pdev is the driver's canonical per-radio object (1:1 with a radio,
holding ar/cap/mac_addr), and this operating range is a property of the radio — so it
belongs there, right next to cap (the HW freq limits), which is the same class of data (HW
capability vs. the rule-intersected actual range). Both problems then dissolve:

- (a) is gone: each radio's range is isolated; a later phy's event can no longer clobber
another's.
- (b) is gone: the gate can ask the ground-truth question — "did this radio receive reg
rules for this band?" (end_freq != 0) — with no supports_6ghz proxy:

  if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
      ar->pdev->reg_freq_5ghz.end_freq) {

> 
> With this patch, the 5 GHz branch also runs for single-pdev devices and
> merges the valid 5 GHz range, extending ar->freq_range to
> 2402-5835 MHz.
> 
> Baochen Qiang <baochen.qiang@oss.qualcomm.com> 于2026年7月20日周一 16:34写道：
>>
>>
>>
>> On 7/15/2026 2:52 PM, Shenghan Gao wrote:
>>> Commit 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
>>> made ath12k_regd_update() handle each supported band independently.
>>> However, it uses WMI band capability values as indices into
>>> pdev->cap.band[]. Those values are bit flags, while cap.band[] is indexed
>>> by enum nl80211_band. As a result, the 2.4 GHz lookup reads the
>>> 5 GHz entry, while the 5 GHz lookup reads the 60 GHz entry.
>>>
>>> Also, the 5 GHz range is skipped whenever the radio supports 6 GHz. This
>>> is valid when 5 and 6 GHz belong to separate pdevs, but not for single-pdev
>>> devices such as WCN7850, where the same pdev covers both bands. After a
>>> regulatory update, 5 GHz is therefore omitted from ar->freq_range and later
>>> filtered out of the channel list sent to firmware.
>>>
>>> On the tested WCN7850, the 11d regulatory update left the frequency range
>>> at 2402-2482 MHz and sent 13 channels to firmware. A subsequent 5 GHz scan
>>
>> can you share more details on how the frequency range is updated to cover only 2 GHz band ?
>>
>>> failed with WMI_SCAN_REASON_INTERNAL_FAILURE. With both ranges combined,
>>> the range is 2402-5835 MHz and 26 channels are sent to firmware.
>>>
>>> Index cap.band[] with NL80211_BAND_* and update 5 GHz for single-pdev
>>> devices even when 6 GHz is supported.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>> Fixes: 0d777aa2ca77 ("wifi: ath12k: fix mac pdev frequency range update")
>>> Cc: stable@vger.kernel.org
>>> Assisted-by: Codex:GPT-5.6 Sol
>>> Signed-off-by: Shenghan Gao <gsh20040816@gmail.com>
>>> ---
>>> Testing notes:
>>>
>>> - Runtime testing was performed on WCN7850 under the CN regulatory domain.
>>> - 2.4 and 5 GHz scanning and 5 GHz association were verified.
>>> - 6 GHz operation was not tested because it is unavailable under the CN
>>>   regulatory domain.
>>> - QCC2072 was not tested because the hardware was not available.
>>>
>>>  drivers/net/wireless/ath/ath12k/reg.c | 7 ++++---
>>>  1 file changed, 4 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
>>> index 89abf2e87ad1..c3bb1df2b1e2 100644
>>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>>> @@ -300,7 +300,7 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
>>>
>>>       if (supported_bands & WMI_HOST_WLAN_2GHZ_CAP) {
>>>               if (ab->hw_params->single_pdev_only) {
>>> -                     phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_2GHZ_CAP].phy_id;
>>> +                     phy_id = ar->pdev->cap.band[NL80211_BAND_2GHZ].phy_id;
>>>                       reg_cap = &ab->hal_reg_cap[phy_id];
>>>               }
>>>
>>> @@ -310,9 +310,10 @@ int ath12k_regd_update(struct ath12k *ar, bool init)
>>>               ath12k_mac_update_freq_range(ar, freq_low, freq_high);
>>>       }
>>>
>>> -     if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP && !ar->supports_6ghz) {
>>> +     if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP &&
>>> +         (!ar->supports_6ghz || ab->hw_params->single_pdev_only)) {
>>>               if (ab->hw_params->single_pdev_only) {
>>> -                     phy_id = ar->pdev->cap.band[WMI_HOST_WLAN_5GHZ_CAP].phy_id;
>>> +                     phy_id = ar->pdev->cap.band[NL80211_BAND_5GHZ].phy_id;
>>>                       reg_cap = &ab->hal_reg_cap[phy_id];
>>>               }
>>>
>>>
>>> base-commit: a1a21995c2e1cc2ca6b2226cfe4f5f018370182a
>>


