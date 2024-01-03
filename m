Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AC0C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6mtgjMrHnorYxe7ayCJzySEgYbdMD5ryqzkqWuNmhR4=; b=V4/JoEuNZ3U//llgHIw8XQlK6P
	1JSizJ9AJa/9rky8VzxbhjA0nIsV4BLBma4EUTO/qrtB3GGgofEkTu73+pVOM+ys/k91x8OPxFH5X
	NGMdBPKIS+zAORed7hvZpFPF+2SQrQ6QuwfLkez7SC08e/nWUOqXqucf0sq1CX5MsfXavbGFOFNQB
	q2yb+mJ+YNltZsd1bdLxGAvOGD3KzbL/IYCl0oF249VSq563J5YRRxUxyMosW1Zs3AHYtNlau3xGH
	+4mS96QN60ZivKPZ2tYMmGPfy3THlYVWgDhDTySTj2nO9VNQdtZprEqknXRfYb2y/VStMeA0/f4hL
	bw9awCJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKutD-009uKA-1D
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 06:38:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKutB-009uIs-0Y
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 06:38:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4036MLls013700;
	Wed, 3 Jan 2024 06:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=6mtgjMrHnorYxe7ayCJzySEgYbdMD5ryqzkqWuNmhR4=; b=LY
	V102nO9QddAKn91rv5B2DJskPWyAojh9qJvAiIIlWN+5tlmV0qZ4R0GVjzKLUCD+
	71qdi42Jzde5enR8QmAzetlYubBD95vpTqJcv5KaHF4GQIvErscNWQa4U+14BlCr
	zoHIETxejC7wyqTubCzUSvHF6w23Q0Dl0chxnOwKt6V/EK2vhaC/M0BehIKyGV6j
	2SwApXFF1FmUQ+NXJCBEZumrN1x6bBDZJnzsI1mUKggbO805vc9MA46OcHDmsRa/
	n9ng1byYkUd5B4bpMxdJyRuCdc1b4mj221DGkrnj1ufRva8ZB3JVrZIfLJj6U0QT
	PnwHEPES3deKHSlV8aiw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vd27yg1ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 06:38:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4036c4JK009960
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 06:38:04 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 22:38:02 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 08/10] wifi: ath12k: Refactor mac callback of ampdu action
Date: Wed, 3 Jan 2024 12:07:29 +0530
Message-ID: <20240103063731.3356060-9-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
References: <20240103063731.3356060-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DetE6UMgI7S1FeesTy8_X4IokACohyux
X-Proofpoint-ORIG-GUID: DetE6UMgI7S1FeesTy8_X4IokACohyux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxlogscore=556 adultscore=0 clxscore=1015 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_223805_212752_ADC5EF05 
X-CRM114-Status: GOOD (  12.54  )
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

To support single wiphy abstraction, introduce link/radio specific helper
function in the mac80211 callback ampdu_action(). This way, the callback
can be extended to handle multiple link/radio in the future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 1566b43029cd..c505bac365f6 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5901,14 +5901,13 @@ static int ath12k_mac_op_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx
 	return ret;
 }
 
-static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
-				      struct ieee80211_vif *vif,
-				      struct ieee80211_ampdu_params *params)
+static int ath12k_mac_ampdu_action(struct ath12k_vif *arvif,
+				   struct ieee80211_ampdu_params *params)
 {
-	struct ath12k *ar = hw->priv;
+	struct ath12k *ar = arvif->ar;
 	int ret = -EINVAL;
 
-	mutex_lock(&ar->conf_mutex);
+	lockdep_assert_held(&ar->conf_mutex);
 
 	switch (params->action) {
 	case IEEE80211_AMPDU_RX_START:
@@ -5929,8 +5928,25 @@ static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
 		break;
 	}
 
+	return ret;
+}
+
+static int ath12k_mac_op_ampdu_action(struct ieee80211_hw *hw,
+				      struct ieee80211_vif *vif,
+				      struct ieee80211_ampdu_params *params)
+{
+	struct ath12k *ar = hw->priv;
+	struct ath12k_vif *arvif = ath12k_vif_to_arvif(vif);
+	int ret = -EINVAL;
+
+	mutex_lock(&ar->conf_mutex);
+	ret = ath12k_mac_ampdu_action(arvif, params);
 	mutex_unlock(&ar->conf_mutex);
 
+	if (ret)
+		ath12k_warn(ar->ab, "pdev idx %d unable to perform ampdu action %d ret %d\n",
+			    ar->pdev_idx, params->action, ret);
+
 	return ret;
 }
 
-- 
2.34.1


