Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E101EA719A
	for <ath12k@archiver.kernel.org>; Sun, 19 Apr 2026 16:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4Ok21R8TtS1c7XoLZjXmfdoHlTBFWS1WBYcbTBRwSY=; b=YSiqWLt+Wzt/Jkv2IO+qnalElW
	dmdLKc8ikoJt+5NsyG18OvBdibwOCI2Z9QwpnTLAEEmP6RLrAzAn0sZm0EOtz6JQuij8vvKTm3nPz
	yNNdqjhQLk5KSS3rf6HsmADHNFMbnGC4WxLvn05ekYYNCvqrNX/OOgXGjeiyzCHc9JTEqS+ZxFypQ
	y4+VdHDPEBZOE0gvFNe8ko1u51pDset6EaE2inps98MaxB0n8q8StxU5jwfCsgfq3PBtBVg6IWBJI
	ZU+gK4FmJgx2YjVL/xSdIeY8l8q/ARX6NnI5jC9nCaBfvH7NiPA7RVlVCE+m2YgvuwCr3PEy5D5Fw
	kryvsPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEV3a-00000005vdk-1zkE;
	Sun, 19 Apr 2026 16:31:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEV3X-00000005vdP-1Wnt
	for ath12k@lists.infradead.org;
	Sun, 19 Apr 2026 16:31:36 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63J5eTDA1351818
	for <ath12k@lists.infradead.org>; Sun, 19 Apr 2026 16:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4Ok21R8TtS1c7XoLZjXmfdoHlTBFWS1WBYcbTBRwSY=; b=AmmuALiYV7le/epv
	COBcK4V2DMIUGsDIbUQDwT28xndOD683UqUn6IMSBtYcvnxsCb+Lf/NUXfUi8jV3
	o2hbFmEOnmiZIPPsN4NxdjfaWRKT+VEkg2dNdItbJlBcRlhh4plSONgT/qmokvQv
	ni4d5QlDSl7F0aJm5P5bwKJ8g0YkNMYnwyc3MNqiTeRV5yMEtcHUZjBCBRBNnqlA
	5RSfsEefCVdcIvG4UQhcj/HI2TzF9251GKeHwLhn6bc+/srfw8ye7IETkfP6molg
	IM5mjBG/flnb8dW2aUgkDXQ/iIDjx8rA1cGXU4VNgKZC3z17d6FYM3TO50Q2YOHB
	LtZFtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm388jsaj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 19 Apr 2026 16:31:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35daf3d3030so2316820a91.1
        for <ath12k@lists.infradead.org>; Sun, 19 Apr 2026 09:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776616293; x=1777221093; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y4Ok21R8TtS1c7XoLZjXmfdoHlTBFWS1WBYcbTBRwSY=;
        b=U/6I1vYcMWo6AD+NX3sEHbUw2oz4+pMm19Z1XXEI5lreW7oYJnSh4AhYyhcCCGcLEK
         Sg3Q528bJQSnON2hYdIt8Q7i20kYC8sgvxtG4wPVQu4qfo7nlijXL7qKyugGuXYtc4+p
         ib76FQLNJrE206WrYdS8uFvEnfpT/PGfn1/BtXLzjmjqQa5F8vlF2acUO9sWuMn1OynR
         frSPHBCMS5PfVzwotxFsSBg2nVE59nbgDgkWU9CBQAeqt9bQgXi7+yaodKCPzUI+Ki+p
         4hi1q4+9T8O+y+v1JqfvilGaSuZlQdvk8nEzX+CU/oGypqo9tKFzCZCZcetd9fUoxPs5
         V6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776616293; x=1777221093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4Ok21R8TtS1c7XoLZjXmfdoHlTBFWS1WBYcbTBRwSY=;
        b=X4hPxgb7ouHAQ2IX5aifqyzbKTROR85oT3mWwWDaMK12XdSKtc9Zh6gA3EUS43ZH8f
         B5lx4VlmO9jbqGd99vVJbVHsLcqUil14az1LS/RUvxwd8q6znEl6vup6kHhqDpbpCfgo
         K87i62/u9CtbEKp8N+3vDYXdWsWBWONxnlTgtwwhhWW/WHmRA+Su3xO31qwYoQhK4pzI
         P8JzP6gfqXUPO0mSu5GX31PaaxCM5m2NNWNeqT04ZuBn+dpShOjFO0O3s6QLBPkGcT2p
         bHRpEnlWVa+3VnOiDGWmYv5ZIYHRyFrLxN35/Bc1gcfujsoWawzPfwe0W4OsDkZLndlm
         0TBg==
X-Forwarded-Encrypted: i=1; AFNElJ8lmrOe5M+x4niSqamv+moHzyHogsHSFt674noEvqY3okwaV7NE1LN6Gc7tbr0LsvxA6uxYHhw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/fq6WvhxDCPjfYQshNWKi/60np+XLGoC96e03Hed7texDjTao
	ZJbHOKJPoAK+AGuTHFcdy7O+XFX4BIYfbreWJLOWwuXk1JpO58CYFFIGGiyFTkQ4RJFuE5ftTBs
	AdtPb1InBZvaoG686/4dWN3p2LfuUhshvoxTXa9EYX0SQ9mgm5wsJ+3ZXKThezh9JbFCzUGmJ
X-Gm-Gg: AeBDieviP+6xU6Hf9aQzFmfndSEZpAvzUBgjLAEDKdSR4asF7KBaq4ONXYjjcMNtpAE
	qPKnIHdNDRFLJ0SNdP4/Ggh33qmRNUPKDzV9JwWfNj4LgGkxSHjaAXy9oufWli8QaRUq/6PRGVN
	Z/MmJCu+I1BBAH3KpOc0WWekcbrhrASzg9UwBQ/BHHsUaetorMbUao7K7FZk1NZDX44ubolKdIc
	8gMhle82UOzlcByCG+52P8xC+5kDAXuzpb5wGDeuMv0vHUiTHzcA4IEmNWHunA9Hhn5e4zsNnlt
	9gzy1o9HK0MNotMnqDSn1YfGkmRPGRwBxjHGL5JERSBaM3u6CBu5WTCYaUNjY2NNoJHs7HMJARW
	m6C+4r/n7Zx5ukVgtRnv2BebbtBkmP8OtNw/o20KfBZ0rGKcb9zWBIL05hatx4HQtrYmy40pHZw
	==
X-Received: by 2002:a17:90b:380c:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-3614049ed12mr10891805a91.24.1776616293020;
        Sun, 19 Apr 2026 09:31:33 -0700 (PDT)
X-Received: by 2002:a17:90b:380c:b0:35f:b5df:448 with SMTP id 98e67ed59e1d1-3614049ed12mr10891791a91.24.1776616292477;
        Sun, 19 Apr 2026 09:31:32 -0700 (PDT)
Received: from [10.118.196.30] ([106.192.65.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cddfsm114681905ad.49.2026.04.19.09.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Apr 2026 09:31:32 -0700 (PDT)
Message-ID: <38a1c477-c82a-49f8-a632-babe2069c427@oss.qualcomm.com>
Date: Sun, 19 Apr 2026 22:01:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix invalid IRQ requests during
 AHB probe
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260414062829.2371761-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GthyPE1C c=1 sm=1 tr=0 ts=69e50365 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hMyz4loUA+MjAVYq/NeUoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=0MLAdd28pQG-b0eIEP0A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: izqKnst93Ls1Hr0vh5TfNm775U-26Zg0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDE3NyBTYWx0ZWRfX6I4Z95kn8VLc
 bjhXfYvqbFrxzwGxomQmmjadikevEOjhBEUPEBpE97eDQuLItCZjhZYy9ugQOK1OglsEIS8FD0p
 eZ+8Hai8+u0PK1UmeUCXnu8Skz8vIZPdb3ibAunR+BWPvP5qMB4t50rmXhAuO+JJvzM4zR6TrV3
 QCOrInvpwk4FEiL8xB0P7X1XK6mHRoyWsWS/9HapE01mjD0l8A6hfhbsmjO1BtK5asiULCMeMVp
 ES1gecco86PzunqQzgEvfUaGVr3C0Jro2D2utHwlBbNrOMYhnDZagpGToelvUnq5AYRo0WZFwD/
 NpIW1/hPBlkyZHgtlrx3K+vVXH11x/siJSyvvGuNAOeq40Am9G8wqlPWzBu5sIqunYc6f/jJnQf
 GoJFYBLlGNCTyjBIYHa6au4PuNat4aom80k6eUqhT6RQYzifNQgDGZapeSHgAIAAjJSTxznZkEW
 1wKpBwHvam5lB5zN3Vw==
X-Proofpoint-ORIG-GUID: izqKnst93Ls1Hr0vh5TfNm775U-26Zg0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_05,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_093135_463552_64519F3D 
X-CRM114-Status: GOOD (  11.97  )
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

On 4/14/2026 11:58 AM, Aaradhana Sahu wrote:
> ath12k_ahb_config_ext_irq() iterates over ATH12K_EXT_IRQ_NUM_MAX (16)
> entries while checking TX ring masks, but the tcl_to_wbm_rbm_map array
> contains only DP_TCL_NUM_RING_MAX (4) valid elements.
> 
> When the iterator (j) is greater than or equal to DP_TCL_NUM_RING_MAX,
> it accesses tcl_to_wbm_rbm_map[j] out of bounds. This results in
> reading uninitialized memory for wbm_ring_num, causing the driver to
> evaluate incorrect BIT() conditions and request IRQs for rings that do
> not have an assigned interrupt line or device tree entry.
> 
> This leads to request_irq() failures with -ENXIO or -EINVAL during
> ath12k AHB probe.
> 
> Fix this by splitting the loop into two separate loops: one iterating
> over DP_TCL_NUM_RING_MAX for TX ring, and another iterating over
> ATH12K_EXT_IRQ_NUM_MAX for remaining IRQ entries.
> Also add a bounds check for num_irq.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

