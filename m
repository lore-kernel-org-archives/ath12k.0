Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D57E1EDB7D0
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 00:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/oayEGvkBr0JcfYTbu+bTCKJ0ZiuWTOtAGet9ZO6me4=; b=1m1zw18M/BYQcB3+r/dTHznQ3c
	snVgXJXB29+baoTXf0OOWOtOTA5CuYLFW1qJXiGPBQiNGEX3CSfrkzjs0fAqRPaiCmszHiYcdKIru
	JbrFcsjvdyKnKB7zV8PcxXt0RllKp/QuTn8Z5e2z3Ge6xVz3BAWs8pGI5NKOuWiGqcmauDUPHAch5
	bvaC+RCYoZVg42AhwZ0kGDxuXJ4uPW9A5DC6ts0QVaJYPugQGza1d46+x0ier2eEBCO9wIoCzR1NG
	1Jk5ILj9QzdASn108y41Q/3JARNaR9Ns0O+vUk+/ryJVs1y735Uyd3P9Byl6z1ntKwFH95LT7lnBG
	H1Rs1RIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7o-000000083Pb-1u73;
	Wed, 08 Apr 2026 00:50:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAH7m-000000083ON-13aI
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 00:50:31 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637M3SKj1620396
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 00:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/oayEGvkBr0JcfYTbu+bTCKJ0ZiuWTOtAGet9ZO6me4=; b=h8z9LAxWhInsgSIA
	wEbeC+kdT4VjIPGjbccnmdxgW0xHb58dxACQvs17t8LhcjrEyX5G0RhFSIe8XVjA
	XSWR0Sj3VPKVU+mmDoPJldABcXdyH6mhaNDa7ctm+CGq3T2xkx7v2/Xu3Oe96ehx
	p96ub6Rk6ma+YqM6JuQdJPmd9LIS3n1f5HucUBjlkZZ2I2nczSRQqlcKeU6MAiUZ
	sjFYqLKoWdb/kcylSasbKO0JJ6WGA/DqAmqSR432inANPt9yVPck0nu+W2bFMeLo
	UGpULzNE/Az86JbPZL2Xr1BJLtIuewP87QjiS6itpzySOVPT5Rg+pd9/lURMVOBF
	jJshjA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddacrgc9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 00:50:28 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12734af2ca4so396432c88.0
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775609427; x=1776214227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oayEGvkBr0JcfYTbu+bTCKJ0ZiuWTOtAGet9ZO6me4=;
        b=EhPLklHYujiloDsu5MpyAwAMkrwFowGWIBi1gdGXq1Oj06GTMo7ol5RizQb2OiUwEn
         CsMj5WWDoc/fIDzT9TMAHtHQXwy5cbk+RsqIvCPx3wilokbOTn5EOd+8OkTW2fi0nBkU
         wWAZMaEBxVZ66RNXY/CcrfDVcONVTJQZn37KiZEZO3PNf8ZKtPlqn0S1/8pha3n5LyTs
         EvfMAwjGjM8h+5GjEowQOg5344J3oEBcDAEN6i+sswnPpaE3xEdUBsO4tg7I7cF21Oba
         UUBbRlJjm/s+q5ZIV28ceUUFK3XJXQB9EfEnIzg6uXQx6AQS2gZAnHhwye7u7gQaOnTr
         Z+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775609427; x=1776214227;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/oayEGvkBr0JcfYTbu+bTCKJ0ZiuWTOtAGet9ZO6me4=;
        b=hIbpXSDCrABCDQ1ZU+MSpDs5hvAp4wtuCjZb0xWA6QoVQ9JSIJyMiUdxUT4/2xb7sw
         ul7V+VniFuwn71Zor+oM0GRSH/1tZ/3ConEzXKBm/aF/kmHcSvtTNjYK8Mx3NQYRfw4A
         o7zw9IOvglQUdNrrjPQ0LeHgG3SMw9TF0kNM0wOx8FJaqLtz38uWmNNNqLmzssm4Se55
         tdwlUjksCWuQbV/ecW3NF/p75EDSEezanaBq1LXyIvhabGTe5LRsBhha7ipitaWn8ZjA
         q0dMIFzLpp9WTYg6P854FmUsHxBGo/83RAvmkTpiIf9bafeRqMA51M5v9hpstxqAxU5C
         cLEg==
X-Gm-Message-State: AOJu0YzAhDr2oNcCst9TDAIkkMKCVzAXG7P3awX9GKrJrqUtZbyyGewZ
	I8K3miwY/YBJz+tFoJL+rBy6r2ujlroMWg7wSF8s6+bjrt6YEjTcro5MsgZ5PeLG63/rif3LxML
	0ghyPoepsmGFdY03cI+SpptAYRS4YPakIMiuuuH8K5OCVAE1K0NsXT+Y3iHyfpHVhCKukZD2f
X-Gm-Gg: AeBDietjeFRDbLXdMc982qOAYRH4IeBm1QCWcm+Hy7rpY7UQlv3GJbjEinXvSbg7Icp
	VAE2+b0YaEhRZO3qQ+Zj8dgyTh7c3VLIDcwpsuJRvtEXIunKONgW/yy7nfo/tk+HYW3TXeT8eeS
	xHodZMNNykITlkAA4CPsmBFDxMTCAdWaLcDmV7fxGfYpqrtjMtUhvAiV2xyl2vCecU1NPkeymE5
	fxCPO79AvOdqvN8gPhB8cO/IbKyIYQkga+dU3jjujz87BBX3OPTdg5Tg5LMWKhmWv5cWVA6gNSQ
	+yHvmjGDNvpFvEYD0TY5FE5o9055OqQ65YQENFCrDJsQmtCX54tQKtA++NfIzubvtzGyP2pGlrh
	7th+EPQwLGzhTDydwZ6S0SC/guPPVYIeVW28TFObsxknHN2WTmPLecGW2rxx4B55Zie/BJzKZxR
	mW
X-Received: by 2002:a05:7022:e1d:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-12bf08566a1mr9854681c88.16.1775609426610;
        Tue, 07 Apr 2026 17:50:26 -0700 (PDT)
X-Received: by 2002:a05:7022:e1d:b0:11a:fb0a:ceca with SMTP id a92af1059eb24-12bf08566a1mr9854671c88.16.1775609425907;
        Tue, 07 Apr 2026 17:50:25 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d2d5409fd1sm1257301eec.13.2026.04.07.17.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 17:50:25 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
        Harish Rachakonda <quic_rachakon@quicinc.com>
In-Reply-To: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
References: <20260326050641.3066562-1-roopni.devanathan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: Support channel change stats
Message-Id: <177560942499.2878209.4098664055076965853.b4-ty@oss.qualcomm.com>
Date: Tue, 07 Apr 2026 17:50:24 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: AyTWy-QRtONFNySqXlG2SrmWJnmYsb3a
X-Proofpoint-GUID: AyTWy-QRtONFNySqXlG2SrmWJnmYsb3a
X-Authority-Analysis: v=2.4 cv=WZs8rUhX c=1 sm=1 tr=0 ts=69d5a654 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ifKrZIL7TpvmNkHrtDcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDAwMyBTYWx0ZWRfX1XFbC09sR19e
 LtLf6p/rRzLPyxICEv4GF3bFRZ2AePn+Z9JCLIVsZBcjg/9VCmo7evlOs7xiRpg4fOupHdUnuWV
 79ZdK7q9fD7CMO7j9lUqd42+5ZpBSR9+TPy+AoMtmf9LqFGIG4wZxLasTiEndFebLzMlW4pbQIr
 iieln33W/BHn55SnWTn/9zbonbQU/llYDbWBGkdL3qmcXtZKytkPsRRrjNdEnEthKhXGCjGgS0n
 eOsBF+e2b7Zk7VJSWvyDsVTyUnDxVsoQvU0NsFR3JNFpuaG1yXP+jD6MtVTkjkS2+RHFcbEpVrP
 sUMk2tSQYSzjo++x2goNUk4xhFmW1zub0H0GltelSwc7B/2VFnTEOj32sNIKXEoiw00YlfCJe+y
 LEjYDldOR84E5AB0wgsgoTtsT3Qn8gIsalRzhtAX8+p35OrU5+AR1Ulo3YyBCALfeh5L0cRv+Ag
 cZfE60eZmqQFczT3yNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_05,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_175030_434215_33CF5F73 
X-CRM114-Status: UNSURE (   9.04  )
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


On Thu, 26 Mar 2026 10:36:41 +0530, Roopni Devanathan wrote:
> Add support to request channel change stats from the firmware through
> HTT stats type 76. These stats give channel switch details like the
> channel that the radio changed to, its center frequency, time taken
> for the switch, chainmask details, etc.
> 
> Sample output:
> echo 76 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> Channel Change Timings:
> |PRIMARY CHANNEL FREQ|BANDWIDTH CENTER FREQ|PHYMODE|TX_CHAINMASK|RX_CHAINMASK|SWITCH TIME(us)|INI(us)|TPC+CTL(us)|CAL(us)|MISC(us)|CTL(us)|SW PROFILE|
> |                5200|                 5200|     24|          15|          15|         448850|   2410|      10546| 434593|    1071|   1100|         4|
> |                5240|                 5240|     24|          15|          15|         450730|   4106|      10524| 434528|    1306|   1150|         4|
> |                5180|                 5210|     26|          15|          15|         467894|   4764|      10438| 451101|    1337|   1508|         4|
> |                5200|                 5200|      0|          15|          15|          13838|   2692|       1736|   8558|     686|    802|         6|
> |                5180|                 5180|      0|          15|          15|          13465|   3207|        855|   8579|     578|    760|         6|
> |                5200|                 5200|     24|          15|          15|         570321|   2441|      10439| 555661|    1574|    949|         4|
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Support channel change stats
      commit: af5708ed67fc562bc45fafbd0f95789c464c0105

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


