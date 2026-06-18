Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAF3CD98F2
	for <ath12k@archiver.kernel.org>; Thu, 18 Jun 2026 07:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=83E4y7HOfo+A3U1jqpxIrPDf/ezN6kYtehTSe1XNNNw=; b=MrRufk/zWCRFnVIsAjtniDmRdP
	4DiscsYRsTh97D3B0bBjIkfYYFTMnjFNqjazL3rPEJhV0Dfdh6tqEdN/xqpg03UapO/52XNHIw/5U
	lMJ5wmlA7kAjwzZZdL6mP+BhjK/PkNqV2p6fVAeeVaKE6xsmYb8Qpx4KuWDkFbOYQJyen3118ZLF/
	h9yZndUMWJ27yvQAxQtvKe2jn6hMmKgChzMucLgTe9/wozZyae59tEQvo7zQUnbZjcLl1aeTlPmJP
	jPN08bugmK0LBE00R4UTcOjpDxTnF4tZgwwOk2EUetbWBcKWMa5y+Nsv3lHUXk/J7+lRLpYBY160n
	QliyPsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6u9-00000000jwF-224r;
	Thu, 18 Jun 2026 07:11:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa6u7-00000000jvq-0fQu
	for ath12k@lists.infradead.org;
	Thu, 18 Jun 2026 07:11:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I6eX0I1010712
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 07:11:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	83E4y7HOfo+A3U1jqpxIrPDf/ezN6kYtehTSe1XNNNw=; b=S1YSiq7tCG6dFT1u
	BLOWy1D/GZMpMflKdjw54qXNKfnKv/mq7C4C+SSMnKyXoi06A3Nz84jp2vPzP30n
	kdJe6Aau952Q2J5dIDy64qptoWPAiGs9hYZJ7yy8DRfoQMPp8+0SJhm1isH58jn+
	H4AjPFPROTTwptpHGpWKBDgH0aHveG4BUNgCYiKRhs4FFuhtui5AI/thLi0+Hnfb
	kynu9l73tWAVl4SaxiKxXiQpQ5szyAr1uSM9hpPvq5P3f5/kYnp43J6vA/tBCJGp
	sdcWyqUQ63o63MfUwKQcqZkks6bhpDzwiePs/pUXQCKjQTZ0bc8o4LU5pxWQ43nJ
	0gUQJw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2jucqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 07:11:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c860544c077so985739a12.3
        for <ath12k@lists.infradead.org>; Thu, 18 Jun 2026 00:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781766669; x=1782371469; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83E4y7HOfo+A3U1jqpxIrPDf/ezN6kYtehTSe1XNNNw=;
        b=Ra1DPMQU6o8wAC3IMv2jlhfJoRXRFJhOGwuzfA9ndWsxXUZ0JZbjzI8VJj8Thopr8V
         MRmIt1TdJV286b7Lm1qzQdGQHUXnsxpwXvgcfUdcUc+pr+741gEEJiSSmsdEgwoRYggH
         gm2rnEPRloKGEFsnfA5yPdom/S7QKJlf807OF+z2rkZwJpnZm+j/gGttAn6OEZiHtcD+
         /siZWyPUs2xiEeBhkrMZaS0NILBEfJtbvT7F6PQ9TdtVsfGimcrWTlQiNMrK1gbX33pQ
         6Byutpcdj0PTj8Nd0c2OT2GiZrxw3Juxtnv3Iq9rC+iZKOgblkJmGVEEzbZ3jkqdcaev
         Tt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781766669; x=1782371469;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=83E4y7HOfo+A3U1jqpxIrPDf/ezN6kYtehTSe1XNNNw=;
        b=RsqupnJNSLNurQtTqAP8copaJ3w5F9C7Jm/tah/yuX/PCqsrwU6b+fGPpxSTW87d11
         AmY4n7CUeVooPItIfYzZEoi1JtGYYm8ptVWb2Map20VQEYgIRrpj7B1RcWueBkIeus+c
         0E4qlUaFkdXNa8ocGkzWxubPrWAPFvaGWUXI7EVKVUydBA5d7UnFtQN8PW6LG4ImIBr1
         wZPklpxghuKAChc2GVtHA9uAHAK7usY+qpx4WkEBLYIAcyGzMf7xFXOIhQFWMq7rukHD
         MmSnszbF7iGGBnpv9HUbte0GPoc7XzxlvF0mX0H7rNbnl2k6rMgury3++Ft15KMnwC1o
         kJXg==
X-Forwarded-Encrypted: i=1; AFNElJ/MLYPZRObV2XzBAnsXnHpwMYLIZyWkQ4S0vYNzzRQuZHln1axpNhCWwWU6b24zEhcFizVsKxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+Gyxzd2zFJRJtPbksYH8i23PDSIs81i3S6wISN5EK3D4XNJa
	joXnZjtsntymfR3dTTQfn3kGYq5Z7YHmGF2R5F/rzYHzSnXDSkrowLeMTW12QKhsO/dJzszaOnG
	zIWTrEp6tLn7cPFWLGibpcJUhCj+7ITYYiuIdyIAdNoOmb4q99gMOmFBh9cca0zFY
X-Gm-Gg: AfdE7cltHwDNCK3AoOQpBmLZjY4ZXLGzEphrQHCZ1BSVO4qgTCyjiGRHHpQS/FHkdUX
	VfsWXhVo7JiREQU1Xm05iFJXukCQBiE4gE8SAVAbsz11RiYoj0HtKx/6bVKQtGl8xJgT/1rSkGX
	co1jlNK3PiHILqo5S3gjhVyL7K81550a/WJjXTUrHHE1SW6LtahyH/CI8jCjUKnARPGawrqWlgF
	W/YGv14emSNEjrZb1fS6z2ZddqN6Y7KNLLs+5s9fkJFQhz6XdJUEdWfIP3Mef3yTbz4qGxgMYYA
	LqFTXALPG/fLFc1cNg8zb0g4dGZGLCwI9PvnEIiphLxr7h/fbfy/sF28iVgjVJ8XC8PAEGTjl/k
	fjpJVwpsQNF+ppUNjfZ7tYgbwONFAZda0kx7tOfmbDNM95DNitL38lf+csAR07x+b/cG/vMLFqF
	wNK+G+8IY=
X-Received: by 2002:a05:6a00:6c94:b0:842:6004:3fb0 with SMTP id d2e1a72fcca58-8452452b3ebmr7813553b3a.24.1781766668574;
        Thu, 18 Jun 2026 00:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c94:b0:842:6004:3fb0 with SMTP id d2e1a72fcca58-8452452b3ebmr7813520b3a.24.1781766668108;
        Thu, 18 Jun 2026 00:11:08 -0700 (PDT)
Received: from [10.133.33.65] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b0112edsm16574313b3a.45.2026.06.18.00.11.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 00:11:06 -0700 (PDT)
Message-ID: <19533f4d-9fd7-41ba-bd57-f7af092aaf6a@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:11:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 2/2] wifi: ath12k: enable threaded NAPI when DP IRQ
 affinity is unavailable
To: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>, tglx@kernel.org,
        jjohnson@kernel.org
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260519011627.713068-1-hangtian.zhu@oss.qualcomm.com>
 <20260519011627.713068-3-hangtian.zhu@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260519011627.713068-3-hangtian.zhu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA2NCBTYWx0ZWRfXzd6rU4D4FyBd
 a1MoMaVsAp7cT9eCkeh/s84a2ioPKqdZV2liAOSp/kxEZ3X48C92GziJaJZdJwZ9UOOHRx6xG3s
 OIhW0qlyOAcNy0lwIoRDBDSvEIwV8ouLukZkx0cVREqFZvFt0L3d+DZKoIe3LB9tgm3Vj/Lo9Dl
 dHaibmfcSyz8MtXhn1ktrPc3y4HTEDzUV89xydHLifPDzjAV2KmhEIu/G31Vl4iJ/Iu3FwOpQig
 tws6ZaAuB2AzKsWuMLyvJ7WdeLp24xIdeJfivr+GHvoPCRkQvPWg7lRmuBlJtzls9zs3XdXWlYH
 NpjqoonVXB/a7X+3rzwIIq15X1tznnSFYo7Rkzm21S0fYzbWF+WQKrGSGM95BOLAL8nwUFzLPCo
 sRCstduxXYNbenngxG0e+p6fCx4PEVyJAdMlYvYPZ9rV2JpGYbxvdG0ibhr05FrQKFzlEp7hRPe
 q83bDvO4ytUXxR2gZNA==
X-Authority-Analysis: v=2.4 cv=Fsg1OWrq c=1 sm=1 tr=0 ts=6a339a0d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=p1D2W8PGoTfUkLiTzOkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 1dVRodVUlXB1fqfPmNOuqbEP_q37HzOO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA2NCBTYWx0ZWRfXzgY3NZvtUCzI
 KtvZEUR4DN97IOdmUROfiG4p3/u3dYxZX95BwwDm18V27Ny54IiT51v3x+5BHnIePqLjHfS4l5f
 PTsfl1SVl4VceZqXFOStxQhHiPUv4Ck=
X-Proofpoint-GUID: 1dVRodVUlXB1fqfPmNOuqbEP_q37HzOO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_001111_325668_FC50F9FA 
X-CRM114-Status: UNSURE (   8.46  )
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



On 5/19/2026 9:16 AM, Hangtian Zhu wrote:
> Determine threaded NAPI policy from runtime IRQ capability of the DP MSI
> IRQ.
> 
> If irq_can_set_affinity() reports that affinity cannot be set, enable
> threaded NAPI for DP interrupt groups so datapath processing is not
> constrained by a single-CPU softirq context.
> 
> On RB3Gen2, where IRQ affinity is unavailable in the effective IRQ path,
> EHT160 UDP downlink throughput improved from 802 Mbps to 2.58 Gbps after
> enabling threaded NAPI.
> 
> Tested-on: QCC2072 hw1.0 PCI WLAN.COL.1.0.c2-00074-QCACOLSWPL_V1_TO_SILICONZ-1
> 
> Signed-off-by: Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


