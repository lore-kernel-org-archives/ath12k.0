Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4E0606A31A
	for <ath12k@archiver.kernel.org>; Thu, 29 Oct 2026 00:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d8IwohmP;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nS5l03fE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R8ZGb+5f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=; b=d8IwohmPD7ihWc
	VE0kJK8EVb+T+eEhKSy7/Eg3whlR/cnvnhjfS4Q/k5B4XPbhzCNGX4Wx4xDgoP4e+lXhpSjpgClMB
	wcqWiKfaBte8d6Q5kkMBdm9ORcTt7waZtoXgK0ieuM+CxIbMP57R+rgw2I9isG9aA1/HkdkADtQMx
	GskxmIL/TWiMqh6O6kH2Y9FgV6ZvTQL6seg7SnipKZubPy9gzM9o64e1UFqyzAypHEQnL8GCHqyak
	dEhKb51Ts6A+T6mHlIlvqN8khovMSBwQL4KDlVrycWfvsCC9KO0piGt/XQ1bo+z64OWIgKQ4rZBE2
	GJQrcEelwjsmEK1Mktvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xME09-000000085jG-3lqL;
	Thu, 29 Oct 2026 00:28:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xME07-000000085iX-0RT0
	for ath12k@lists.infradead.org;
	Thu, 29 Oct 2026 00:28:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SMARd9884219
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 00:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=; b=nS5l03fEVUvDe0RT
	cRhgGB4bxhYdd7GkTwMJ7APOQy6+oPJIUncnlhygtyk2VY+KPgalb/hnlMeBr0hs
	4i5IdqnU8daYm1b6lyJk/lv0UBaNj3pmgIxPFp7m9s7hwcepVnmOqj8TNmKvgVML
	RJs35MV1YQYdbAK/yaZGukQ1XcJq8Vkve4uHk4z4z9LDomtMoh/qSwaOBwkNpxWl
	LSBrTkJzsVoT+LrKH8zoApgwRfLOOlQKqcK7d5DtO6nuj6yGMq6PYSpfdxS342ZE
	TYDG+H4Jipn1F1JSTY7fwWtv2ow0Cc8m6h24lebVt1gnGqHtRnwYAOB5qaRhiAeL
	H8j2jQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnjkkc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 29 Oct 2026 00:28:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1a71dd190b0so4622516c88.1
        for <ath12k@lists.infradead.org>; Wed, 28 Oct 2026 17:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793233693; x=1793838493; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=;
        b=R8ZGb+5fLc7fLJcEa20X4RjVBAzpr7MNMrl6YcdmKnPFiWDrvS0EWeNpiBc3+ztZPU
         gWt0z9EmAdgVA9rNZbj8+mX7+MfxB8K+17sED5whSD3zmM7rnX79ASZtnrQopfdAo5v6
         Boiwf/UmDStMfgnGUYpVpQOSEzoTQ+nreL4NEZsu4gBMw/wiFMda9Sd493eKu5wIbg2l
         g/w2PRN9MCA6XfewrbxFBqRlF87aCPTx43rgpVf+oxnjtvOPJgkcPxb9AvReIx3LcvQc
         2vjmlsrYIn8EFGDS1ajDZKNHEYWQ22OPkAteeaP1t6H/VSDHX9S/MlyD+DJKtnyTLC9E
         Z51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793233693; x=1793838493;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=161wcd9EPFoe3fJhGneKDOtD4VA/F1JbIvr2VPER94s=;
        b=0uOLXhso7HkZ88zomUNPom5MK+RkRw9d+zeiSI/4msPZ54D0fSt5T7iXOayDlR87c4
         zeTckjWASCTk3M300vM9uEZe6KipRoAgANi/MrnO8J3pXmPKEwvJ3MQ+G4KWhuwTwHKV
         YX9HqqDrU2TaXDMssAhZnL912ZA/YXqNjwmh66Oc36PSqGbtVT7kog9lTR/jFuo5VZrl
         dpsgWclyCL6lFCRnTguxfBr5YEAh6x9JWI0fReMWXgXy6Q3EXx6n5M33zRgT0JUsIVMT
         RczZX/zAqj/XV701SHIQ2f/szpW7p6L3A1rP7Gw6hwdxtjIkN5DRSv56EMjVNTh3f16b
         1Vmg==
X-Forwarded-Encrypted: i=1; AKwUvBx19+sS8yixtAcUVJ+kBtZvZKXxhAK2S2OAj6hel2oZCYeMKXFTTb2ZA0kvUDshUELd11vTDtg=@lists.infradead.org
X-Gm-Message-State: AFq9FYK/8T/oYhGJllqPCoYpb6UG6+MAJtap3Ux+INDWBTDuT8IffjPu
	E+fCOQETQJFsA3bC5X6e0ijg2FOf+BQMCVivax6DnjfqEEH2hKUqbhJZ2OG6/iUSW2IPekDjDH6
	eG/+JwnFvanfxV/Wt8QLiDQ48yseMyWbVlCUhDSq1xybgtNP32aKTeF0gbDCrD9TJ
X-Gm-Gg: AYBFou0dcshTPq1dVSeI7vk0GH7cLkJ71E7197mwsgjKKouduK48Hg1yFKkKv5s5Zam
	KpSKqO6O48LgJCqKLUf+KaZlnJTr0xf2MCePh495PdPutZlUEDLsSRXzck9XPKhiitjMKl+2+NP
	3RFzNtInNd8dHItUnZ0ctBeo7G0rITF34S97sdfwzSpxWKxIa2kv2PKidQAM5NfoCSCznjBVKtF
	KjlGFmyig4aFJnA75FwpmE3/7B62qDtG9BRBDrxeAE+xWn3VV3ejG/8rFh7bLeo3wuIIh5xAYBa
	ZUC+syNs1zTwYCop3P/Vq8K+mvsin85YVxctRM8kwz24ncM/+QIelZ/FcZDxxPHSkV/SNC+bw/D
	H+lD+7h5/dTb6I/XMhJKZGD7XzrCZgh5bH8ySU+NF1Tzwa4oNtDlDNf1/zXhhy/ZlQ9c9zx2h/A
	/pTiytHtPkECcxv1JeL0WrGUcFZ6g76ow=
X-Received: by 2002:a05:7023:88c:b0:167:d73a:e994 with SMTP id a92af1059eb24-1a6cd779e67mr6125347c88.24.1793233692855;
        Wed, 28 Oct 2026 17:28:12 -0700 (PDT)
X-Received: by 2002:a05:7023:88c:b0:167:d73a:e994 with SMTP id a92af1059eb24-1a6cd779e67mr6125313c88.24.1793233692158;
        Wed, 28 Oct 2026 17:28:12 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76056a001sm13527135c88.22.2026.10.28.17.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 17:28:11 -0700 (PDT)
Message-ID: <35ec209a-a62c-4fd9-aaba-edeed86dedf5@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:28:10 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] wifi: ath11k/ath12k: validate capability TLV lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261028051254.147628-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028051254.147628-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: r329sipy2XqqM1jq5mPSOmurUsU21p1L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfX+NqTBFIkF2FL
 dk2anUm2wx4lJxYV6AwvpSi2gn3BNcTRoEOvh56eYEjPAwFTMmpfYYliC+YGRzJ26M4nWva4myJ
 QhRlOe1cOHOSL3fwMXxGOYEXoMJ3yyHNCfxd2PTVw54X7nGoAN7+ldzJEMvJxyfwhQCt1qIW6FV
 7iSgEMh3NTF/SKiUYldahxEW1RqPb/U2vNdS5qoo+hz45/O+kyiDrknStXXbO5GCl2Y4irGi8br
 2Jk8m7OSTGUnn9faczSqMrIqOmkW0S7Y3KdhNetZueTGyJoeXRgGigwctLZQHqGxjiEJMyeUGKg
 JE7OLMR3Tkg/LslM+KZhwph/AI4BcxlN/P5iFm2Lk3WTDAIIeDrR3RS08B+zeMWmDQ1X2TiVo4n
 ixKityRq+mF8IP+ANNI6TwOsEz2RR3k9ObK6BZs4VQb5ActYIXVzOpIjF55tS0ExAxkLRuCk+NE
 wdgHPaQHnisg5NQCflQ==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2931d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=zf6acwKC7uJQSQTK7isA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: r329sipy2XqqM1jq5mPSOmurUsU21p1L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAwMSBTYWx0ZWRfXxJKE7IsOmGwm
 /h7ra9rZr2cKeuMzLQ0C7IAbd47SmyIh4X3y3By5b/se7oc1Clvkcjl3uXrH/mU0srMv3A6cyEJ
 s8CIYgM/NwFBonAJocZLOWnBVcMsdhE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_172815_173693_688B05FA 
X-CRM114-Status: GOOD (  15.61  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/27/2026 10:12 PM, Jiale Yao wrote:
> Several ath11k and ath12k WMI parsers count firmware TLVs and later
> consume them as arrays of complete capability structures.  The generic
> iterator validates that a TLV fits in its enclosing message, but these
> tags have no minimum-length policies, so a short element can still cause
> an out-of-bounds structure read.
> 
> Add policies for the DMA buffer release, hardware mode, DMA ring, and
> extended MAC/PHY capability TLVs used by these paths.
> 
> Jiale Yao (5):
>   wifi: ath11k: validate DMA buffer release TLV lengths
>   wifi: ath11k: validate hardware mode capability TLVs
>   wifi: ath11k: validate DMA ring capability TLVs
>   wifi: ath12k: validate DMA buffer release fixed TLV length
>   wifi: ath12k: validate service-ready capability TLV lengths
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 8 ++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++++
>  2 files changed, 16 insertions(+)
> 

I was surprised by the asymmetry between patch 1 (which just added validation
to the array entry TLVs) and patch 4 (which just added validation to the fixed
params TLV). After a session with an LLM we came to the conclusion that both
are incomplete:

The DMA-buf-release event has two independent OOB sinks in each driver — a
fixed-header copy and a fixed-stride array walk. Both drivers are affected by
both. The series fixes only one sink per driver, and in a complementary
pattern that makes each driver look "done" at a glance but leaves each one
half-covered:

- ath11k: patch 1 guards the array elements (_ENTRY, _META_DATA) ✅ but the
fixed-header memcpy at wmi.c:4669 (16 bytes, unconditional, from firmware
payload) is still unguarded. Needs the [WMI_TAG_DMA_BUF_RELEASE] policy.
- ath12k: patch 4 guards the fixed header ✅ but the array stride reads
ev->buf_entry[i] / ev->meta_data[i] in dbring.c are still unguarded. Needs the
[WMI_TAG_DMA_BUF_RELEASE_ENTRY] and [..._SPECTRAL_META_DATA] policies.

And since you are playing in this area, my LLM thinks that
WMI_TAG_HAL_REG_CAPABILITIES_EXT has this issue in both drivers, and thinks
that WMI_TAG_RSSI_STATS may have this issue. I haven't verified that analysis.

/jeff

