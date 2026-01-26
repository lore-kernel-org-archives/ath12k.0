Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38B7C88E57
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 06:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G1dpPgF7h2aF/XlD/npUdP88EeQ2KdGO18icjINGr0=; b=I/LtaBGZDZt4K5ziGJRK0N+5US
	g7IdCE6LbNioojw4Sfp/GFWYSSeWbrSO4+aRRGO/3VtZSCoBJ/eSj2fenFvWM3TC5/s3kTpVnDy3n
	ilR3cc9ntbohuqE5xX8MHfU3AYvlLJmtuGguvItWFpSWN7dTxwpkg0uuubbjpBqLXkK6hDBNlfidm
	oKRjyeciUXUhsegeEgG/gObliqR7bGc3vS7216R1QdHwoPMoaIwlpxF76uziGnAdi1ovezhnRjEag
	JkBlm1jslGQXweKcqwDh7ckg6Z0lwr9MequwEuab1/gP8ljawwya0LFPY2XUWky8h87My2TEeJpcs
	WaVbik+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGSH-0000000C0i9-0MbX;
	Mon, 26 Jan 2026 06:52:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkGSD-0000000C0hY-40Kw
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 06:52:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PNiMKh680547
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 06:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1G1dpPgF7h2aF/XlD/npUdP88EeQ2KdGO18icjINGr0=; b=jk8ppHvAMHv9iBcM
	47dX78nGa8z7m+FJjEYn6uoBiG7WYZZy25rX4W5I61mT85UQ1GuCQwNLzoH2jon+
	MziSN//LKXPQkEkclHl79UDGfmUyqQwMkyUoODemlRRG5r0hc+d5DjQHTCKDthKR
	h7oDnrIuWc6i43Jh4krOJfjAteFSdWM2Xf0tPVkOjmyLZ5vgK/9HAT4Gz30nnWWB
	fA9VlPNFdLR7Zwkt8BjtwCQyp7umMTTOJTJlZqWp+gAMpWXZkxdP2yM1h7CE0Zn3
	te47RAf4IoH2a0wkZXImgNahyJnXnRTZCpdqDmG1lSFDZgZ8fRGCf+m+Kelfulz2
	oQzgnA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tumen-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 06:52:04 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c337cde7e40so2189217a12.1
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 22:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769410323; x=1770015123; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1G1dpPgF7h2aF/XlD/npUdP88EeQ2KdGO18icjINGr0=;
        b=S+qrBUpLK5vIqKJQCRri9gY9An0X1vtR3rkvxFXvD0ve6jRo6L42ZWlCgmqygcJ/eZ
         kzfiPrIexVE7UqLK540PV3HgVfcgwvKt6vgw1iG2J+8VHKbTAPQXAkYZ5dy6tgrb1xEt
         mRVt0/kOaQnPJYg2qoA8EflXY/6KflRsok8Anf/PF6JoAkoJwY/dAg39pGopbQ2YGV+u
         Y4/appje31CRtAAcD4ZQrBMuuhgO1UkdGjkfbs+8in7xwSKEz0kf3fj4wENGLs/HxBWf
         9acoh5zQOysdOB2z6IQH2DnobxHrvZEN8DgNf1lQ7X/tv8OvtBLNPysGJIDPbS4XQYzW
         bN1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769410323; x=1770015123;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1G1dpPgF7h2aF/XlD/npUdP88EeQ2KdGO18icjINGr0=;
        b=Wk4oHiIwrPhpjgx2a8gVxcZaRhbWp8drnXvliqWCOhsNz0mXPxkBtLYxwjTyXanPmB
         OPV/2CHIqm8oW09GXEqVZA7dwKKKvFHj9PS+Y9u+8PMm1bDhQkvD7HZagkQfBx9XI1SE
         me1r9y0QLWXFLzZfnG+oy8RxAKYv18vAEAiy9rS68Idx9aVeLH/dXTKvE1QJzZ/9BALt
         wawWs6WOF1T+SG47QlFBfwRmaCQQnQneFvoHa0pcGRVXWLhch75sk6jUVkyOaqfGl25j
         oMLVKKHzzZotVBziDbGGK6OD0P6cS9fBzCkMmcc+2oiINzOoklEnWTDPNi7NEZKihrdf
         hHFw==
X-Gm-Message-State: AOJu0YwvA36KvFoCvpYHtrfj0f+nbSGEFbW5sVVl10nz9CtnJ3cjLeav
	IYr8dIArZFwMjSm1tYZaMVFIphF4o0kuEwpYYQgFDq30o7wudAzNeQE6IfRsL9XDAXr+9khZ87M
	klqiEKnMpZft4eJh6SePj3zztB3HgiVJNxzXj1rKiMZXbspdZQfypmcnv7Twkh+Go
X-Gm-Gg: AZuq6aKPZ9WujOMLdMQaV10rIsbiSRsHSN+2tJdhYTS8JzqWMl06i1UtHUNH00hPdrI
	y/NxkQ8NNowlGCncbcKVuAaAJg2vqpNG14Vz8lzp/oeBgCOiQAr0N1IuZ/tansrWIRhtJO8sfQi
	5yBZPrLYSiDmsc4spdaVdtJGhLV2H9qRtl4Fseka0i0bvZH7TF31bjSdh/P0emm5YtWzRguNpKU
	rYIXXjPDA1ZUgtDVo8UQzlFQnWOVhVSmAHxkLuDmxNx+FsqmpKOj3KyFgS4MNExdsMHMTQkuDob
	vpCcYcjL1nukoMNhhSEeuU1EozIye2nwMsCXxaGG+tzsfKWFoWa0ZqGzCbM3JiLQP8cONYUltJU
	9D8g3qBfI+kmtXbeXOd2YxaD43m8uq0c0RHgZFEaOlBxEClzgrARtKijB9CmUbXkvaF7HayE=
X-Received: by 2002:a05:6a21:32a4:b0:38d:e87c:48b0 with SMTP id adf61e73a8af0-38e9f0e9ca5mr3246888637.13.1769410323514;
        Sun, 25 Jan 2026 22:52:03 -0800 (PST)
X-Received: by 2002:a05:6a21:32a4:b0:38d:e87c:48b0 with SMTP id adf61e73a8af0-38e9f0e9ca5mr3246876637.13.1769410323010;
        Sun, 25 Jan 2026 22:52:03 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876fd1fsm8515934b3a.69.2026.01.25.22.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 22:52:02 -0800 (PST)
Message-ID: <ad7a2168-58d8-4afa-8744-84a34a63cd09@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 14:51:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Remove broken frequency range filtering
To: Saikiran B <bjsaikiran@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kvalo@kernel.org
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
 <20260123155750.6007-5-bjsaikiran@gmail.com>
 <ec1a3721-a17c-47dc-85d3-0e0b97004c2c@oss.qualcomm.com>
 <CAAFDt1syi0jLvrho4mnvwsv8HtraT78wP8tCLFHRw3oiTq2E5w@mail.gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1syi0jLvrho4mnvwsv8HtraT78wP8tCLFHRw3oiTq2E5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA1NyBTYWx0ZWRfX5DB4hztFtllx
 khElMwuPrJoosSwZh1BKhWk7e59g7EVkXmiYNnm98FLaW4DNynU3knTZxkHl59Mwdmnw8sSeoXo
 N84wOqhZMJ2WnP/RmHDLjXoOm2Ei3LJ/aefknFuaz3dryDq7e6InVckTboHOdtZNj5+olU/PoYl
 gxFtZ7B/1s+a7C0LbaIPuOg0Tw85YFwG9qpD+Ivxe9okzJbtqtOA06FF7t/tSnRlzBxLr5bLuic
 /yF2lNP+gCNC0S+mtVTgp1z8FDJJ0d/xJJJzMxn0LQ1Z7wF6cZzjbFw86UPFPaNzDohlYmoPADG
 VHnR+FFIkiM07fXs8fCuo5rrdcrkdSS/wE+YFIIrJcSxoXOpaXtLFZgODSbNaysRCbRKpDchouy
 VVkS6OBUAJhWp72hW9IXtVj7srkYG/lBqs52kZ/10DOYysf7iuRjRrVjZLuA033Ogep62UEYesb
 CQtxy1HGmdmsINUbtPA==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=69770f14 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=-oiKkipkm7vCZl0rOUcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: RI9nh6ibIFAAdV6XOoF5EPPMiNeQuAye
X-Proofpoint-ORIG-GUID: RI9nh6ibIFAAdV6XOoF5EPPMiNeQuAye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_225206_128295_69BAE1AB 
X-CRM114-Status: GOOD (  22.09  )
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



On 1/26/2026 2:35 PM, Saikiran B wrote:
> Hi Baochen,
> 
> Thanks for the review.
> 
> regarding ath12k_mac_update_freq_range(): You are correct that this
> function eventually updates the frequency range.
> 
> However, on the WCN7850 (Lenovo Yoga Slim 7x), there is a race condition
> during boot/resume. ath12k_reg_update_chan_list() is being executed *before*
> ath12k_regd_update() has finished populating ar->freq_range.

could you please elaborate on the race?

> 
> At that specific moment, ar->freq_range.end_freq is still 0. The check: if
> (center_freq > KHZ_TO_MHZ(ar->freq_range.end_freq)) evaluates to true for
> all channels, causing the driver to silently drop every 5GHz channel from
> the scan list.
> 
> If I cannot remove this filter entirely, would you accept a V2 that skips
> the filtering if the range is uninitialized?
> 
> Example:
> 
> /* Skip check if regulatory range hasn't been populated yet */if
> (ar->freq_range.end_freq != 0 &&
>     (center_freq < KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>      center_freq > KHZ_TO_MHZ(ar->freq_range.end_freq)))
>         continue;
> 
> Without this change (or something similar), 5GHz is completely unusable on
> this platform.
> 
> Thanks & Regards,
> Jaya saikiran
> 
> On Mon, Jan 26, 2026 at 11:15 AM Baochen Qiang <
> baochen.qiang@oss.qualcomm.com> wrote:
> 
>>
>>
>> On 1/23/2026 11:57 PM, Saikiran wrote:
>>> Between kernel 6.16 and 6.17, ath12k added frequency range filtering in
>>> ath12k_reg_update_chan_list() that filters channels based on
>>> ar->freq_range.start_freq and ar->freq_range.end_freq.
>>>
>>> However, these values are reset to 0 in ath12k_regd_update(), causing
>>
>> Yes, it is reset at the first, but it get re-calculated later. See
>> ath12k_mac_update_freq_range() called in ath12k_regd_update().
>>
>>> the filter to skip ALL channels:
>>>     if (channel_freq < 0 || channel_freq > 0)  // Always true when
>> end_freq=0
>>>         continue;  // All channels skipped
>>>
>>> This results in no channel list sent to firmware, causing 5 GHz Wi-Fi
>>> to stop working.
>>>
>>> Fix by removing the broken frequency range filtering. The firmware
>>> itself handles frequency range restrictions based on hardware
>> capabilities.
>>>
>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
>>>
>>> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
>>> ---
>>>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>>>  1 file changed, 13 deletions(-)
>>>
>>> diff --git a/drivers/net/wireless/ath/ath12k/reg.c
>> b/drivers/net/wireless/ath/ath12k/reg.c
>>> index 2dfcef013277..2d9adc74ac6e 100644
>>> --- a/drivers/net/wireless/ath/ath12k/reg.c
>>> +++ b/drivers/net/wireless/ath/ath12k/reg.c
>>> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar,
>> bool wait)
>>>                       if (bands[band]->channels[i].flags &
>>>                           IEEE80211_CHAN_DISABLED)
>>>                               continue;
>>> -                     /* Skip Channels that are not in current radio's
>> range */
>>> -                     if (bands[band]->channels[i].center_freq <
>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>> -                         bands[band]->channels[i].center_freq >
>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>> -                             continue;
>>>
>>>                       num_channels++;
>>>               }
>>> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar,
>> bool wait)
>>>                       if (channel->flags & IEEE80211_CHAN_DISABLED)
>>>                               continue;
>>>
>>> -                     /* Skip Channels that are not in current radio's
>> range */
>>> -                     if (bands[band]->channels[i].center_freq <
>>> -                         KHZ_TO_MHZ(ar->freq_range.start_freq) ||
>>> -                         bands[band]->channels[i].center_freq >
>>> -                         KHZ_TO_MHZ(ar->freq_range.end_freq))
>>> -                             continue;
>>> -
>>>                       /* TODO: Set to true/false based on some
>> condition? */
>>>                       ch->allow_ht = true;
>>>                       ch->allow_vht = true;
>>
>>
> 


