Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84F2C982D2
	for <ath12k@archiver.kernel.org>; Fri, 18 Sep 2026 01:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4iJs6VxQgQlwW5ktJb9eYE+rPDMrUQn6RUi2NUqv3E=; b=AhpzWfpDsQ5WBDak9OPChDgtSZ
	tWfBYq3pmWrnN4dDwc2ao//C6vL000XImk5iqOY/+rXEV65ro0xdP/H0Mnu2eTf8P+SG607LBgOsT
	VzlSWlG9B8ZqkLFO4ddeZFM7x1IDUeFBf72WayT7Z+0YiJXeedn608AYg0jxrp6C0U7bNGO2zAx7k
	Uaqf2oy3aIy4vv1dtN3eExzbyIGhwvnA9q+LgVQm7PiuesSP3kN6uR7u4Lph0C9/SlyLeAsvTxcZw
	a8QOOyq7rnKdFv2vjE7V+49uFGcAdJq4ME4SXMMVuuiKPgqNumWgpgHLVhTQPpjF1ne43N5iG2p6Q
	JaHDApsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NY7-0000000DAia-2EOZ;
	Fri, 18 Sep 2026 01:37:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NY5-0000000DAhu-21Kk
	for ath12k@lists.infradead.org;
	Fri, 18 Sep 2026 01:37:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I03PMY144731
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 01:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i4iJs6VxQgQlwW5ktJb9eYE+rPDMrUQn6RUi2NUqv3E=; b=GfJbG0/JuPAW/Xb+
	pCWAl9vnGxpGoUIg+DBak0FW+INiArcIp+8o6jA9q0+fbzKhoD5mLsAlVyGL5ie2
	IWgMCZDu1nPetNeAS3CtLix6L/kljpVTyi6V+gSMjNf0m0iYLvwz12KNu7/9PZ9d
	v7/rl8evI22PWdcWPlyVgA0y+6Ix+/6ZT7bCtWZOdiJPdUSFuFTJO/+6QgDUtmzc
	l8R2JYM2H2b1FdCywolQ+lQqSOVtDyU96vo2d3SR9fGb7XXV7ovOrPFo/yKZdF5o
	VbvJ9gWK1SDnLhuamHCuKBqGGZXzqHrvceAxjwp9cwyqeAV0F10/BelPCyYuwgHs
	Ew6xMw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpr9fn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 18 Sep 2026 01:37:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso434189a91.1
        for <ath12k@lists.infradead.org>; Thu, 17 Sep 2026 18:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695476; x=1790300276; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=i4iJs6VxQgQlwW5ktJb9eYE+rPDMrUQn6RUi2NUqv3E=;
        b=cqPHZhnsfoZMqDe+sZfVLtKQLSRfG05r17kCttNtdo33220rY9cY+6Hg00VqKP/+r0
         ynAEwNKjk2kAkIi3v+KlVmpShplRbL00GXmrJ38EikACFnTE5gOPgmMba8+a0T+a/YIG
         Tkm3EL43v13MTNVAeWoQZidngFk+t0bWhovCPQ74RIIByKP15uJdL1S9VLQ0TQ9yMQvu
         NYNjM9Z2wv16qUILE2bby86QGEdcEUOSxaYirIOyiVo/0LDOgUAwVH1EIawz8KhFHw4J
         /NMR8fXZLrlBhC/gktsQTqRpevvUK6mZO/rnVIXPyHWRKl1nVeSAJwBjHuwtUEbTPM7v
         YDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695476; x=1790300276;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i4iJs6VxQgQlwW5ktJb9eYE+rPDMrUQn6RUi2NUqv3E=;
        b=G/8g2IMSVY5ilSvAWDcHyUFkMNvBqU3S35YfwZySkvwfHqtn1EsZLCA1EbQXfbIDrT
         mQKi1Qdz6a0XSS1nc0whyWeCo22H3h4kzHkGWtuaq4+Q1uDBrAHSMi1mUayjZHsl85pp
         a92K/7LEghkLu+7auLaKqaGyOVyOq93JhvMVTxlyNlyckmcmgUZxWh/3y9SU2TiIZTjK
         dDAD5IronksKUPX+kqfYBdCIHI5ry7mwYCqGdueBPOzhUwUs010VzG4qwq9zhFk/G/Y2
         zmPiicMzFptWG8a+cggHVxVZzBZXH3iURCgLidsNlVX1NO96An3iDkVZ4cfF0qyPX5s5
         5ROQ==
X-Forwarded-Encrypted: i=1; AKwUvBwupeFzg+cUlOmG/T701t5tU/D0Jcnwv1qkbBezk0OkegQHwzazITpBR3NzFlo1ftDwc63GyU0=@lists.infradead.org
X-Gm-Message-State: AFuF++lfut7BcoWGv9aYCob8CsVAZpyzhbrVenGL0iizlI6Qka4cY/BU
	9kbhCMFY4BDW4q/6tube1N1T8vDxbI2QsJVI+ZOsmQbq7QBKBm80ZLlWJ26CwdHV75CeI1qWgVf
	l2Hh2Qs9J6goxw+6Y9uDImsr4A8sSK51/oIAuUwGVvg7vGLYW70MTcEIoAGie/MnQegY/LpO1
X-Gm-Gg: AYBFou0tfFAT+mxc1M29DsjbUjJ/fwiBV/TZ47qMUBxeKkbKs57Ly4+goWrGXCikvCU
	0awWflafvqaX3v4/yd8dHB7moQK14IXgOxbCYNLho3Iegoac81CnV1isZBc2EM+p8ls7/vOfBTC
	aJo6+xTvmIBmiOt8N9yNhugRKoX6OVuhqoka83ZHmoQBlCN2n6lOp86F488/l1kN9TQQHg2zp84
	glz/tz/vklObjO/8TwARHMa+TJOvrtgKf3v4cGLCTr9LIO2tAQAyN35IRorDTymesSBVCwkjZjC
	5RqDpQTJLg89oqzP2sykVPakFSij5t3I7o8ARBjpwv11XuF9dsOD74OKzRvfDLI5gXH42ZbJbp+
	Y3UXuEUmLvGba71hFonZtocO0ZgV0r9LxVwEcLbFwDGSUPUtTVHHfSo6YAUyUknkmrCE5THMf
X-Received: by 2002:a17:90b:2681:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e54f0e40bmr1974148a91.23.1789695476116;
        Thu, 17 Sep 2026 18:37:56 -0700 (PDT)
X-Received: by 2002:a17:90b:2681:b0:39d:ee20:1e3b with SMTP id 98e67ed59e1d1-39e54f0e40bmr1974102a91.23.1789695475660;
        Thu, 17 Sep 2026 18:37:55 -0700 (PDT)
Received: from [10.133.33.84] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3617443asm9284630a91.9.2026.09.17.18.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 18:37:55 -0700 (PDT)
Message-ID: <91f72bf8-de7c-4ece-bfcd-286da649bc28@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 09:37:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/6] wifi: ath12k: fix monitor RX buffer
 lifecycle issues
To: Kang Yang <kang.yang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260916060325.854-1-kang.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX1bvKuYM8O0Cc
 Zzh/V/6MJRHlRHN0HPsUP8Yc5l3hLZP6FYAyXmg4sINWtno38dOda+pItdWgPAl1sOhHV/BwrvU
 ViLLWwJlasQtyws6nvSdN7Ou4RP5vflKZTaNsGqSQykwo2G3FAyDEj71Ls7rgNirE+zpUnXuGxL
 fLaw5xHR80tY5xBtI6GNfllr4NWTirIwV7DzpriRgCgjME0vSqjK2qYqI5/5SZ6Rw4OoaICeEf2
 sOvNx1Sm+HAAABMQ35T07rXVCwE6ZSNMr5hPwF4elFX4jFajyih6WnewrAQXcLyeYkkJ+WYoa3W
 goUMs7jtYirGOfGMIn8puEy/Trr9rnAfr4/AIX/VJJ2k8OVrnehElbFOM7PYQRCjaJC1OSutFBC
 N1NC0d/EtCTm2AvFEETQEwWTQKMzhIulCfLpl31WNrZthQQKd1F0vzDJXgkUK/tJVt5ktiiTlpK
 PNkbd3ituZGTXkW189Q==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aac95f4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jeZ2dEGWif2cJ8v1hNMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX3PWu7bophH8m
 fcnYrFa4I88hnGXTFH8C4LTAhYqWMKk5p4Mnv3V7yZ1vsA45dQqBpk9gsFQYjg+DgmH2QRC3j8X
 pLmYtSQA7i6I8F0a2gC157oBZEh6YOU=
X-Proofpoint-ORIG-GUID: fSRUQs6fLzrvx_TwYod52w8qKqj60fTv
X-Proofpoint-GUID: fSRUQs6fLzrvx_TwYod52w8qKqj60fTv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_183757_544501_4E634032 
X-CRM114-Status: UNSURE (   9.21  )
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



On 9/16/2026 2:03 PM, Kang Yang wrote:
> This series fixes several monitor RX buffer management bugs in the
> monitor destination path.
> 
> The fixes address leaked skb buffers, stale monitor descriptor state,
> object lifetime issues, and incorrect DMA unmap handling observed in
> various error and corner cases.
> 
> Kang Yang (6):
>   wifi: ath12k: fix skb leak on paddr mismatch in wifi7 mon RX pop
>   wifi: ath12k: free pending MSDUs on duplicate mon link descriptor
>   wifi: ath12k: fix stale tail_msdu pointer returned from mpdu_pop
>   wifi: ath12k: place dp_mon_mpdu on stack in mon dst reap loop
>   wifi: ath12k: fix skb leak on monitor PPDU ID wraparound
>   wifi: ath12k: avoid double DMA unmap of held monitor RX buffers
> 
>  drivers/net/wireless/ath/ath12k/dp.c          |  9 +++----
>  drivers/net/wireless/ath/ath12k/dp_mon.c      | 15 ++++++------
>  drivers/net/wireless/ath/ath12k/dp_mon.h      |  2 +-
>  .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 24 +++++++++----------
>  4 files changed, 24 insertions(+), 26 deletions(-)
> 
> 
> base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


