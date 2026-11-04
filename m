Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C3606A31B
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 17:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zGrG1uRI;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LyNZM81U;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ewRTdtjd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9SkKB3G/797S/2lKmTrWnkFIt8Oe4NXChau9ezmzeSc=; b=zGrG1uRI0tbeoa
	5DNLsBXrIQGo8sf/4GXhytPkFk6Aa7Zo62ejj29k9qcEb30vivfVunjzbhlrWogGm1xFgYEPPnJzW
	8ne9ZLRL+PISa/bn6H8Z6vtA1xvDU0Cx08nqnzp9KAXlvFwzM+V1YOKN8KWp4YSiNQkvCexu/CaI7
	EqaZfi4QooQDkkNSUHf2BgFyEorLDfdfHfsWQxmRjzDvSKtKsJt1xISuqrmOBmhBi9q9GsnxOUyIs
	grLHDBJxt0pDFAzpotgcwoCkEmk2roaA6lPwfBJIiwGVuRJrTaliazhD1opTegoJWsy4U0K6WYVuR
	qx4pahr26vb6D97T9TtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeTS-000000069VT-15ui;
	Wed, 04 Nov 2026 17:08:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOeTQ-000000069Up-1JRD
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 17:08:33 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjDdD2244252
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 17:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SkKB3G/797S/2lKmTrWnkFIt8Oe4NXChau9ezmzeSc=; b=LyNZM81UWIBxpaPb
	G9j6fH2N75+uVIac/+YZ0wRq/6asspaNmRDBrT1lGJPTiOH5h3OUHGR+MywjFY+r
	wMU0GseRhXfufXZd7T4glFoEi0jqWqw3rWIBh9U8e951gM2UHIB5U0f8Zbax+Wmc
	tmJ7qzo8WbYKftQsvo5nzjN6slYk4HE6HyPiNvxrJ+nQhus1fW8g0Y4vyzdaEID1
	jh1ZFeA0dQJWW87WxXb+eRLhg36wMff7BaBejLUqb+zKcPBt+OrEAeCr+kQnAhTq
	Wjn7ZosG++uGmiiUrxclcqDaIj0B+k8JNAWnjx8ICu1zOyZdfbksxjPxpMSiPWI7
	YSSIVA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pyhewt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 17:08:30 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-154e9d2d94fso2324961c88.0
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 09:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793812110; x=1794416910; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9SkKB3G/797S/2lKmTrWnkFIt8Oe4NXChau9ezmzeSc=;
        b=ewRTdtjd7Ymg/WH0x8aoewpYAw/+uzj3ODIRmLyTQcIbrg8g8+eueR6isNnbejWgxv
         ix/z+5nao10ZGggF2auefP1+m2NFFBRYSBi5zBxqCFPu7ChfpMWc9Un5cFYWcEwIAxCg
         ufcJDjH8h0xIsatLOZeIVTf54C/rIr0jLXf2FJ69lNL6sJdq97k8Xj3fXpgV75b5goX7
         GKL/03by1uoC7iNbfFZRyIw6F5haH4kOyx1PAwNBMn2i7qGwOGP9w6zwJ1OO5INucIeU
         /uRVUuq2+elqNodSA6nnxtZPC8HvFVlrfWkVnlwobesNO3bOPgPmZXpyti9h13BmG3mI
         Pa9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793812110; x=1794416910;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9SkKB3G/797S/2lKmTrWnkFIt8Oe4NXChau9ezmzeSc=;
        b=eFFudRtAalNxj7DJ/Ak2CS2ZXdG1voYo1EXrTpVv8AeyuwCJvmOTExCGKtvmxhvyRa
         rN8kDiwkdvUkkyQzG6q7jt4rllT1Dc2rofZFoSQBkCag/Di3Wljun71oqor9Dgv1r0cK
         rIYEuP2fD0xLLbvxHKOkfQA6VXTGc43VKdj8mY8wn04N1j+IvmLnEdK5s/i+DMv4PJta
         7mz8NyIS4Bx556p59xI5HrocTmjsa1U4rfmAx9LhFfVMz/2zOIdSe/rRsmIHgN9wC7Lz
         aV1gyuss+VyhW7VrHJ2YLv5YwlTt1H4ShhCyuDmznOpaETA+wTdkofXuKFE8pUf/wur2
         HSTA==
X-Forwarded-Encrypted: i=1; AKwUvBwTcdXvDR39ZB9mpcNV2ttFLMWmfTbAbQagY1aiWCWA2P2a3Aio+mpIr3uwICqMcWNz1lATa5Y=@lists.infradead.org
X-Gm-Message-State: APuU4Z/TLwTAKdolidFYN1T+mf5uSIxTe/soJtWLIJUq9mxcVTL/J3hm
	r1uBN4CWVK1I7dzUt4PmDN5xy7d3Fhl9oQUGbrBONqYREOwos8ka0NecB2hbQT8laLxdNSrNCq/
	zp9MMzX64ZM1svf6kvk4JXe3SFOSC9MVcqL2j1sFMIW7xIOPpnGci9PV/Fyiu7D54
X-Gm-Gg: AYBFou0TY9SCG+GXAY+Jr6fp/AW6Tc4PfSoyoTtu5bRcYWa9RSaPb+eCO3MBOuRv5lo
	u7jeMXFlE7DB1Ky+sUWWcfl1IJDiCRyPrlP6joYNkCSz5YpGM+PpwWahscJ3cphJgSDOlsOjUM9
	a5QnsjEWIJDzdxzU8VtReedwmh4NyV5HyexuAsO0mqays5t8VuUAobAuiduvy+kqoHgdRb65uHI
	OmSh4DnRnkdZ/I8sm0wyC+LzCI3eVYS5ukewlaBgJT5YDqqwXN9wDDRS4Y86nURwAeYGpZvvOYR
	b1ENA26Xhhk05OCH6VMrq5eExd1jBQvep2wIkxVhz9WaauvJBIgVQRs2nDEPWuc2OYd67uEvl2X
	pXpxfxcqwNpGF/pRlVluxzGOSedi5FSM46JEAGNw19ChXuMjgwL4hRtjnVDRaZqz/GUIY8G/QCb
	KgFRgEB78qKNC22+jd+HnT1UBQ2YThVtxh
X-Received: by 2002:a05:7022:f903:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1ac55f2d154mr25383603c88.4.1793812109439;
        Wed, 04 Nov 2026 09:08:29 -0800 (PST)
X-Received: by 2002:a05:7022:f903:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1ac55f2d154mr25383572c88.4.1793812108532;
        Wed, 04 Nov 2026 09:08:28 -0800 (PST)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c127sm9002240c88.6.2026.11.04.09.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 09:08:28 -0800 (PST)
Message-ID: <a07bcdc9-0526-4a6e-9b6e-92773a7fb4dd@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:08:27 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
To: Birk Skyum <birk.skyum@pm.me>, ath12k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>
References: <179381165259.84724.9229191626653570162@pm.me>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179381165259.84724.9229191626653570162@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aeb668e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pEfsSs99s6TFoh5TOIEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfX8VuoWcfR+k4y
 gZYTgfTuBnf2SyfZ1sgDzmbkh7HussMFIqaVSM5kegSShEhTaUuEhqb87nNeICzEDqIUm/OYge2
 kNGz9uM5yL2m4gMKQOcAa/KB55N9TvBYR1eItMfXhYlzNXPkGdFLdr6iiqfeUSncheqQ4YjemnM
 WLmo368lkAZUPz8/K+b8AX1AFcRpbynRv3vqkDeL7ZlJ2wQe+NMYg4bmgNkwax+EdHbZXumG5Jw
 LpDyIjr9DY5jq7YyH+8hGGCl9F13rtYbRsi/isesLeRcMwv202UIEckR6KTgV1HxB/wusXhGqTC
 1cnXUYYOSqn4n0uxEhQ2OharyAeIc7xGDLtiJOuNcY9Fq8v+Q5+OzmD35aj0nezY68KvB68Bjek
 ID9cKm09+qLfisYKsDoEd/wfBvU9jcxM/vf1WCcKVHs9G+JaGD8WfYa5J/6IbhssEULcbjjLli8
 EWE6QQ3flcl/OxLckYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA2OCBTYWx0ZWRfX8inkCKCOTuS5
 Nm3KZP76giOg8dxsfxsP9zsl1IrQC9fVz+5vHhV3F66/xWMYCSdeHp2KQ8tJdIMk2Fnd8ErOgQR
 bEHMesMVku+IN1bZLms4eiFoDPi+oqY=
X-Proofpoint-ORIG-GUID: L_t2UtDk9pEt1i2e1-1Ej6T2dg5zWOfw
X-Proofpoint-GUID: L_t2UtDk9pEt1i2e1-1Ej6T2dg5zWOfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_090832_472258_AFEFA4EE 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/4/2026 9:00 AM, Birk Skyum wrote:
> Hi Jeff,
> 
> The ASUS Zenbook A16 (Snapdragon X2) comes up without Wi-Fi because its
> QCC2072 card, 105b:e14f, has no board-2.bin entry. Qualcomm's Windows
> drivers list eleven more QCC2072 and WCN7850 cards that linux-firmware
> has no entry for. For each of them, the driver's INF sets the same
> BDFileName as for cards linux-firmware already lists, and those cards
> share one record in board-2.bin. Could these cards get entries
> pointing at those records?

I've forwarded this request to the team that packages the board-2.bin

