Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30E0C7EE2A
	for <ath12k@archiver.kernel.org>; Mon, 30 Jun 2025 03:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zouhYTDahyyqlN7l7LkNnQ0ijp4WMADMJKcPTqyHBZ4=; b=SRlpVuUecQkRshxw+aprju1sPQ
	OPK57r8kQZQkJCrAuYM/8/k0p6aZcBZGZEl781um1wfE/u1My1qAhRnXwST3Ri7gWlSSmiWq9yx9C
	hLbIjgu1berZzD/VMlRZeSwmfLYbym5dv4S80KOQP8H+szoKQc6oEGa3O5B4WCYUm58RzDxAKUm3c
	9RhbCaE/V4koFCDMx6T2rY0P/T1/NV8Ey5VcLx0hHcabz/3EHhGnmL05NnLshvX4VqMY3MObFCub+
	Pgx/OSrt0L0sCamOnLsya3wf75YKpCKm56+HH/TexGRsg2c5ZguN1lwspen8p0Iiohd45qaKWmfbE
	tcCXRWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4zM-000000016SN-25PV;
	Mon, 30 Jun 2025 03:15:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW4zJ-000000016S0-1YvT
	for ath12k@lists.infradead.org;
	Mon, 30 Jun 2025 03:15:22 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55TLPGpb019923
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 03:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zouhYTDahyyqlN7l7LkNnQ0ijp4WMADMJKc
	PTqyHBZ4=; b=NHhuR+HpC+XlAXwStAUIXJmmpiTtEfdvXvYtG9fQ5oYal1Hgg2A
	7v+FL4zGlq2BHCpPDmMWENWSTEmOeemR6wMZbf6GLzAHVKGGYvoesNxFQ1/FmuEB
	ZWug7LSWX7vlEfNp5qvfbtOGgnMzHZc/smo/Eb+Ui6QRMRIaNw+kxl7u3jnU/jn9
	2TsklRmSfJ9+SI+QkoNlTyH2FV9Z/4R46uAs1JmiSaKPdgk4DccP+RlxMqcw1ChS
	cTqZoFM/Uq8+qn4vcgkmr5gXJH2NTnr0ENNn1qFC6Cs64HhT26wLds6F47PMRcFE
	6UUBW0tW4q1qP2PSy1xgaZhEWn/zuyGTzWg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvk8h7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 30 Jun 2025 03:15:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-31218e2d5b0so3194936a91.2
        for <ath12k@lists.infradead.org>; Sun, 29 Jun 2025 20:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751253313; x=1751858113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zouhYTDahyyqlN7l7LkNnQ0ijp4WMADMJKcPTqyHBZ4=;
        b=aPIRcFCS5wLdOsBBqYneAzvCwy2mVS+Vk3QbekiHXyGGIyRUaDSfIaXBQ7RKzyuCSo
         iLglOJutjIavGWBIybzrjodfWuGzbmJxLEeBl2EQ3PwQ8rokGMnAtCHvfpg62QIiUrTK
         dK2neGJOTtAUensevG5yhrVtecV4+RisufnFVC5WxItd6t2R1PD6oAF49TVryJrY9LXS
         FD5+ot57y90ZHIfjHUrxBTN2EQJUBX4gvh6+xNZe0UDAY1m3XaYAlsiR3v2spzQepPgC
         b9aUnw3fKNzfyc/B8v9wi9kliBlUnn+bGP8+z6M4fzwJx3OweKv+O9zLF1iNNEbLg0K7
         FbxA==
X-Gm-Message-State: AOJu0Yx3WevKVdJDoVkj8YacM2BqF0KYY0aS3XnDmb1Qvg2tJqJ1IsA+
	o1M5ajLYb2Ub5LrR0EqIn8S9x0TLGq1/BY25pWZsOsBkyzKOJMAcisp6yXK56Fy6rPYQ20WmdGT
	6ddo5UHa6RoGOzajhnhN0Y1keWXyeJApzD4J1C9ZI7IYLwrlbaI7LGtrCGmgkOQDmwu+p4j5T
X-Gm-Gg: ASbGnct+YeDrcEGp7zEgVYkGpG2ozYnSjoGKC3h7lzKB7zb4syikMIaydjY4DEzLWvq
	lWtfy5Yz4rlWWkEBeKhW8A/9MLP2Q8koaOfScpXSVExM3VBsx8x8BX9S+scWhGTCu0SZGHPfXEq
	Xh1fbi9GQ87sAkewz8XFSucccH1AMHvtKRpc/SrIA0Xiesc/F/gAc6ePTdhzrATJxcVpdrCA1Uv
	/s48x40lQGsQdgk4tBl8WQzAcNkfRtB5MUOtbFoX5eWD8aaLqbWQg4ntqs9nJSI4x/CmPGX/Ec8
	/29HYhINkFI4OJ8crWnfme8sWFQEDj0xq2EZtQFCMqalwlzd+qIHDzQlFizGuRRauoGRWcNhzkM
	VOeUxYLbvs9BiqQCXcawXNSvWGpXkMta9+VHAqvl39j1ovw==
X-Received: by 2002:a17:90b:5823:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-318c8eecfcamr15544478a91.13.1751253312722;
        Sun, 29 Jun 2025 20:15:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2c9a+v7if/VyAPvMaNeR1gC+/LtweHuvaEBcZAbeOPnEZMDQC/yQ3gQukPSHNR4RIZWWfDw==
X-Received: by 2002:a17:90b:5823:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-318c8eecfcamr15544446a91.13.1751253312317;
        Sun, 29 Jun 2025 20:15:12 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6ccsm12165421a91.17.2025.06.29.20.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 20:15:11 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Subject: [PATCH ath-next] wifi: ath12k: Block radio bring-up in FTM mode
Date: Mon, 30 Jun 2025 08:45:02 +0530
Message-Id: <20250630031502.8902-1-aaradhana.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: kXAfcfTwJwOOT_SSXSNMt2jG-tMMS4bt
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=68620142 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ClpxArXO_HDk_Ajs1zgA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: kXAfcfTwJwOOT_SSXSNMt2jG-tMMS4bt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDAyNiBTYWx0ZWRfX3Mm4iYCYxTN3
 eIgFBdYqj1/7kZ2pyUifLxginjNtyetSOSTxWuWtQuyiJYTDrQ+7jLSCjJtqz48yp77GXYUS0RX
 TQRmKmFA/hZTz+iJVLXNX+Q8b1AGp+pqUQnnefc1kv5CCDOwmaBt4gR77RkDWQZJsyb9ZMe7o+9
 E4g5iH+kGymdB3vmEdU47WwirYrnhHdvJ8GV9bCVNaUuvGWaRtGqeaEnZsgcvgx+lCuKL6wz60B
 6XaSeeP0xFmuwNju8M5vwQvK+akmvMFwHYC6GqDizccBuDoVpZRhY45wpj7xHTRsDTs9f+clJ3y
 d5zmHUg5AJNqGnBeIBdnKJDhfH9lPn3M67VMSi1OhbENNi/h8cmx8g9QfGq+/QwS+NxnqtvYPfE
 BGgdE1KFXg9CmOVoWFMfmOE4ANcxn0quAX7FD0xAzGOTkkppUF7Mhr2rI1GoF8LSJXYAsbdD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=999 adultscore=0
 malwarescore=0 clxscore=1011 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_201521_433529_7240FF05 
X-CRM114-Status: GOOD (  15.07  )
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

Ensure that all radios remain down when the driver operates in Factory
Test Mode (FTM). Reject any userspace attempts to bring up an
interface in this mode.

Currently, the driver allows userspace to bring up the interface even
though it operates in FTM mode, which violates FTM constraints and
leads to FTM command failures.

Hence, block the radio start when the driver is in FTM mode. Also,
remove ath12k_ftm_mode check from ath12k_drain_tx() because FTM mode
check is already handled in the caller function
(ath12k_mac_op_start()).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 3bc374cbc49e ("wifi: ath12k: add factory test mode support")
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 32519666632d..22a04b32c0ca 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -8342,14 +8342,9 @@ static int ath12k_mac_start(struct ath12k *ar)
 
 static void ath12k_drain_tx(struct ath12k_hw *ah)
 {
-	struct ath12k *ar = ah->radio;
+	struct ath12k *ar;
 	int i;
 
-	if (ath12k_ftm_mode) {
-		ath12k_err(ar->ab, "fail to start mac operations in ftm mode\n");
-		return;
-	}
-
 	lockdep_assert_wiphy(ah->hw->wiphy);
 
 	for_each_ar(ah, ar, i)
@@ -8362,6 +8357,9 @@ static int ath12k_mac_op_start(struct ieee80211_hw *hw)
 	struct ath12k *ar;
 	int ret, i;
 
+	if (ath12k_ftm_mode)
+		return -EPERM;
+
 	lockdep_assert_wiphy(hw->wiphy);
 
 	ath12k_drain_tx(ah);

base-commit: 4fb98d37afdac11db1f82c1d662e0fd3d209afaa
-- 
2.34.1


