Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B78C021AA
	for <ath12k@archiver.kernel.org>; Wed, 19 Feb 2025 05:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+qatjzLJftR5C9+14zG6XcWQr6f2xKe2e15fwV/4sFM=; b=AZHCjQaa32Or8GyGMSeSADx/vW
	Y+LIJ1rANJTLrUPyoB3Qm9VNuLW0d3ZP28IJ0q90mMSLZPV9n65voHRoD86u6CUmykMdYHOJyY8xr
	ayodWFbgYK02262sbx0hetANJy/REaVSakN3t4SCRIa3K1WpTWWPNh1CYP8Mg6XqqhOiWomJV2N+G
	P4E82Ax3aL2pp5HSqeAg9SN1tBhtTDpzXr24gVcfqCo1Py9PNXi45T1xmXlEKAY82xrAT226Me8qu
	4QNydrEtIL+5HF1l1yx0jKRCBwKAWd8kViLo5C3rT4qa5v+ZLHjFLA85noku787D/ajcwlFbA3T9n
	HLhJ1+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkclW-0000000AvrG-2Ymv
	for ath12k@archiver.kernel.org;
	Wed, 19 Feb 2025 05:36:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkclU-0000000Avqs-0Cgc
	for ath12k@lists.infradead.org;
	Wed, 19 Feb 2025 05:36:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IIwGkF025590
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 05:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+qatjzLJftR5C9+14zG6XcWQr6f2xKe2e15
	fwV/4sFM=; b=cp2qOnmL6qFJGfJG7TVZ1QftDBplw+KukpyYEsyRbSP2rqDAQob
	t+HP3LwD/MTv8xnGEK/VXaA8ySKYbQy6CQfvJ4RE0/dnHE2V0JIOAsx0OJnQ81l8
	S05dXfGa6PeBFqv6eBe6G+kfWz7uyMfIM/MCifDgxu9CMpz28Kt1IZsFIgybBoV8
	bJ/QH6QTMdWkwtGp/4ZR7QwzKFLcpH5E9zSgxZfJ0waa6UYtU0Po+nyrg/LmXApW
	RMgU5gBPM5AAA3mbzh4T6JPQg4xVZDVq7I6nfGNYjDUNLItsmrVYTNrWI2NAdbhw
	APNdpIePzatVW9WBwac8zYq1AacieGvW5bQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy0hayw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 19 Feb 2025 05:36:53 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-220ec5c16e9so104909405ad.1
        for <ath12k@lists.infradead.org>; Tue, 18 Feb 2025 21:36:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739943413; x=1740548213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qatjzLJftR5C9+14zG6XcWQr6f2xKe2e15fwV/4sFM=;
        b=kKcOOdfA0WkkofjZCHCdl1YE2r3RNaCZIpqjIMG+SUM/ZZ1E1EdO/mPhjy0OSModtX
         SVfk0VuG5aY99PW1isXjuxPSQvtrzOYeLSwzJgXCr6qJOTnCSx4BqSt/c/cKYPQH3MDb
         MM0EpFLFD/yIuqnJq5qB1+5ByQwatWjVHCqOd12OIAYKkllgaBBEphblkHq5LmjjvDfm
         KjpbMICPqli9VZCvMWWvu/dyPj49cfh+51lmBEsKk5sf1aob+xjePUp7EyX4Vm+yRP/Y
         6i9X9AOr5yLD9Mgb8YiqsYvn/F4C7UO7Vvs4FccjITfq7z4BpIsqIOs/2jy9k6xbgXuO
         Vjvg==
X-Gm-Message-State: AOJu0YzZ8q/hpcJzCIcy0jG7aBvDLpeIsWq/2pZPS1MYst2wqDZzgQjz
	EYk1eGX+DYGXbEtwgT9YgXRsC13T17xv1jr8TkuupgG+wbQVkwv9Dlz0Ip5CrVFTIws4g4lhkUB
	0VQukG6lbbF1c6FE90DIv0H55tIKa3m53Hr4fiQwQPlETpvDuG4tzi89zc1N2j04XcFKO
X-Gm-Gg: ASbGncvKsCpWDeyOlR+uqMsGxQ0CQoT9Fgv8kULWeWepEBNtPn6/StLNhaSJdC8avhA
	rlgzx+wJ8RNvo0C75h7GkA8Xos776F4J/Zf4Cunvx+K1AhuzpDGFxJOo/6RuWu5wqvDHwn87iP5
	dgExg+WeimSHkzov+JIj7cmbR8ou5h5ONrngMl5nSX1kIXPZ/urtCuz3a98pe0XBOcK/WGo7+TQ
	2ML75FIYshT6pTrinIEU4P1hPKNkmIuIlzA18xPgaMK3qlaC7WLgs6yATpRYvneYqZkR0gyvnv+
	bkTJ2B9cEs12LbBl3JLDM1rlkg3Geb34bx0h7POT9N7nPKP3K3B2jchc5G1ah2ylCrWmF4jMbw/
	BkCzxWeYiHSn7xNo8i1Kuxm4=
X-Received: by 2002:a17:903:3d0c:b0:220:d5a4:3ac with SMTP id d9443c01a7336-221040d7a6fmr253332955ad.45.1739943412661;
        Tue, 18 Feb 2025 21:36:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7vSWOoGuSQ75kPdzGnwwwUhItGPUkLL43lIEutmC6u7bUx5hF8bLSWis78xsuWNKoTSonNQ==
X-Received: by 2002:a17:903:3d0c:b0:220:d5a4:3ac with SMTP id d9443c01a7336-221040d7a6fmr253332695ad.45.1739943412173;
        Tue, 18 Feb 2025 21:36:52 -0800 (PST)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d53491dfsm97409375ad.3.2025.02.18.21.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 21:36:51 -0800 (PST)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: remove redundant declaration of ath12k_dp_rx_h_find_peer()
Date: Wed, 19 Feb 2025 11:06:40 +0530
Message-Id: <20250219053640.223734-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 4qM4zeze4sXpulfUibuijHUiOzfNqPx9
X-Proofpoint-ORIG-GUID: 4qM4zeze4sXpulfUibuijHUiOzfNqPx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_02,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_213656_092016_2D8319C7 
X-CRM114-Status: GOOD (  11.42  )
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

The current code in dp_rx.h declares the ath12k_dp_rx_h_find_peer() twice.
Fix this by removing one of the redundant declarations of
ath12k_dp_rx_h_find_peer() to ensure that the function is declared only
once.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.h b/drivers/net/wireless/ath/ath12k/dp_rx.h
index c0aa965f47e7..88e42365a9d8 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.h
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.h
@@ -138,9 +138,6 @@ u32 ath12k_dp_rx_h_mpdu_err(struct ath12k_base *ab,
 			    struct hal_rx_desc *desc);
 void ath12k_dp_rx_h_ppdu(struct ath12k *ar, struct hal_rx_desc *rx_desc,
 			 struct ieee80211_rx_status *rx_status);
-struct ath12k_peer *
-ath12k_dp_rx_h_find_peer(struct ath12k_base *ab, struct sk_buff *msdu);
-
 int ath12k_dp_rxdma_ring_sel_config_qcn9274(struct ath12k_base *ab);
 int ath12k_dp_rxdma_ring_sel_config_wcn7850(struct ath12k_base *ab);
 

base-commit: f22471c17f5849b2f20e2c56ec9fcd9dd8d5bf28
-- 
2.34.1


