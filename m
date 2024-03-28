Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC16C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RWPAWZS5q6QijauSiOmT/R9lEekKzDrnSghigim3D8w=; b=11yjnnSvBlnNtvVX0o72xGJtqZ
	hHKWElZWlUBi1ixTL1v9wlA9t/YlQEIkLU5NrZw6tkPLM3QbTHOiBxFUkWcLuzCgOskILqcql7hUF
	LNGvME5sk1dMUhDIb1XCeBaAKzWP2A8PVAwXRMBZ2yjaNuczKvXf4GpKm+7venDSpKpnEnh2aM9pA
	UBKu5zXCtepsoKVEQUxMr3a6k8NuR4Gvqrqo9cEJx1ZLKt2+QE8cJmOrR1C9+0RYtRpUfjcULEAxG
	wTKPby8zDHHaUum3U3/UWAij2evDYSewu/SFlpwbvhojVh3VVUjejovFGBGuByO0zYj+UBJovTya4
	/TBe6qXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkD5-0000000CsGa-3CW1
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:30:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkD0-0000000CsDI-3XLh
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:30:00 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S6iX8A017470;
	Thu, 28 Mar 2024 07:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=RWPAWZS5q6QijauSiOmT/R9lEekKzDrnSghigim3D8w=; b=mB
	e9qt4tlHfgeDeESll4ymYKG/8m404H0hmHYMrcXvXSw3DRMQZNc7GJWNpY/nZaz4
	rtopVJ9KAlSAtlO7Nuter/UbvJej+JLOWYfL8+0Me0UZlLAeFaNmW6Gzskfj/mRg
	pje1B7dm3TZ9WVu4yrLdoB4UOReMaca6o3TyCmzE50fj34rqfJgCMejz4kFFoalb
	WLntqe48UsF5vhVukpgeXIOFfN9WOTkTJksVv7YM4zt/C1T0/MYLLqS1pAB+Qx6E
	8OxftLBHyZRwXS2d4s9iYrF7hwG60M6Z/LorWCnf3rkm5bUvLlRjPyFDCq5Z8iIG
	Fa1NT+GkNDFhc4fuDX9Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4u1wjb83-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7TvKK001172
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:57 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:55 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 06/13] wifi: nl80211: send iface combination to user space in multi-hardware wiphy
Date: Thu, 28 Mar 2024 12:59:09 +0530
Message-ID: <20240328072916.1164195-7-quic_periyasa@quicinc.com>
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
X-Proofpoint-GUID: bGI7j-f7Ma6VzT_rySZUtLpTIQR0sOGS
X-Proofpoint-ORIG-GUID: bGI7j-f7Ma6VzT_rySZUtLpTIQR0sOGS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=864 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002958_934525_D876DC24 
X-CRM114-Status: GOOD (  19.94  )
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

As originally discussed in the RFC [1], add a new nested attribute to the
existing NL80211_CMD_NEW_WIPHY command. This attribute should advertise the
iface combination capability for each underlying physical hardware device.
This is necessary when the driver groups more than one physical hardware
under single wiphy.

[1]: https://lore.kernel.org/linux-wireless/20220920100518.19705-5-quic_vthiagar@quicinc.com/

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 include/uapi/linux/nl80211.h | 50 ++++++++++++++++++++++++++++++-
 net/wireless/nl80211.c       | 58 ++++++++++++++++++++++++++++++++++++
 2 files changed, 107 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index c53c9f941663..aa0988be1f2a 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -6004,6 +6004,10 @@ enum nl80211_iface_limit_attrs {
  * @NL80211_IFACE_COMB_BI_MIN_GCD: u32 attribute specifying the minimum GCD of
  *	different beacon intervals supported by all the interface combinations
  *	in this group (if not present, all beacon intervals be identical).
+ * @NL80211_IFACE_COMB_PER_HW_COMB: nested attribute specifying the interface
+ *	combination for each underlying hardware when multiple hardware are
+ *	registered under one wiphy,
+ *	see &enum nl80211_if_comb_per_hw_comb_attrs.
  * @NUM_NL80211_IFACE_COMB: number of attributes
  * @MAX_NL80211_IFACE_COMB: highest attribute number
  *
@@ -6020,7 +6024,19 @@ enum nl80211_iface_limit_attrs {
  *	numbers = [ #{STA} <= 1, #{P2P-client,P2P-GO} <= 3 ], max = 4
  *	=> allows a STA plus three P2P interfaces
  *
- * The list of these four possibilities could completely be contained
+ *	When describing per-hardware combinations in multi-hardware in
+ *	one wiphy model, the first possibility can further include the finer
+ *	capabilities like below
+ *	hw_chan_idx = 0, numbers = [ #{STA} <= 1, #{AP} <= 1 ],
+ *	channels = 1, max = 2
+ *	=> allows a STA plus an AP interface on the underlying hardware mac
+ *	   advertised at index 0 in wiphy @hw_chans array.
+ *	hw_chan_idx = 1, numbers = [ #{STA} <= 1, #{AP} <= 2 ],
+ *	channels = 1, max = 3
+ *	=> allows a STA plus two AP interfaces on the underlying hardware mac
+ *	   advertised at index 1 in wiphy @hw_chans array.
+ *
+ * The list of these five possibilities could completely be contained
  * within the %NL80211_ATTR_INTERFACE_COMBINATIONS attribute to indicate
  * that any of these groups must match.
  *
@@ -6039,12 +6055,44 @@ enum nl80211_if_combination_attrs {
 	NL80211_IFACE_COMB_RADAR_DETECT_WIDTHS,
 	NL80211_IFACE_COMB_RADAR_DETECT_REGIONS,
 	NL80211_IFACE_COMB_BI_MIN_GCD,
+	NL80211_IFACE_COMB_PER_HW_COMB,
 
 	/* keep last */
 	NUM_NL80211_IFACE_COMB,
 	MAX_NL80211_IFACE_COMB = NUM_NL80211_IFACE_COMB - 1
 };
 
+/**
+ * enum nl80211_if_comb_per_hw_comb_attrs - per-hardware iface combination
+ * attributes with multi-hw radios in one wiphy model
+ *
+ * @NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC: (reserved)
+ * @NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX: u8 attribute specifying the index
+ *	to the wiphy @hw_chans list for which the iface combination is being
+ *	described.
+ * @NL80211_IFACE_COMB_PER_HW_COMB_LIMITS: nested attribute containing the
+ *	limits for the given interface types, see
+ *	&enum nl80211_iface_limit_attrs.
+ * @NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM: u32 attribute giving the maximum
+ *	number of interfaces that can be created in this group. This number
+ *	does not apply to the interfaces purely managed in software.
+ * @NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS: u32 attribute specifying the
+ *	number of different channels that can be used in this group.
+ * @NUM_NL80211_IFACE_COMB_PER_HW_COMB: number of attributes
+ * @MAX_NL80211_IFACE_COMB_PER_HW_COMB: highest attribute number
+ */
+enum nl80211_if_comb_per_hw_comb_attrs {
+	NL80211_IFACE_COMB_PER_HW_COMB_UNSPEC,
+	NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
+	NL80211_IFACE_COMB_PER_HW_COMB_LIMITS,
+	NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
+	NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
+
+	/* keep last */
+	NUM_NL80211_IFACE_COMB_PER_HW_COMB,
+	MAX_NL80211_IFACE_COMB_PER_HW_COMB =
+			NUM_NL80211_IFACE_COMB_PER_HW_COMB - 1
+};
 
 /**
  * enum nl80211_plink_state - state of a mesh peer link finite state machine
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 37524a61f417..87436924834f 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1653,6 +1653,61 @@ nl80211_put_iface_limits(struct sk_buff *msg,
 	return -ENOBUFS;
 }
 
+static int
+nl80211_put_per_hw_iface_combinations(struct wiphy *wiphy, struct sk_buff *msg,
+				      const struct ieee80211_iface_combination *c)
+{
+	struct nlattr *hw_combis;
+	int i;
+
+	if (!wiphy->num_hw)
+		return 0;
+
+	hw_combis = nla_nest_start(msg, NL80211_IFACE_COMB_PER_HW_COMB);
+	if (!hw_combis)
+		return -ENOBUFS;
+
+	for (i = 0; i < c->n_hw_list; i++) {
+		struct nlattr *hw_combi, *limits;
+
+		hw_combi = nla_nest_start(msg, i + 1);
+		if (!hw_combi)
+			return -ENOBUFS;
+
+		if (nla_put_u8(msg, NL80211_IFACE_COMB_PER_HW_COMB_HW_IDX,
+			       c->iface_hw_list[i].hw_chans_idx))
+			return -ENOBUFS;
+
+		limits = nla_nest_start(msg,
+					NL80211_IFACE_COMB_PER_HW_COMB_LIMITS);
+		if (!limits)
+			return -ENOBUFS;
+
+		if (nl80211_put_iface_limits(msg,
+					     c->iface_hw_list[i].limits,
+					     c->iface_hw_list[i].n_limits))
+			return -ENOBUFS;
+
+		nla_nest_end(msg, limits);
+
+		if (nla_put_u32(msg,
+				NL80211_IFACE_COMB_PER_HW_COMB_NUM_CHANNELS,
+				c->iface_hw_list[i].num_different_channels))
+			return -ENOBUFS;
+
+		if (nla_put_u16(msg,
+				NL80211_IFACE_COMB_PER_HW_COMB_MAXIMUM,
+				c->iface_hw_list[i].max_interfaces))
+			return -ENOBUFS;
+
+		nla_nest_end(msg, hw_combi);
+	}
+
+	nla_nest_end(msg, hw_combis);
+
+	return 0;
+}
+
 static int nl80211_put_iface_combinations(struct wiphy *wiphy,
 					  struct sk_buff *msg,
 					  bool large)
@@ -1704,6 +1759,9 @@ static int nl80211_put_iface_combinations(struct wiphy *wiphy,
 				c->beacon_int_min_gcd))
 			goto nla_put_failure;
 
+		if (large && nl80211_put_per_hw_iface_combinations(wiphy, msg, c))
+			goto nla_put_failure;
+
 		nla_nest_end(msg, nl_combi);
 	}
 
-- 
2.34.1


