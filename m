Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21F9C43458
	for <ath12k@archiver.kernel.org>; Fri, 10 Jul 2026 06:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYlcCGv9F5rwLeM3JpG4cosoDRi4rsg+0+seCPsDMaM=; b=S+vCTM4YyjzEs3CJc6A4oMF/rn
	w8x+qa00PQyWUHeoVA0FnyFQAV1pyKiN+M8UR7KlO216grJ1NHjjTGTyOyHGTzmJ7jHPkxsNuZTv4
	M/bAiO8HHUYacYfiGc/ywevyjEDXhZRgWe2AL5d7UizNSWPcbihD6O72Q6ng3QJeNT0bZQuYvfxk9
	sQfI9diYdlKcGXb2Q6mnfnH4IigCorrHRhe/PWmuZo06hp2rBB1CvInC6oW3y/91mtnKGDO8Htw3E
	4zR/7RI7VA1s+FIcZ7QK0Vl/84J4u8/Wl3o8ER65+PcSyzCQ0KDnR/6gSQHk8rAY4KAMnMSP9gU3J
	2MPL6Qdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5Bw-00000004JBg-2Inm;
	Fri, 10 Jul 2026 06:58:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi5Bu-00000004JB5-1SGl
	for ath12k@lists.infradead.org;
	Fri, 10 Jul 2026 06:58:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A3n1Kb3661656
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 06:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yYlcCGv9F5rwLeM3JpG4cosoDRi4rsg+0+seCPsDMaM=; b=U/gfnc9JKcXkuRaG
	9BxWtucsPMxnJUEALBhYgWc8DRKnwbBFPBBdE/0PJOiYpZgw6sRgmx6sFuJFGCgL
	F8bSg9wwZlrA6Tbd19QDtM7q0e07ZkkTRCOp9HrLYIK1qUlQPQ7V3TiGK2J68EP2
	g/H9P0ate7jJlXdUT4z8LKTI67x4rW4ZY1MuM1qYw6YIiT7h8VEGXDYCNfeaAU9j
	kJ5bJ32LiC9JGW/1mP2wsumpu2Qtk/rBRgR0n/gqGx4UmD1IF9dxoPTmlnpN5kb1
	+WmJ1p1tpmOOV2Mi+WMb+96oRwQuRzKdjtCHlhLayjw+1ziZkoOQMzEP1xDJ5gzZ
	TLaCrA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24u1j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Jul 2026 06:58:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84854c2f888so1201995b3a.3
        for <ath12k@lists.infradead.org>; Thu, 09 Jul 2026 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783666708; x=1784271508; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYlcCGv9F5rwLeM3JpG4cosoDRi4rsg+0+seCPsDMaM=;
        b=XuQJe5XrC6eRDbJkwkStfmqTB+FFQLgQEBWUkmpf7ZXhlT3gFxpyE5nOWnPei35Y5t
         5Rc7Bzo7E6L02ERh8OqYGcA44FI/3ICzxKrjBHw/5oQuKN0x0VVm+Iz1xjI9t0NAnkkC
         WDdi85PWEw8YvtVR+1t5b4FG/bufyLMNaLEtI7ipnXv6F74zC3wJrA85sCz9oIYVZ2tz
         ZH1+0aZZaXKbESmDNuFG92qLDJKYCPI8AiGQS3Yz0dyYdn0g5cRybV+YCIE5qGPE6nm9
         VhmO69cbr0ALBDgTXh5iB+1wWesXfZBulgfTuMe7PZMzK+uYu+kczyGneT0FU6oCdgDe
         /Tbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783666708; x=1784271508;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYlcCGv9F5rwLeM3JpG4cosoDRi4rsg+0+seCPsDMaM=;
        b=tDPYeD02nz0N1U0Y8w9hwXuroR4k/+azFli2KJS5uRvBSVNBki8jALNH+6QP4KWWhm
         co9pooc29WNxGqD26pl4mim4/u2vGgS6vq4XcIEHG+O4uKeWnLVZ9AcMJ15SERroUS9P
         YgtLGjljjRivexXyn0KWzyEExhQwqDob+MUYk/ktcvfAuosfkfvkYKKO70BuxZTsxj0G
         VlyFVNwVaeekYRr+PCrUSQj11NPe15UEkHCNeZiH0Gw23zVtqBSldAAFUSglJHb/IW52
         e4xr42aS9dUzi7qHaPa2KyUO3yuCZhpyVdN5AFbvBz3Gs7MNair1UKFa5SayZHNv9FL+
         8CXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnY6Nuxb2qYrpVa/Qd3TmyaM+Zf8X7Oy8q6gyfd2QQOb7MqKuK6omCSKjKYecqJuyU6+G06eM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxeJ8Ehhxfof825W33rdJMNYBPx9Ug8hJMNlkH9/1W/pFHdP7E9
	FHusQC54TorFdrw788flUFLLBgJuhSoF88+F5uH9dq0X/8+b7sUXPXtfRYObPzRq1/76P2B2fRF
	lGG77d/aSNdVHYWG62WEDM0l/JBxkpV0CEGFzSu0Zpo94E+6TwSws+99k0wJbjOkBcuz3qz6v
X-Gm-Gg: AfdE7cnj+qaaRbJ/nEb9Fjh2GgaS9ttdXv+u3azgW8XkGsgn6T25AeV9EQuJ6lDXtTu
	86yssNjiMKp0rgPsBaN1Mgngvw7jrYDM7W9gvs7ZVkt15oj5ITGkcOveOF5nBKZuAQ8N5BHFA2W
	sox5PRezZk8BzBIcJRvDyxOACFfgB/sdVtabWDw3NSFCGTinrCVT8+s6DWVfaCldmWlC6uybsER
	EczlV5u3Fhw3ReENV8zwZmA0yuhkv7dhNOUjlRcj0ZG9YLLWny2RDYKQcYdRR8hAHRhUpMsgYw0
	HvRMcMEjqALyFwoLtKddDB/qD6FkBelfcUAFmSy649/rWXD689A+1TnU+YAASfR9am7VZlOd6bC
	8zveaJmw/H3ArbVPBXU1wNp5oDTVj1ieZjzs3Z0L5IPoWP1DqV6sx7cBUarDHYCL709JD6t+vBn
	p+taziYh5b
X-Received: by 2002:a05:6a00:c88:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-84842fea0dbmr10202169b3a.8.1783666707553;
        Thu, 09 Jul 2026 23:58:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:c88:b0:845:18b6:1154 with SMTP id d2e1a72fcca58-84842fea0dbmr10202138b3a.8.1783666706986;
        Thu, 09 Jul 2026 23:58:26 -0700 (PDT)
Received: from [10.133.33.227] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84854bf8c9asm2527585b3a.41.2026.07.09.23.58.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 23:58:26 -0700 (PDT)
Message-ID: <d300a113-9de5-49f7-a2a6-cae1d3323d49@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 14:58:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: update IPQ5332 BDF address offset
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260710053534.879233-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GHY5s1AUwICpKu1s080wX5mhj_FlHo0o
X-Proofpoint-ORIG-GUID: GHY5s1AUwICpKu1s080wX5mhj_FlHo0o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA2NCBTYWx0ZWRfXxtlg9O0GibsR
 mPRpf48vQYpk1VrZ7SycgKZwDUx4GeJrOf1L7PmZ37hzSAC1dFGm7sT5vYkDw1GhrNZT6uYxPfE
 2LlJ1txay63vf51SNt2jz1FqpDpOvlY=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a509814 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=viQb0OZrn-eQzSfuS2QA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA2NCBTYWx0ZWRfX7DZdIT2+EMy0
 jD65DUB8AdjuRfd4imzePwetIitreB2jNKghShNnX84lp6GdhozI0X9pJfSZqOdUKai30M9vC5B
 54mCetBQZrXC5SCqHEUyPAMa/+CZRR9muY0Jr0ScVerW0j+bnXVuMxCoS8TD7tA6KBhebXgkjW0
 Gx3yi3zKOsjzuJIcoridfefhnDIaGoOtFCYC0MrZjPLzpSpLuaHorZ7hclcHBUd6YNaGROtNs3b
 1Mhfxdo8qJbQg8m1322lWHsxvCHS5hZ7J6l5KrkCqPCVP8VVhqTiSIqa+vSEGq2BWWwJNJPGywd
 BNvlNgVZmwBDlg5iPKVk2v9xf7RzoUWaItdXMkmDk+ObMXIE8mxPXIo40tu9OPgGyj1so229pJ4
 HmYji+lC6PizSgYYv0j5fFoalxCZMnmet0pLXwOtMVJGL2CgW4f6pfgY5W/v2nHCSf3MsSDRo/c
 yuPQUAEHlNuphOkHUYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_01,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_235830_507957_308E7D3D 
X-CRM114-Status: GOOD (  11.37  )
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



On 7/10/2026 1:35 PM, Aaradhana Sahu wrote:
> In the ath12k driver, the BDF_MEM_REGION_TYPE address is derived by
> adding a fixed bdf_addr_offset to the WCSS Q6 region base address.
> 
> The current offset (0xC00000) works only when the Q6 region contains
> the IPQ5332 ucode alone. On some IPQ5332 platform variants, additional
> devices share the same WCSS Q6 processor and place their firmware
> ucode in the same Q6 region. This results in multiple ucode sections
> within the region, and the existing offset can cause the BDF memory
> region to overlap with firmware read-only sections, which can lead to
> firmware crash and driver boot failure.
> 
> Increase the bdf_addr_offset to 0x1A00000, determined by analyzing
> firmware memory maps across all known IPQ5332 platform variants. This
> value represents the upper bound of the largest combined firmware and
> ensures all IPQ5332 variants can allocate the BDF region safely without
> overlapping firmware regions.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01275-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

