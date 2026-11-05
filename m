Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9047606A31B
	for <ath12k@archiver.kernel.org>; Thu,  5 Nov 2026 03:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DIjg4T1/;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hQAer9Io;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jHgUewIk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FekbeLCV6mfdHeAQ+IxkgbPVvUyfpjHk/hHoJdv15Uk=; b=DIjg4T1/MSJ96o
	kimtTnvVT1JqTXSAObwv4/FcdSo6mH2wfdLTpjah9aeskILbpMc04BWOiPpJ+OSGWgyBFQcePyVWV
	6WbU6u7oiFm7JytTD2Fyz2LoF5UvEjXHXz68R+Ez0l3OP5OVMu0z/jIViGKW1GejBniOeRsV8P81/
	itkjINOqdwfj9gBe1O0921xuOJAP8uzVxRcv1pblVuFCs3UZQ1ucgEAnVDDQdxz1/XwaHTR9r/e2q
	Q9bx7f90pzp0K3ihYRjVWmvjZDgfD0OOwR2pLT3+zpO9vt9/QeJJbmaUZ+19pJDihEAelMX0HXSNd
	p0x+U2OBjV1xqqW5H6Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo3V-00000007fWw-3tIC;
	Thu, 05 Nov 2026 03:22:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOo3R-00000007fWX-3x71
	for ath12k@lists.infradead.org;
	Thu, 05 Nov 2026 03:22:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50oSit3402983
	for <ath12k@lists.infradead.org>; Thu, 5 Nov 2026 03:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FekbeLCV6mfdHeAQ+IxkgbPVvUyfpjHk/hHoJdv15Uk=; b=hQAer9IoFEy4soQI
	LujXo0Q+QieLCklnQuK/m/sarsTAp1ZFrX8/1kW4VHfkhBWT+dcWeOUzcq+KdLMa
	7wqqlUt4m+ldrh0Qkz+xBrqsW2JlWWO97Tr3RryEXJAQqnhczE3XaWr4fELO4CzE
	ByeGh337FqoLabbo3OkDcCU6guYPGrVULj3nM1ygFAshXaQ8EnA/r6ilyKDuKfGo
	sy7l+YV2bLJ60dO3wNIqPdwzNcUnjvgW5v0eZrNM9Jt54LCbJ8cRoAi2VLKKJ8Wt
	9SBwoIrjNy9odwxwC88NNNjPpZNEJb4JiW3bcAoK9gAGlP8/Y0ffu7vrqQVSqt1m
	8YfF8Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdtwjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 05 Nov 2026 03:22:21 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a01ea9e318so2185874b3a.2
        for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 19:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793848940; x=1794453740; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FekbeLCV6mfdHeAQ+IxkgbPVvUyfpjHk/hHoJdv15Uk=;
        b=jHgUewIkcKcGJt4JWjYjUqhnnR9zTjr2J6bwSTMFweqTaxHmJAIuBYvdEELKh0w8Rr
         yTGJpauaEDMIDKDqlgPMWPDFgWsNDrECTXu3rkdnGLPh5eMGB+LSfg3A2fGB1F5bd0ws
         DLAjqNKo/VvliUzxeVQ+CBKMJfw+QqSTngvfBN7sxaYMbUK94nZv2RWmQQlbuSLV9Qk3
         CaTI4l2ZLAQ6+4MdGbBpimTkWzcF6UjnNbFFATeEaK9ZY6rLH9uMMT14K/hNLmaIgGn1
         qZ+CC6SOWZGu5T8zzDnNV18VCORwBInQgtOGvRfqd+uiTiujxNGF7dpvmzC+T1bVOyB/
         oYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848940; x=1794453740;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FekbeLCV6mfdHeAQ+IxkgbPVvUyfpjHk/hHoJdv15Uk=;
        b=l8A7u/52jRuaVnfO6zQ6jEPY9UkA5pSN/4m1xhlRqRKm8vkVs0kYkvEjGlRZr4qza3
         v1qe18i9XNDt0st959KbE+mzJhc+D0LQ3LonVPL2XVf3SQ0vqRFv+hUk8gzg0GVLdDoo
         5sSwGoyJaiXrx1dEME3x/6cMXb/r8vcFx8QY0DhD8M9w1hVhFstQNCpfZgOmClyYiHXX
         uh0jXrVZdghwSVz5zT2KfzPQsJfMCzZLTp7Ms84KlrDNHzDijDDOID5cIWHw0gvg7NnE
         fmdHC6WjPRstCrhn6whc/o+xp8c2z9PfTB1A6RNh2PNgIXpOLCqQNY6e5OsfwJmHudyZ
         9HWA==
X-Forwarded-Encrypted: i=1; AKwUvBxoHNaKdkR4FhI75G9abXZvXg2TmhNE/rX98AwOtZpjW498iOjZ2HIQktM2S2p15Pq+q09aXRg=@lists.infradead.org
X-Gm-Message-State: APuU4Z9DM7gmmlLaVy7hCxcxEEd3qRpkmGGVjr/nOnJDaVgFgQazxAe9
	wIxtsG4nQfPdNh0P5WXZ33qHf/r2P8yNA4Wo/LhgWqYcHFvz1xRW74PpaRFoEjcgYuzpr04kSlK
	mjD6uGW3uTxe6Rc22XvLaBnQo/TfAhQfDaFecVtYae6fYiAQialsbtXr1UJajcEshI8YYgvOrrW
	A=
X-Gm-Gg: AYBFou0Kc9UcLc3hEmwfUD7E6Lm5Sq2OjmVnGImugAB89EmIeN8WtP93i1p3YzfGDcW
	oUdaKxFnwcAkdyzWOCuynw/GJBgP1MBSErf9XWAxwBHMxOaRtWWprCU3eFLskhn5OZa1KNqKMWE
	3HlXxukwQ+vLaWg3sIU7upiSFCGv36/oDT2PWbKlAi/D4BW2wucJVW9tAn7Jn5b2Njpw2gA7IEi
	quzvJouZz5Gm01lzZUCPRZAeNrAgkFZem6ZMSKnXVg9pSOgAior9ytjfveEkUO2i5YIVnccjvQ3
	MEPmmWSXTi89vQ4QTbPUA2XyclqStrjYaI6rA/JsuVrISa3eI+3KcM97aP/53LqyurahuNRYLqf
	IjqozDG3huSU/DAcf2rHW764NMo9go0Yyyx4u60djG/6orSFiAd5oq0o/7fX0UDs38WmaZUNVIG
	/VbX6GyBgoqiwbnTL/g1B0Rqb42xCQbe4XvpQUDaaxEjtj1Q==
X-Received: by 2002:a05:6a21:4cc6:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3e92892ea1cmr15996361637.13.1793848940481;
        Wed, 04 Nov 2026 19:22:20 -0800 (PST)
X-Received: by 2002:a05:6a21:4cc6:b0:3e0:b71b:a8ed with SMTP id adf61e73a8af0-3e92892ea1cmr15996338637.13.1793848939995;
        Wed, 04 Nov 2026 19:22:19 -0800 (PST)
Received: from [10.133.33.112] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09bd3ad6fsm1446826b3a.55.2026.11.04.19.22.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 19:22:19 -0800 (PST)
Message-ID: <35fbfa41-a636-44fc-b996-9295e265d515@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:22:15 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: board-2.bin entries for 12 QCC2072 and WCN7850 cards
To: Birk Skyum <birk.skyum@pm.me>, ath12k@lists.infradead.org
Cc: Jeff Johnson <jjohnson@kernel.org>
References: <179381165259.84724.9229191626653570162@pm.me>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179381165259.84724.9229191626653570162@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAxMiBTYWx0ZWRfXzQJ9UvzUF/Yq
 wR3kYql5/ygAZUv+EsxOi7kRMFy+3fx6k6uARIS/7kdSQIXH8CWO0m+q28wf3PbBfrsEftg00Nq
 +OjrsDIlHZ0oPZSKCEqCleXMb9J8ck8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAxMiBTYWx0ZWRfX/OEEq2GwVa++
 nuEm2hp2ykUUoWDME0uDEhD53rr+YHVx1+HZDoKN+0fqJsUMP0Nqvii3o/D0vCbliwjR6gKb+Gk
 jFUkDWqENW7o2+xTwAxQJwzXZHs8KZ6ViCf1JL8Z26tXGGYXD6E1Nmvv0e2589JFD6W0q0KsBwK
 edwtpM9rThS9XLNcDlLDGG60fZwjjxqeqfz6Iv/85OJU3GZi9WPkADwzOw7D622ipJnB5ZZZskx
 afktlm0rNiPPlVOEa3BNjwrCPj11klDFSFwJpBCdxYLpohfaLTeK39rTQvj7BvfnjywGRM48018
 zpq3sVdRsZyv6N2PKsfwc3iDXaPDLYxx99bnIZxrZLiS5YjoVUaMqCJGnSdfClGYgvlPuIIPczy
 FsSegECXkdILvWwgy+xAGns6qRGGPU68WrYlWj5tQ2+/SBZHhXUMNHN4Q00jTGQmr0QcI8p5m6M
 vipPsN5iuLE/+/lSUtA==
X-Proofpoint-ORIG-GUID: QyRIzHcaoilmBY9ryRcT76M50_6AnTc0
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aebf66d cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pEfsSs99s6TFoh5TOIEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: QyRIzHcaoilmBY9ryRcT76M50_6AnTc0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_192222_019204_D83BA7EF 
X-CRM114-Status: UNSURE (   9.95  )
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



On 11/5/2026 1:00 AM, Birk Skyum wrote:
> Hi Jeff,
> 
> The ASUS Zenbook A16 (Snapdragon X2) comes up without Wi-Fi because its
> QCC2072 card, 105b:e14f, has no board-2.bin entry. Qualcomm's Windows
> drivers list eleven more QCC2072 and WCN7850 cards that linux-firmware
> has no entry for. For each of them, the driver's INF sets the same
> BDFileName as for cards linux-firmware already lists, and those cards
> share one record in board-2.bin. Could these cards get entries
> pointing at those records?
> 
thank you for reporting this. can you please share the dmesg logs ? we need the driver
logs to identify which exact card you are using.

