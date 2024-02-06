Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1E1C4829E
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 11:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9x/L9zBRAyTkONnTlLEDtK2szL6cwTn1TVFewVFbA8=; b=XfGDPKsFFLE1SzKzwPw+hmZZU7
	QlVaDX185DZyrJbAMBca+MRaYkPOpuQYTmZXgeB5fJYEfs2Qr+SwBGbsNCzonQonVnuQCQ6oisPQf
	W91p/5X1giMbEaY1k+IeUTOrmzqpc08qiBuPeRw+EWqSNpMKbMTPys3w02vGVyAXswi/OW8CYc5Jm
	C9AlhxfUsJowtryDU0QvTdEkMO8+6sQNwZ6piHB/edQuaAxTBnLUsNDgrfYF8Z6wbDSEg8vf6Gau2
	bUhQxXwwScVjPPbGSCmbcD3qe/9kSBn+TfuUU9PAI2BKPIF4g8M54u0kaoztnJ5TvhUiehU5Wc6G6
	+tUI/dfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXJta-00000007OSe-0WAY
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 11:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeV-00000006gDX-3up1
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:22:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=y9x/L9zBRAyTkONnTlLEDtK2szL6cwTn1TVFewVFbA8=; b=JWEnebhnTe58dtVX/7p2myLcUj
	a9pwrZdGmF44acxSOIJctjiUShAyk1/ElamA0cFsxO3PDBchYS/vHw0VQ9Z6AmqzgjgeMklWdLyvz
	bbZ+DDS0BBZkyOhS4FvAZxdBnRjdzcgSwtIvpGNjgzz8/4UxwjDeAwsGQU1W7mjDPumMRzn00woBN
	m7kv0RNokei7sueDCYS+IaS9WLne50U+AJ+03BKe18/Uo66TFITafp/G1A1/1K74MvlTgfJBJRegR
	eqSGofdqjwXBjjme/S1XY2AcPTMWoToxcqW4N9qv6XOLKVsEC+nGZslA3s8PNn80RtJkx3HJR1fMY
	OwGnQlHA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeR-0000000CQzA-2yD7
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:22:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4166xQRE014451;
	Tue, 6 Feb 2024 09:21:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=y9x/L9zBRAyTkONnTlLEDtK2szL6cwTn1TVFewVFbA8=; b=VH
	RzC2pJ9zDmojfTndwt1pGvVBBn2fxsTQ5az+hsp3xOeOwah7vJP9Ap0tU8hzARB2
	+O+BA/jHBWx4OjnKnmy0cF0DXjKTZBVuzT9e75fFB3theGQ+rX8ceVFwpHj9GURk
	L4aJ59AIpLfhi8pZVzvueU80eQ8tZwpR0STI2q7y48FyPVKoKSgJ19HZR27icavZ
	d5kPY0ky0hTkJGorJEvTqHFhW7rQsecbvTPiMoIwJsnViEDH0NpnZTeQ5wSQ4ioj
	6+90aGUg+9SjjtXGAjYqwtIny5v3uZZc550mE2qknW25JUBsIgcGkM0+w0z0cPLr
	4Zq8SttR0byZp/foXezA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w3e7g0ggx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:21:57 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169LvIN021340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:21:57 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:55 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH v2 10/12] wifi: ath12k: Modify set and get antenna mac ops for single wiphy
Date: Tue, 6 Feb 2024 14:49:52 +0530
Message-ID: <20240206091954.4144454-11-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240206091954.4144454-1-quic_ramess@quicinc.com>
References: <20240206091954.4144454-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u6ghTtS7jtMuDVEAtYnTINYiHk9OGl6b
X-Proofpoint-ORIG-GUID: u6ghTtS7jtMuDVEAtYnTINYiHk9OGl6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092200_381855_6DFA390D 
X-CRM114-Status: GOOD (  16.29  )
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

From: Sriram R <quic_srirrama@quicinc.com>

As multiple radios are combined into a single wiphy, and
the current infrastructure supports only set/get antenna
for the wiphy, the max Tx/Rx antenna capability is advertised
during wiphy register.
Hence, When antenna set/get is received we adjust the set/get
based on max radio capability and set/get antenna accordingly.

Multi radio capability needs to introduced with interface
combination changes to support single wiphy model in cfg80211
which would help extend the wiphy specific get/set configs similar
to this to per hw level.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 37 ++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 617dd55e7d4e..a85468cc63da 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5010,6 +5010,13 @@ static int __ath12k_set_antenna(struct ath12k *ar, u32 tx_ant, u32 rx_ant)
 	if (ath12k_check_chain_mask(ar, rx_ant, false))
 		return -EINVAL;
 
+	/* Since we advertised the max cap of all radios combined during wiphy
+	 * registration, ensure we don't set the antenna config higher than the
+	 * limits
+	 */
+	tx_ant = min_t(u32, tx_ant, ar->pdev->cap.tx_chain_mask);
+	rx_ant = min_t(u32, rx_ant, ar->pdev->cap.rx_chain_mask);
+
 	ar->cfg_tx_chainmask = tx_ant;
 	ar->cfg_rx_chainmask = rx_ant;
 
@@ -6309,16 +6316,22 @@ static void ath12k_mac_op_configure_filter(struct ieee80211_hw *hw,
 static int ath12k_mac_op_get_antenna(struct ieee80211_hw *hw, u32 *tx_ant, u32 *rx_ant)
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
+	int antennas_rx = 0, antennas_tx = 0;
 	struct ath12k *ar;
+	int i;
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	mutex_lock(&ar->conf_mutex);
-
-	*tx_ant = ar->cfg_tx_chainmask;
-	*rx_ant = ar->cfg_rx_chainmask;
+	for (i = 0; i < ah->num_radio; i++) {
+		mutex_lock(&ar->conf_mutex);
+		antennas_rx = max_t(u32, antennas_rx, ar->cfg_rx_chainmask);
+		antennas_tx = max_t(u32, antennas_tx, ar->cfg_tx_chainmask);
+		mutex_unlock(&ar->conf_mutex);
+		ar++;
+	}
 
-	mutex_unlock(&ar->conf_mutex);
+	*tx_ant = antennas_tx;
+	*rx_ant = antennas_rx;
 
 	return 0;
 }
@@ -6327,13 +6340,19 @@ static int ath12k_mac_op_set_antenna(struct ieee80211_hw *hw, u32 tx_ant, u32 rx
 {
 	struct ath12k_hw *ah = ath12k_hw_to_ah(hw);
 	struct ath12k *ar;
-	int ret;
+	int ret = 0;
+	int i;
 
 	ar = ath12k_ah_to_ar(ah, 0);
 
-	mutex_lock(&ar->conf_mutex);
-	ret = __ath12k_set_antenna(ar, tx_ant, rx_ant);
-	mutex_unlock(&ar->conf_mutex);
+	for (i = 0; i < ah->num_radio; i++) {
+		mutex_lock(&ar->conf_mutex);
+		ret = __ath12k_set_antenna(ar, tx_ant, rx_ant);
+		mutex_unlock(&ar->conf_mutex);
+		if (ret)
+			break;
+		ar++;
+	}
 
 	return ret;
 }
-- 
2.25.1


