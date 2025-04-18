Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9D1BC369CB
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 02:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2fgI4tJO2uc3dK9JK0frhiRolBL3NCAZCR5DelGbK2o=; b=uekaaDwIAqm6c8U8mo++VQTein
	viXbqt9eHwotAbgHaSre+KFmuN6JmPtIiXW+eyu2JsfUDQZ7raRwIrVCJkLryDfaTYYQELA28PcHn
	sCoVdgbs7o+vcT2/u8B9IKUMNWyTZfWqP3s154yBWV1l6xeBSAnKxmP8xmLQ2QZJDLhE4+QEmJa3p
	Ta4g8ZtskSJaSl86TUdqqUCfdW8NP4zUlq1xm4uew4MeQUDtDwaEa8DjHvJkFuvIc+PRzCvoUxP1S
	HzgyoiSnjyJAvUG4bjH/o69zpnW9ehvcglywrZzEbaVH2fI3I0x/WGdRe+xBERiZIXkJpH8R+VhLM
	5sUneMVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5btl-0000000EufA-2SP9;
	Fri, 18 Apr 2025 02:56:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5bti-0000000Euca-1pjs
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 02:56:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HMvAeB013110;
	Fri, 18 Apr 2025 02:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2fgI4tJO2uc3dK9JK0frhiRolBL3NCAZCR5DelGbK2o=; b=MeAJ5CLNPmbOVt3J
	PgENoAuKP7wZUdxEav2EqRGIcL8+u936XNeTgieSefwZMr6icsTY40OvMeuE+MB+
	x81pcClpgfliofWm6LM7JI1ei2lQLzXQkPGFg6oJT09cEWhPzn24Xb0LphwIZPxe
	i+ZiGbg3O03wSAt1mLwDRWQJPVko92W1k8PbHm3Z0cNWEaOmnFAmwStNUcsm8Vot
	R6PAKU1VUGqBYdzqTnFKIgsdMmp1Okst48U8JU78zuHIziHGm38i4OxrpB6WKO2d
	51SBviNim5xYuUZN7jSyAEVDtSyJucDILDj28ZNlR6h684H2HW0Ot0QVFZTUn5wS
	k8dJyw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhqh1j1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53I2u6F2021397
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Apr 2025 02:56:06 GMT
Received: from [127.0.1.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 17 Apr
 2025 19:56:04 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
Date: Fri, 18 Apr 2025 10:55:39 +0800
Subject: [PATCH ath-next 06/15] wifi: ath12k: store reg info for later use
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250418-ath12k-6g-lp-vlp-v1-6-c869c86cad60@quicinc.com>
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
X-Proofpoint-ORIG-GUID: sQVgypAux0xWnicDGyn5FO7lQ-7QO91j
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=6801bf47 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=nIzqRh7MEcWn2tJg4EIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: sQVgypAux0xWnicDGyn5FO7lQ-7QO91j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504180020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_195610_607111_4A66D092 
X-CRM114-Status: GOOD (  15.59  )
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

Currently we only build regdomain when channel list event is received.
That event is received when driver boots or when a new country code is
sent to firmware. At either time we may have no information about
interface mode or AP's power type, consequently WMI_REG_INDOOR_AP is
selected. In upcoming patches we will rebuild regdomain once those
information is available. For that purpose reg info has to be
stored/refreshed each time a new channel list event is received.

The stored reg info would be freed in ath12k_reg_free() when it is not
needed.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  2 ++
 drivers/net/wireless/ath/ath12k/reg.c  |  6 ++++++
 drivers/net/wireless/ath/ath12k/wmi.c  | 12 ++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 4b8f434e3e9a8ff61e3c734c28277c28216fec25..ef65e8b35b8cdac395ef456d0d9aa0c338b7da03 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1041,6 +1041,8 @@ struct ath12k_base {
 	 */
 	struct ieee80211_regdomain *new_regd[MAX_RADIOS];
 
+	struct ath12k_reg_info *reg_info[MAX_RADIOS];
+
 	/* Current DFS Regulatory */
 	enum ath12k_dfs_region dfs_region;
 	struct ath12k_soc_dp_stats soc_stats;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index e3ad475328526cf6e9e5e312c7953f661a1e5e8d..dbd7d956dd52ad91cf1c0bae0a243afd3bd26a61 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -1040,6 +1040,12 @@ void ath12k_reg_free(struct ath12k_base *ab)
 	int i;
 
 	mutex_lock(&ab->core_lock);
+	for (i = 0; i < MAX_RADIOS; i++) {
+		ath12k_reg_reset_reg_info(ab->reg_info[i]);
+		kfree(ab->reg_info[i]);
+		ab->reg_info[i] = NULL;
+	}
+
 	for (i = 0; i < ab->hw_params->max_radios; i++) {
 		kfree(ab->default_regd[i]);
 		kfree(ab->new_regd[i]);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 42e275762563f84f4891ffd1be8e33917f1192d2..80b8cad5bc78ca0cf27383e594ea6f48887a1910 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6118,6 +6118,7 @@ static void ath12k_wmi_htc_tx_complete(struct ath12k_base *ab,
 static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct ath12k_reg_info *reg_info;
+	u8 pdev_idx;
 	int ret;
 
 	reg_info = kzalloc(sizeof(*reg_info), GFP_ATOMIC);
@@ -6147,6 +6148,17 @@ static int ath12k_reg_chan_list_event(struct ath12k_base *ab, struct sk_buff *sk
 		goto mem_free;
 	}
 
+	/* free old reg_info if it exist */
+	pdev_idx = reg_info->phy_id;
+	if (ab->reg_info[pdev_idx]) {
+		ath12k_reg_reset_reg_info(ab->reg_info[pdev_idx]);
+		kfree(ab->reg_info[pdev_idx]);
+	}
+	/* reg_info is valid, we store it for later use
+	 * even below regd build failed
+	 */
+	ab->reg_info[pdev_idx] = reg_info;
+
 	ret = ath12k_reg_handle_chan_list(ab, reg_info, WMI_VDEV_TYPE_UNSPEC,
 					  IEEE80211_REG_UNSET_AP);
 	if (ret) {

-- 
2.34.1


