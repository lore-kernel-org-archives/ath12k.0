Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 925AFC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 22:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGUj3v0Pv5TVgXxV2YJ8yl6KXgZxFwuvlfUYyUuvN6s=; b=1O7yYC1E6By12p0vNI6WlRhExF
	KQJ0UFoRIsr6ncRw0AbhATTSu+sXUp87Zo7n4ehHiqtg8XK3dp7ZnDZo+VwdzFkBcZHRdyzz0ERm7
	/vRwllWOUizQIGiizk0AzbzGEjKjTm4Ew8DwvUD3psvnUINFwvmQrhmADL53LyN2pggvveuS7IEF5
	t2j9PU22h9E70SPafNIs8hx/QjtzgfCSSZRCu7zdBMtQlVqeEoBYWSmvm430OdwKz+brWY+IXWlYN
	LAJ6pRwoXdASOK5a5xXgkzmUhJQJ2OHfnWbNUyQEbWDbDSVldVMQdAH5w3PLBHTKSBs8gtWI174x2
	JqNir7tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07R4-0000000ASKc-0VA3
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 22:19:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07Qx-0000000ASGQ-2brE
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 22:19:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PLjKxe021088;
	Thu, 25 Apr 2024 22:19:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=kGUj3v0Pv5TVgXxV2YJ8
	yl6KXgZxFwuvlfUYyUuvN6s=; b=Q7h2cuJczJH6U1qGwza7zwO/MnIvL1U72H+n
	7Dqsw4XhVRP52uaY/QczrirEaPDeunuhegRBxunege3/ZccVs0k1uivDNULWP1FV
	wkAZhjW4VpBQFrPUW5/DynIDN7d2kjpFjwyz7b8IvgTE1hOJ5JqpOu2rIG05q+XF
	QHzFAS9Xtl4odVyz31FVtgmFEMk7N/lJoU+QgcuteK5IO7ks0jpElD16+uFjAT2X
	2MZSiFYaolQl3bRzleUlu+FISCh2HTwf6uPPIyeiVuIfz7okMxt7OAZYfFcW8ftd
	uNIMojEcnC6GbGD3/FBTn1xso0vYTwHLYjfQLGO+CRYj/Uixeg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenh3tr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:19:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PMJEUW017357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:19:14 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 15:19:14 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V4 5/6] wifi: ath12k: refactor SMPS configuration
Date: Thu, 25 Apr 2024 15:19:01 -0700
Message-ID: <20240425221902.11553-6-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
References: <20240425221902.11553-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WPh1qsQ7Yo7Wsq4bS2ySx90ppD0zsMwW
X-Proofpoint-GUID: WPh1qsQ7Yo7Wsq4bS2ySx90ppD0zsMwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 bulkscore=0 clxscore=1015 suspectscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_151915_833343_636498D0 
X-CRM114-Status: GOOD (  14.04  )
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

Move fetching SMPS value to a new function and use u16_get_bits
to extract smps value from capabilities. This will help in
extending the functionality when SMPS support in 6 GHz band gets
added in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 32 ++++++++++++++++-----------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8836dc67f7e0..d4bae41a32d4 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2086,18 +2086,29 @@ static void ath12k_peer_assoc_h_he_6ghz(struct ath12k *ar,
 				     ampdu_factor)) - 1;
 }
 
+static int ath12k_get_smps_from_capa(const struct ieee80211_sta_ht_cap *ht_cap,
+				     int *smps)
+{
+	if (!ht_cap->ht_supported)
+		return -EOPNOTSUPP;
+
+	*smps = u16_get_bits(ht_cap->cap, IEEE80211_HT_CAP_SM_PS);
+
+	if (*smps >= ARRAY_SIZE(ath12k_smps_map))
+		return -EINVAL;
+
+	return 0;
+}
+
 static void ath12k_peer_assoc_h_smps(struct ieee80211_sta *sta,
 				     struct ath12k_wmi_peer_assoc_arg *arg)
 {
 	const struct ieee80211_sta_ht_cap *ht_cap = &sta->deflink.ht_cap;
 	int smps;
 
-	if (!ht_cap->ht_supported)
+	if (ath12k_get_smps_from_capa(ht_cap, &smps))
 		return;
 
-	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
-	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
-
 	switch (smps) {
 	case WLAN_HT_CAP_SM_PS_STATIC:
 		arg->static_mimops_flag = true;
@@ -2571,16 +2582,11 @@ static int ath12k_setup_peer_smps(struct ath12k *ar, struct ath12k_vif *arvif,
 				  const u8 *addr,
 				  const struct ieee80211_sta_ht_cap *ht_cap)
 {
-	int smps;
+	int smps, ret = 0;
 
-	if (!ht_cap->ht_supported)
-		return 0;
-
-	smps = ht_cap->cap & IEEE80211_HT_CAP_SM_PS;
-	smps >>= IEEE80211_HT_CAP_SM_PS_SHIFT;
-
-	if (smps >= ARRAY_SIZE(ath12k_smps_map))
-		return -EINVAL;
+	ret = ath12k_get_smps_from_capa(ht_cap, &smps);
+	if (ret < 0)
+		return ret;
 
 	return ath12k_wmi_set_peer_param(ar, addr, arvif->vdev_id,
 					 WMI_PEER_MIMO_PS_STATE,
-- 
2.17.1


