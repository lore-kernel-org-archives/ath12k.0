Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D218BC0218B
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 17:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mv9qORSKYg6eJtZAxxPCm5lrx0aB0tkxTIz++kUdYlg=; b=cIIkgxPng+sHr2dzVYljxqGL4P
	bCjdidYGshc5Vz7oafc0z7qcxbkplLV/ZzDXox0Et7tHssLlgKxW/K8RiccXYeLJK8fPwv9hm5vpH
	1eMvNzu9d7XA0BQV/Pel+WYUu9VuBbWbqnAOO0gaHZhivxoiDHB6j7MW+pZ6gG6yTZ0nBjrbdRBdO
	RrgNz4rLS5ntx7oriY5UypNb1aj5xF8ZW8qZBLCCl1J2wj4aMT23ve4tmwmdQEvjco2Lfy7OPdouu
	UW/WyTQih1j0DDyUIex930yDjPSQH3tfDBtdwHaP3npIGvusMBFBNGfUKemPmU0vObeZUUkP1cRr8
	wM0JvXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKW-0000000FCEx-2ZdJ
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 17:18:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKT-0000000FCCj-3GNm
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 17:18:51 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OFsZ1v022491;
	Fri, 24 Jan 2025 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mv9qORSKYg6eJtZAxxPCm5lrx0aB0tkxTIz++kUdYlg=; b=dV+7I2778DZ+JYPW
	dqu2fX9USOpWZCMLhntg3VIJseVmg5r5Ei+9klekLQGYbmPeB9ACbhLH9RgM8eOh
	Ss2L5ofB2/fj6mRjTW4TG/pRB7VnZVgd6GijpMPReREt3OWSSBtoDYJ00kPepSBG
	FKaURCBU1okH0rCy1eS0ghc3xygs7uPPVp+6YFGXQGHEiiVXvdt+qWJWPMdxpbEv
	1LlVj1HDS4ZdswIA3HH9d2TkNEq4ciDoaFc2jB2R0lRqHnh15T1PCmMIovYur0Dk
	HqUdzMnCOrW1uQRuW2c+PiMRwPDJkGOTbrXzaJPyN1AP9QPttqQ994PuEh4sP20t
	bmPw9w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44cdwvg5sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:48 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OHImNf001895
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:48 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 Jan 2025 09:18:46 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v2 4/5] wifi: cfg80211: set tx power per radio in a wiphy
Date: Fri, 24 Jan 2025 22:47:55 +0530
Message-ID: <20250124171756.3418663-5-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124171756.3418663-1-quic_rdevanat@quicinc.com>
References: <20250124171756.3418663-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1dGiD3LfhXca-5bm1WHtBmTMh5flv4uG
X-Proofpoint-ORIG-GUID: 1dGiD3LfhXca-5bm1WHtBmTMh5flv4uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501240120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_091849_825929_D8F827CA 
X-CRM114-Status: GOOD (  16.95  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

A wiphy can have multiple radios(wiphy.n_radio) combined in it
and each radio is identified by radio index (radio_id).
When set tx power is done without a valid wdev then it is
a radio level configuration but currently it is being considered at
wiphy level since radio identifier is not present in nl80211_set_wiphy().

Pass the radio id that is obtained via NL80211_ATTR_WIPHY_RADIO_INDEX as an
argument to set_tx_power op to indicate the underlying drivers about the
radio of the wiphy to which the configuration should be applied.

When NL80211_ATTR_WIPHY_RADIO_INDEX is not passed or the wiphy is a
non-multi radio wiphy, radio id value of NL80211_WIPHY_RADIO_ID_MAX(255)
is passed in which case drivers should apply the configuration to all
radios.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath6kl/cfg80211.c            |  1 +
 .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c   |  2 +-
 drivers/net/wireless/marvell/mwifiex/cfg80211.c       |  2 +-
 drivers/net/wireless/microchip/wilc1000/cfg80211.c    |  2 +-
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c     |  2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c     |  2 +-
 include/net/cfg80211.h                                |  2 +-
 net/mac80211/cfg.c                                    |  2 +-
 net/wireless/nl80211.c                                |  2 +-
 net/wireless/rdev-ops.h                               |  6 +++---
 net/wireless/trace.h                                  | 11 +++++++----
 net/wireless/wext-compat.c                            |  3 ++-
 12 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/drivers/net/wireless/ath/ath6kl/cfg80211.c b/drivers/net/wireless/ath/ath6kl/cfg80211.c
index 120dbd66ea11..bf23daec8662 100644
--- a/drivers/net/wireless/ath/ath6kl/cfg80211.c
+++ b/drivers/net/wireless/ath/ath6kl/cfg80211.c
@@ -1405,6 +1405,7 @@ static int ath6kl_cfg80211_set_wiphy_params(struct wiphy *wiphy, u8 radio_id, u3
 
 static int ath6kl_cfg80211_set_txpower(struct wiphy *wiphy,
 				       struct wireless_dev *wdev,
+				       u8 radio_id,
 				       enum nl80211_tx_power_setting type,
 				       int mbm)
 {
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
index 418b9dadb039..6a7c4c06585c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c
@@ -2628,7 +2628,7 @@ brcmf_cfg80211_disconnect(struct wiphy *wiphy, struct net_device *ndev,
 }
 
 static s32
-brcmf_cfg80211_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+brcmf_cfg80211_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev, u8 radio_id,
 			    enum nl80211_tx_power_setting type, s32 mbm)
 {
 	struct brcmf_cfg80211_info *cfg = wiphy_to_cfg(wiphy);
diff --git a/drivers/net/wireless/marvell/mwifiex/cfg80211.c b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
index 8f1929ee2a92..a6ae8011f14b 100644
--- a/drivers/net/wireless/marvell/mwifiex/cfg80211.c
+++ b/drivers/net/wireless/marvell/mwifiex/cfg80211.c
@@ -374,7 +374,7 @@ mwifiex_cfg80211_cancel_remain_on_channel(struct wiphy *wiphy,
  */
 static int
 mwifiex_cfg80211_set_tx_power(struct wiphy *wiphy,
-			      struct wireless_dev *wdev,
+			      struct wireless_dev *wdev, u8 radio_id,
 			      enum nl80211_tx_power_setting type,
 			      int mbm)
 {
diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index 2de0834d76cd..b8b5ec062c3a 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -1636,7 +1636,7 @@ static void wilc_set_wakeup(struct wiphy *wiphy, bool enabled)
 	srcu_read_unlock(&wl->srcu, srcu_idx);
 }
 
-static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
+static int set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev, u8 radio_id,
 			enum nl80211_tx_power_setting type, int mbm)
 {
 	int ret;
diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index e4ba386f6265..7c1a378726fc 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -894,7 +894,7 @@ static int qtnf_get_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
 }
 
 static int qtnf_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
-			     enum nl80211_tx_power_setting type, int mbm)
+			     u8 radio_id, enum nl80211_tx_power_setting type, int mbm)
 {
 	struct qtnf_vif *vif;
 	int ret;
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index c7458bf9a7f1..eddea77b9cec 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1795,7 +1795,7 @@ static int cfg80211_rtw_disconnect(struct wiphy *wiphy, struct net_device *ndev,
 }
 
 static int cfg80211_rtw_set_txpower(struct wiphy *wiphy,
-				    struct wireless_dev *wdev,
+				    struct wireless_dev *wdev, u8 radio_id,
 				    enum nl80211_tx_power_setting type, int mbm)
 {
 	return 0;
diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 9cbce47fcea6..24e5d7cfb9e5 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4753,7 +4753,7 @@ struct cfg80211_ops {
 	int	(*set_wiphy_params)(struct wiphy *wiphy, u8 radio_id, u32 changed);
 
 	int	(*set_tx_power)(struct wiphy *wiphy, struct wireless_dev *wdev,
-				enum nl80211_tx_power_setting type, int mbm);
+				u8 radio_id, enum nl80211_tx_power_setting type, int mbm);
 	int	(*get_tx_power)(struct wiphy *wiphy, struct wireless_dev *wdev,
 				unsigned int link_id, int *dbm);
 
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index bd121815bd93..f86350b3a668 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3073,7 +3073,7 @@ static int ieee80211_set_wiphy_params(struct wiphy *wiphy, u8 radio_id, u32 chan
 }
 
 static int ieee80211_set_tx_power(struct wiphy *wiphy,
-				  struct wireless_dev *wdev,
+				  struct wireless_dev *wdev, u8 radio_id,
 				  enum nl80211_tx_power_setting type, int mbm)
 {
 	struct ieee80211_local *local = wiphy_priv(wiphy);
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index e2e70250527e..b6a1fe4fce29 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -3766,7 +3766,7 @@ static int nl80211_set_wiphy(struct sk_buff *skb, struct genl_info *info)
 			mbm = nla_get_u32(info->attrs[idx]);
 		}
 
-		result = rdev_set_tx_power(rdev, txp_wdev, type, mbm);
+		result = rdev_set_tx_power(rdev, txp_wdev, radio_id, type, mbm);
 		if (result)
 			return result;
 	}
diff --git a/net/wireless/rdev-ops.h b/net/wireless/rdev-ops.h
index 0b4185013fb2..c22a458e8158 100644
--- a/net/wireless/rdev-ops.h
+++ b/net/wireless/rdev-ops.h
@@ -589,12 +589,12 @@ rdev_set_wiphy_params(struct cfg80211_registered_device *rdev, u8 radio_id, u32
 }
 
 static inline int rdev_set_tx_power(struct cfg80211_registered_device *rdev,
-				    struct wireless_dev *wdev,
+				    struct wireless_dev *wdev, u8 radio_id,
 				    enum nl80211_tx_power_setting type, int mbm)
 {
 	int ret;
-	trace_rdev_set_tx_power(&rdev->wiphy, wdev, type, mbm);
-	ret = rdev->ops->set_tx_power(&rdev->wiphy, wdev, type, mbm);
+	trace_rdev_set_tx_power(&rdev->wiphy, wdev, radio_id, type, mbm);
+	ret = rdev->ops->set_tx_power(&rdev->wiphy, wdev, radio_id, type, mbm);
 	trace_rdev_return_int(&rdev->wiphy, ret);
 	return ret;
 }
diff --git a/net/wireless/trace.h b/net/wireless/trace.h
index 5fd600f54e0a..98ec4f3e8ec7 100644
--- a/net/wireless/trace.h
+++ b/net/wireless/trace.h
@@ -1716,23 +1716,26 @@ DEFINE_EVENT(wiphy_wdev_link_evt, rdev_get_tx_power,
 );
 
 TRACE_EVENT(rdev_set_tx_power,
-	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev,
+	TP_PROTO(struct wiphy *wiphy, struct wireless_dev *wdev, u8 radio_id,
 		 enum nl80211_tx_power_setting type, int mbm),
-	TP_ARGS(wiphy, wdev, type, mbm),
+	TP_ARGS(wiphy, wdev, radio_id, type, mbm),
 	TP_STRUCT__entry(
 		WIPHY_ENTRY
 		WDEV_ENTRY
+		__field(u8, radio_id)
 		__field(enum nl80211_tx_power_setting, type)
 		__field(int, mbm)
 	),
 	TP_fast_assign(
 		WIPHY_ASSIGN;
 		WDEV_ASSIGN;
+		__entry->radio_id = radio_id;
 		__entry->type = type;
 		__entry->mbm = mbm;
 	),
-	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT ", type: %u, mbm: %d",
-		  WIPHY_PR_ARG, WDEV_PR_ARG,__entry->type, __entry->mbm)
+	TP_printk(WIPHY_PR_FMT ", " WDEV_PR_FMT ", radio_id: %u, type: %u, mbm: %d",
+		  WIPHY_PR_ARG, WDEV_PR_ARG, __entry->radio_id, __entry->type,
+		  __entry->mbm)
 );
 
 TRACE_EVENT(rdev_return_int_int,
diff --git a/net/wireless/wext-compat.c b/net/wireless/wext-compat.c
index fd4a4112610e..3f1112fa56e8 100644
--- a/net/wireless/wext-compat.c
+++ b/net/wireless/wext-compat.c
@@ -892,7 +892,8 @@ static int cfg80211_wext_siwtxpower(struct net_device *dev,
 
 	guard(wiphy)(&rdev->wiphy);
 
-	return rdev_set_tx_power(rdev, wdev, type, DBM_TO_MBM(dbm));
+	return rdev_set_tx_power(rdev, wdev, NL80211_WIPHY_RADIO_ID_MAX, type,
+				 DBM_TO_MBM(dbm));
 }
 
 static int cfg80211_wext_giwtxpower(struct net_device *dev,
-- 
2.17.1


