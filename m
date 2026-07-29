Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14013C53219
	for <ath12k@archiver.kernel.org>; Wed, 29 Jul 2026 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FRVP823fAAcox/ry8BPkjj9sFCNNH0Nz4PJFbK8Qygo=; b=Qbhd6sC5DERP8jGd8i2j9mo+wf
	YKS7lGSye9hhbliXq5iXsQ4MsC+XdTDu2KAmZSMnhTO5jhlKd8XFL0L6idZOVWxd+1CwVhzdapna4
	rNZ8Y5ZzDNQ4M/MyCAxW/RpklIWbJsyG+ZJ4x42w0mPoqHLDTLjaUGY9/TNlj6SX2X0WAeiBeGwyV
	Jaxl0jZcXOWjZ+JlwtFtH7FXNLg+TvodaUYTqy2RfgLWa/zeC+ivfpy25e1aMQGNqBhreoQvueib6
	vuDo94/VMHypqmTmVEApLfDXVXzQpohArPT7/GHXsef9pIL35epScXR+8yuJLmCsLXjnW7/WHPVku
	XBiuJ2uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UY-00000008RhX-3Fxy;
	Wed, 29 Jul 2026 15:46:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp6UW-00000008RgF-2saD
	for ath12k@lists.infradead.org;
	Wed, 29 Jul 2026 15:46:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2VUj2591758
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRVP823fAAcox/ry8BPkjj9sFCNNH0Nz4PJFbK8Qygo=; b=n36AyaTcz4Dhm7Cy
	tD2tanMgjSYKlZDyE96ofIRlwdFnl/pkbcrg3/s5dlemsd07neboUCORZZ6gXqq/
	pGN0Ucah4wtAW+zWjitr5mf0dt8fPMUZG7Xkt99dQqVuCzjpYNZoW7b8gRYHLlZM
	GBt2Vd4O0dH1mmOqtZDNblhyLMQ529GbrgkPaLhRYfuZY7yUIQCRroQMSPUTFGH9
	alsyL9zJw4RIIjZH+jcM3aGxLxQxSF84ODzuPc0coYVqVEndIYXlDR3QOkQ+wumU
	yT0eH3ZmovIJJnsx7pNMr4IYt8VfZCQRGoblz7rzAe2rvwDNV3Ki5A/kF+ANV6+Z
	6S5CfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08eu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 15:46:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so26187135ad.1
        for <ath12k@lists.infradead.org>; Wed, 29 Jul 2026 08:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785340004; x=1785944804; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FRVP823fAAcox/ry8BPkjj9sFCNNH0Nz4PJFbK8Qygo=;
        b=QVqDL2Wb4Cztis5wcCJnGKLkBA6+froh3GKSK2X2Edt/FQAXWhczVHA6W+dU2ZD1wJ
         xvFVAqpGh8NlTlb9t9N/J7oB91pNMvU9wp5hfqVh3C4kb6/wVUDauhq/8j5hFM38nZ22
         S4Bv5naPERSr0EKpZ/Joobd5TAmcaFJTTX3vgYFhql9v/cAZdR3CAXv/E2cOEc7Zadqw
         ByRqKh8XsbjpmUD5cDIOiRwoTX3Q30phVxasfksChu3NZqGWnApKSYOI7ie18VJQppgr
         IaPNoX3YliUBrCsYN2XqWfjT9cxxfXr8MrdBW7E07wCPm29s+f7zrTx/gRCwYt0r5/Xh
         5nTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785340004; x=1785944804;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRVP823fAAcox/ry8BPkjj9sFCNNH0Nz4PJFbK8Qygo=;
        b=BTMAfRxqhKkd24mioWd+iEyekEhGrtQLAXoyZUe/DPnJmm8vJgAhhKqq0QjG1TwLVi
         xetVqdNOGPMZEZV8jFSUOQRNOlbxpBYGhMxPKMTLaI7l2PSKoaHHEdL8cIczFQSb8UMq
         EbyU/q1iL3dTdCffAmPJRd2QtUNWBcZ6sBNsQfgG7xuIdU1+FPiMgOoRabKUloFoHlVx
         3GuOjQVYXzFcqrzU8AP5cVXl/GHxd7uoSCkKx/cbfx+RZCSWegFQGJnYCYfuaxU8JtlY
         8lSZ39m5zlE+fXI0+UYq1o0ow/b2MvhB6utr+111Awtjd1CxmFaQmqNdyPUsGjBfGLoG
         Z2yw==
X-Gm-Message-State: AOJu0Yy/KO2By6jFDtjc8Jp0elpJ2ujXPJYOXFIoO8NfxEocZP0TWxbR
	70tHSruEtT1UbpWGo+KmxVJYz9kON1yZyPBPbX/EaBzPzjMkHuyCpDd2KHIezv3yt2A2g9x8KYZ
	i+OqK2CgmjUGMM7TCMWJeOXpIfYkN8Xwrg8ATpML4r+O4TNFUwMe42HzA24J/5SOJvteqDpNm
X-Gm-Gg: AR+sD13Rvz2o11OyC6x1jmTwViu9RtKCLpmBxEETZYHbKnaINcobpTQciFyQxxBg09w
	6yrOChAwRWd+kdBQPmNA21DJ+whSRAM5kvKAhW2cpUXiQ0czcmTjl5Xl1b/do4t02uQpJHosDnI
	uHCPMTwv2bjEI/KBop8TFU6K2CHBe8wmXFt2pNQDhDCwv6UZ4H9hF7NYZWiShmc8FxYCmBFGg0m
	4sAEOtwvpv8f+XE6dmaPFHBQJJvjuxyzlQiklIOthx5PLAfb5UaeIxfozKrMqnWFk7swFtjTZvZ
	GQY1Y4S2dUx/kcuZ/nwSW4lDsB5HnTfjK4gRuYH2vRsugHs82oTow3K0gwxuBpD54YEOuF0Xa86
	hsF+7R5EksUQ6sTmUO2qbzeCus3llwHtcoaqDaD9HC70cXtn+ingwFQ8=
X-Received: by 2002:a17:903:1a8e:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2d015d46125mr85548085ad.22.1785340003676;
        Wed, 29 Jul 2026 08:46:43 -0700 (PDT)
X-Received: by 2002:a17:903:1a8e:b0:2cf:b066:7de2 with SMTP id d9443c01a7336-2d015d46125mr85547825ad.22.1785340003301;
        Wed, 29 Jul 2026 08:46:43 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a76a5bsm13577185ad.35.2026.07.29.08.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:46:42 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
References: <20260726-ath12k_wmi_process_tpc_stats-len-check-v1-1-c4ba2f84d9c6@oss.qualcomm.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: validate TLV length in
 process_tpc_stats()
Message-Id: <178534000184.2826154.4421935426388447838.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:46:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfXyvWZgbhcerMi
 zlpjUQ23geKViGP+URQqebHRlcEM5wk8+UAbIHwGnuzzYHGXdEupl1ZsEcZH402tR/m6ufmHT9Z
 afrYC/ASgeXWyAS7iKseudE+KktV7YGBDgwLnG5i+80TQ/k6RgfxnTylxwPO5vb+M6De8MXNIJZ
 drJ2iKaxJnkopGHrsoJAgf15MPiCzPXGie9MVQfI3burxW2LABaOXRafbfaMyXw60r32JPGYj3l
 TDtEz8J1B5lar9Kxvui2aZ/6BGwWx0KWuCzEHDozNHF5RpXVg8BM9sN2Th2p19RleczbnrEHcY3
 DB2V1axEeH1aZLpri2eD4xpp2QzFsNUVTdE1iuecbFmT6NiBco58hW5rKxsD/zS9I/tZo/4syEi
 hI+0xWkfPB+gugK7vkdTOBhaMRa29ODy/R5Lw1tXyp+/U2nZG/qfL3hXh2CkIVGaQtRyJWqPSsY
 qbsb1026ZnwLK6UJjLw==
X-Proofpoint-GUID: DemCIKUqlTdbLYvvPjE89gpZTqMcb2M6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNiBTYWx0ZWRfX1nJdpd1J/CDm
 c+xGCHumIrfriHvmky9VLbxGMPsiBmoGawgzGxQe2kFFr+31v2t51VSkaW+OLgHnofn+gnTNlaw
 a/99WoOgfMILOSsVYK7rY63fgWsC9QE=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a2064 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=oNZ9Jk2e8T8Wm7Im8qgA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: DemCIKUqlTdbLYvvPjE89gpZTqMcb2M6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_084644_769014_C68DFF36 
X-CRM114-Status: GOOD (  10.55  )
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


On Sun, 26 Jul 2026 16:02:07 -0700, Jeff Johnson wrote:
> The outer skb->len guard only confirms the SKB is large enough
> to hold the full fixed_param struct, but the TLV's own WMI_TLV_LEN
> field is never checked. Firmware advertising a TLV length shorter
> than sizeof(*fixed_param) causes reads of pdev_id and event_count
> beyond the declared TLV payload.
> 
> Add a check that the TLV length is at least sizeof(*fixed_param)
> before casting and dereferencing the pointer.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: validate TLV length in process_tpc_stats()
      commit: 8e415b8068480d51a057197ded974e2637e8c42b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


