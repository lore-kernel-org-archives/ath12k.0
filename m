Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F46C531F9
	for <ath12k@archiver.kernel.org>; Mon, 27 Jul 2026 02:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK6NjlG2f4PCV5CwJH5F1qGJLsW62BAIhYSmA0UjeXQ=; b=CU7AFAWHKaFE5Gk6RnkCInq6Bp
	fW3Lut0Qo6sNT+P0n+nDtYmEkWS1g/S+r/BB/zrMFDQIMlEwpMhMrvpfUq8Oo9bXu7wZzbLQmWGzj
	zxQqRUm+nDTazTfpw9RUbw+oSQx7QeL+r7TsSxvtQKsS6aDDf19i7yxdjtBcAkei77umyH3UC40fC
	zaLpTMnsTYkQWy8kqYkuhkbWoMc62GK7Dne2bSs+U0IzgTUIaEySGubVE2cmPjeZe+p/NFeglljfK
	B5tWFwpEo1Zs5I83Tmub8SJZQ33I3DU9qpRw6MnIawNuu0IRxFXTREgtSLs6/Rr9Y4p9C3ICiZZuH
	GAdbvfgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBH7-00000001pvy-2UoY;
	Mon, 27 Jul 2026 02:41:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woBH5-00000001pvL-3EYJ
	for ath12k@lists.infradead.org;
	Mon, 27 Jul 2026 02:41:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fh142239925
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 02:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TK6NjlG2f4PCV5CwJH5F1qGJLsW62BAIhYSmA0UjeXQ=; b=MfAU3xVjYWRO/RdL
	18IYWj2SQH8x9npH37BIvxA4z/Pv1B58Wmb1pRT+3UeRePlFVY1MESzHH+qtDAE1
	hKw4eW6FrqNXjZzoDvNja6/7Equx7WRAngyM2wLg186YoRHW2XKfQ4NVOPZeBoMJ
	9/jWN3nc+UZ5iGiGVE5HyZcp2sjeUbx3RnSDYXLPwabsjIPs+vcGmpssYxT64sjE
	UpQbQQOhta858VVshIWRgvYHEpsvwLLAR+fnWeSJorYkFwa9Y9bhBw45h4LAeCC3
	iOfg/nywlvCk+NM3VsLf87EGz2v61K7fHAmIQahtBS+R0x6WsHAarXbErujFFRZY
	BvVuSw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs0gse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 Jul 2026 02:41:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so4261581a91.2
        for <ath12k@lists.infradead.org>; Sun, 26 Jul 2026 19:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785120060; x=1785724860; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TK6NjlG2f4PCV5CwJH5F1qGJLsW62BAIhYSmA0UjeXQ=;
        b=gaW1hLRqFIKsAQwKRC8c1aWzlcIVtG5oRBJa8BwFhw3GWL6NVWBD8p2kFzfkcmrOsO
         Qk7xINzkXJ/w4uxOl65kiR9tzpHkXYmrrGAkezEMRdzszyvsS98ssnD39wbKxUqx/enH
         lbEaNEhZF09MIIV63YhZjUcK0WqrrMAzNlsSPJuAeBY5ZlNBYKH8mPfNEwIxwAH3ene2
         +6jiExFeIEWW9czC+9gSPiiC3t9NFZwYK03Yo87wZA30p8bHjOcyHIzdY6nPEa2p1P9/
         lNC4Ahoa/ikk5yeXGJzdx/aA1Lcy7tGb9Uqb1RXixx1SE9qV46Jmg3kPmTFuKxPVb2vE
         LqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785120060; x=1785724860;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TK6NjlG2f4PCV5CwJH5F1qGJLsW62BAIhYSmA0UjeXQ=;
        b=rlTb9chrA+pFbuJOOF0P0TyuuphrUTRQCm3FMzaRRv2ZMtF+h1Y3J6SNNnozn9TP4l
         JK8d1aNI3aVqpuDRPZzr2ezOSqE8VUWL41lMbcUQcDXLRZrI4yEbO669jdlZNeX6NrCU
         bR/5ku9AGvH3J7TYKqCAvwECYm1h0bnXJEvsGKm6nznRwSKWxjuBG2/FOxwhOZdfC7z+
         xwjP9MaGUpg0a2v4TGCpF9gc3ld4AVVN7M+EReFp4FGDOESCiLbdE038XMy4k7kbqAra
         rslmpGKbA/IUb59T2UW3AXfJNGoFc6KAcV99qRp1qPSn5Srfn7asfW2woKTZ5g77oj6m
         +fHA==
X-Forwarded-Encrypted: i=1; AHgh+RqDHa6AG35l17nRfk93MnPQvQ5833Y4i1BtX9s0DBUwcjrbLt9oC8tDuouoKt88tmdU4bTU6D4=@lists.infradead.org
X-Gm-Message-State: AOJu0YycC+J+izsLU2NjXfnY26FlTzMC6sqnwZZZ26ooLvUal5kceWFk
	P6Njw9HvIIw8Aknk31KIDaey69pjxPnJ8IIuZojSaRFoRclsGHcAU0M1jt4I0g1zxci5HT8EiY7
	XjtZeHxYSWnCyFKp1olhqoLH80Icsh8G/tiihyCFF3StlQTFcjENoetg+yP2zwqVT
X-Gm-Gg: AR+sD102n2Th39mMNowZ/a3/V4KyEH2EOnyIhw56mTX5hz00/EJ6liKdL8wB0QM2KZo
	VYpTkYC8oMZCSNAuPkUbl3YujFWfa+gLYef9LWW+SK6xfqAsfOGwWR2r+QMSbLheznEZjeziEBJ
	zcXOgfJ7NL/TgP5f5Ato2bsxHZukuBwvNwOxGKhVr4ukXs6HLb7TgZ//Yl3gm/Duo08AJqPKp1B
	0Er1wfsMnPKLLyVIyD/ct0+zedYRXXiYB2BFxAKbDjGbi93GjcOEW27LxPa+qXO7x/fN6ke8tVY
	DQAzK4D+FndIQ09ovam/bVo7UnmoVVT1uGeRFPdIWarHNdVvEPpx82hVbQPi6S4ZFvF738bWq5I
	kiW1YW13N3qvzABO4I9YfSn2EllUvjVY=
X-Received: by 2002:a17:90b:254c:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38f298859c2mr6628462a91.40.1785120060282;
        Sun, 26 Jul 2026 19:41:00 -0700 (PDT)
X-Received: by 2002:a17:90b:254c:b0:387:e0db:3d8d with SMTP id 98e67ed59e1d1-38f298859c2mr6628447a91.40.1785120059795;
        Sun, 26 Jul 2026 19:40:59 -0700 (PDT)
Received: from [10.231.194.200] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041c3647sm4214768a91.16.2026.07.26.19.40.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 19:40:59 -0700 (PDT)
Message-ID: <8f327447-fef1-4c58-a563-bf4a0426cdb7@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 10:40:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: skip MLO multicast links during
 crash recovery in Tx path
To: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260723054653.2794550-1-pavankumar.nandeshwar@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDAyMyBTYWx0ZWRfX5pk7ruiuJ0eG
 fcUk01tY1UAFIeIY3SDBGe1Z5lsBPafdbBdz7ETZLx8SWL7ifdzQYfTHsm195E+63D5cpQs51fO
 C+RAaXefXf0amA/lxfFO+6xxb5Dk2bfMtF76tbHEGullRK48ilma/9wpYgwT+dJlAFH1oJDV3Dt
 lphOclncIM2zkZVnru6838XAWvwcq0/vzrqwq5/KG3+OGNcdXDTqqit9Zg1pTzj5Kw07PYgSrBs
 oLK2K7KGsty6kyQuoBwbB8Dg3OXG9wVmQKzLB20ui37+xVwCPk/zrhg/r7V9feY49KwK37IhfYv
 0z3Bs8Z2bzkVLK0WbzIuVJ+Hb1ihIN012X3dkGF8kLkrbdDzr2HLEoE1t0yNQSXSGsKxHH4ZtbO
 0x1RUaFlTNvfyuR/zt220xN1wBZAtLn5rff0Wj+4RCPPF43nEg4DYvEItCy1Koe9dSuSXWg3Gzt
 XKKifbcZmFrRAoeOHGQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a66c53d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_N75d0clQG27oq7jPmMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: 2rbuTK7W8pp6JdU-0NxHjDHeKLjysevK
X-Proofpoint-GUID: 2rbuTK7W8pp6JdU-0NxHjDHeKLjysevK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDAyMyBTYWx0ZWRfX5wYhlCSyFsRf
 cYTEhGpUvB7GB0zAa3Yox8+kMLCVTAuoqNO34e0LuJFnxT4MkJ393JKIEUiShQQ7mKQCv5vMR23
 909F4Z2ctbdlRJx9u3bsWS88VONK/ic=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_194103_939319_1AF4ACA4 
X-CRM114-Status: UNSURE (   9.85  )
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



On 7/23/2026 1:46 PM, Pavankumar Nandeshwar wrote:
> In ath12k_wifi7_mac_op_tx(), the MLO multicast broadcast path iterates
> over all active links and copies the original skb for transmission on
> each link. When firmware crash recovery is underway (ATH12K_FLAG_CRASH_FLUSH
> set), the per-link copy is allocated and partially processed before
> ath12k_wifi7_dp_tx() eventually rejects it with -ESHUTDOWN.
> 
> This wastes GFP_ATOMIC memory and produces spurious "failed to transmit
> frame" warnings for every active MLO link during the recovery window.
> The unicast and non-MLO paths are unaffected: they call ath12k_wifi7_dp_tx()
> directly, which already guards against the flag at its entry.
> 
> Skip any link whose associated ath12k_base has ATH12K_FLAG_CRASH_FLUSH set
> before performing the skb_copy(), matching the behaviour of
> ath12k_wifi7_dp_tx() but avoiding the unnecessary allocation entirely.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Signed-off-by: Pavankumar Nandeshwar <pavankumar.nandeshwar@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

