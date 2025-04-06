Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A57C3600C
	for <ath12k@archiver.kernel.org>; Sun,  6 Apr 2025 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D8NIhl8RiGPqvmTbq49KwxZpuxvM1Pwnqgqoar0qyI8=; b=uD6vRRX15BkQ2r1qzidi0Sauys
	wbw6nmHjXW05R8CnWl/NckRe4cqT7IlsYVRLN55dlrH6Sm7tpYQr7opApss+cmR/e/V4quqY/4ohB
	yiXvrJx7XhtA7Zm6YeUvy2BrwEcmnBmCzaQjR61ZIPqD5mHEHjLqwQG2QvGQMVb4/VsCygSHX4tBT
	aQOO2692/jaC+mHTuNNDbVkiZV0Dwcb2JRinqH4ZJ5zXkjAfXfJsMBzp1PAVUx3kO4Bi3PVVF1LIO
	/Kqsk+y2Uftvc0srqQUvsYqlpMHbMeaBSfZfT5rhtWLQpowJafe8uV0EkRpIcR0psXAAH6sqgybeD
	s71HNcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCx-0000000F78q-0Mmq
	for ath12k@archiver.kernel.org;
	Sun, 06 Apr 2025 09:22:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1MCu-0000000F77p-36oS
	for ath12k@lists.infradead.org;
	Sun, 06 Apr 2025 09:22:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5367N2eQ010983
	for <ath12k@lists.infradead.org>; Sun, 6 Apr 2025 09:22:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=D8NIhl8RiGPqvmTbq49KwxZpuxvM1Pwnqgq
	oar0qyI8=; b=YVvGt+B+IglXYZL8zCwvNDAL5M0ABPSRA2WULzlDiC3Ezh6t4s9
	KBQqol9Y7i60jadBO/+FJSAneuM3rcWVlaLhezRjgvrjC7W2tgHsCHlcYmu7v2kz
	tBLz6S+Ipdj/JSKHY7yL7XknICfjGTZAoML0nN07Pmogc08gVJKTGRlmwtWIFR10
	5XFsze0vKHSZyjay0FO9vhZBGFJtax9FL3xoIryjX6JR7N0Rb3iqVERsRydysEqF
	+AjydwbBiTNfwC0MnKQAn0C9JaQtHv9ctjIX/+LN6nriGW32re4IIUuq3D0TAZk+
	YUptZGDEWFi0fc1SsJFG/qG74jRstbKRGbg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg39nqh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 09:22:21 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-af54a9109f4so1272865a12.2
        for <ath12k@lists.infradead.org>; Sun, 06 Apr 2025 02:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743931340; x=1744536140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D8NIhl8RiGPqvmTbq49KwxZpuxvM1Pwnqgqoar0qyI8=;
        b=JP0oIiCgp+N0sy3bfBZckYjhatOZ+AKr3kD1HMrGWiE0rceGbjupp3TAr2zXr8jqjE
         TVNIATFEWSN43LbKz8zI9rVeAZzV6gEopNGM8/wEEVXYzUbkFTgfJMO8WuYf0ZtxxAr8
         b8URYRxnOI3wETz9//FxigaFPKes9Pm+IuWYSohwxYQdTLv7/vnWnYev+cmuz5ksva1w
         qC6oa0+MKd/jnAURuG6PcjJZY6NivLTrdDdoN8i350MZ8EpXVjVYioOxpGTqGWC3y4fX
         AcpMaDWTgObUhBPt1uE9X57NIUAn1spRG3N2WLiPZIMO4mtRSXnYdlM/gSKE9Wq6dhUf
         f8tw==
X-Gm-Message-State: AOJu0Yx7ff1Yp6+32p632TUskvr8kBsiYunRkdlFPSTrimmL3T7OIBEp
	P7vMUoe3BhQEeqUhQmTg6TeKlVMo6CYv/8VzaN48g7e4R0ELZ2LC/r36OrT1c9AjnYyOYYcxGIL
	7kCGI1h5KOfZBz4fa/OhdxW50VE6P+55mfo8Gvy3rvc5omjenlmuXEciYr3zl26uCjDLS
X-Gm-Gg: ASbGnct4xz+LgKuOg3Gp1rNVOgCE0uX8xzuZPSQ+UGuy8lvAtauBQgypZ9sNTrLi5FY
	g8KdxDnr9avxytVQgB1vyPTv4k3YPpCBuAHOFkdk34b5QoSmx9vNDiSDaW39cddAG40BMGJddvh
	5WzeeugroWzApmVZiEBmFBScOMmLrZPA4tzai7/6f+IHeSzKzOEQd+GLMWRPGlJHAkcI+DpPJ3Q
	1vtAfqhQAL4+opx0UjptbVUQ2gC3xF/4k0xrA85dpOjrvqwAtuhaF7cL9IwLx8gTUyrS3sWNS/3
	2AnTg7HzEzCUpr4QXgywcpN2PY4/qwvKMbYgVZsKoX+yR2k5TzVRCIhCM6BEeW84/s2ZFOA+GyL
	+5sVzhHumeS57elioMyTNAtzkJnOQkq7Ia6VG01pMniKE
X-Received: by 2002:a17:902:f541:b0:224:23ab:b88b with SMTP id d9443c01a7336-22a8a8594b1mr99055535ad.8.1743931340389;
        Sun, 06 Apr 2025 02:22:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENTWoJbSRuOi2E8nXYcMKsJqRxMRlY/R9s4FFf8M2I3af31vRVESQ8We6BaWaHFq2GjRwTZg==
X-Received: by 2002:a17:902:f541:b0:224:23ab:b88b with SMTP id d9443c01a7336-22a8a8594b1mr99055345ad.8.1743931339947;
        Sun, 06 Apr 2025 02:22:19 -0700 (PDT)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5e75asm6857311a91.37.2025.04.06.02.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 02:22:19 -0700 (PDT)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: set proper key flags and MIC space for CCMP256 and GCMP ciphers
Date: Sun,  6 Apr 2025 14:52:12 +0530
Message-Id: <20250406092214.3602182-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: bzXkYZXIlWNa_JkCnutqm4oB3UkWMs0Z
X-Proofpoint-ORIG-GUID: bzXkYZXIlWNa_JkCnutqm4oB3UkWMs0Z
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f247cd cx=c_pps a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=Hc_DSzY3qiiTP8U-yMkA:9 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-06_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504060066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_022224_913467_4F9A85F0 
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

Currently for CCMP256, GCMP128 and GCMP256 ciphers, Management key flags
are not set properly and MIC space is not added based on the cipher used.

This results in unexpected drop of protected management frames in case
either of above 3 ciphers is used.
Fix this by setting IEEE80211_KEY_FLAG_GENERATE_IV_MGMT flag for above
ciphers and by reserving proper MIC length for those ciphers.

Rameshkumar Sundaram (2):
  wifi: ath12k: fix wrong handling of CCMP256 and GCMP ciphers
  wifi: ath12k: avoid multiple skb_cb fetch in ath12k_mac_mgmt_tx_wmi()

 drivers/net/wireless/ath/ath12k/dp_rx.c |  3 +--
 drivers/net/wireless/ath/ath12k/dp_rx.h |  2 ++
 drivers/net/wireless/ath/ath12k/mac.c   | 22 +++++++++++++---------
 3 files changed, 16 insertions(+), 11 deletions(-)

base-commit: 12b93f7c6d101d22e0ea3bf4a240699746c79117
-- 
2.34.1


