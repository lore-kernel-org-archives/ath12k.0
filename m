Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE8AFF6E9A
	for <ath12k@archiver.kernel.org>; Wed, 18 Mar 2026 00:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsEuIeYeunUYsxBkTNU3Sm5E54z1MAxMRTKCi/1j9sI=; b=QRprQFeiArMpNs1c2eOn+zmAjX
	56suUruNRXJ47lRJWmHG1F1WXnIILJZuyg1hdeuAhjBB3KfYlQH5p6FUOuGqoywBhqzElKGEzFb+7
	JGY2g2KqTyvgJT1wpSF1ix5i7FWW2tdAu/PXPfgIDvkQOrD5nzbYmjaMaWmTiBsJ4mOuEIgpQQ1Xq
	XoOxujIWRW9mdhimBOIsGB8wCWRLKtz0XKADMzlrUXWuAkBAfzJSSaRuNlIXFE7F1KswKzTwagJLb
	tWEwFN3N88+SMS3f8BgUJAsu2JRYXpIz10FNXAABLleQekWvDJHWAKMSPAKNPaVz8ZDaUPLcPlBfG
	68EhnMLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ebl-00000007UYW-1kfB;
	Wed, 18 Mar 2026 00:17:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ebj-00000007UYN-2Hq9
	for ath12k@bombadil.infradead.org;
	Wed, 18 Mar 2026 00:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=OsEuIeYeunUYsxBkTNU3Sm5E54z1MAxMRTKCi/1j9sI=; b=J4dNktWPQJPi/Ge0gNNEb3uEhi
	1ImJ0q+paYwY7I3+8dJ0Pz/WOoAPneHtJD04IJPw/SlqmTknb8IMXmo4s7SOQhm6BIUNgFb2ub9aT
	EFpJfRZlWU4zK++HdM2otSwLPauDTLHlIlHSXkndrPRwwgH+gXBvHADD4kmXAQjs9L4dTmUrhGehE
	WJrsAPquhpWQiLcieNJWWUrd21vDxmTwrJb0IELo/R5SutijgLP0csWVZK9AJ/YZbfX9C21XJ1uMG
	ImZmUMv0oRhw/PLK2ZfqTvY4kChdjr0F+CdKfcqIuF+DLgUPdFSVH94XpRsY6SDIIhnzzDgxjF2zk
	CcCDLaNg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ebf-0000000ACFs-1caM
	for ath12k@lists.infradead.org;
	Wed, 18 Mar 2026 00:17:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HIJGno1632379
	for <ath12k@lists.infradead.org>; Wed, 18 Mar 2026 00:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OsEuIeYeunUYsxBkTNU3Sm5E54z1MAxMRTKCi/1j9sI=; b=KmGyGi1o9NzO7og5
	oqnSYYow0dmSh652yLmJVOP4f10dL1IcOPxreXJvDG6/7ycLDJ9jUf5RBVNHxNmn
	cCkI4fSv2IkHR9Y+gqgsXhrIVcDYaK/O3yAB9lTgos2H7pY1qQbWvZpBa2JdhzYf
	1wMOzySSgkxRP62E0LTRqMIyDSLkmXq84nRHgxKZ+ZecOsUi199Ji0cDVeabcDzZ
	FVNM1F4t6nK3X9cMD9gYwkwBCGoMAOeR1387TXgnNYcjzz7i0e5IqiIv+3q1lUG5
	Mp81eGNb5MmPHjVVXSPTSW+AI70O6/Gg3SKLCzZGlqdsF4KGfKK9kOdI/HeF9D0S
	hyE8GA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyapuhn50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 18 Mar 2026 00:17:46 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c0cb775215so12510558eec.0
        for <ath12k@lists.infradead.org>; Tue, 17 Mar 2026 17:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773793066; x=1774397866; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsEuIeYeunUYsxBkTNU3Sm5E54z1MAxMRTKCi/1j9sI=;
        b=AlRTTWde/ID1yQ6R66YIxAE1mv72q7Opt11NgSUwJQezvN4z9d2PAp2xhtY9X/WgR0
         UvNimwhxchbhRhW7PLoFVsMfiNVddOJBIplCU66m6Rj1C/RtUSqxcrim3C5jBVcRwVcj
         Vxet1dGmL+FyvIK6e4ghkGavn+ddSdmjMiyic+9FKbiIl+ESuAsGzVJLB890D4NdCRgU
         hOjmPeUGmYblwU1AjPjDYUaLY27TMaz2hRFuWNrjKu1p6nbERlY32OZ2sA9ZdyFqGsJ8
         VrAFU+hCjhQ4yI5Gefh72ZJMykb5gNE4o4aytjJ10vLyhcPHUfn1zqtKzAaNlj5gYNZ4
         xK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773793066; x=1774397866;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OsEuIeYeunUYsxBkTNU3Sm5E54z1MAxMRTKCi/1j9sI=;
        b=e4ZYhwRVFMGBaDPyiYZ3nz0JUt269lotXcUN3yjOs1KR7qGVfUHEPKq/Bz11lK26LV
         O5pBo2YzYZ4569vZ5iMAyWpw+emK2CC86kX96evBJsHOxVzDMM9hWIhEaV1j2X5hk/+m
         tod7yTDmGNcLF+uvCiJY8Ks60/4TR4OsVocr2bzvuwALNAQkHWC5iw0WHLBZZhUJHSSz
         8pIeer/y46ql7FlfBZy3UQ34TVLpd4E4E+5Ja2ZQHz3ky/vg5kVpfJTDN2XdAEvsAvvx
         /DBfgAMJwhMp7qYAbwvr3YLDoz2yIGdJzasDWiJfKek53OY2DMJ1GNBxw7OfXSOFgXZQ
         rgag==
X-Forwarded-Encrypted: i=1; AJvYcCVjlGk56mZuNccuN7B3xPs4wcFm6dT/abU0rnmNL5nYbumvTg5f4qulhu/IwGLjaDMe7TR6AoI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxE9m0ld3NMDMx4/EDYWsopk6uicvhic/cplS3UX8BB3NCrA3Ra
	R6t5B3hg51jFsaF3GF0OXAZrQwPq9H1nFkbocaYnd6GKzGU+7wyIGpMNoiENecnglfncyJFP72y
	HnwOdehV8s6g1SNdL/jEO9hsjdJMub1KR4r5U7Twie7awdv+M1P0H7jswffjEz19sg7QgQHUp
X-Gm-Gg: ATEYQzyxW5hNnoT4kGXWeBoQn7puwZDnwGNHqsX9Nkru7ORqikkR9zyx1Xj1H0IpVsT
	DdPH7BtNoBcmm5/gXxRTzrBi8N+NQnydPW4KtaUpjjviVySQsbLsWbJsXSVyol702/8Ed4zd4f6
	05a+2B0rPaZD/BZq5gVjKiZvzp5GAPDz+Yb2tRxW5Doah1M6o1ZaSXmyLT9D6L7lloEiQuYxDG9
	57+ZBDXtgPDbAOmM07VrIszptCUnwedckyT+27ij2z61x7xUJo5Iftkj/KnOKzURenoqgZEwkIl
	MIMnNvKwELtNkp+wLxvPaBfh7v3kEUNkxMtbTS5YQqjzio/LfjPOY7T0Bcr2vMkOQb/U/N5+uGl
	lVrn/dMV7vTALKz4Rfk6HYv5UTMYbK+yuU+GZUaaWwYXJHd0JzoEJZZVXZYgqgiQKtJBQMaleDK
	3ZcaSpY5ZLwSBCtw==
X-Received: by 2002:a05:7301:4b03:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c0e4f90b9dmr829580eec.13.1773793065592;
        Tue, 17 Mar 2026 17:17:45 -0700 (PDT)
X-Received: by 2002:a05:7301:4b03:b0:2b7:32a6:82d1 with SMTP id 5a478bee46e88-2c0e4f90b9dmr829557eec.13.1773793064958;
        Tue, 17 Mar 2026 17:17:44 -0700 (PDT)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e560fb5fsm1907343eec.31.2026.03.17.17.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 17:17:44 -0700 (PDT)
Message-ID: <bd262372-9930-4abe-8917-fd037623ed01@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:17:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix HE/EHT capability handling on big
 endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260317-fix-he-eht-capabilities-on-big-endian-v1-1-e7b937b32768@westermo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260317-fix-he-eht-capabilities-on-big-endian-v1-1-e7b937b32768@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bKIb4f+Z c=1 sm=1 tr=0 ts=69b9ef2a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=N9GNhs4bAAAA:8 a=YmICAkyFvM6EgTkIZ6oA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAwMSBTYWx0ZWRfX9fSf7sGGeTKw
 tiuED9P5afbUp5BXjKqkysSC9mDGt/6brxPXvMET8Ej/p2QUeeEGGxfjnWKEdWoEi+DTSmoRy2i
 su3xkqQkVXH2ZJIyEER1Fl/cER83smOFueQAfTgUFnVIQehQ2oAXMooAcukIBYRJrz2L2A14Tpm
 22bsSOd+6/ATp+KNK2WAFEgZ3nhGJaHKs4Reia0bpuedV4O20Dy/xTw3qaWYXChPWe4Ms2gPkKL
 EKWSD9Cym3JWVNoPGJrENxjuT26pgVc3IGge481kK8+aBGZPYUqnVi1+AWE3NfoeifFPMpUKdRs
 7uyJVuY53ZbyUwaycg7C6nviaW04WiFWQI2ks/lRsAjMI5jXqYyxNo44dmky6W2P3f1y6ZNTOA6
 6YXZblAD5QHEyiry6KZO1x1noodX6rtFT0nXFHntaakoEFZbq+8uGI2EYjDvjO4fMYQ5bPcSgWz
 JbrUPI8vrdHFvSxxI5w==
X-Proofpoint-GUID: 8KeKUH_mPL3HA5KlenyukIx5iFqXxlVB
X-Proofpoint-ORIG-GUID: 8KeKUH_mPL3HA5KlenyukIx5iFqXxlVB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_001751_898338_A54ED77F 
X-CRM114-Status: GOOD (  12.70  )
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

On 3/17/2026 3:59 AM, Alexander Wilhelm wrote:
> Currently the driver uses u32 data types for the HE/EHT capabilities in
> CPU‑native order. However, the ieee80211.h header defines these fields as
> u8 arrays. This causes the ieee80211 registration failure on big‑endian
> platforms, as shown in the following log:
> 
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: qmi dma allocation failed (29360128 B type 1), will try later with small size
>     ath12k_pci 0001:01:00.0: memory type 10 not supported
>     ath12k_pci 0001:01:00.0: chip_id 0x0 chip_family 0xb board_id 0x1005 soc_id 0x401a2200
>     ath12k_pci 0001:01:00.0: fw_version 0x111300d6 fw_build_timestamp 2024-08-06 08:43 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
>     ath12k_pci 0001:01:00.0: leaving PCI ASPM disabled to avoid MHI M2 problems
>     ath12k_pci 0001:01:00.0: Invalid module id 2
>     ath12k_pci 0001:01:00.0: failed to parse tlv -22
>     ath12k_pci 0001:01:00.0: ieee80211 registration failed: -22
>     ath12k_pci 0001:01:00.0: failed register the radio with mac80211: -22
>     ath12k_pci 0001:01:00.0: failed to create pdev core: -22
>     ath12k_pci 0001:01:00.0: qmi failed set mode request, mode: 4, err = -110
>     ath12k_pci 0001:01:00.0: qmi failed to send wlan mode off
> 
> Use the __le32 data type for the HE/EHT capabilities instead and avoid
> swapping, so that both platform endiannesses are supported.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

With this series applied I see with make W=1 C=1:
drivers/net/wireless/ath/ath12k/debugfs.c:413:65: warning: incorrect type in argument 1 (different base types)
drivers/net/wireless/ath/ath12k/debugfs.c:413:65:    expected unsigned int [usertype] v
drivers/net/wireless/ath/ath12k/debugfs.c:413:65:    got restricted __le32

From existing code:
f5c90ff80b4c0 (Sowmiya Sree Elavalagan 2025-01-30 11:41:04 +0530  413)  extra_mcs_supported = u32_get_bits(cap_band->he_cap_info[1],


