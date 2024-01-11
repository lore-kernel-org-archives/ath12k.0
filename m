Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC796C47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 04:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zwXQYgVAKcBRQJGdmXvGwZWwpJf4aKIZBmHwCrjEvwA=; b=LsZ2sM8nx2LWD0Nmdj2bxlj17z
	wmfpABTg+ibvpWhl3efvieqstDc7RBPBEJ1MK7erHj59S5sCUqg+qjHMzBo7JzSH+8E3UEGgsDrZ5
	EWxua43JK1xGn3/jzWMutXFno2d+YXBnVnhbXvC7gAHj07znV4FNNjhngUGlSf2uOisqVMJRomywx
	KBh3V6zOJDS81JZV9gFbqicA1vjeVWIEdXq7lcIZilXXlfNFMCtwag+xXc41ziAM7mk8DrGOOMjea
	i+trCDgMnt2e1kkkZGNpToZezFL4r/wWEisLIdDEufs0yKfgNdY2krROe8G4JQ7h8JVlqFspcEV6r
	WETb5VzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2e-00FrNH-1w
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 04:51:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2b-00FrKu-1d
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 04:51:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B4WHZL031154;
	Thu, 11 Jan 2024 04:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=zwXQYgVAKcBRQJGdmXvG
	wZWwpJf4aKIZBmHwCrjEvwA=; b=hP4Njhf3od9a9DEjNhkSwl1XMfo2PsEmNyby
	fFxjUp6HZ8425zIBYatFdqiH8C99jC304iX/yDCRR6eqKvPvAZUWVfHGJyzs5qr6
	/IzIA8X8mGWH4cRX7BPVWXbY6YUiD95sKjq9dmFYVqyPNx1Jr7vBEWhJjIJtLz3f
	pBpm3QCtfpXtZWOUVef0PIlrCToc8HsM/iz/kuADAzdYJNFPmsmlHkwMFHRjJ8cD
	bEyB1NADc1Xs8o94NlsgY9SymaeCn68wEZ2MoSjehHE2RCWTmJ0XrFQ18Fk/KuCf
	XHNdmvxH7e0sch85tjuiZNnStuycOO3Yhlri5IiA8Z5TjPLY5g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vj7w2064w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B4pdZM010171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:39 GMT
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 20:51:37 -0800
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH 10/12] wifi: ath12k: Modify set and get antenna mac ops for single wiphy
Date: Thu, 11 Jan 2024 10:20:43 +0530
Message-ID: <20240111045045.28377-11-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240111045045.28377-1-quic_srirrama@quicinc.com>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GwSq2sfflGmoKBlN0AD1qOeMEM8PhEWU
X-Proofpoint-ORIG-GUID: GwSq2sfflGmoKBlN0AD1qOeMEM8PhEWU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_205141_663751_9CF89CC4 
X-CRM114-Status: GOOD (  17.00  )
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

As multiple radios are combined into a single wiphy, and
the current infrastructure supports only set/get antenna
for the wiphy, the max Tx/Rx antenna capability is advertised
during wiphy register.
Hence, When antenna set/get is received we adjust the set/get
based on max radio capability and set/get antenna accordingly.

Multi radio capability would get introduced with interface
combination changes to support single wiphy model in cfg80211
which would help extend the wiphy specific get/set configs similar
to this to per hw level.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 41 +++++++++++++++++++--------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2f19d6c5b741..00063c783e6c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5064,6 +5064,13 @@ static int __ath12k_set_antenna(struct ath12k *ar, u32 tx_ant, u32 rx_ant)
 	if (ath12k_check_chain_mask(ar, rx_ant, false))
 		return -EINVAL;
 
+	/* Since we advertised the max cap of all radios combined during wiphy
+	 * registration, ensure we don't set the antenna config higher than our
+	 * limits
+	 */
+	tx_ant = min_t(u32, tx_ant, ar->pdev->cap.tx_chain_mask);
+	rx_ant = min_t(u32, rx_ant, ar->pdev->cap.rx_chain_mask);
+
 	ar->cfg_tx_chainmask = tx_ant;
 	ar->cfg_rx_chainmask = rx_ant;
 
@@ -6380,21 +6387,25 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 static int ath12k_mac_op_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	int antennas_rx = 0, antennas_tx = 0;
 	struct ath12k *ar;
+	int i;
 
 	mutex_lock(&ah->conf_mutex);
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	mutex_lock(&ar->conf_mutex);
-
-	*tx_ant = ar->cfg_tx_chainmask;
-	*rx_ant = ar->cfg_rx_chainmask;
-
-	mutex_unlock(&ar->conf_mutex);
-
+	for (i = 0; i < ah->num_radio; i++) {
+		mutex_lock(&ar->conf_mutex);
+		antennas_rx = max_t(u32, antennas_rx, ar->cfg_rx_chainmask);
+		antennas_tx = max_t(u32, antennas_tx, ar->cfg_tx_chainmask);
+		mutex_unlock(&ar->conf_mutex);
+		ar++;
+	}
 	mutex_unlock(&ah->conf_mutex);
 
+	*tx_ant = antennas_rx;
+	*rx_ant = antennas_tx;
 	return 0;
 }
 
@@ -6402,16 +6413,22 @@ static int ath12k_mac_op_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
-	int ret;
+	int ret = 0;
+	int i;
 
 	mutex_lock(&ah->conf_mutex);
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	mutex_lock(&ar->conf_mutex);
-	ret = __ath12k_set_antenna(ar, tx_ant, rx_ant);
-	mutex_unlock(&ar->conf_mutex);
-
+	for (i = 0; i < ah->num_radio; i++) {
+		mutex_lock(&ar->conf_mutex);
+		ret = __ath12k_set_antenna(ar, tx_ant, rx_ant);
+		mutex_unlock(&ar->conf_mutex);
+		if (ret)
+			goto out;
+		ar++;
+	}
+out:
 	mutex_unlock(&ah->conf_mutex);
 
 	return ret;
-- 
2.17.1


