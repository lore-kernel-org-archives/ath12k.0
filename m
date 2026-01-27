Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B6E0D2595A
	for <ath12k@archiver.kernel.org>; Tue, 27 Jan 2026 07:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dprmke1Nl4vM405OVGCjKPKs6FWp844yoaeNutzCxs=; b=SmW/jEEr8Gu+1BTpULDZ1P5kEH
	w2SxZYLA1HmHvwNzU0TpmYrn4QCT4vpGLJoeHzeik5WVkGiRl3lmqn9avNI0LrzPHh060lb2SDWwj
	KRaGW8ndSOyXrsgbzNrQcGPmwaIm4hlKbRf/xEVAeNkW0R68ysrxTsxgJ3e4XyythAS8E3Jmsy3sL
	LtiCxr5yU0cPxnU68AsbX9ILvYnIacanF2LP2VSyZIRranc8xXMixa6NkR52XKTQKcJwp9cJGh5UN
	zdWNuuaZhSX7rXfYQjKsqxMRqixqvO00W94KGtIvnXhQvbrNBh1N3vfkpaIaa45rgoO/RvqEbkXgS
	+1Cv+BMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdhk-0000000DnSH-15MV;
	Tue, 27 Jan 2026 07:41:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdhh-0000000DnRq-0DnE
	for ath12k@lists.infradead.org;
	Tue, 27 Jan 2026 07:41:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4U6DS1268740
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 07:41:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dprmke1Nl4vM405OVGCjKPKs6FWp844yoaeNutzCxs=; b=p7ZNIXkxpdRYNslr
	MwBulEeqrO+u6F7KQb7YU8ekbu5/oDkGtF++xjPMZWUB+p/nvgZ0EXDgVK6g2JTb
	714SaAxtHhX6vDdb5CSfqcPN3YEFRtYnY/0O62W0vmBvNRDC4eqiz8LIRFZQTbo2
	sln7+0b3q2gmfNnLJIoX9g+jNTL1cDpGRzrxIhjygesdaPFRCRAMrNGt3uV6ysdf
	3jLGkZKMBvmQ8jwjkK25tWMx3csdi9a+2xD05fU3d+YsFOGsX4zCtkwW6ueX6FOw
	Uq+bIzPiJz4sFdZlYF5lWnyGMaCeR1TyrNVFWYmtrVhu2op0+Oj1OeDR06VoULlt
	fizueA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyarnr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 27 Jan 2026 07:41:35 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-352b6ad49ddso3589140a91.0
        for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 23:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769499694; x=1770104494; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7dprmke1Nl4vM405OVGCjKPKs6FWp844yoaeNutzCxs=;
        b=DyXTKXDjfJF4fQfizGnxQ74MBGojb2Bc9mZmAaTLm6+RQezyHWaZo2psmaBWon265Y
         8SkG+gHf3AYL4lD5eD4BUmsnfNaYNV8D22jVYfJJk2t/kjYfFYq2Isz57/NpcD1rwVDC
         U6bBNpqRRYitDpGe+Aq743MEJe2VvMylMzkY3F1oVzOYoYo3jkPbVYYx49JLXXldUlPm
         NXQqzPuz/FII0BH8xO8OC2tqxnvNi6opn3Rt76R8hNgDBl9OP+XAM/z5vTkAOGnC6U8U
         6OIU9hXb2rtB7lXKjwpQOzGBxdN40f4AuvhzQdJD1khV6s54M5FcRN4oNQmckbNvgYU2
         4ixw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769499694; x=1770104494;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dprmke1Nl4vM405OVGCjKPKs6FWp844yoaeNutzCxs=;
        b=hRZzXJPI6OjvCLRSf+RAf1tlyfYXEGSCcaNS3QcZd2t2JdQ2FbhMeM9wnRE3sUcx1x
         igwUjjK/S/4aqbLiuYBeP8D5LcRu99Po+OGM5OI1LcrtRDDH8bI/ixuK3yK4C7jwEmOS
         ObaX+YT5jjpDdUmA8vVBbgmYIhLSny4R08GAk6/EATWoMX0x/pxJkyeV+vkGs0CWHP0Z
         eX7wE/SlTNqA9j/gvvf7sDMAd2bXsimyz74yj9sR4SXipRh+h+YmZoeWWCMeBt7BF5yb
         yMgtO0XHYj8Tc7k/aaOh6hrOFNhmdAyUHiTzOuC8aN2Gs0j25pDsOSmpJKfMqBNpsfqT
         E3PQ==
X-Gm-Message-State: AOJu0YyHabz5tpYVHJ18jWXFaye7b91qJr1qd9b0qfaq/X2A3eiNa6Uz
	atRqABoISAFDNna2OJ76Z/3zeaLAdkg3GPW7Mvc04dUiLig1Qn9vqezrBQTTG+9hynNkBfXyuq1
	giGoouM2N8orbsUoFuszf86FrZ+VtN9n129MZqB8+h+xo/9Ty1bCO+LG57Zv1WzHk
X-Gm-Gg: AZuq6aKVJ6VdihHq2km8ka5OKuAF1CJ52tASKRrgB/u4PIvpPKkuAnd73GYEpr7hTbt
	bz4vr48emalwrvQYgGrDJzRl4VnOQ8MPPxlRnRrl7VEkORX5utH0qFBPY2k1ylAE2WMTS7F59h7
	UrSnpo7nk1JRcaFWNtrtNN3oRWoHiXx+xyEepfLEa3ZaCDyreH7qRd7NGZkq1wobfZUPgQGeqEx
	dOB+/9G4kNMRMtg4a/btFHH3jtS1FdRUPsS7viVNT07doLS1+WiEyv9pSZtfBF45pYGIOzi41Lt
	EdSZ1tT3ANBD0ALU/IuTz8qslbxwJNyeuLDQdQHEtKR2/Kf1MEYAEw4/xSzBTLj28JTDhKKqEXp
	a3ZENm7BHCPwNmzLKtGX5l0lqHfFDOu2fb95M9iwhWFWkXGye+f1+wN71o+zIgBb6K8b71+I=
X-Received: by 2002:a17:90b:3b85:b0:340:2a3a:71b7 with SMTP id 98e67ed59e1d1-353fecd6236mr1040412a91.12.1769499694423;
        Mon, 26 Jan 2026 23:41:34 -0800 (PST)
X-Received: by 2002:a17:90b:3b85:b0:340:2a3a:71b7 with SMTP id 98e67ed59e1d1-353fecd6236mr1040396a91.12.1769499693931;
        Mon, 26 Jan 2026 23:41:33 -0800 (PST)
Received: from [10.133.33.215] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6102679sm1566430a91.3.2026.01.26.23.41.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 23:41:33 -0800 (PST)
Message-ID: <45061c9a-6f01-4228-9737-0222b4b49059@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 15:41:09 +0800
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
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1sgAC6bHOVtELmcQVx=L1dTXDsQFtO+N3R_C2C35VOxhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hb_0tEogoPxFdxBe-8DOuiinmUzuLPAJ
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=69786c2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=yaoEV0eubIWe5B8FoUsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hb_0tEogoPxFdxBe-8DOuiinmUzuLPAJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA2MSBTYWx0ZWRfX505f6DAI7qI4
 aAEwGp2QS59r7VmA5cVXCCpNzH97oOWSpGFkaEy1EvwvCDDTkcBEVkPGKPFS54knSGRoi9obLKi
 MHrdEjyYkBuxUGSbFBqw8AJ9P8IQYoH12I5jof911UXJqCoMaurgLr67/HHhS5e8/u0LXZMk6ni
 25kaIym6kCR4jWzA0EkZz+xt+UxV4AyvNOdZRKxjBiEO6ROH/N/z3S7pHPQEIUxCqXVG+b0AjCr
 XTtgaM0bOIR2jD/lKHzWbdakQkoX7bIkAyHUSouNxAQI1c+ekaq7gtU1vh/js5xCqKEnnQoAe68
 Zg0jmmLl3odMRiTvFxYM06vptY3iW8wNV4zf9p72dbgdMcIbQnuozyNNnAD1AGdjMzjIlZmmPV4
 CnxDcTfwElxCwa0mcOQ9KaKZTLXjLCb2POy1MjxE7iitwmf+SUwPk4gncU+M1+7mApSkt3Q/EJO
 DF5j1msfABVcORAmM+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_01,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_234137_221913_5BE0B213 
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



On 1/27/2026 12:04 PM, Saikiran B wrote:
> Hi Baochen,
> 
> I checked the logs again.
> 
> The issue seems to be coming from how
> [ath12k_regd_update()](drivers/net/wireless/ath/ath12k/reg.c) handles
> frequency range updates for this device. WCN7850 is a single-phy
> device (single [ar](drivers/net/wireless/ath/ath12k/mac.c) that
> supports both 2.4GHz and 5GHz/6GHz.
> 
> In ath12k_regd_update():
> 
> 1. It updates the range for 2GHz capabilities (sets range to ~2.4GHz).
> 2. It then attempts to update for 5GHz capabilities.
> 3. Because `ar->supports_6ghz` is true, it uses the 6GHz path logic.
> 4. However, `ab->reg_freq_6ghz` appears to be uninitialized/invalid at

Hmm, this seems like a known firmware bug. Are you using the latest board-2.bin? please
share md5sum of your firmware binaries under /lib/firmware/ath12k/WCN7850/hw2.0

If you are using the latest, please help collect verbose ath12k dmesg log:

modprobe ath12k debug_mask=0xffffffff
modprobe ath12k_wifi7

> this stage (possibly due to regulatory init timing or country code
> issues, On Lenovo Yoga Slim 7x, SMBIOS does not seem to provide a
> valid country code. The driver attempts to set an invalid country code
> which the firmware rejects. This inturn triggers this issue. Fixing
> SMBIOS parsing/defaults is a separate, complex issue that varies by
> vendor.), causing the 5GHz range update to be skipped or invalid.
> 
> [ 11.699027] ath12k_pci 0004:01:00.0: Failed to set the requested
> Country regulatory setting
> [ 31.111995] ath12k_pci 0004:01:00.0: Failed to set the requested
> Country regulatory setting
> 
> As a result, `ar->freq_range` remains effectively set for only the 2.4GHz band.
> 
> When ath12k_reg_update_chan_list() runs:
> 
> It compares 5GHz channels (e.g., 5180 MHz) against a
> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) that only covers
> 2.4GHz.
> Result: `center_freq > end_freq` is TRUE -> Channel is filtered out.
> 
> The filtering logic added in acc152f9be20 works for split-phy topology
> where each host ar covers a specific range. For WCN7850, where a
> single host ar covers disjoint bands (2.4G + 5G), [freq_range] but
> [freq_range](drivers/net/wireless/ath/ath12k/reg.c) (start/end) cannot
> represent multiple disjoint bands at the same time.
> 
> Removing this driver-level filter allows the firmware (which knows the
> true capabilities) to handle the channel list correctly.
> 
> Thanks & Regards,
> Saikiran
> 
> On Tue, Jan 27, 2026 at 8:52 AM Baochen Qiang
> <baochen.qiang@oss.qualcomm.com> wrote:
>>
>>
>>
>> On 1/26/2026 5:52 PM, Saikiran wrote:
>>> The frequency range filtering added in commit acc152f9be20 was designed
>>> for split-phy devices where multiple radios with overlapping frequency
>>> ranges within the same band are combined into a single wiphy. Each radio
>>> in such setups handles only a subset of channels within a band (e.g., two
>>> 5GHz radios covering 5GHz-low and 5GHz-high separately).
>>>
>>> However, this filtering breaks single-phy devices like WCN7850 that use
>>> a single radio to handle both 2.4GHz and 5GHz bands. On these devices,
>>
>> To be accurate, WCN7850 still gets two phys in hardware, it is just in host that we treat
>> it as single.
>>
>>> the freq_range is set to cover the entire supported spectrum, but the
>>
>> exactly
>>
>>> filtering logic incorrectly restricts channels, causing 5GHz to become
>>> completely unusable.
>>
>> how? what are the actual values of freq_range when you hit the issue and how are they
>> calculated?
>>
>>>
>>> The issue manifests as:
>>> - All 5GHz channels filtered out during channel list updates
>>> - No 5GHz SSIDs visible in scans
>>> - Only 2.4GHz networks functional
>>>
>>> Remove the frequency range filtering entirely and rely on the firmware
>>> to handle frequency restrictions based on actual hardware capabilities.
>>> This approach works correctly for both split-phy and single-phy devices,
>>> as the firmware has complete knowledge of what the hardware supports.
>>>
>>> Fixes: acc152f9be20 ("wifi: ath12k: combine channel list for split-phy devices in single-wiphy")
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>> ---
>>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>>>  1 file changed, 13 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
>>> index 7898f6981e5a..48c362a86524 100644
>>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>>>                       if (bands[band]->channels[i].flags &
>>>                           IEEE80211_CHAN_DISABLED)
>>>                               continue;
>>> -                     /* Skip Channels that are not in current radio's range */
>>> -                     if (bands[band]->channels[i].center_freq <
>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>> -                         bands[band]->channels[i].center_freq >
>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>> -                             continue;
>>>
>>>                       num_channels++;
>>>               }
>>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
>>>                               continue;
>>>
>>> -                     /* Skip Channels that are not in current radio's range */
>>> -                     if (bands[band]->channels[i].center_freq <
>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>> -                         bands[band]->channels[i].center_freq >
>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>> -                             continue;
>>> -
>>>                       /* TODO: Set to true/false based on some condition? */
>>>                       ch->allow_ht = true;
>>>                       ch->allow_vht = true;
>>


