Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F32AC47422
	for <ath12k@archiver.kernel.org>; Fri, 26 Jan 2024 11:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ynYzS7CZWgIak+OpUcB86wdYKCuBQYYaw27vMUfb4+U=; b=IcGU0eADrR82hmrhyYphq+1NPD
	k7FvJYEy6sS/q57bo31L8Bsb38SqHA1gVlq2QkkPk+iSKX4b1tCXKvPRLengjCRk9zW0lC7NvKVtB
	UDuBUgdOyz+kbybalfyJj3FO2m1gMv497bx23aEtWM02bFXJgkyHljd+ml0VRiFJe15Yk1vT2H3i5
	tiIeRGG5tioua8atYhowcD3kwzJlVcVAsO8oKmr8oWC3CGS+MV4QOygPPHifasq/dKzGMxJdl9d0g
	ebjlRzCyurb57b3vj+TFk7EdacK4T2oBGvqB2LV5XRf1uXLJL2pSH7tfC1+ER1MlKYDjvg/aOk8Wl
	+eb+49AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKla-000000042fq-0FCl
	for ath12k@archiver.kernel.org;
	Fri, 26 Jan 2024 11:53:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTKlV-000000042d6-0eXg
	for ath12k@lists.infradead.org;
	Fri, 26 Jan 2024 11:52:59 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40Q8lWQQ030608;
	Fri, 26 Jan 2024 11:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=ynYzS7CZWgIak+OpUcB86wdYKCuBQYYaw27vMUfb4+U=; b=Ce
	S38JTSGjlwN88HxxDyFCTlLXoy7diIW8QbwaNu6OLg2CTlsy6mOlUTI+tJbiwV4t
	AimoawqYncI+dDYRFJwDtDleymV5bD0UerrtBM4I1dSGgY9YkhcRVcKn60entjCK
	Paq0gcs3Om4bbJhZ9uTLR2y9UEAqSV0nM+V1AW4ujmPZgKEGtyMmGOYGs9R2KvB6
	s2ROJM++MpEg2cTjOroIQG7RZpg6qAxxOw/Y6NNkJUaVs2PKsQ/MlEoh86oKZa7k
	huRcJIhVs3jXHc2J2pUCGalx2tOlDsTV8qG1c3u3oSgvMPLqvRuRJ8C3Y6NUInv3
	ikzP871kAg16zHfUXCAA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vv1q59agq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:52 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40QBqpHX008185
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jan 2024 11:52:51 GMT
Received: from yk-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 26 Jan 2024 03:52:50 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v4 01/11] wifi: ath12k: change interface combination for P2P mode
Date: Fri, 26 Jan 2024 19:52:21 +0800
Message-ID: <20240126115231.356658-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126115231.356658-1-quic_kangyang@quicinc.com>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: vQ34hiOzBw4l3qflzdO6ZB7yw_JepXT5
X-Proofpoint-GUID: vQ34hiOzBw4l3qflzdO6ZB7yw_JepXT5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 mlxlogscore=842 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401260087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_035257_400784_D3DE1B4B 
X-CRM114-Status: GOOD (  14.69  )
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

Current interface combination doesn't support P2P mode. Change the
combination for P2P mode.

Also, there is a bug that when mesh is enabled but ap is not enabled.
In this situation, the mesh's max_interface of interface combination
won't be set.

So assign the max_interfaces for mesh directly.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---

v4: no change.
v3: no change.
v2:
    1. add Tested-on tag of QCN9274.
    2. update copyright.

---
 drivers/net/wireless/ath/ath12k/mac.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index a27480a69b27..d1d2e83dfa37 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7479,9 +7479,10 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 	struct ieee80211_iface_combination *combinations;
 	struct ieee80211_iface_limit *limits;
 	int n_limits, max_interfaces;
-	bool ap, mesh;
+	bool ap, mesh, p2p;
 
 	ap = ath12k_mac_is_iface_mode_enable(ah, NL80211_IFTYPE_AP);
+	p2p = ath12k_mac_is_iface_mode_enable(ah, NL80211_IFTYPE_P2P_DEVICE);
 
 	mesh = IS_ENABLED(CONFIG_MAC80211_MESH) &&
 		ath12k_mac_is_iface_mode_enable(ah, NL80211_IFTYPE_MESH_POINT);
@@ -7490,9 +7491,15 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 	if (!combinations)
 		return -ENOMEM;
 
-	if (ap || mesh) {
+	if ((ap || mesh) && !p2p) {
 		n_limits = 2;
 		max_interfaces = 16;
+	} else if (p2p) {
+		n_limits = 3;
+		if (ap || mesh)
+			max_interfaces = 16;
+		else
+			max_interfaces = 3;
 	} else {
 		n_limits = 1;
 		max_interfaces = 1;
@@ -7507,14 +7514,22 @@ static int ath12k_mac_setup_iface_combinations(struct ath12k_hw *ah)
 	limits[0].max = 1;
 	limits[0].types |= BIT(NL80211_IFTYPE_STATION);
 
-	if (ap) {
+	if (ap || mesh || p2p)
 		limits[1].max = max_interfaces;
+
+	if (ap)
 		limits[1].types |= BIT(NL80211_IFTYPE_AP);
-	}
 
 	if (mesh)
 		limits[1].types |= BIT(NL80211_IFTYPE_MESH_POINT);
 
+	if (p2p) {
+		limits[1].types |= BIT(NL80211_IFTYPE_P2P_CLIENT) |
+				   BIT(NL80211_IFTYPE_P2P_GO);
+		limits[2].max = 1;
+		limits[2].types |= BIT(NL80211_IFTYPE_P2P_DEVICE);
+	}
+
 	combinations[0].limits = limits;
 	combinations[0].n_limits = n_limits;
 	combinations[0].max_interfaces = max_interfaces;
-- 
2.34.1


