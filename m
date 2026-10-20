Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A606A31E
	for <ath12k@archiver.kernel.org>; Tue, 20 Oct 2026 13:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bhO++VK5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxIRm7mb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X0W66Q/0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=; b=bhO++VK5/M1BAWOROdoKNF2f0D
	PcG3jZfaC7/tQcyGXe0cpUKDeVlaEpgs1wm+JXZSUHoiCENGmKeoMxMueXo7xKfzJiaYFO/ZWwWgq
	Umh3asP2w3/YIOz8TvXspTkJWYxH/0E3jcdRHo3A/p+DMexuW7fu4hHRRFyD51wV69iLGVF5MOd5l
	2pcZtCk6QmoWX0+C8yHpmQsayaSgwl0bJQlxY0nKWxXLAEGoDiEuxzOCoOD/HtqHKc+ELyBiV5WRq
	baFlQ6I1kih4UJkKLMIjGRblVFz71R5UBTmWEE5RhDmTuZaVvl5mO0Up5zHKEGEjPS+3lQf2MtDfd
	/Iu0YEaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAHy-00000009q88-16pF;
	Tue, 20 Oct 2026 13:54:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAHv-00000009q6p-1XTw
	for ath12k@lists.infradead.org;
	Tue, 20 Oct 2026 13:54:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDL5K31754710
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 13:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=; b=PxIRm7mbp3RunCyZ
	yBQ1a8W6CcivEoLinHJu4jxi4YCf4nX1u8FfjVDxCla5njVtR2UGPJEWFjyP0G7s
	wVdktf/kpjXXR7O/FvMozK+QXcBAnFRvv5H3urG+pn81R6zp5Kl/qEt2cSOz7Tac
	5qHZ2GlLxsUFdwZMSO1oAiU98qlx+adlRUHN1qeiadKVRKb7TzcsrkVwc2UBt2ux
	Q8jncPMnfIU+RRnBXJ+igfWHeoR84h1h5JWIaQuNUzL+uBBgri9qXhrJAVT00Ixa
	qCXTji0qUnjizfBlCCrqEqQXSs3FpWVgQRJOAjqav4mNKhdwi1uwe7gOPIiqFFAk
	aA0Uhg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2rr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 13:53:48 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so3164110eec.1
        for <ath12k@lists.infradead.org>; Tue, 20 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504427; x=1793109227; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=X0W66Q/0GesOeUEkEq2zOQ8XtPw052DKS2H3IW3LLCHweEJJmcr0Ju4GSN4PKK8egB
         qxKkaQOf6NgYiEVN1TJaemHzAY4rZ3OzpiC76eJhanGhoUUrC0fNjcdNE+/UUkJNnybG
         +Ss6/XfTpdmoTRQkjYCXjElq+jpvOYkpU7+X4Zn+sMdlOuaHI9zsXiGryWVdDFB/kvTW
         lMk7oEIVZ60n6HIu2D14IcbRWRs0ipATJP5IKhkjSdwA6DPv37qDBD+KJ6WUEkEopE3j
         x6z36dLD2jMrpSWio/QC2fAWGWBwRClNjQV/1BU1SxuO3KiMuRLlD8Miyg4DoRTlkk5p
         313w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504427; x=1793109227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=y0bm60Xsf76Xw+aJ0sn/vRbWjHWjPleWAV8tL8Ps1qdwcNEOGrRcT0OGYh4h7b7Au4
         TSyLelBVDatCJgu1nZ4Ly59pp4vD4zLIrCabFLZ9UEV34L4FWQZ+yeZqeTbPClM7Xkvj
         Y5N+qThJgy6Pb6Ixgiy/jzWDPFZd59s83cbNpMYhMl2XiVe1m+DKryOvFCz/sqF4YY7x
         wzco4n12XpRC3WHStrIRVHvPgZZc/ID/HBWNg/p2ErvBgK1yvM1rKUBOnlD3bi6usqqP
         Ep5FsqGICGdyYr77yJRx++aAYCeRTRmjpKBUaWt+Pd1N1zkdBkjTsWDp61DtruuXUFQV
         KMIg==
X-Forwarded-Encrypted: i=1; AKwUvBxreRMeymGuzNzaZqL7HZ0vk1T6Izxr6z2uGHFzBev7O2wEt5gScqkFN/qDIX2qe6DgjnGhmDI=@lists.infradead.org
X-Gm-Message-State: AFq9FYKyjHAm641wsn0kEGaNuvaZOcXTyvJuWO3xl9yETD0/INVqfOng
	XhullblQXYbGTh0qi/n99cYVlgWo6X8v8zIiXSdThgYuclZXs6U7aQEU5BjzqoweIZ0FWvx3yMA
	shDdSuJfCnO3DjARRoY7UV6oSS+i7NYewHpzx3Rp/MU+edZHVxsHDDuJcF3DET8l8
X-Gm-Gg: AYBFou0kWcm650ooArXkKIr54r8qdYxAzcSqMWrtRW7xZAfuUeJ7iVQ2PYxVxRDmqdA
	iz/GS4a9BXv1ilAFidxGzDyHkeRg5KABbmUDu0Z+IubLfURfUjVhapli3WFzDxq81knhrrl8pIm
	KbNfc6ZEAnZlk4ZInbGnwJ19nK5wP9LECfZtF8ChayWjN+eBvRFgEDpbOqQ0cOdmTXWF/e9uW7k
	MCwhem9f8p3NZdittssQ1Z6S4qw3qKvqHFp1QYRvodnL39G1XVblFpE7/bSM/YJnPycF1/4eHmN
	BKFyibJwW066GxFacFNtXiIW+cghA5h+u1+p1BVHMPmhVzL1BqsSv2lRJj3qcPhvfV9HPriKc6l
	3ROo/pHvuB0bbY1EFs9f1cV4SQKXMDnRa6CGqDbqH2cOPWvuXH0yQ1hbBrg==
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278884c88.9.1792504427028;
        Tue, 20 Oct 2026 06:53:47 -0700 (PDT)
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278842c88.9.1792504426205;
        Tue, 20 Oct 2026 06:53:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm49618023c88.13.2026.10.20.06.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:53:45 -0700 (PDT)
Message-ID: <520e2454-a0bb-45f7-b604-62492eb15a1d@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 06:53:44 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: jiale yao <19888972804@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
 <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: hk_qwLnWAyhiz78gzrO2b9e7BvOsTeKp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX5WZUfnptK08A
 O2VoOizU7Z7W8uP8YwAPLdG6jdS4EFNJ1dJQWTKNTkQUZCSxFR8HzvYFZ1W/gOVztCmJlDpYhfe
 hSi90qAQ2MmSx4vLn+qYeOwvaipomE4=
X-Proofpoint-ORIG-GUID: hk_qwLnWAyhiz78gzrO2b9e7BvOsTeKp
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad7726c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=A1X0JdhQAAAA:8 a=FdzspUwgXfhqtPi2OHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX1b/sS4x2RIbw
 vvh2zLByHcTNezc4qL2U31cfKfxmmNn9Fv++BvqXDEhWiCylaJxlRNGqQ/j2BIKELOMEE8OJSnn
 vtp6Bq9KEHx00MDXK8qQNbQKgQn6AaMqUXulYoeDbZVU7nOhquenktdt2mV4GfPBZbNnEm9Pwth
 XXBQtGEWhIvojaVptRAcE6eMDzyfBCaZKod8GKVx+Op7rcwInogU39EJ/7O72L3vKPz819KZ0ck
 OSavrI3J3BzuXO2S3VROwv+S2VvYGb0IG+uuV4nOwrQGrorTJwIgWJ5KpJrDF7fKc9PDO2Atg00
 d9MFbt0GZBGPdgHFkwDXJovprmyGpLYRIuixULiwUktjSCRp8cqvdnhCY/98DBytKC/Bdu9MlB7
 PmPYnM/BYSOjQ1vQig8W+kX53ZYBo2IO+coy1DsYO13l4ht903PBBW0vhlgdm2tfscn1zeLGHH5
 wH8AdNpYKp0fGOrHkng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065359_530798_02674E8A 
X-CRM114-Status: GOOD (  13.58  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/2026 7:19 PM, jiale yao wrote:
> This patch series is superseded — please ignore it due to the incorrect sender name.
> New one is https://lore.kernel.org/lkml/20261019100506.1915181-1-yaojiale02@163.com

Please do not top post and don't send HTML e-mail since it is rejected by the
mailing lists. Please make sure you understand Linux Kernel e-mail etiquette.

You are close to going on my ignore list...

/jeff
> At 2026-10-19 18:00:25, "Jiale Yao" <yaojiale02@163.com> wrote:
>> From: Jiale Yao <jiale.yao@example.com>
>>
>> ath11k and ath12k consume two firmware-provided arrays without fully
>> validating their lengths. The service-ready-ext parser accepts fewer
>> extended regulatory capability entries than the separately reported PHY
>> count, while the ready-event parser trusts the reported extra MAC address
>> count without checking the fixed-structure array length.
>>
>> Malformed firmware data can therefore make both drivers read beyond the
>> corresponding TLV arrays. Add matching validation to each driver before
>> the arrays are indexed.
>>
>> The four patches are independent and each addresses one parsing path in
>> one driver.
>>
>> Jiale Yao (4):
>>  wifi: ath11k: validate extended regulatory capability count
>>  wifi: ath12k: validate extended regulatory capability count
>>  wifi: ath11k: validate ready event MAC address array length
>>  wifi: ath12k: validate ready event MAC address array length
>>
>> drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>> drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>> 2 files changed, 20 insertions(+)
>>
>> -- 
>> 2.34.1


