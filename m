Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BBCD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sf7XQrn8OOpzfAnWC78Bzf3fNIIO26Kb7m5W2QlOTsU=; b=xSw5hnovJa0qNASssoRv2PKwuR
	nFFzSycnk/Jba7dIps9YJmazBrAdEyTfNYu0Fi2GA1TRZS7nam3TSYn1f3Szl5mjEMhIlhKvJrvJd
	lta+omKTW9BGa6LbRLrmG2nDrk8pPBiHja505L+JPhw1dsY9ga5nryH2KkAtnL+p+YpY7E8lASB70
	jQBormpeLrI5JC+gWZ4uX2Xmp3SPIoROPPVZedgoUHKIvnDhi1UOYYCO7rkxPT9p1rnJR4H+x0vHK
	YajNSD3/w6nj6APCwAzK0GlQEFEBxBkl/vSD5S4Kq+v3YrREQXNmqzHhk2uUVHE8baAHKEnfO7e/z
	hfovGVTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkDH-0000000CsNF-1QDw
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:30:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkDB-0000000CsJm-31vi
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:30:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S52okD008246;
	Thu, 28 Mar 2024 07:30:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=sf7XQrn8OOpzfAnWC78Bzf3fNIIO26Kb7m5W2QlOTsU=; b=Ux
	QcZTOqM9vggr+9yIjmOzn7nn9aFVaA16PysK8iuDfpAxwHN5PMG4yAdj6iIIUzf4
	rnPeP+X+DKmFz9yJ5EXTRAg+20CPOoR8WjCcNsDFwX54E6W6pzCyChakLBDqE80m
	zBbKRMSiIC9ITs6rck1UeMdLhG0rM4bCsdflpN5aWXYbdWNegcSxVIQSq2Eb8GaC
	jWAvobYTU5XzaE+ohmsgsHt+7wnjBsOo3oyNNC5ocy5OV8bo4rVgCOD0PXNvo4HZ
	/tSNwImoZ1hmgQ+UMT44f0RfktwKrcOb8S+vzgv005eRs6t/IeegG39ABtHufOYL
	Q1bHjsO7xH7lLadReICw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4u1wjb2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:30:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7TjQj012638
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:45 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:43 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 01/13] wifi: cfg80211: Add provision to advertise multiple radio in one wiphy
Date: Thu, 28 Mar 2024 12:59:04 +0530
Message-ID: <20240328072916.1164195-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iC8DXTC_-GQr-yHgugZ9RYewSFrPLKWm
X-Proofpoint-ORIG-GUID: iC8DXTC_-GQr-yHgugZ9RYewSFrPLKWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_003010_112925_6348BB10 
X-CRM114-Status: GOOD (  22.98  )
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

From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>

As originally discussed in the RFC [1], the prerequisite for MLO support
in cfg80211/mac80211 is that all the links participating in MLO must
belong to the same wiphy/ieee80211_hw. To meet this expectation, some
drivers may need to group multiple discrete hardware, each acting as a
link in MLO, under one wiphy. Though most of the hardware abstractions must
be handled within the driver itself, it may be required to have some sort
of mapping while describing interface combination capabilities for each of
the underlying hardware. Add an advertisement provision for drivers
supporting such MLO mode of operation.

Capability advertisement such as the number of supported channels for each
physical hardware has been identified to support some of the common use
cases.

[1]: https://lore.kernel.org/linux-wireless/20220920100518.19705-2-quic_vthiagar@quicinc.com/

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 include/net/cfg80211.h |  24 ++++++++++
 net/wireless/core.c    | 100 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 2e2be4fd2bb6..dde129e61b60 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5394,6 +5394,18 @@ struct wiphy_iftype_akm_suites {
 
 #define CFG80211_HW_TIMESTAMP_ALL_PEERS	0xffff
 
+/**
+ * struct ieee80211_chans_per_hw - supported channels as per the
+ * underlying physical hardware configuration
+ *
+ * @n_chans: number of channels in @chans
+ * @chans: list of channels supported by the constituent hardware
+ */
+struct ieee80211_chans_per_hw {
+	u32 n_chans;
+	struct ieee80211_channel chans[];
+};
+
 /**
  * struct wiphy - wireless hardware description
  * @mtx: mutex for the data (structures) of this device
@@ -5610,6 +5622,15 @@ struct wiphy_iftype_akm_suites {
  *	A value of %CFG80211_HW_TIMESTAMP_ALL_PEERS indicates the driver
  *	supports enabling HW timestamping for all peers (i.e. no need to
  *	specify a mac address).
+ *
+ * @hw_chans: list of the channels supported by every constituent underlying
+ *	hardware. Drivers abstracting multiple discrete hardware (radio) under
+ *	one wiphy can advertise the list of channels supported by each physical
+ *	hardware in this list. Underlying hardware specific channel list can be
+ *	used while describing interface combination for each of them.
+ * @num_hw: number of underlying hardware for which the channels list are
+ *	advertised in @hw_chans, 0 if multi hardware is not support. Expect >2
+ *	if multi hardware is support.
  */
 struct wiphy {
 	struct mutex mtx;
@@ -5760,6 +5781,9 @@ struct wiphy {
 
 	u16 hw_timestamp_max_peers;
 
+	struct ieee80211_chans_per_hw **hw_chans;
+	u8 num_hw;
+
 	char priv[] __aligned(NETDEV_ALIGN);
 };
 
diff --git a/net/wireless/core.c b/net/wireless/core.c
index 3fb1b637352a..119937d0f2e0 100644
--- a/net/wireless/core.c
+++ b/net/wireless/core.c
@@ -690,6 +690,103 @@ static int wiphy_verify_combinations(struct wiphy *wiphy)
 	return 0;
 }
 
+static int cfg80211_check_hw_chans(const struct ieee80211_chans_per_hw *chans1,
+				   const struct ieee80211_chans_per_hw *chans2)
+{
+	int i, j;
+
+	if (!chans1 || !chans2)
+		return -EINVAL;
+
+	if (!chans1->n_chans || !chans2->n_chans)
+		return -EINVAL;
+
+	/* for now same channel is not allowed in more than one
+	 * physical hardware.
+	 */
+	for (i = 0; i < chans1->n_chans; i++)
+		for (j = 0; j < chans2->n_chans; j++)
+			if (chans1->chans[i].center_freq ==
+			    chans2->chans[j].center_freq)
+				return -EINVAL;
+	return 0;
+}
+
+static bool
+cfg80211_hw_chans_in_supported_list(struct wiphy *wiphy,
+				    const struct ieee80211_chans_per_hw *chans)
+{
+	enum nl80211_band band;
+	struct ieee80211_supported_band *sband;
+	int i, j;
+
+	for (i = 0; i < chans->n_chans; i++) {
+		bool found = false;
+
+		for (band = 0; band < NUM_NL80211_BANDS; band++) {
+			sband = wiphy->bands[band];
+			if (!sband)
+				continue;
+			for (j = 0; j < sband->n_channels; j++) {
+				if (chans->chans[i].center_freq ==
+				    sband->channels[j].center_freq) {
+					found = true;
+					break;
+				}
+			}
+
+			if (found)
+				break;
+		}
+
+		if (!found)
+			return false;
+	}
+
+	return true;
+}
+
+static int cfg80211_validate_per_hw_chans(struct wiphy *wiphy)
+{
+	int i, j;
+	int ret;
+
+	if (!wiphy->num_hw)
+		return 0;
+
+	if (!wiphy->hw_chans)
+		return -EINVAL;
+
+	/* advertisement of supported channels in wiphy->bands should be
+	 * sufficient when physical hardware is one.
+	 */
+	if (wiphy->num_hw < 2)
+		return -EINVAL;
+
+	for (i = 0; i < wiphy->num_hw; i++) {
+		for (j = i + 1; j < wiphy->num_hw; j++) {
+			const struct ieee80211_chans_per_hw *hw_chans1;
+			const struct ieee80211_chans_per_hw *hw_chans2;
+
+			hw_chans1 = wiphy->hw_chans[i];
+			hw_chans2 = wiphy->hw_chans[j];
+			ret = cfg80211_check_hw_chans(hw_chans1, hw_chans2);
+			if (ret)
+				return ret;
+		}
+	}
+
+	for (i = 0; i < wiphy->num_hw; i++) {
+		const struct ieee80211_chans_per_hw *hw_chans;
+
+		hw_chans = wiphy->hw_chans[i];
+		if (!cfg80211_hw_chans_in_supported_list(wiphy, hw_chans))
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
 int wiphy_register(struct wiphy *wiphy)
 {
 	struct cfg80211_registered_device *rdev = wiphy_to_rdev(wiphy);
@@ -927,6 +1024,9 @@ int wiphy_register(struct wiphy *wiphy)
 		return -EINVAL;
 	}
 
+	if (WARN_ON(cfg80211_validate_per_hw_chans(&rdev->wiphy)))
+		return -EINVAL;
+
 	for (i = 0; i < rdev->wiphy.n_vendor_commands; i++) {
 		/*
 		 * Validate we have a policy (can be explicitly set to
-- 
2.34.1


