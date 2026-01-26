Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6B4C88E47
	for <ath12k@archiver.kernel.org>; Mon, 26 Jan 2026 05:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E980NRlSWDqjUtTK2n3I5/m+bNTdIxQQ8hrwhq3KLJs=; b=q2kbSJTwWGRu2DveTngba3XeHU
	sE6mqb0b/PYzMi8d2V+mHKf8pxuKTbx53P2TMv8I2LiyOAoJb90Q1A1ILfu1jWg39QJwX6Zby4/Sp
	jIEdrkURiKwAcH2lFgbeumrGk3mYlREW7B8IpvT09CBTV3skroNVS1WzjR3mZ4h8geCmhwNBBFQl7
	iUNg481ClwfJTMlk74U74L0t1/58beZy+SgV++B+rCsscj5zQDKTtZItOYw2J6hT2+pxiAyv+uWGp
	uhS0X+bHJxJ+ryCCp6C97lqlT9SMJd+k8yvSvxjuKApSqCliJGRz86ZejuI8dRaK7L8+BJuEHX3uj
	+nFB9V1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPe-0000000Bwl4-1jIH;
	Mon, 26 Jan 2026 05:45:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPc-0000000Bwkj-0tKy
	for ath12k@lists.infradead.org;
	Mon, 26 Jan 2026 05:45:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PLd6nC432792
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:45:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E980NRlSWDqjUtTK2n3I5/m+bNTdIxQQ8hrwhq3KLJs=; b=U/8sLtZsntzeohGT
	AWvmDOyAGT6dVJROHZRjJhhaElaa2EBEc1XtOUzGZg/xSqRNGEds7bqorpzr72Uj
	pT4mg4BHTPcI6bWRlZfP5f3/KTaj7B75DxuXyB9+zJo8gWOc58DdyvlvFKR1tyeQ
	TmYI0eUCsl/p/dhRQu9Dz157awo93fM+IOK4+i2HlTgAObFiglEEJ8WUwgMvfBEF
	f52EOpe+nndeIq/NvW6rQFFmxhulsslOkrjURCXSUOSepg3mGnCH6CgxXRJl/zGM
	6Lzji7dPSgD1uuOwNOujxFRQmbSra+I/gmVL9Y3lDqmoIzMWg2abvxQXIg6N1Pad
	stVGxg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9tug04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 26 Jan 2026 05:45:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b6097ca315bso7535406a12.3
        for <ath12k@lists.infradead.org>; Sun, 25 Jan 2026 21:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769406317; x=1770011117; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E980NRlSWDqjUtTK2n3I5/m+bNTdIxQQ8hrwhq3KLJs=;
        b=e8hRqbIt23ZbACEoAL1fWWD022TjXhjHiNJUjkh+knpHLR3+nfjg5d4UpT4tQJvjDd
         s2Jk4G4qfAPrNJPz9OzL4v9thCyMKdALpLqQm7keMbawHfEknXy0RT2k/ahXPKEiUOcF
         VWlH9gbmf//LvQtkQx3qJYd2r7c3HsO+ZPHq9phLAVwzIJQN4AXOJSKaLMYo1gTS2f+Y
         EgAV2+TqC5fZNNqwfwBU1Xqmb/DIPVUagvu9PgtZC46aMU0yIrjEyM1AvyIoyuStotVo
         YmbT/qtFioA1PcgP7eUewZbPRQerAoDwdAeytYSew0DcBjQZ5UIZUlxQt/H/v4msSq9h
         uECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769406317; x=1770011117;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E980NRlSWDqjUtTK2n3I5/m+bNTdIxQQ8hrwhq3KLJs=;
        b=TY3t89v1HgFTVCrKhnLU1meObvIWLxeZuZh5lpPds3GXuSoglEbOt9WukvlwqIYHkD
         FYpdPyYNdqfCDGRdJvX+4dZ505IO+pbQJrR8RDiDmGs78ENIhkUW53iL0B9BCiCm4crg
         KEbKS+kMAFJuVe+1yP6bvu5XcEm1br2WUHZlT9U4VWuA/qNM1/yoDL08F3x3RudogaJl
         DKRkUIHdcvvhw0bkHIQC2eqQW2nsq7F/kPcijL9KNWjY6xdSYZoRtwDDQYnxKyxojkB3
         cMQtdPghnXIxehlRiO2Ay2A3jgtJsj8NXUcysnaHmJH3g2tpMZQBoWG5c7W5y/5984m+
         uG0A==
X-Forwarded-Encrypted: i=1; AJvYcCWE8pL8tmEWxSCzPDfzAMAVZQlbNtSIeZL2NjCiFchiG4CylTnkr5r6WtHsHneEdAYqZNNUumM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7ytDFP0kWCHZ4H4uwGFl+7TqIUD5XJlk5WQ22zWlWpLkG5EW1
	zCzL94vOO+FATzPi1vo1LHHr9QPylVqF46owckEmp421XG7Xl8F04dbEg/dgWGXroLf6NufdFlV
	kgoeUZAxEmwPFH/k+bef8JfwLmDX7ZSTnPsr0r4ihsk7LyrUYp9SEQwIrnhGQ1j5JcilPmgYz
X-Gm-Gg: AZuq6aLyM8oC21b6HFMAvsoOMQABgIat9ChIj1WQBjaq+mDc4V4nD/fcX+quF3A4mJz
	im7jZI/r/beQpdsIVfQAdRpXgrF4AGKQJqFEszD79Os9eyGGw1EkL8BiRNUZAJbahggwLm0LWjz
	PTBOm6ppanVDXxPIbgjsflLNGCdCdhMW/iZOrs/Ve5VgmcgncLY/dybA6McMV1e1gMCXY+zC6rA
	Vy2lcdf2bpT08GNtqa+rQtMDHpt7dHqHZfCqrJuk/hTRvLNDzumXic/0iHuOfntcTSiau77ttbg
	hIRHcBeD/biGI1IXz47yLbq4qUHQorvKV9Vd8wV2sRCb912zADJnIF6mwefKTP9NYESmpoXzwGd
	bQVRnQV9wFMcBuX1jg1JqHMvkBU4wOqnwiHRLe48EvnDJtSJ3F1FpltQzqgtnvcgHsu6Zb6w=
X-Received: by 2002:a05:6a00:6c85:b0:823:f51:192e with SMTP id d2e1a72fcca58-823412b5b1bmr3145655b3a.51.1769406317538;
        Sun, 25 Jan 2026 21:45:17 -0800 (PST)
X-Received: by 2002:a05:6a00:6c85:b0:823:f51:192e with SMTP id d2e1a72fcca58-823412b5b1bmr3145641b3a.51.1769406317071;
        Sun, 25 Jan 2026 21:45:17 -0800 (PST)
Received: from [10.133.33.199] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231877012csm8329122b3a.65.2026.01.25.21.45.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 21:45:16 -0800 (PST)
Message-ID: <ec1a3721-a17c-47dc-85d3-0e0b97004c2c@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 13:45:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Remove broken frequency range filtering
To: Saikiran <bjsaikiran@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, kvalo@kernel.org
References: <20260123155750.6007-1-bjsaikiran@gmail.com>
 <20260123155750.6007-5-bjsaikiran@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260123155750.6007-5-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA0OCBTYWx0ZWRfX9WqOIaHvHHS5
 9RQLlgjtL+ZqGchL3cVo7AL4BPC+YLw6/eL00otsu6GSaVDZUY9KF+ohD+W089qzwjSzXRdJbee
 h2wvLFeWrPnKpGF/ObYtrJZq3PDpHpW1FEqWsLWdu4nRp5ES2A9VUkEt/6hiJGN0+sgWRXlorF0
 1/CkavQzIRy2JFagJBF7XEJKQuGc3WB5EhBl5K/7iTWtiecQhmhxDVMQZfnpHW51kX04jjNeEGh
 W7Pka4mdRef/3TPGujuvxIVWI8Nn7pbCbbOh46rJvQ8I7xZ6ZUbYf1CeJ7DNkynSJeqEStEdYqX
 xOvfSHkwSaVuoZyA/eAtYgs0KIKxqsBSs90dZ2cOhzv8PbStrgJIgintNh5MZLuaudZrIkwv9L7
 ghwVe2uDmBsL8gU6z7HhK01u3CiBQWYMnElG8CmO2IX4k+cMt0rBfEC596uhU+kXuReWq6ceIUF
 5jeUUL38RDusBWAKIrw==
X-Authority-Analysis: v=2.4 cv=QN5lhwLL c=1 sm=1 tr=0 ts=6976ff6e cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=YGz6NkLsH7gTjuWo1MwA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Ou-0qhgm0RN7mdTrbJZbmWdvBScyJShQ
X-Proofpoint-ORIG-GUID: Ou-0qhgm0RN7mdTrbJZbmWdvBScyJShQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_214520_376761_1C6766E5 
X-CRM114-Status: GOOD (  16.19  )
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



On 1/23/2026 11:57 PM, Saikiran wrote:
> Between kernel 6.16 and 6.17, ath12k added frequency range filtering in
> ath12k_reg_update_chan_list() that filters channels based on
> ar->freq_range.start_freq and ar->freq_range.end_freq.
> 
> However, these values are reset to 0 in ath12k_regd_update(), causing

Yes, it is reset at the first, but it get re-calculated later. See
ath12k_mac_update_freq_range() called in ath12k_regd_update().

> the filter to skip ALL channels:
>     if (channel_freq < 0 || channel_freq > 0)  // Always true when end_freq=0
>         continue;  // All channels skipped
> 
> This results in no channel list sent to firmware, causing 5 GHz Wi-Fi
> to stop working.
> 
> Fix by removing the broken frequency range filtering. The firmware
> itself handles frequency range restrictions based on hardware capabilities.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302 (Lenovo Yoga Slim 7x)
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>  drivers/net/wireless/ath/ath12k/reg.c | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
> index 2dfcef013277..2d9adc74ac6e 100644
> --- a/drivers/net/wireless/ath/ath12k/reg.c
> +++ b/drivers/net/wireless/ath/ath12k/reg.c
> @@ -153,12 +153,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  			if (bands[band]->channels[i].flags &
>  			    IEEE80211_CHAN_DISABLED)
>  				continue;
> -			/* Skip Channels that are not in current radio's range */
> -			if (bands[band]->channels[i].center_freq <
> -			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> -			    bands[band]->channels[i].center_freq >
> -			    KHZ_TO_MHZ(ar->freq_range.end_freq))
> -				continue;
>  
>  			num_channels++;
>  		}
> @@ -190,13 +184,6 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
>  			if (channel->flags & IEEE80211_CHAN_DISABLED)
>  				continue;
>  
> -			/* Skip Channels that are not in current radio's range */
> -			if (bands[band]->channels[i].center_freq <
> -			    KHZ_TO_MHZ(ar->freq_range.start_freq) ||
> -			    bands[band]->channels[i].center_freq >
> -			    KHZ_TO_MHZ(ar->freq_range.end_freq))
> -				continue;
> -
>  			/* TODO: Set to true/false based on some condition? */
>  			ch->allow_ht = true;
>  			ch->allow_vht = true;


