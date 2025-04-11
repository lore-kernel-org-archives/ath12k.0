Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235E5C369A2
	for <ath12k@archiver.kernel.org>; Fri, 11 Apr 2025 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oJ2TCsE35p2j37jzKpl48esGLYtNeNTDcByvcDQWow0=; b=hCcFtkiQwrVY9dok/9ig17Kwrk
	jf3J6toQGxABRzT9lqGfk5W7JVRRZ5OU5fBqRt1qdt0ndKzX2kyJidiG7V0LR8KwE8xyJ98EW2dkv
	jMwNC97n+RHYtS2mtfP4v66UoyaIqmaAISMHuDQMcfvmDl17bNVZBqcFvrXNU+3RMBuwmWIiqT4zU
	0uV/lAzBAHq/9YyNm/+mczGLglowrFcgo/MJqQH2Jwk4tDYWRc1Cg6aIPHfuTjWM8VPtIOUeczdvY
	wcsJS9hOpQPIJvc9xjhkqeIUojmY2j5BzCve/DbrDa8hIk60Yoc98YTsamcjGag2EMVsG4BfXjfGl
	j6u9exLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u39yn-0000000D3zR-3moY
	for ath12k@archiver.kernel.org;
	Fri, 11 Apr 2025 08:43:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u37Sy-0000000CegT-1CCO
	for ath12k@lists.infradead.org;
	Fri, 11 Apr 2025 06:02:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5Z4pm032024
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oJ2TCsE35p2j37jzKpl48esGLYtNeNTDcBy
	vcDQWow0=; b=n46d3/OzYVW/w9oAmBILFh2ueCV1HM4Yp2u67BjAHRCI43VhvFo
	y3KeTXF6R49A44EgkGFpdSBWQ2VLvtZ/MOxRWJ3DmrPFn8UlHzOtql1nzg/a3QCD
	tlg2wnipIuUxBWjHz103SmyFOOo9jeVr+vUQRTfpyEZ1RO2s0OYE2qaMIbsII4Dj
	QNixESrPnrXuxPqvmStGzArLxkGWWsfNi57/FkAhxtQkaBkm0LO4tM/QbSyxaPkl
	cbBN8lwfVpiAE3x+1J87dArWSvAvIBHXCwZCN/tcr3IbQ+7uAHJ+r5a+/vYy5m6w
	O5NBz8sPMV+BnL+Qq4dh3i78DgfFOKjl3DQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmh927-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 06:02:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7398d70abbfso2093555b3a.2
        for <ath12k@lists.infradead.org>; Thu, 10 Apr 2025 23:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744351333; x=1744956133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ2TCsE35p2j37jzKpl48esGLYtNeNTDcByvcDQWow0=;
        b=vFbWIX2ldz9gZWxjySc5+MxENZcAmbt7D9L8DDaqmK46GxtXAMPwVFU2t8Fwor2ZAC
         R7JKDvtA+wcPtVRdSsISlACUTz6mmy4AbXFh58i31cLNL9FbtMzVSf2Lon/lZGgakhSl
         nDdQcI4WbFYlHedFP9EhzN0Q+PhBPsPZ4ypg4oQ0dd4Kab2/3uZhg2oqWBcjmB3L9nIe
         uCQyFoHV28aKsIdJw7msrueNQLcA1zmi1ISFvcUvo8ssy+CIycj3RK0u1jzwl+8KEeNQ
         7TpyDz8iNhqT5iNxIZG8KNomqpx3/NAlFz4NJiaEVLU/u99GCAjE4coYoX3/IriHEXo5
         LTTQ==
X-Gm-Message-State: AOJu0Yz7Bb4Z4sdZ3lcdbb7k8nJhWsfB3/OBObhCG0L/AzIr/BbNF4RJ
	7sbEiZ2oI/e7ibT3dLKsgkgVSFmACv8oJYo1tDEL0rszzYR6xnduFaTH3iIq9Q5ZAzgfulI7uMa
	2hzsQNjzTIQE7kXCEWiR1otok3tSKAWlnh62f2FWpEZ/XpXwrMVta76dm2Z8LGpnYU2Al
X-Gm-Gg: ASbGncsdFoUQdsJe69mhYjxQSRx7Cznpk7QgCQfNuPWDJL/7+qUMviZE5ltg3CNh0lE
	XHwG1Bd6tQstJcu7LojILdjvN1cVBBM2btOzKrdxMMeWq0E2qWYDlgFjoIGAFE66s5GieKkRyQc
	rP1mldiLxu9R9osKBh41JMxj/GM0p8mq4r9JqM0XMpE5pwzdYSv2X9/yaZaYpShpV2igC656e/k
	EeenvzaJXNzBrMd/QRievw6rEuCUSwGd3crKZBTsai+3Sa8BoB2UoCNriw4ZAcHg3e+kevDJBZQ
	hkhB9uctKSKqUNcny9SL8squSnRcyrQ0+iLu0/rLI08349GJDeiYsrCx6cd5r7yugGQPYixTE5k
	TnrWwbaouoLH5KPIUTbhN7A+ef7/QNg==
X-Received: by 2002:a05:6a00:3cc2:b0:736:bfc4:ef2c with SMTP id d2e1a72fcca58-73bd0e8f5b1mr2013844b3a.0.1744351333333;
        Thu, 10 Apr 2025 23:02:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGAW7IWT4c0PXDvp6hA/y1UH04YsR2/mzX9OciQ15+3OnUM35y+XJiKJ88EZCQMq9QdHob2w==
X-Received: by 2002:a05:6a00:3cc2:b0:736:bfc4:ef2c with SMTP id d2e1a72fcca58-73bd0e8f5b1mr2013770b3a.0.1744351332618;
        Thu, 10 Apr 2025 23:02:12 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2328435sm624567b3a.157.2025.04.10.23.02.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 23:02:12 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next v3 0/4] wifi: ath12k: Fix multicast memory leak in tx path
Date: Fri, 11 Apr 2025 11:31:50 +0530
Message-Id: <20250411060154.1388159-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DbpxppXUp5qtEH2m9XB4a4zOKC6oYmd-
X-Proofpoint-ORIG-GUID: DbpxppXUp5qtEH2m9XB4a4zOKC6oYmd-
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f8b066 cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=18hAiPG3HQP0OPlRAisA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=599 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_230216_326382_AFCAC7E5 
X-CRM114-Status: UNSURE (   7.71  )
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

Address the memory leak caused by extended skb allocation observed during
multicast transmission in this series.

---
v3:
	- Rebased on top of TOT.
v2:
	- Rebased on top of TOT.
---
P Praneesh (4):
  wifi: ath12k: Handle error cases during extended skb allocation
  wifi: ath12k: Refactor tx descriptor handling in tx completion handler
  wifi: ath12k: Fix memory leak during extended skb allocation
  wifi: ath12k: Use skb->len for dma_unmap_single() length parameter

 drivers/net/wireless/ath/ath12k/dp.c    | 10 ++-
 drivers/net/wireless/ath/ath12k/dp.h    |  7 ++
 drivers/net/wireless/ath/ath12k/dp_tx.c | 87 ++++++++++++++-----------
 3 files changed, 64 insertions(+), 40 deletions(-)


base-commit: 1a7000fb8348e04ab486513d6ebd4b6074a94be2
prerequisite-patch-id: f2cd6035cd8769da70721efd8354cf8131edc926
prerequisite-patch-id: 08db299a9f0375f556005283219456e1725bc37f
prerequisite-patch-id: 15f3b1e458a979254c34be57e7449bbc05febd7f
prerequisite-patch-id: 8cf261ae105d066b527e467ffe24b4372cff0b3c
prerequisite-patch-id: adbcbd1770169e05e4d69c7ad86ff644b22f2c54
prerequisite-patch-id: 43e5c01088694110a0e528ee709d5d2ae2492f99
prerequisite-patch-id: cbabcace5dfce8d0f72e9c4061c0b9d43178ba81
prerequisite-patch-id: b21a6dec4281f6bcf49681b9add2ea41de849dd1
-- 
2.34.1


