Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3DFD25051
	for <ath12k@archiver.kernel.org>; Mon, 12 Jan 2026 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtuylQsGR2SHc1tC5K8cJ0nm8a9J5bKDyHrvDYl9Tno=; b=VI1HiZQ73al7wcWmmbaJ2boZ1J
	ni7XRpcFoUQLiwso3bSm1lA2OY84HZpDZSwdQYfpc3zVA9ZAUAEyYabK1r52aT73sIacS2PUJEQ84
	hA5GnTXvX6uJyzQt8olEP5CsAjo7jx4e/h/LHz+dtxWdfY0XP6V30F6wnNx0pv0D6UkjdZvA0cHPf
	5Bybt707pMFF6bBitllExR+h/VXXdB66ciU7qVNhyC1eMQ0ZxZtfeIWweoZlDfsftFvK0qGyVjSfi
	m4Vud573EJAt8FlqgD2vltlkOUGmVTBP8mnAZvrG4wQo4jXFS1lcJfR6LmhrL+fNqRerX/yBa8BQ0
	RSTCZNFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDX6-000000050mN-0uRJ;
	Mon, 12 Jan 2026 08:44:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDX4-000000050lx-0csz
	for ath12k@lists.infradead.org;
	Mon, 12 Jan 2026 08:44:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60C844bG1041986
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 08:44:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LtuylQsGR2SHc1tC5K8cJ0nm8a9J5bKDyHrvDYl9Tno=; b=a8Khh1qYWW8HLxlH
	oxFCQuNlu0z2GrNyeqmnjBk6S5EMTmD7bsyhLapB2SJ2V30U+Vco5ARwx1+iz/Xc
	6WN1UjF3/wiLFaClaS6InISKXPtRuvwXF01q+Xr2rAfbHvI3aFMTo3Q/69r96IMd
	Yv6E2F3LVAuM/QXkYr4RXOO154UMT2bFoInKx7lGn3fwIW5uCQlw/7IeFAwSeHfh
	ztDYACUFYVhi85Zvi6F/NRxUL4dKMZnyPFDGJ4CUjQkopLzJFlGdYy1g5LoTTRNP
	Q2MXyE0yC4YSyItGdAC+ElZD24Dp2EtdxAHkPy3kSGQE+dFZxexxEV768amXPXQc
	H+lHgA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkfxfv5y8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 08:44:13 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c56848e6f53so1386096a12.0
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 00:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768207452; x=1768812252; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LtuylQsGR2SHc1tC5K8cJ0nm8a9J5bKDyHrvDYl9Tno=;
        b=iT5wpodq72F2wHo0Rzja76w2Kx2pU9VyCcTSg7cJbIvlB5tijT32pb86wdUcjylrLX
         7WSSfLlg9p259WyLm5g41P0/t33ZjcNmOdS/5PngNC94Avoo3um/EBdoMqvV/uU2B1iL
         RFmZLTiHI1JGFoyXjRBEdUTC0sFY0evgy1NsG9edpbUoeDiQ1tZNjxM9hzWOcuXmaax3
         G4HL9AC706MWK4MBg/gE5vMaQHSxPWOLcI2ys+oKnsjCGunDRtVhiGOHcN2unzfZPvcw
         Mul8G2ljYN5e5BBehNCwQFr6J0A7I9eblxV0w7/Fp8yHwAUg5uxSa+NGsYcBQKtJOIlu
         21cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768207452; x=1768812252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LtuylQsGR2SHc1tC5K8cJ0nm8a9J5bKDyHrvDYl9Tno=;
        b=Ph3CosqRKhNMS0zAtg0TPeFk9eXeyFOrTHnjubRemgrCGhbM2lvGa9QvA6qlrV+m5u
         7PtK2PYaxfyyi0rKQswhm4qQm5Uoqa+yerHFQFzECil2CiMlegj2BB+rjJgqXSa5kh+g
         8lmeL0JJe3SwsRKDDw9V813Rbi0wZ/jx9mL0ScGyie+jjplaTEZKp1Ekox3HxGawjH91
         1fS24luiCaDDcIby9jk7QmTsUtHghUaBlEZsGjD7em+krcsWcCLfO9q3Bt/iT2CHTfsr
         8Xa8NC71ij5tiXU/xr1QX8RNFsokUHLl1qaxwXpJwzO9AGjTO2CseK3LMEcdetQEZf+U
         xD7g==
X-Forwarded-Encrypted: i=1; AJvYcCUGn7xjnm5wG9SXZOh9YHz7j9fuW4kXzhhFAtcJjukwOdQi9ELI+ky91Lkra0O4KMRSsYdIz1s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3NYhSwT/7IUoyeXDJXKI9tMOoU834+riWU9zIXhcJYeLW0c9n
	jahTKYKol9weRLxvB9ImlV9QvPp1YwV222uIxkNFexCmntvEhbieMuZI+UzNpE9EoAjb/2VC37F
	UElFG0bYJJTgP6g54fsipVvxBsSiWKClOVOHyILiOHfYzejCYCcmznjooY20JKtD+
X-Gm-Gg: AY/fxX5GPiCto9QKeHuGSBa5MlenXxLgQcZitiSK7jgqCP4q/Nr1d64gCNIL2gt1dls
	MWqI7hlczfnwoE4FxxnT+JMhp9sR+RhUkXYpJ1A1ty6dCl/ukBHYTkBrAajAJwmTaWfGo8dtxb2
	79ANfsVSJOy2VAwipujgp9xve7Tzf4vltZUgvmKK/FlFRU3psA5e/zuBgDGpEqtjmuMsEeKd2W4
	y1x6kW7g45HQqi2SlbzeBkJivnX8RgS5dmUrvLXW7yBBCbvQx+UgHmjd1K9vpxtGFp5fwCmEVDY
	RIAtevxENSA6K2RmfZL0ZLurTyCYKr6EW6DqDcfo0hQ9nzwkuPzfhHHaiWpDvz8+GynB3zwk9jO
	IlnOCC/zTF+EFqDiQpmOY7usd0+g2XULsrgrdn/I/Qz0Y9Q7bkRhowko=
X-Received: by 2002:a05:6a00:9086:b0:81f:f5d:e1a6 with SMTP id d2e1a72fcca58-81f0f5de6e3mr6521274b3a.58.1768207452538;
        Mon, 12 Jan 2026 00:44:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHq7NFkE4v7sC7fUG2lzdAtaGT7wu2cdRhx8GoQ3pjyOCC1K1KcD3iCMGbL+8z+DJWRyOYSew==
X-Received: by 2002:a05:6a00:9086:b0:81f:f5d:e1a6 with SMTP id d2e1a72fcca58-81f0f5de6e3mr6521259b3a.58.1768207452013;
        Mon, 12 Jan 2026 00:44:12 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f106e9be7sm6620903b3a.47.2026.01.12.00.44.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 00:44:11 -0800 (PST)
Message-ID: <5a4acd79-ef1c-4fcc-896e-ac0d948a1722@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 14:14:09 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: cancel scan only on active scan
 vdev
To: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260107-scan_vdev-v1-1-b600aedc645a@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bo2OBFna-NX_Hl6sFtNZSyK0cnksEXYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA2NyBTYWx0ZWRfX8uPULWfWh02n
 QdPkx22Lpd0omJRUm4mjR2ljGuVov+T6v7VtE3SDvl017AcmXrHC27Ai3o4BiP0e8RrCWdzzy80
 rn4eNsMVR50NuY76dBQmZBTxRVUgZpg6JDts+Fq2wQK/+EHwiGP1jM/BmQDn0cApprG6sJkxGe8
 SeZgN87f8cPu1Hxpxb4dVpjHpaNp6TmP/a+lFvwJt6gdLnT0H3yJzLPskal8efbc3bZ+zwItres
 u8TgVQy9EytebbH+ZhUGGu7xtL9FP4gLhsgQXb0Sr4ez0FD/7g2pz35vV0bHgjLWe7IXB4ssyvi
 NtbWHtfBp1oJlpWTg63mRX2rWbAcMRju9jkeePPUvgWduOaxGjNXECiZinJNKV9XW7Rd+QuwVc6
 YpsiRfrSU8PMj2M887REYiGVG/RO/cohHzfM8kcx92mxS/pTlMzMt3NlHcjAugd0wpl4Bl1dhd1
 dw3iuj/jgEjUJkYswSw==
X-Authority-Analysis: v=2.4 cv=c7WmgB9l c=1 sm=1 tr=0 ts=6964b45d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iFBeAqSSch97oa6bARUA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bo2OBFna-NX_Hl6sFtNZSyK0cnksEXYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_004414_199624_4F7B14F6 
X-CRM114-Status: GOOD (  15.49  )
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



On 1/7/2026 11:32 AM, Manish Dharanenthiran wrote:
> Cancel the scheduled scan request only on the vdev that has an active
> scan running. Currently, ahvif->links_map is used to obtain the links,
> but this includes links for which no scan is scheduled. In failure cases
> where the scan fails due to an invalid channel definition, other links
> which are not yet brought up (vdev not created) may also be accessed,
> leading to the following trace:
> 
> Unable to handle kernel paging request at virtual address 0000000000004c8c
> pc : _raw_spin_lock_bh+0x1c/0x54
> lr : ath12k_scan_abort+0x20/0xc8 [ath12k]
> 
> Call trace:
>   _raw_spin_lock_bh+0x1c/0x54 (P)
>   ath12k_mac_op_cancel_hw_scan+0xac/0xc4 [ath12k]
>   ieee80211_scan_cancel+0xcc/0x12c [mac80211]
>   ieee80211_do_stop+0x6c4/0x7a8 [mac80211]
>   ieee80211_stop+0x60/0xd8 [mac80211]
> 
> Skip links that are not created or are not the current scan vdev. This
> ensures only the scan for the matching links is aborted and avoids
> aborting unrelated links during cancellation, thus aligning with how
> start/cleanup manage ar->scan.arvif.
> 
> Also, remove the redundant arvif->is_started check from
> ath12k_mac_op_cancel_hw_scan() that was introduced in commit 3863f014ad23
> ("wifi: ath12k: symmetrize scan vdev creation and deletion during HW
> scan") to avoid deleting the scan interface if the scan is triggered on
> the existing AP vdev as this use case is already handled in
> ath12k_scan_vdev_clean_work().
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Fixes: feed05f1526e ("wifi: ath12k: Split scan request for split band device")
> Signed-off-by: Manish Dharanenthiran <manish.dharanenthiran@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

