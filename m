Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD6CCD98D2
	for <ath12k@archiver.kernel.org>; Tue, 16 Jun 2026 05:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NTwtydChUQAyklm/gAQGK2Eydni2CX8i9kQ4nvHiFeE=; b=JYrickAu9l46Ryqc/e86FfPevQ
	nHnPdQx5LYtjs72N7g6K4TrbIaqbAyrXbhKwN5w/H07LQZHfTaOyWar7KL97VM35SLct8Q989/9U2
	9FpjzobDxu5hg5vastXOU/OfSa5vIvshcxld5H201nTSwA6psbT/1V9Ni/YNlwHi7VMw1gZ6uSKC2
	sjMMPtZMGMRWYaOVZanVB67q74Q9NcFdy1EHVWUaJzj1qMq2ReWJwZsWy9OtXc8EVi/bQ+8RK9/yB
	nnWpocgMAhCSCrLhkX+5lVZBdpt0Vt70JwzgNBOkqrfbiCqKpDhUkk4oL5TMuJqwgKqJR+oC1wHq9
	7wA6CD2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMiS-0000000FGKW-1FIw;
	Tue, 16 Jun 2026 05:52:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZMiP-0000000FGK6-2Qyy
	for ath12k@lists.infradead.org;
	Tue, 16 Jun 2026 05:52:02 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G5NlJD2139378
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 05:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NTwtydChUQAyklm/gAQGK2Eydni2CX8i9kQ4nvHiFeE=; b=NXNcNLC9rrG7zpds
	mbO2FGCF7tgDehGnAPL9af18A0x+APrC9UhIAsMFI9cjAKpkpevs8mI1zaibmlzO
	TaKVcAKP20zzpipP9XHV9Fb7HNIfWT2RPcz57cf/l8Utbl0W42+4p8oUNnnhsr5L
	cwfV0hm1nCsBjuhdbGT/P1XF9wqGCNeiA/63TDAoEzOfXPr3RgH7of9sADIB3ha2
	+Qt6z/QtwkmA7OdbHoHhQgMHsUbIGWbUtUSsGlr3eVnZOAmeIiAVfLqYAOhm9xNE
	bMmpAhHY3hy+s8CCFlO22i7kahk9BZkwD4/d906JhkREMoFeNa3IkGa0Nzo0TWCb
	GojCvA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7r3cr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 16 Jun 2026 05:51:59 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2d0a8b5beso43233665ad.1
        for <ath12k@lists.infradead.org>; Mon, 15 Jun 2026 22:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781589119; x=1782193919; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NTwtydChUQAyklm/gAQGK2Eydni2CX8i9kQ4nvHiFeE=;
        b=LeLt6JmouN0Av50UlczG6ag+8Y/mBznKBULHBNey6t0ITV89p4jnRqMZo6MP85kuzr
         JRjNtyvjimLMxTwi7WsSYCrGC32Xn0LJMmkxDq/p+J0FAgWwbot7sfIWa6vw9gt16qew
         RX96aTeveD7p3ckDuoROQli3jIj8b1qEkGVpzHVBE4MPEYHMBXy9Lm/bPfEG8k1eryiS
         TOA38Was9qNgpIHJrlzb2kNFtN5csVMyWlVODUo5qRV7QRwURy519c9W5h2rrjHq/Y4q
         rPDklOMfnES4q8QttC1n3dMR8srox44Zu7rviB1IeequPDMTqBiCFTT5pbGcY3s65kQn
         cK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781589119; x=1782193919;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTwtydChUQAyklm/gAQGK2Eydni2CX8i9kQ4nvHiFeE=;
        b=oM/n5dUg3w7Mt6mTLE5foa9C6SrOOi3xgZvl12Pzbi0CT5YUR+APzralJ7xfwtRZGX
         QAw91t690x+qbu70RWzKjADqygrZPcc6jUJC0AUtNTpS3YZULBS0D5UG+xUnsnDdfruM
         U6CnObMcNx8actWEChQ4FR2u0ki/BUQshhhyrGfrpRYiMrVNNFj7up31HwnGvMWQItcZ
         7Zcm0UBmg3dIvndKFOP6gz2eZuarTeT4XLJiVTlDOPpQAsHQS0jzK6CTIFku0McGhkK9
         ZAWfp8KdXmTXVgtVFBAfvxjJ80/4PJOkNZHErSowA24Lf6D2CziAFUH9AbhZXQygx7Xf
         Y7TA==
X-Forwarded-Encrypted: i=1; AFNElJ/aDJGyuK0SUxCX4ewa9dHySpssSNQwj6wKntqYHQ73bqqKj95mdiO/+bQU3i7IQsNS3Z+enVE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx0DnP2PDvbrTQPX7z/E6wHNshMV7I1+Ng/Mp2b3IpernzhMwN
	apPZUPkbJVvDmrgUWf+CRCvORVWotqGYw/xD15b2J6pEIhFBa26OpVWFTZ/Gsz9qp+bgw6+mnT/
	/lvZ/B9sJYbiBR9VKkyvbgTL+q77rYp0kD0GHCWOJ1nIpvSA8ybA9QbR8Bj7ln5vD4+hbnNvg
X-Gm-Gg: Acq92OHIzE64l2OwX9ieiLGzuUazZJVnuz7puGvOmFgvlw3QySVyywmXp80SFw6/0Ua
	vga/jZb+qumZqiyEJ67l8jAjtc4W8Ug2EsC3WLKMOHgV/UGmIRH7bPMSdOH5jbThylmogG6l/OO
	D2hxmCVKwsiWD3uiFTIY6QpTQEbk9ZGeeHg+Ux/hSmV03amr6huM0xpZMxznGIJoe7sBRF5l4bl
	Dmr3b7tixD6LIcpasKurnIwTg2IvrK+lg1CMZSgkoA5ERKvqKz4l4KcPAXw8UFZ03bztKPP9wF8
	zvYNj0tafkg2CLrO+CggCsRugzMLvZSP9laDVixG/UDevPkBgIB1oHwycayfHQG2fcHl8z9ihPa
	EXjU/UQxnw70YAfmxR8ier+c1fbxxFH1DFaBd0y8ESFn4+WOboDvOrKirMy9sQ5d4IeL47A==
X-Received: by 2002:a17:903:37c6:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c69a21d1f2mr23438715ad.35.1781589118850;
        Mon, 15 Jun 2026 22:51:58 -0700 (PDT)
X-Received: by 2002:a17:903:37c6:b0:2bf:211c:4980 with SMTP id d9443c01a7336-2c69a21d1f2mr23438505ad.35.1781589118354;
        Mon, 15 Jun 2026 22:51:58 -0700 (PDT)
Received: from [10.137.71.130] ([106.198.19.31])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4328a47f8sm112621785ad.47.2026.06.15.22.51.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 22:51:57 -0700 (PDT)
Message-ID: <9ed73ed4-3c52-4841-821f-0fae12f452dc@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 11:21:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: correct monitor destination ring
 size
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260616040653.3985702-1-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260616040653.3985702-1-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA1NSBTYWx0ZWRfXwVxvwoZkjJCX
 W4iktxyAVmsbPYo+dbaQcP0wsKUBNJgrHfSeKt2jxsB/vcTb/CiUSY8nQ6p+F+Zi4SwmjYjgm6s
 8yLtB5r9Y70s4494d7Lp0L54xiF+I4UUCEau1V0vjfSN+6q4J/n6deKbTnxususBn1bE3BCCHAI
 V8mzt6qv91RuK+W4jplcQbY7kDa0BgNlYCDQWtmLTmePcFfYYTDVWBraASKuiRclXG8Q/bsiRZq
 lgIbg5auZ2HY+VeAP34xYN+gMR0WnFj5u+dwRNY92Tb6gdTKjyRkYHm8u7FcIuyKfQRWiFCy4DO
 7B+SfylPuH5LOUTnaaZeKL5HzKm/FgXo+oK21DoeVuvBgt9cqJizvj8Iz+h1FVUpYdfJ8xHiGR4
 rSjh8XRcUr7Z/9t02ErJBbtm3ops/ec7vvryFLZJRj22MGtIDVXqlBC3WOvi75voLj/vei3r14p
 z2z3wE51jTKXHYJwj1A==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a30e47f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=z+7zcDXV3Faa9n+rlPmSWg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Vof7ml1Sp1nGWk4UEeMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: FjV7Y7H8EgbNnHNUIms-q_i2VvXfyoBB
X-Proofpoint-GUID: FjV7Y7H8EgbNnHNUIms-q_i2VvXfyoBB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA1NSBTYWx0ZWRfX7cLuAZ5dz3rL
 yc1Xce75VRiZ6VjJ4rlbShvyPDUmc+uj8s9+sp30vDNmgUYCzpe1foWRCIhaj37pVmt1jdmaJfC
 6tkWOwzpTx1ochcitCA+aORlii7EB5o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_225201_635722_C5644967 
X-CRM114-Status: GOOD (  15.56  )
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



On 6/16/2026 9:36 AM, Aaradhana Sahu wrote:
> The default memory profile configures rxdma_monitor_dst_ring_size as 8092,
> which is a typo. The intended value is 8192, consistent with all other ring
> sizes in the table being powers of two.
> 
> Correct the monitor destination ring size to 8192.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>

fixes tag?

The rest LGTM

> ---
>   drivers/net/wireless/ath/ath12k/core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
> index 742d4fd1b598..b488bd8fea9a 100644
> --- a/drivers/net/wireless/ath/ath12k/core.c
> +++ b/drivers/net/wireless/ath/ath12k/core.c
> @@ -49,7 +49,7 @@ ath12k_mem_profile_based_param ath12k_mem_profile_based_param[] = {
>   		.dp_params = {
>   			.tx_comp_ring_size = 32768,
>   			.rxdma_monitor_buf_ring_size = 4096,
> -			.rxdma_monitor_dst_ring_size = 8092,
> +			.rxdma_monitor_dst_ring_size = 8192,
>   			.num_pool_tx_desc = 32768,
>   			.rx_desc_count = 12288,
>   		},
> 
> base-commit: 83f028be15fe071efbee8e27837538d6cca77e87

