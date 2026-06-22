Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC606CDB46B
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 05:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60bpPo7bB923QwBAsdBtArQLCaqk1Or+3USoOTjJavk=; b=DdoXk7ZFqLX32x/yGd8R5jXeCG
	loYz5insn4MQJAKfmz8ZAK9qUrhJ1rgbKvg7x2JacBcwoQl7T07N3MWFYO1s0HXMzzj+QPmYK3gFW
	IwBxnux2KzAdNuOXdgCu7tDyXXae/D0qGnbGww92fkC4Ki1V3ACSQW5ztSRd9AV/nWcOqKovJUoDI
	y9PgQyydce9eoQI0LHBeHUWHk/k026/fq0fYOvVdXsMYcekgyLmvsyinu61bX6RUxEzDlRTuDvZcs
	QJtApkWQm9RzYlMs2DJ7hm9CxBQ0m5fLlubUkxji469DngESTs40s7X7ai+5V3CB2vRwYRZJwE9gp
	x43+lwvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWwZ-00000004QRT-1BLx;
	Mon, 22 Jun 2026 05:11:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbWwW-00000004QQn-2dYH
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 05:11:33 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M59KuN3850669
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 05:11:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60bpPo7bB923QwBAsdBtArQLCaqk1Or+3USoOTjJavk=; b=iT9FYQiEkGN/7lRV
	E6xxiGQZ8xmGm70OwlpJLw/9EW6QFBhGQw2OP37aC154b1auSiXRUfmI0GtHXe8B
	nxxZ/vlZq6nM3kIwK7ecqAL1UQ2DCmY8vsmGvz03T+R7yNIcnihA3HS27gW3PJfV
	CSHiTGAwdXJP0ZXaQlqIlI7ZaU0EZzIW1qTWfy1+q49lLoX6HlczatzeZbh3Kzdt
	Az/Zdmdq1C5celIxD+6cR/87xwLD3UE2Egs2sPjHYZSkQMxAayhPSoiYs7X+gtnD
	UVUC70/NmMbYZgRIounxiF9NkBGIyeRw0KtFrcgiXE5V/BPt4GVyYV74UQ7gZzcq
	s+bqpw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewm584n7t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 05:11:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2c6a20348ceso47180605ad.1
        for <ath12k@lists.infradead.org>; Sun, 21 Jun 2026 22:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105091; x=1782709891; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=60bpPo7bB923QwBAsdBtArQLCaqk1Or+3USoOTjJavk=;
        b=GwlIM0HlNEniDQ4qUvy/vSu4rR8qix33YJAUlRoqjzsGuCV1XExama3eds5GkN55lO
         JuhyQl5c3MHn083YuXbi+F92AhEQgFJYem9KU+9APksuii9Ymwk+PZxVVDkBO6PSNnBP
         QyF2Dmir6qEo5s/RMBW5qywgLEnoqAvJlJeFCoFoFedU3gmjq5EWeMEYONudhNn973y7
         /AU4gcb2v09Dg8P5P4H/vVT00saEXD1MpiyYDcAbW+Ekmx7Ai3VyJpJgzNHugHXvju/n
         wSHoQSYjGWHpjU7I0NCnZxnfFWKaeMq7YDdZ7AcQHCPK8/gMFWCW02JSOKpaR9Z8BqYp
         CclA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105091; x=1782709891;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=60bpPo7bB923QwBAsdBtArQLCaqk1Or+3USoOTjJavk=;
        b=MdmVDLnIzRaAa4+kFAAi9Ul6UqGs/XFJ6lDCjnmLqOaZJl/KvkmnFkdSJbl2qMLkQD
         iFb+jnFfHlK3RzzNEOW8Io8w5j0vtkLsIpdRxZHcy6TnsK0f4NYZasfpvbLYC6eUuZ8q
         5d3bGp4XrJuX3ZqSFY26CMPpBWBhCLHxYNXlKQ9vv4wM5vLX3UsIwS9f+iRU29IjRPyP
         Cu4e9MWcGLhvJ45K/xyVy6RyCF+U+agkZSH4zvMeC8tYKBMW7BcWS339eb/7d9K2cqcr
         iR9IrEvbs06OJIN1WduCbijm4kf3X/XCO/atHcXAemjPb4DtEntXh4zBcDZ2wOvEVepR
         VWAA==
X-Forwarded-Encrypted: i=1; AHgh+RpjvqqhhI1iyOhZ0Za2O/ROcNJYHQBQSqXSjqdfuKUEC7sNAGMxd0sI5+9QEmVKGG5GTekp/Vs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yynqh7kQbUIoRkBe6CoeSDQgqW7I3b/1VJKJCR8V601bnACYO0h
	BKNJTBGKPX4q0acJiy9XkeGVR1M6BTmzKE2kWSQnOar3dNv9YeOiItu9xeH6hBpT/jquTuQAK2S
	8R9OcrQg9EBwFHe5EKZPQQxhVm74+nLl9VrVAyLPaxqYIfuRf1aY+lYeAvmzV64QNdltWab2a
X-Gm-Gg: AfdE7cmAAjWgo/PjTz1rqSjYR2YCf58YiMZf0OGbzQZ2OE2tK3baeG4H14HpFUM6zzx
	z1/bgmc1rXn8o1UWqWXAVcckNb9T3vuGtPCX0KDUE+chrBrTcw96dSaVqIomJlbmFA6TAK27GC4
	0GoD6Lygoo846xbqmGhYKS//4471fwd7dbkID/ZraI9fN1H+t43m7BKFmL/8YwQ1e6MwpQ7JdTa
	fYG42X/WosxijCSKOp2Ft+P6h+rP5nwgmQNJwXi1BT4WNzpl98EoiaJ7G2fyO4V5J5BX1V2tP7G
	g0u4kO0o47R6SnUwPI6e7uO+WM+GiC37LnfANxtT9Q6GneKtInJcSFjwizo+AlfJeIF5C3dtf9m
	VvE5h1PdPWr7Sfo7DR3JJuckMcXzono7NFXvVhWdkJZp7ouTaPcI=
X-Received: by 2002:a17:902:f68e:b0:2c2:9a1e:6099 with SMTP id d9443c01a7336-2c718f64b9amr133429585ad.23.1782105091070;
        Sun, 21 Jun 2026 22:11:31 -0700 (PDT)
X-Received: by 2002:a17:902:f68e:b0:2c2:9a1e:6099 with SMTP id d9443c01a7336-2c718f64b9amr133429235ad.23.1782105090607;
        Sun, 21 Jun 2026 22:11:30 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7436aff98sm63304345ad.3.2026.06.21.22.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Jun 2026 22:11:30 -0700 (PDT)
Message-ID: <106a3e99-eebd-4c12-9677-11979a92c268@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 10:41:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix survey indexing across bands
To: Matthew Leach <matthew.leach@collabora.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: Kalle Valo <kvalo@kernel.org>,
        Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        P Praneesh <quic_ppranees@quicinc.com>,
        Sriram R
 <quic_srirrama@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <20260617-ath12-survey-band-fix-v1-1-e7d9555bb478@collabora.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260617-ath12-survey-band-fix-v1-1-e7d9555bb478@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: f7rLswlDu2UaByZkesvqLNQggMpeEkoE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX0YRF5P30DqxZ
 8M8tgPsLq3svb1Z8lzLfxrYBLhiGhfB/wp2lt0802OaJNeXyihcXzQFQyPV57yq0JgTfeA4l8dH
 KQPW0ae67d/qppL98u/ABx+Z8/cd8kU=
X-Proofpoint-GUID: f7rLswlDu2UaByZkesvqLNQggMpeEkoE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX7cvLuoZgsGFu
 vgc71GX9gyWV9n9I2Mvr0qbSyTLlaDgUzhuI+Ze51SkKF4h7Pm3U3zO+kMch9gYG8Zl+fyc2HZf
 NqzgsOqO5zOa72q4Au7hqR7WvRytSSNNAN2HBR1WkwMUjhSrJFQLcudDlYZ6dCpCtsDUmQaBiwf
 zMw7ZDGPh8Oiw3Tuf0VHpAjDnfQHl0aBUTPTvNiLMX5HSVk9EyTb6U158hOPjvz8WmHJyxnGq9A
 /EbM0a3tb9XJrDK5u+hqKc/p9+aucuHUemlVelIbyDQoTc4vKQtZP0Cc2ruiui8Qs5bbGqJl29d
 HYTu0KXFWQUgg+w9psN8d8JFWJyWDh2VhtGr7qghylpLcGc2nlcw36tC2JStmEbkTCw3Y6L6Lrd
 phAMRnhl1WfRYIbkgsMIMbAtTtFDQ1/rKi2gLPF0gAa/SwZwHvDYbjYIV0GZiB/G+2VZNmtHyGF
 Cjp2TIGggvsB6HiN3Jg==
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a38c403 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=QX4gbG5DAAAA:8 a=Se1BA6vDASlMqV_I0t4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260621_221132_677117_3911C589 
X-CRM114-Status: GOOD (  18.97  )
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

On 6/17/2026 3:48 PM, Matthew Leach wrote:
> When running 'iw dev wlan0 survey dump' the values for the channel busy
> time have the same sequence across bands. This is caused by indexing
> into the ath12k survey array using a band-local index rather than the
> global index passed by mac80211. This results in surveys for 5 GHz and 6
> GHz channels returning values from 2.4 GHz slots, making the survey
> unusable on those bands.
> 
> Fix by indexing into ar->survey[] using the original index passed by
> mac80211.
> 
> Band busy-times Before this fix:
> 
> 2.4 GHz: 9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 5 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 6 GHz:   9, 2, 2, 2, 4, 2, 10, 16, 4, 12, 5
> 
> After this fix, times are independent:
> 
> 2.4 GHz: 23, 5,  5,  12, 2,   12,  26,  5,   3,  1,  27
> 5 GHz:   30, 40, 29, 27, 118, 118, 112, 120, 11, 11, 11
> 6 GHz:   1,  0,  0,  0,  0,   0,   0,   0,   0,  0,  1
> 
> Tested-on: wcn7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")


The Fixes: tag is probably too broad,

4f242b1d6996 ("wifi: ath12k: support get_survey mac op for single 
wiphy") changed ath12k_mac_op_get_survey() for single-wiphy handling and 
moved survey lookup after band index adjustment.


> Signed-off-by: Matthew Leach <matthew.leach@collabora.com>
> ---
>   drivers/net/wireless/ath/ath12k/mac.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 2cff9485c95a..9474d7e70823 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -13351,6 +13351,7 @@ int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>   	struct ath12k *ar;
>   	struct ieee80211_supported_band *sband;
>   	struct survey_info *ar_survey;
> +	int survey_index = idx;
>   
>   	lockdep_assert_wiphy(hw->wiphy);
>   
> @@ -13385,7 +13386,7 @@ int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
>   		return -ENOENT;
>   	}
>   
> -	ar_survey = &ar->survey[idx];
> +	ar_survey = &ar->survey[survey_index];


There is an existing discussion on similar lines, see [1].

This could break survey dump on multi-radio/single-wiphy setups, for 
example split-radio QCN9274 configurations.

I would suggest to move the survey results from ar to ath12k_hw, since 
not all bands in ar->survey[] are effectively utilized for a multi‑radio 
wiphy. In that model, this patch's approach of preserving the original 
idx would make sense, and freq_to_idx() should also stop skipping bands 
based on ar->mac.sbands[] so that WMI population uses the same global index.

  -        if (!ar->mac.sbands[band].channels)
  -            continue;


[1] https://lore.kernel.org/linux-wireless/aYtRBg498h_aLPBK@pilgrim/

--
Ramesh

