Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF9BC369CF
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=klyXPSFY5tX/Ct25yVK4xQk19g+SmefgcJOQpb4nun8=; b=tSg+56sZJsVW/lU8FsijJ5ZEsZ
	fmJOcnFq/a0p/5ARCHAwQhxmx73De2DIVpxZXVC/SQlNzG+pbuqJKDarlryvO1S8dml79z02/aest
	qQeF7GM1SBqTmnnw/KcdR5BVhi0pSHHgAZoUEI61hkDMHFYgdpcrGO2Iiqz83x3S3l+vU/wHjgqXZ
	iUHy86VI70ZDiP1DyslUHcXs6N44hmY7yqTOLie5hLnHnX0b6G0JPE0hqK0ZHz0eEfzWbbCGf+EHp
	jaiDRPBTVzUXXUI5WZu7aXRqpd39SS5ok5nKFxUVeQK30ZBb09KloayGZUa1eap/d2gkGGj2CulSC
	XDoTqkqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btg-0000000EubP-0EvB;
	Fri, 18 Apr 2025 02:56:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btd-0000000EuZm-1aC9
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HJbjFI014438;
	Fri, 18 Apr 2025 02:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	klyXPSFY5tX/Ct25yVK4xQk19g+SmefgcJOQpb4nun8=; b=Xrc8WMqBnQ5Ii55z
	/6QSR8shG+hUJLpofm1dpOMs85Fvam50KqSCKR/ox/pWrQaJSwuzokG5OEzqZTsO
	Nqvo7kkDVzpkqU9bYBcSuzr6m2hxdn2YxDIksx7pE2OaSDG6reW1uODHwx3miM3l
	GbqXs9sYHWon18BavxyYJ7m4nUEPoF9gRO9IecLEahofoVPlxsrWurkHpax1ZMwA
	hrJmq9m3DXcS57WO7S6o0KvTl953rInZ8ve1xOJxhh/wi+yB6LBsyqwSDoRLTh5c
	FkMS5CntkYw/ml558u6baM7yyna6WgiK/ks/EuUwFsOMqVEYEwjpG3zxjP8brllA
	PBRcdg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a0tp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2u1UZ022863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:01 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:55:59 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:36 +0800
Subject: [PATCH ath-next 03/15] wifi: ath12k: refactor
 ath12k_reg_build_regd()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-3-c869c86cad60@quicinc.com>
References: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
In-Reply-To: <20250418-ath12k-6g-lp-vlp-v1-0-c869c86cad60@quicinc.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
	<jjohnson@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -mrZPHBBgYEMKDbC1z5NSc9XCNiBB-az
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=6801bf42 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=fhh3vIhDZVS6VH9qMvAA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: -mrZPHBBgYEMKDbC1z5NSc9XCNiBB-az
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195605_546103_6D3F0CA2 
X-CRM114-Status: GOOD (  14.73  )
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

Currently we pass intersect flag to tell ath12k_reg_build_regd() whether
regulatory rulse are intersected. This flag is determined in
ath12k_reg_handle_chan_list() and has no other users.

Move related logic into ath12k_reg_build_regd() to make code clear. Also
relocate ath12k_reg_is_world_alpha() to avoid forward declaration, and
refine it for code simplicity.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/reg.c | 43 +++++++++++++----------------------
 drivers/net/wireless/ath/ath12k/reg.h |  3 +--
 2 files changed, 17 insertions(+), 29 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 21c5a8312a9e55a458aab5151ff9c017808659d7..86e3b426d5f9de525a22850140cbc8acac0b6fcf 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -710,9 +710,15 @@ static void ath12k_reg_update_freq_range(struct ath12k_reg_freq *reg_freq,
 		reg_freq->end_freq = reg_rule->end_freq;
 }
 
+static bool ath12k_reg_is_world_alpha(char *alpha)
+{
+	return (alpha[0] == '0' && alpha[1] == '0') ||
+	       (alpha[0] == 'n' && alpha[1] == 'a');
+}
+
 struct ieee80211_regdomain *
 ath12k_reg_build_regd(struct ath12k_base *ab,
-		      struct ath12k_reg_info *reg_info, bool intersect)
+		      struct ath12k_reg_info *reg_info)
 {
 	struct ieee80211_regdomain *tmp_regd, *default_regd, *new_regd = NULL;
 	struct ath12k_reg_rule *reg_rule;
@@ -842,9 +848,14 @@ ath12k_reg_build_regd(struct ath12k_base *ab,
 
 	tmp_regd->n_reg_rules = i;
 
-	if (intersect) {
-		default_regd = ab->default_regd[reg_info->phy_id];
-
+	/* Intersect new rules with default regd if a new country setting was
+	 * requested, i.e a default regd was already set during initialization
+	 * and the regd coming from this event has a valid country info.
+	 */
+	default_regd = ab->default_regd[reg_info->phy_id];
+	if (default_regd &&
+	    !ath12k_reg_is_world_alpha((char *)default_regd->alpha2) &&
+	    !ath12k_reg_is_world_alpha((char *)reg_info->alpha2)) {
 		/* Get a new regd by intersecting the received regd with
 		 * our default regd.
 		 */
@@ -899,22 +910,10 @@ void ath12k_reg_reset_reg_info(struct ath12k_reg_info *reg_info)
 	}
 }
 
-static bool ath12k_reg_is_world_alpha(char *alpha)
-{
-	if (alpha[0] == '0' && alpha[1] == '0')
-		return true;
-
-	if (alpha[0] == 'n' && alpha[1] == 'a')
-		return true;
-
-	return false;
-}
-
 int ath12k_reg_handle_chan_list(struct ath12k_base *ab,
 				struct ath12k_reg_info *reg_info)
 {
 	struct ieee80211_regdomain *regd = NULL;
-	bool intersect = false;
 	struct ath12k *ar;
 	int pdev_idx;
 
@@ -948,17 +947,7 @@ int ath12k_reg_handle_chan_list(struct ath12k_base *ab,
 		    reg_info->alpha2, 2))
 		return 0;
 
-	/* Intersect new rules with default regd if a new country setting was
-	 * requested, i.e a default regd was already set during initialization
-	 * and the regd coming from this event has a valid country info.
-	 */
-	if (ab->default_regd[pdev_idx] &&
-	    !ath12k_reg_is_world_alpha((char *)
-		ab->default_regd[pdev_idx]->alpha2) &&
-	    !ath12k_reg_is_world_alpha((char *)reg_info->alpha2))
-		intersect = true;
-
-	regd = ath12k_reg_build_regd(ab, reg_info, intersect);
+	regd = ath12k_reg_build_regd(ab, reg_info);
 	if (!regd)
 		return -EINVAL;
 
diff --git a/drivers/net/wireless/ath/ath12k/reg.h b/drivers/net/wireless/ath/ath12k/reg.h
index f65cfaca7404cd72a9978c0ae6ca98be9d5f6b70..41230092f77bc9f133313dd334825409f0599fd2 100644
--- a/drivers/net/wireless/ath/ath12k/reg.h
+++ b/drivers/net/wireless/ath/ath12k/reg.h
@@ -96,8 +96,7 @@ void ath12k_reg_init(struct ieee80211_hw *hw);
 void ath12k_reg_free(struct ath12k_base *ab);
 void ath12k_regd_update_work(struct work_struct *work);
 struct ieee80211_regdomain *ath12k_reg_build_regd(struct ath12k_base *ab,
-						  struct ath12k_reg_info *reg_info,
-						  bool intersect);
+						  struct ath12k_reg_info *reg_info);
 int ath12k_regd_update(struct ath12k *ar, bool init);
 int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait);
 

-- 
2.34.1


