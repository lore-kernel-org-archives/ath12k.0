Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98F79FD3774
	for <ath12k@archiver.kernel.org>; Wed, 25 Feb 2026 17:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QZTkBXKmJdrutsXYLhcPuot9yfewPJZ4rwWBczMZYPk=; b=KWyIDENzg6flBLLzMTzqYIsg0X
	j0iP5Fa5rtGeYIxFE12pQcKSgOF0w5WczL7ueNyTuZ1MNjxZ+uXrB/KsaZnovp7J0sF0Qy49Sgo0H
	9TSOfkrtI3TljqpzvvdymSy5+LG7I/kbGlUZgy/81PafmfXdP58wJjT5IErIu+mAI5nznWHs98p5k
	XaO2ETm8pDM4TaWGdeE3Xq/zIalLaLTKzsp0YfrOJx4hAtDPRS/lPYEsI6tBGsFpVPTOVmvS/YUk0
	ZjPI2bAQJ+S3ZLhroa9Av27F6m2zIBORrBA49jHBwJ+qKeCZsO9Crz2qL1cjR2ySOgQVZrTlbRIDL
	1DTwVjJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIGc-00000004aqW-1VBP;
	Wed, 25 Feb 2026 17:01:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIGa-00000004aq4-04L3
	for ath12k@lists.infradead.org;
	Wed, 25 Feb 2026 17:01:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9Sqnw229724
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QZTkBXKmJdrutsXYLhcPuot9yfewPJZ4rwWBczMZYPk=; b=YOBpKJUsWqllm0XU
	gfWjNVOfKyTCzY8TGIHsYdypuv1EFYJzhiFk8ukOCo4eLo1KkLPaT/a5ohPV1Jvi
	F0GlJa1OfcsgFIsj29SaDE822AdC2+6xfbjRHaVqs8j3xcAJ1vgzxRjtEfzi8wbS
	d6tW+1LewKnaFx/QWWmIYXN30hMsfQcuic8NwhI2C5QdDz99UshTm6R1FPRXkhr5
	6C3nG0yXChXn6W40wDnNfPbTHd5iVr4PeSpPdS/baH6O8aji/GSNgaTK+QgtUqy3
	HlTePwyhHqjcZlf5gwXjBDVtx36LrkpJetSw+qHuCzDe3W314aJAyUnvn2rBMQLI
	F7G6zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg37v2vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 17:01:39 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e5e33ddcso1918924a91.1
        for <ath12k@lists.infradead.org>; Wed, 25 Feb 2026 09:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772038899; x=1772643699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZTkBXKmJdrutsXYLhcPuot9yfewPJZ4rwWBczMZYPk=;
        b=kh49gSBq1zQMoLmY5zG+1bEqBVQsSFV2Y+0GJ+GdQQw2LY+NEsDYT9echophHd0Pk8
         L6m4fjjmIURJ/VdI+r4WpPzMWiAHcQYjPktEriMm6AD5ZJXioaIe8pWVLZQdZebeTQjA
         A73uXhyQSbG9OfGSvNIj+EfXrJwFhGllN1AtDOE2BV00eJrKSdNswy5+2FDeD8OlDs4X
         5XZNgZLzr/45yrsWEuJEt+T43JupW3gt8GroSc1LN/VAAdP2XjD+/bAOAL5Upwc66o7O
         k7d7Jy+ZCSoW2yoPwZ19PqE3ORhrbZcL4iEViPjUPklMl0H+vIe9G5lcUaT08NWc0DQm
         ZzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772038899; x=1772643699;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZTkBXKmJdrutsXYLhcPuot9yfewPJZ4rwWBczMZYPk=;
        b=qVh1eLVK2wxtTb8C9HnfrYQHkKjxCF3XAeLknOf0TKGB+ZUEXUa/8AATqPHxMNtmz4
         SctCZOjcVgWkF7jQBUU9JjunIZGYfT059moHxcZ5fxsD41JiFOBtCaqw2Qgd8XzYyivu
         eGAAK5vvU370bYhGmSEbMDsUpK70/QPiOHlrahHTcFu2PweXlvohJ5KYb6vXh6j9Xruy
         Nsa2nusoOfASi4UD5HagJDW22d/dJiXp6WdS0pQFp1z8hk9ekwCHraNls6+ie+6Om9R0
         cAkHuPS2XJmV+T1L7+/nNI/Obt4nMEtvPlBeabA7hK3So30eVhESNGThg9aIrXO/cFBP
         kP6w==
X-Forwarded-Encrypted: i=1; AJvYcCXOQWNYYDCr0fdJ0nz1ffRLceI8ex8FEkTrjAJ4zEtE0H+bcjhuIzBIJPhtR62ZKamayPYak9U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7WyYkHYTrBHoQYndqQuaX+OqPQ+zRvGM+csYaFgn1SXB5h8I+
	2XTmuKyKa0o++PuONpfshYNegtu4zHDI4ukwPjA+ZdRNGCLJkw4Y9iMMHm8nwZNBujSBY9LYpK9
	jsVBznaVpUzRJ1+wDxU7N7OoXXrrU/f9iwg/ST96i5MQt9Qs84oNsv+Jw1AFT/a8FTiI0mJ2B
X-Gm-Gg: ATEYQzySA+ycrWQIuP//6rouRGQw5KskS2vcdOIV/khJ7g8QbOboB8OVxMalKAMlrg7
	TES97ZTX2hwKKevK9UEebhxVww6sILc4E2tnD15Nha3tgdLRqrtjPagyn1qcBi8G7SamiVQaL+a
	ZJr5loj7IuG5KxIN32vblOjD8enr6Q2YMHSPLScdzk0IcCNnvVqMFXW/oqldab0w6roxDkLhyOs
	SPT7oTF1jCJXOKngsN4Kn3Ej5W/LhXYtB2VacCy10+6QojvLae0DZ3+AB0dY2hzasX0BLZ2XqSd
	PDkiqYb0NgL5Wf9zmYHY+y4KA1Ul9gadl1mpc++sdk7Z+XOj4QYglAxZz4fyDNke9frYYCXYkmZ
	QchrckEWN1Tb5yIzs9vG0RXLvjTiU/MkCDh7LP0I4kXJqUqid/75M13Kejh/hq/ju5S9/RaButw
	==
X-Received: by 2002:a17:90b:4d10:b0:356:2fc5:30e4 with SMTP id 98e67ed59e1d1-358ae7c6cc3mr14333963a91.2.1772038898589;
        Wed, 25 Feb 2026 09:01:38 -0800 (PST)
X-Received: by 2002:a17:90b:4d10:b0:356:2fc5:30e4 with SMTP id 98e67ed59e1d1-358ae7c6cc3mr14333936a91.2.1772038897956;
        Wed, 25 Feb 2026 09:01:37 -0800 (PST)
Received: from [192.168.225.142] ([157.49.193.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3590158f6e0sm4426973a91.1.2026.02.25.09.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:01:37 -0800 (PST)
Message-ID: <5a9d3966-26ff-4d15-96a5-189618407742@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 22:31:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: fixes to station statistics
 request
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260129-ath12k-fw-stats-fixes-v1-0-55d66064f4d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=br1BxUai c=1 sm=1 tr=0 ts=699f2af3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=hSb1S3R1191yeZY/11SCyA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=6wuBYe4-bsxGNRZuf9QA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2MyBTYWx0ZWRfX3XxKt3gCETo2
 bshUWDPoHHdm1dFbpytvrgq3CQcbJt0Af9X2x9fDG58fdL/SBc7xeNozHatJcKCj+mHPk2Bb09K
 uebqJJn0g4jI3yiZwgdU+ZZdMEqHi13qS9ye87i1Ra5VjCklI1ST0H2tlNQKwVSALM0zAP4WISV
 M6vyygxJFHPp+yYWKkGKrQo8Tq//F3ZQ9k7kL8CsEqNjf9wJSGKML7aMONB0DsuMPdYukt76C46
 a9X2g7M7DVXZF1QIOHm043GAOA4UN6S9t01HaxbXTPm2h4ELnbPqTm+RTvkHTCgvyX913bjwR4h
 cS8pym2jSp3ZinNBzRAwFRCSljapZnXWr0SUy+3JBFffxtdw0mgtgJPcklvkm87D4avwQW6Wc7J
 tLaYdpqxH4foL3LcYIvh2vedLyCpMzE++xYmoxNKwdoaiMl+FJ1UmkqrDXBElaAXW7QvD+gMaUg
 F+fkyZS8axQ2+94ARWQ==
X-Proofpoint-ORIG-GUID: fEOVlfZtkPK_exabkC8U9i2WzPDwxJG_
X-Proofpoint-GUID: fEOVlfZtkPK_exabkC8U9i2WzPDwxJG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602250163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090140_072086_A72506E0 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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



On 1/29/2026 7:54 AM, Baochen Qiang wrote:
> ath12k hits timeout and memory leak when requesting firmware statistics,
> fix them.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Baochen Qiang (2):
>        wifi: ath12k: use correct pdev id when requesting firmware stats
>        wifi: ath12k: fix station lookup failure when disconnecting from AP
> 
>   drivers/net/wireless/ath/ath12k/mac.c |  6 +++---
>   drivers/net/wireless/ath/ath12k/wmi.c | 36 +++++++++++++----------------------
>   2 files changed, 16 insertions(+), 26 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

