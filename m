Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B736EC28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JlKHU2/TUa9+D8iRdr1kav334eUDJN9+DsDdTgSyiy0=; b=Yv+yvHf1ndx9RiGUrKOuSZ1il5
	AamTTo2jjKW6PXRLJkY6FRhpkXMcdaFzrUCTZRSLenMCuUJvPxVqWJeuMCmWrXc0gKzA52U8SDR76
	2JE+MDMdEWkk5kzW9sW10V7Xl8Lz5tejIAdG7kOrryiGn2h8WFWSoK7AJHA5bwnyljdVitrw/dqT2
	4A9xCkfqAIs8/60fXcrDQbhdIvdAeiaqnRQ2ZZhUa8l2vUbdVcUjHWt8xxU62xihGUO/IAjWSr7uI
	zn3XavIz1hW6imziGyGKNR+C3fDnX1Ge+5UZGPSPTBwOJLAkdHAq7jvl7o3vShHRCskflgsMdap5o
	zH0DfSRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0257-00000006nZk-1i9E
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 17:40:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0254-00000006nZ4-1h4u
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 17:40:52 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532BpsGN007206
	for <ath12k@lists.infradead.org>; Wed, 2 Apr 2025 17:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=JlKHU2/TUa9+D8iRdr1kav334eUDJN9+DsD
	dTgSyiy0=; b=JcZSo2g2gZIohGKfkFiiI/9h/mT72xJkTnVBxMdrg/1gayJsiMm
	EET2gd9Qm2/OaPbwvjaY17dL7Zf7TdqxWVM/DG/c9U1Cavw+vYDglj6WZgWpPUyW
	7J76xGpw3vsmSxQoDvVui2+0krvWZcEiOT18cpk9pROlOFGUZPmo8Ol91h3i1rQZ
	NhsQBw5sJZzLVFC9eTB0y7Qu/L8pYsAfvwA2yiodWuyze0aT5BL7XNqa7MoKL5O9
	B0YjwjZxsbaxtoL9bkt+NlDGH6kK/Fa2YdUIGK1GXKwaXND4LFJ5tUhY+DckBZsP
	mwjFZglOX6zKkBxQwN2KEHfPr4iBaIhay3Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rh7ym4j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 17:40:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2242ce15cc3so896715ad.1
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 10:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743615644; x=1744220444;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlKHU2/TUa9+D8iRdr1kav334eUDJN9+DsDdTgSyiy0=;
        b=V9d2oq2sSqQeMMtcQme6Ua1WC77VqGoto1R+/Vr6Ik/Zo0L8aKTMMOkxLo8lawfIV2
         oAemUVFXDu8AUryXVXxtSHRcNWhSieeY0DC8/VJtkf4RaNCbOzDcV2Suern3kGWvSq+n
         X9W43z6sEuZnSDZIlHgQWWrjpxFLVtye2DRXRDmfm5MzpZehJF1QHW1OEsnnI+A9QjH9
         jrUzIewZmiXILoYouGTdbuqmCtw+3okG7a9gJgCx/xIeBp8GjgmbsAJtEgDojeFdPsJT
         QsMQHyZt96A39BtoLx3TsXotLRFX2HIYynrolUn6OIRXTDstdWa+Iw4/MSeXLX84P178
         HsmA==
X-Gm-Message-State: AOJu0YwDETtnmGeXQPBSJJ/W1sKyQlcPAGmUiMsJvXM9RRGB/YKX65wE
	DIgn/iWRlq+gIJ4nkBtbaeShG6edFd9wM2L5r1l+d76Menxd/aaUXs2IqhzqA+bbuDUmbP9FmiL
	m9R51TdxtH25uJ3VgUR3mfkN5+T7QkSClk7nw8XUr2Z3bu/iA5VO0yZ9bFv3hkC+UJemb
X-Gm-Gg: ASbGncvQfBJsAeA5JGhdBwvOcLOlX1uux3lu7RrL9og+70dVQ0Hj8g9E2wlE1Ey/fzy
	hH296142iqZVrQ8VkT6WtUF7mLjMPQn7N3O37+vuPccjM64bjmDh0uFOxWIuY3LTcuRoi21VKIT
	vUiPSUy7qN1fQAApwaK7cT2HSt7Moq9zQSp7eUixBfy3p0FnBDWXtTqNagzWxayn5QiI8vXLwgu
	vZ4KGYptoYxTA7YCeWTOpmKw5A4GTLP7nV3jaG47Y0t/Ti6NfEIBsKaNSg93FUefXbUgXj9ln62
	YFCu1isLW5q9Vc38WD5A5QWMHJ5s9JfIXSaMVh+8GMKJQpo55gFCI/0J3XNk0kOXN/QKcdh9eNz
	Yd+u4OZu0niBKGBPsTQnBy9GOuxyV0LP8Lg==
X-Received: by 2002:a17:902:da8b:b0:224:2a6d:55ae with SMTP id d9443c01a7336-2292fa028b9mr251921435ad.48.1743615643935;
        Wed, 02 Apr 2025 10:40:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbhl/rK4DR0thjK2YCbyuMDFzwjSnm9zjq9KVnDpPzHZ0Of6yFS1mesY18ojgTn5yM8dDcoQ==
X-Received: by 2002:a17:902:da8b:b0:224:2a6d:55ae with SMTP id d9443c01a7336-2292fa028b9mr251921095ad.48.1743615643459;
        Wed, 02 Apr 2025 10:40:43 -0700 (PDT)
Received: from hu-ppranees-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7ccdsm111510425ad.239.2025.04.02.10.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:40:43 -0700 (PDT)
From: P Praneesh <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH ath-next] wifi: ath12k: Fix memory leak during vdev_id mismatch
Date: Wed,  2 Apr 2025 23:10:32 +0530
Message-Id: <20250402174032.2651221-1-praneesh.p@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IYWHWXqa c=1 sm=1 tr=0 ts=67ed76a0 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=G60vcV2tWwDvXW3nvSsA:9 a=RVmHIydaz68A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: dvA_PlQYNfQFEDdhWTos2Q8puHiR7WgS
X-Proofpoint-ORIG-GUID: dvA_PlQYNfQFEDdhWTos2Q8puHiR7WgS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_07,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_104050_655696_2F7AFB26 
X-CRM114-Status: GOOD (  15.72  )
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

Currently driver enables vdev_id check as part of the bank configuration
in ath12k_dp_tx_get_vdev_bank_config(). This check ensures that the vdev_id
configured in the bank register aligns with the vdev_id in the packet's
address search table within the firmware. If there is a mismatch, the
firmware forwards the packet with the HTT status
HAL_WBM_REL_HTT_TX_COMP_STATUS_VDEVID_MISMATCH. Since driver does not
handle this vdev_id mismatch HTT status, the corresponding buffers are not
freed properly, causing a memory leak. Fix this issue by adding handling to
free the buffers when a vdev_id mismatch HTT status is encountered.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c    | 1 +
 drivers/net/wireless/ath/ath12k/hal_desc.h | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 29e2715024ce..b93669348f35 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -586,6 +586,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_TTL:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ:
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT:
+	case HAL_WBM_REL_HTT_TX_COMP_STATUS_VDEVID_MISMATCH:
 		ath12k_dp_tx_free_txbuf(ab, msdu, mac_id, tx_ring);
 		break;
 	case HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY:
diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
index 3e8983b85de8..63d279fab322 100644
--- a/drivers/net/wireless/ath/ath12k/hal_desc.h
+++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: BSD-3-Clause-Clear */
 /*
  * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2022, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2021-2022, 2024-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 #include "core.h"
 
@@ -1298,6 +1298,7 @@ enum hal_wbm_htt_tx_comp_status {
 	HAL_WBM_REL_HTT_TX_COMP_STATUS_REINJ,
 	HAL_WBM_REL_HTT_TX_COMP_STATUS_INSPECT,
 	HAL_WBM_REL_HTT_TX_COMP_STATUS_MEC_NOTIFY,
+	HAL_WBM_REL_HTT_TX_COMP_STATUS_VDEVID_MISMATCH,
 	HAL_WBM_REL_HTT_TX_COMP_STATUS_MAX,
 };
 
-- 
2.34.1


