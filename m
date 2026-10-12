Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A56CA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 06:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rzyqoTq4mNCNhxu5pCLCT/tmkpUXAonKXvViWSHkRHU=; b=ZvKoobKvUQnJkZ06nS81prkGz1
	H1TpVpsnpuk42RoltfZJkUdkPJHBBfEvKbOxFci7prkaQ2QeO5kMdytyDFCrzexc2KccjapmDilAC
	9QF2JeX796GE9ViiHAVHw5PENq2uCqQE6t3nlwVsEf86AxI/PSJxEp5080fePCZ2LJuJ9wQ7NMV+x
	xGIivj2wNkMhVbaDxdtbv3G/FN9zP2tgslx2cuRRzuNn6CmvP/WqEC5O39eLmpd+2B8KyGBw271Kf
	t996ijovrwTssRud0qypWzXYrpVNkHY6s0k4DKLXUsDDh1CgxiD/6mM3x4+RU5HI8gfafBU2HRbBr
	KlVPnjTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9df-00000009kbA-1U3T;
	Mon, 12 Oct 2026 06:35:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG9dc-00000009kaK-2wpy
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 06:35:57 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PcAw1787080
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 06:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rzyqoTq4mNCNhxu5pCLCT/tmkpUXAonKXvViWSHkRHU=; b=l8ei1FiaGV90CWdq
	1yBrvg4hcMswHo0mrit1Y5EZckj7Nk53VjHgFVF/VvJZN65HoPn9S9O0qnsNP6ub
	dH48YyDzBmwh6yRjNO0dqxNbuNeHYSKXSU/5TUVIuX6c5H5cgTos1LAYrWxFMTdj
	wNpMKzzsY/FOXAjCkTwVYURn0oScbgNe7fjvQleHQ9L6qg8pLnJsvwGor7kKD/Aa
	RNyKijoGitPcLPkQNTAokaJCZJRzQle+eAb+cTjxGdSTuOTo2uuH5rbqiEOFcq8A
	i+d2by3EzoT3CnYPXWTLy96+tT+mJSUXP3ssPe8Lfm8zZm7z0bNl/UMuGCHpqMQ7
	2pzQnA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1r9vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 06:35:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a8ae5154e7so1340070a91.1
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 23:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791786954; x=1792391754; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzyqoTq4mNCNhxu5pCLCT/tmkpUXAonKXvViWSHkRHU=;
        b=SCfzmtlVlo/pfkNU2IQLuuq67TUeU4yLFmLLyp7LiJpIBax8JjAPT+enJ3oWPcTrON
         6dRxv5DU5CHu5A/cAP5Ytk+ZjzYmaifQnpPBL9dgBM4i+x6/npGhkZVATDnNCtnmIKrL
         YcyU+dGT/d7NPboA7NwgqS8TAo3L+evjDar4vCYKtwPYqPNaeKOztXVTHb5TI8gGEB3c
         8OEwPlbLiuOTGsoeiD2+WubVMatMSC2QHhe9VdGbtL4C0WhMHbOr3zQDGGFg/cvZ1Rsl
         AXZh3qHK7/+Ye3zyD/dVs63NtP8FrFSIkyY0xaUZw6seKqYNYRd3W3BRzjcgGL8JGlES
         sgZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791786954; x=1792391754;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzyqoTq4mNCNhxu5pCLCT/tmkpUXAonKXvViWSHkRHU=;
        b=jsCcKRHY5v+T0c7N6SF4/dlon8NDQM+q/KxH/41GwkpOexPnPidKwRe83NOox+oT18
         PuYhI5NBlAZIzdP37hwLpITJjCN2A89ze7xy/ng2LU4psPn8e3Ye/lmv4z9RncNC/GLG
         5tC3FYPgPLiKKHWGln3+UJ0bgd1u8LwDcLHTAD/5GwgmSAYmMNwq9G/DnJEkMwCckPuZ
         z0v9ONHynvQZDBRQfkwujAS4Vn0g5U1Yp7CFU0E6zem7OOJorWKlDqtE97xTBNJMfHN8
         w1rAv99BVYRXm1SuSPYBaUADt//3xXhdqh+KyDXBbyEXb00T16na6EEOAvuAXz6YNYMh
         3MeA==
X-Forwarded-Encrypted: i=1; AKwUvBxTeDH0f38Fq+bsLPT86AmSflkTSLntNort4bket5bUYQsnJItIK0GiVK6f4HDrCsDqPzNAfnU=@lists.infradead.org
X-Gm-Message-State: AFq9FYL3FelCnEgq/12eKpujOLILByo4tJlxAf2nkOW7LsJShN9470uo
	WToCASX+KDn5EpsRFRyv9by4DVLXmzq45FwV9iMAEwrGpN3rHdqhoDW2tEPtlnC8vQhUkSyPJax
	91T5GspwQZUh7O69Jd3qoMPA+DCDfFIbL46TdUquxZ5Ef/rf30DNrK4c6Iz5dN7Cr
X-Gm-Gg: AYBFou2gVQqvGDDug8pDbzeoerR59Nwg7yOch2mX7GRstmU6a7n+q8X3/LhR1f+Uh5G
	6hCkgAt94rYMKFGVCH307S0XKD93rwf41tlasefc1Nm5axY0Wel56KyWIKpEG0jmOUtc8swF7V4
	rV/9ht6YpcFtro8XBkYZQLx7q6AZVA9zPe7aTqMWSzJxki22IBtLD2577ZL8x3Lz4uRlZvk9d1m
	cDNDr98NRnID1aX5gZEX9DPN0BRyflNlF10v/cSUSqyJDTp/S2FrZ8RYrFH8y8BHR2AhXdrAr5e
	kFs02olAFDQ6z5maSXok/8Prl04dJZa9fjCwq6UtFKH0Mq/SQwxEGXprX+QCgXRUiSbrh++iGls
	cxTrBYm97zQbYnshBlpuElZBeF+G35xw=
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr6483762a91.33.1791786954566;
        Sun, 11 Oct 2026 23:35:54 -0700 (PDT)
X-Received: by 2002:a17:90b:2ccb:b0:3ab:1af3:a0d with SMTP id 98e67ed59e1d1-3ab3ac63ba3mr6483750a91.33.1791786953913;
        Sun, 11 Oct 2026 23:35:53 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab3972cc05sm6748715a91.3.2026.10.11.23.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 23:35:53 -0700 (PDT)
Message-ID: <cc107d66-df4b-4a77-b0d2-2106a02620ca@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:35:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: Fix NAPI resource leaks in AHB
 external IRQ paths
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        vasanthakumar.thiagarajan@oss.qualcomm.com
References: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261001045423.493121-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ewIZCRg2h8gkujW1vc8cPtpPW1kto3QG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX/haRbh4SQeUq
 Sn6xvgBvgkiDFhB3Tb4cLBr+Oi4NWJ9rtTS2ahU2leoMiym6vdr+frxGVu1cDWtJdmBtc4FILur
 ssVv5SPnDgCpAJTXkx601rLmZjXRXjQ=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc7fcb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=3Kn9n7x3DtEw6PE7aXgA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: ewIZCRg2h8gkujW1vc8cPtpPW1kto3QG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX72KK9UCdpXQY
 tofUXtkQeA/WkUd2FD95Zb2FC6BAosgEQ24WT9tv/bhO7P7b4xJJZYl3IlLojbtlfBsIiUShBat
 DRtGPtOmAhUxU4NyxUf39VWfX5canmx3Ame/QjAzFMTDnuHWotQ9YNViax3qHDlXjJTbbUSPDoG
 obETk3RrxSwoJAvVFvWU2A3RP7UV38OdQEES6ystHkH7VR5RkJDncmvEoaUGUTQErfEsNVaWZGW
 sxb12nk+rwSCKZyRYzMALmO4S6O8qq2V9sVbTaMMJO+95+GXlRYgOkP9Wq5YcGvfSAex2tVwUPp
 9CYBf4c2A+jMsMWzUWfVcNL7sQv/YDBcoEMASMLP5n1kIl8qgl+9jowxGHbUQQFnnecPVPax/gl
 etw32smOs15C7wxsycNNGFTYa7nBDmIj9kEkDqhNnicLjL/RN+lPry6o1OB0dVgiJwbMogYReSL
 /CaRcE0vEbfm6RPY+bw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_233556_866293_0B69FA25 
X-CRM114-Status: GOOD (  10.20  )
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



On 10/1/2026 12:54 PM, Aaradhana Sahu wrote:
> Currently, NAPI instances and their associated netdevs allocated for AHB
> external IRQ groups are not released when external IRQ configuration
> fails. They are also not freed when arch_init() fails after
> ath12k_ahb_config_irq() succeeds during probe, or when the driver is
> unloaded.
> 
> Fix this by adding a common cleanup helper to release the NAPI instances
> and associated netdevs. Call it from the external IRQ configuration error
> path, probe error path, and driver cleanup path.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 6cee30f0da75 ("wifi: ath12k: add AHB driver support for IPQ5332")
> Fixes: 614c23e24ee8 ("wifi: ath12k: Support arch-specific DP device allocation")
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


