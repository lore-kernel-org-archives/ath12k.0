Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99498D29DD3
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GSUcEqMp6FMsBB+2t9djtaujijmMdZGCATYEu/OcPlo=; b=OuCN7lheqeKE5m1+ugs14ynjY3
	cU0RU+JjSjhvYFwj/QnsgP4E3oX+W/IyCLn5AlPgwwwN5SjB02XI7u/vqLmIPwTMt/9e/89leZvOI
	Mac5r//Gfu/SDnor9LhHUTKdfQAlxwgZvyXCCGgZNTtxDP5f+NIMstcemm1vLbZTXq5yWXz4gqRlL
	itB/8LVA6hq6F09tCzijiJg0+UfGEMoasOVkU4Dm/fIoC8eNJigp3gNhvupSB1rQ+p6X1Dgi+eWAh
	/+Nx1quS3H2bgJI58N2SKtgzZmVKTugiS4uo7PWHRwv9vY5+AWc+MPb4TDkT4Hjc8eaVEjlfNriG7
	cQJdSgoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXnl-00000006ajp-1Jwe;
	Tue, 13 Jan 2026 06:22:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXni-00000006ajS-2qt1
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 06:22:47 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5gnhM3808783
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GSUcEqMp6FMsBB+2t9djtaujijmMdZGCATYEu/OcPlo=; b=VFOrzsBKvYEvZibK
	YLio5qvnKIbvfvG1dP8dDrTh1kSrVtAdOV2N66K43EzfUUulx4k442LZGxPbL3Pi
	L/U/jEpj5YwNIhhTQdB6xdVJKnAe/GlV2W4Ro2xydqgB3PF1T2cvrPOkLZzyje2s
	dP8oKJ55XZFjT+wt2sjcm8XIi7t0f/JOGYQ0amf81eDKXHFpT3QZVqQTvhyd5I/r
	9UQgCqzKWWxeh979UkhnsVNQ/gC+/x/fKpPhNIcKf5jMJ2gB2SN27SlZVV1l8IGX
	mH/lvYUSWj+Rf5EQSycUuL2d0z3OE6FlK7AlzP4eQ+A9SCB1+5BsjwuSsQKjlIC5
	mFGIyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng55r3tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:22:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0dabc192eso71165415ad.0
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 22:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285365; x=1768890165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GSUcEqMp6FMsBB+2t9djtaujijmMdZGCATYEu/OcPlo=;
        b=SFpa21ONUYwJCSPTsokWIT/+Rw8p8pgz5JQZsXP6a5x8lpObu1S1dUbMENqWabPsGM
         WFydh0/kTPNkveoYrpMvT5kWmwpI6Cvpvr97ziU9wvM9dH016E/PersPYzfKZOqeVZK1
         pJPCIPVqCliu7uaUHgJGGhVUDX18TxFglhQS/UCgkJcy3vpqbU9LGbS9QNtUnJmcHOm2
         dKBk9kFRZM6vnva0+9zmKt9ShujWzWNZNSGqu/XcFXK9dCWhlod2G3hKxfin57iGBYay
         PYp1MnOSwfMwqHRX9XlElBX231e+9aQfTb+YCUmrb/PR54nzXTmv63x6/o3v5tow5lxf
         yz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285365; x=1768890165;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GSUcEqMp6FMsBB+2t9djtaujijmMdZGCATYEu/OcPlo=;
        b=GgoVeXE+n3ZiPlB+xHRjO6mV0WxI4LaMNNZequCEXRB/Xl93YZ42mo5rvrD2MiikdH
         Elc3VaKF99FISyF2eTe1Xx6TmaYiP3GOmCD6+lpdWPxaOQqADYMVIPJoo4tk1NsLEncg
         YKN7U0uhaTr1SsnYMaN1pT+QFWpJHLyAgUARMbXq60QBoP1ZxLjL1cc6F7EbDbYVd6tt
         capNV3muuXMVEXZ7NYSWq5UG3is573lqsn8mGw15HxFz6nV5VohDjrSHQcymTvdSkEsD
         9A3H5Ghro5qTHR8t24FE3PS1Fdh50h2IsCt24kdfLkWc1oecStqeRY+bt04vxQMyLf4K
         RbiA==
X-Forwarded-Encrypted: i=1; AJvYcCWWoCzuygYb9qqodvvhan/Ddbfl2vToE/UjRFbZoA1vH0qlmxrha520eTtoQ9vc7fjpZTyMV4o=@lists.infradead.org
X-Gm-Message-State: AOJu0YxtokvLyY2QkbP2qUyrGZci44TInDfzezvp9dN9JI7Qu+f7O7Vt
	xIc6G+Ow83fRg6LBG5zBFR7tGGahfwoHOS/RYHTbGtAMQxZ9VFUI7K8gbnv+1h2TmR2p/vjoIbr
	PhO+T4vDhnLN+SuethZfHhQ/q0PKXGraIoE6jXPBnIYNGFxHe8D1y1CQNrd/aki35
X-Gm-Gg: AY/fxX5lkeBkAz0CmByCdwRQ49C0i/IRBUT/LhcdQgCOBcdcat95C74e285msmIBCfZ
	GoK/ItUCzv8webDcFEPjVK8VAJ0VimZhIrbR8NDRQ2usdVWCRDjxlSXCmThVY2NgrbBFda/iIar
	YpK8w78Z8w7fMHgybn+cR5IPGXtTCPJZSNMLKIFA7km9mIY7+B2hv13oUWF+9hTuAE+0h0fu374
	1+kTAmsL3ILvCO/tNmeAaQKsyfC4aHsuDWnNyhgIJGEbkDNnmdtauzihDyO3r9x0IRN2gBPRlMP
	0focPhhxsgcF9R/ojAFjPgLAJED+dqH6pAC+kk4SYp86e7EeW46di4BLq+d17M59ISG2lPUz2hU
	6azShQ8nbOzGBgxfipp7DmPVEQ5Z81GTklN+U4EPGcmEBDRjDgpq5uCE=
X-Received: by 2002:a17:902:e841:b0:2a0:9411:e8c0 with SMTP id d9443c01a7336-2a3ee4b580emr203607785ad.32.1768285365253;
        Mon, 12 Jan 2026 22:22:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE+nkOMKgu3hsqz9xVAOUonSf7usnx+s2nDVg5IBWdYS+wNZayH73RGVJAdh1kT2DpMgRkCxQ==
X-Received: by 2002:a17:902:e841:b0:2a0:9411:e8c0 with SMTP id d9443c01a7336-2a3ee4b580emr203607585ad.32.1768285364744;
        Mon, 12 Jan 2026 22:22:44 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc7856sm193322855ad.68.2026.01.12.22.22.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:22:44 -0800 (PST)
Message-ID: <fb802027-84cd-4b2d-b921-e4b7346bc4ea@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 11:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: Fix wrong P2P device link id
 issue
To: Yingying Tang <yingying.tang@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260113054636.2620035-1-yingying.tang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M2T7mcuC7TzndJxpdNX5UT9vzreEgfoU
X-Proofpoint-ORIG-GUID: M2T7mcuC7TzndJxpdNX5UT9vzreEgfoU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MCBTYWx0ZWRfXzW8XtAIsKwi/
 LGnMbEI0jevIOgAXbXSq1Yot2NuKzEtFl7Jnfn81reBCHXm1cyOje75XB6nbarfxUHHPgvCmLLK
 KktBFp0lARR7B9Fjnoiq+SO1dSUKlcHzmlEmfb7j5iQiTqFweQg+j0E4xu+z7tTF0J7cev2hXdf
 bhfsq+xpYbcEIN5iEiOJdI/8M2HbZA2Ewjcyao1PnNW18oZ30zdpLOXj7yzihpi84GZTLHOlAwe
 +9O27+eZ5FsqCUepcf2XapbAdAc894UXn5PgP1PE9KYkHBusJCtxwOFa1nxspTuTQ4cbZ6y9CGW
 Zqj/qC7sKI4stC8VvwINf/0DFfs2KGlapUXLaTtk2MCmvcU6yjFtY7HvalLqe26yIklDkiMEwl6
 P0WryfkSSW+Ce62i/bnK2/Wrl1Vgc24bJQsvLFwZQyT53K/W8BdUB2fprQ0fq/YsIFjqhq5+Pw2
 D0a3mnNDiGU2kkyxgBA==
X-Authority-Analysis: v=2.4 cv=IIsPywvG c=1 sm=1 tr=0 ts=6965e4b5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=2Mo8NHjUZIvW9bQ8WxoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_222246_731672_4E438008 
X-CRM114-Status: GOOD (  10.68  )
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



On 1/13/2026 11:16 AM, Yingying Tang wrote:
> Wrong P2P device link id value of 0 was introduced in ath12k_mac_op_tx() by [1].
> 
> During the P2P negotiation process, there is only one scan vdev with link ID 15.
> Currently, the device link ID is incorrectly set to 0 in ath12k_mac_op_tx()
> during the P2P negotiation process, which leads to TX failures.
> 
> Set the correct P2P device link ID to 15 to fix the TX failure issue.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
> 
> Fixes: 648a121bafa3 ("wifi: ath12k: ath12k_mac_op_tx(): MLO support") # [1]
> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

