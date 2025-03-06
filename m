Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FECC28B23
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 11:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjXUleZqTEfN/C/LZajGZsmaBHaz6JmQbcU3tNgRJJA=; b=jK1/6IhJz/zgaZfCzsTklvNzuz
	8o9HJTaDfY3gj5LozaFWBAePXORJFU8j3gxzYs1qGbK/6y2x1/5TZA8vTC/N0v8nCG0xc5bmQZVA6
	/mEHNG10Ip7zyb8dnaUsSuW19qWhygRDi6iUWnLY1IO+v4GYbJ2hXQlUFyzeTXDAQiVVgrh0LM4yt
	9uTO1gKhS1xiE4IH8K37NdsgI4VR9LmWyXQTQ1v9Rd+GugsaRi/6pyWD5HB0f2u/CjFUMqLruVXkU
	ImeR5m26HMZg0dmlImhWDw7EMmZE7i7VcBhQw6a1ud13APXaoiTsCUzId5PIh4/UsgzTI9G0FGFMY
	MIjq2sVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9UC-0000000AnKt-0u2F
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 11:33:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NR-0000000AdiB-3eQk
	for ath12k@bombadil.infradead.org;
	Thu, 06 Mar 2025 10:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mjXUleZqTEfN/C/LZajGZsmaBHaz6JmQbcU3tNgRJJA=; b=UJfOe4cy4NXfB4CHTM8IDcQdXY
	gmppNhy7jd4gwE6V0r4bdYtHOEDuQxllTOaYhEl/NKChHC/RYLtui68vszIZ1FzQRZWk9bR6DajIa
	3kSd1FOYxKsTFt7TmRc7m+ZiStW661QRwiBwMCinefcnts3xA+Yrk3UfyQWL2t2ZyhtFk3vJ0bMtP
	oaq8vY/3vkEOz/CZoLJEE9E8f9LK9btTvDfpT9q9uYWpjFWScU7gV/uOBbjBDvuxL7RkgcEVyU7BH
	/9qt8ENsDL7kPl/SgyYQ7kK2tgDkI4A+jO9+PKiTh486C+WKsJ6S3SVITDYGy5uqDcpudLYxLUM19
	MZpRFAuQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq8NO-0000000114f-3vBj
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 10:22:52 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5267mBw5005358
	for <ath12k@lists.infradead.org>; Thu, 6 Mar 2025 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mjXUleZqTEfN/C/LZajGZsmaBHaz6JmQbcU
	3tNgRJJA=; b=JgoCirfNa3uM0clILZaZI1sU6yr8pf0wqVIC6+qZcm3uxd/LD40
	T82JWT8DWaAjtbB4re2fWoq4iLtyxjmmlickcOjw3SbW7C1NV+MMLlyEM+9WPXfZ
	Nz6M9ntUSXoNx6RxqgKjPE0ETxlxKerMYPArtnltElfaIXqrGNvqXCTj3x5WN1e3
	+et6d4vPfjTwmc0vL/U21dX7nYSTJtDf8VVzMW6CDU4AyBaKtnhGVllfM5jJoUw2
	nsiMuYhzmW+NtyOOSVBaaHo18TmlAAvSKL1FkbX0csQPEG/FabX8gTY0xtJaHOAX
	iChRaTvmf+mLGiZejN/LEVNXoCsPXMVaylA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4577mx8ej9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 10:22:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2240c997059so12931645ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Mar 2025 02:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741256548; x=1741861348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mjXUleZqTEfN/C/LZajGZsmaBHaz6JmQbcU3tNgRJJA=;
        b=MI6x9E9TPYWKrDy7UoRwOuUfeepyvdT6zmTKQT00WcnW0AXEfjGUzCZ/QU3FGA4hk2
         +BzwYrPWLjzxA9dZAIlRwxPBwuKIX45nQuZWG6Y6RdbKlYGJoqRmQB3S5oJW6XHxc9UE
         5d8uIrBIPaPWaQe1ImviUTvLpUX5yFpYHU29MVK7ZnBF6R9LLplbKMdISm/xATpq93zZ
         EgyWMmSa5RosU56JJswCWV6j6hOPTpF01+5zMwH7Sn6WdW3aM/kFZXNuPQZgbJkGidEE
         Z3BbkUOGO8H04LU34VSyOEQ6ba/4BY4H3dmLStjoRM4laHJTCCCrCF3jWzijfyvJZ1nM
         RnfQ==
X-Gm-Message-State: AOJu0YxuRdy/s24NgQnQJDV8vNvGAWnasH9oKp8PTtuAZjC+sBIPTgAZ
	E3IjwH9o5/RPoNvhkGzD2yuQwx5FH+36YING/6z1GycjhSDJ+H4VYPL5OKZArm14c81klhx65Xd
	75Xew7pVOYlJ7olVIhjQRcakmmNApJ0FpNsgoBoc0ndvNMveNwftfFQLFfl/tsFms7mMi
X-Gm-Gg: ASbGncsluHua/lB79o0YAQUzZOws9LfNGSN2yfkA+Psr5FygHNHI3Yo0Ok0kF9o3WzT
	OkRmG5V6QQHz/mpsYY7+nldD5I+PlYDK/d/wHKVtcXriu2mAT59P++bSM/kpIL6KjM5Mm5V8Qio
	7aQL139NFqpbuCwTyKzBxbdjm5+OTrKN76smzid7P8oWnQFKgX7XXRrjV7o/GeXkbi3vOgMVWet
	LCKCtsGDp2l9eC9GLUiuct6h0EWp2fLlnMEplH+vi0A4CPgj8YvwOQluNcrXriFBP43EKh8kdgi
	79k8QbL4J/QriBdXSVr571hzfB+UmFUCLx+QPZIja7D3+OAl0E5lXD2g178O4kDK4/KNUHSaRy8
	ZBJTIXp/2OKRKPhiGm5fGoFp6VYjVoCg/uC30Nfwn8ekt
X-Received: by 2002:a17:902:d511:b0:223:fd7f:2752 with SMTP id d9443c01a7336-223fd7f2b74mr77536125ad.29.1741256548683;
        Thu, 06 Mar 2025 02:22:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4kzypG6Kp3TpQntY2VNnfIigwepdapNs5G/uuxifg0RFmeMQa9GArBvqIenvxk+GgKCmouw==
X-Received: by 2002:a17:902:d511:b0:223:fd7f:2752 with SMTP id d9443c01a7336-223fd7f2b74mr77535655ad.29.1741256548261;
        Thu, 06 Mar 2025 02:22:28 -0800 (PST)
Received: from hu-ramess-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109ddfa6sm8814785ad.33.2025.03.06.02.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:22:27 -0800 (PST)
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Subject: [PATCH ath-next v3 0/2] wifi: ath12k: add support for get_txpower mac ops
Date: Thu,  6 Mar 2025 15:52:13 +0530
Message-Id: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LRB4Ssoc9H_nIQ1uaAWWi8M8ieOagGyD
X-Authority-Analysis: v=2.4 cv=cOIaskeN c=1 sm=1 tr=0 ts=67c97779 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=Vs1iUdzkB0EA:10 a=PGcRVBYcp0WH4tafFE8A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: LRB4Ssoc9H_nIQ1uaAWWi8M8ieOagGyD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_05,2025-03-06_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_102251_316653_9E99F5DE 
X-CRM114-Status: GOOD (  12.04  )
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

Currently, driver does not support get_txpower mac ops because of which
cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
gets its value from ieee80211_channel->max_reg_power. However, the final
txpower is dependent on few other parameters apart from max regulatory
supported power. It is the firmware which knows about all these parameters
and considers the minimum for each packet transmission.

Firmware reports the final TX power in firmware pdev stats which falls
under fw_stats. But currently, fw_stats is under debugfs.

Add support for get_txpower mac ops to get the TX power from firmware
leveraging fw_stats and return it accordingly.

Also, move fw_stats out of debugfs so that get_txpower mac ops can
function properly even when debugfs is disabled.

v3:
 - Rebased on ToT, added tree tag
v2:
 - In PACTH 1/2
   * added sanity check for stats pointer in
   ath12k_wmi_tlv_fw_stats_data_parse()
   * Moved ath12k_debugfs_fw_stats_reset to core.c
   * Removed ath12k_debugfs_fw_stats_request() and reused
     ath12k_mac_get_fw_stats() of mac.h as both are serving
     same purpose
 - In PATCH 2/2
   * Modified ATH12K_PDEV_TX_POWER_INVALID to hold u32 max
   * Saved power in dbm units in ar->chan_tx_pwr

Aditya Kumar Singh (2):
  wifi: ath12k: move firmware stats out of debugfs
  wifi: ath12k: add get_txpower mac ops

 drivers/net/wireless/ath/ath12k/core.c    |  53 ++++++
 drivers/net/wireless/ath/ath12k/core.h    |   5 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 112 +------------
 drivers/net/wireless/ath/ath12k/debugfs.h |   5 -
 drivers/net/wireless/ath/ath12k/mac.c     | 188 +++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h     |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c     |  99 +++++++++---
 7 files changed, 294 insertions(+), 172 deletions(-)


base-commit: 3148fc3cf193dbbd2e14eee59468a510a38bf604
-- 
2.34.1


