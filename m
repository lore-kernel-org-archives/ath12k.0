Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EB24C54E67
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaH4fMBk+JQl0hAOLd24qlZKav6+aNCUI7YTLNvxBs4=; b=d52oeiSOFSBQQQqJoSHccAIcbu
	+1v1uenGFdqPUMHDkTJB7v9nCUd6YdmQwHJhM2WE+CQR/vZMa1sm5nx2RtDqMXoG3uVK/KMUz141T
	H2qUl3oFRKEz7amJTnhs+gNrKIEBNpKJ70ZHppdCyXZw4eGjTy5S4ZlontqohOMJ+cUb/v8ZZKpTz
	wcMkoTJQsNBDDjgErGdCBfxIueYA6FmjSKP8d1u8E8ayjNj3fq0sntkydBS2J37VmxUOUxaRwsqvt
	0TPqXEE9dwWV7H35zaNcfexEoMCypITjHvLaFN8CaTnMjD+sODvH+KaoQ8UVAni1y4TL8sMLqKZaY
	uuzAyjMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkCu-0000000CsBN-1BrU
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:29:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkCr-0000000CsAG-2z68
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:29:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S2kSln015207;
	Thu, 28 Mar 2024 07:29:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=UaH4fMBk+JQl0hAOLd24qlZKav6+aNCUI7YTLNvxBs4=; b=Wd
	nrgXYRlZbhgYkBBm4F4zAgG8L84DTW2kd8vCRgObryGFJgDh2+dIbLiHGHuk/fpD
	tzv42bWZJuLz7dz3ZxXxe0FMeQIz3w+IbbtRz/qJbaAtMu4FihjBlPlia+fAjWnm
	F5p/c/nY4VR5br16qxJ/flYpE+xEBFKQFLPolfWXPH5XJXcASo2PKbVPHgG4USlJ
	0g/Y/+lhztDI6/5fcq3c/Lmab9dqKERKlhIpypzhse5yw4LDo+pgItS1Gquey4xO
	YKRVn9T0E9V2loS71fhcS5NFZCg5ekuzAdXuAlEMwHg40e+9eG2t1oa+e5icXo0r
	ho4/Zizfk4ID4He70XOw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x4u1wjb7a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7TmYp000618
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:48 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:45 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 02/13] wifi: nl80211: send underlying multi-hardware channel capabilities to user space
Date: Thu, 28 Mar 2024 12:59:05 +0530
Message-ID: <20240328072916.1164195-3-quic_periyasa@quicinc.com>
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
X-Proofpoint-GUID: fMrZDl1MtlaHgYHUBoxzlprMN36AtsIb
X-Proofpoint-ORIG-GUID: fMrZDl1MtlaHgYHUBoxzlprMN36AtsIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002950_038398_39C1FD33 
X-CRM114-Status: GOOD (  17.63  )
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

As originally discussed in the RFC [1], when driver supports multiple
physical hardware under one wiphy, wiphy->num_hw != 0, send per-hardware
supported frequency list to user space. List of frequency are reported
inside an index which identifies the hardware as in wiphy->hw_chans[].
This hardware index will be used in follow up patches to identify the
interface combination capability for each of the underlying physical
hardware abstracted under one wiphy.

[1]: https://lore.kernel.org/linux-wireless/20220920100518.19705-3-quic_vthiagar@quicinc.com/

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 include/uapi/linux/nl80211.h | 28 +++++++++++++++++++++
 net/wireless/nl80211.c       | 47 ++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index f917bc6c9b6f..c53c9f941663 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -2856,6 +2856,11 @@ enum nl80211_commands {
  *	%NL80211_CMD_ASSOCIATE indicating the SPP A-MSDUs
  *	are used on this connection
  *
+ * @NL80211_ATTR_MULTI_HW: nested attribute to send the hardware specific
+ *	channel capabilities to user space. Drivers registering multiple
+ *	physical hardware under a wiphy can use this attribute,
+ *	see &enum nl80211_multi_hw_mac_attrs.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3401,6 +3406,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_ASSOC_SPP_AMSDU,
 
+	NL80211_ATTR_MULTI_HW,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -7999,4 +8006,25 @@ enum nl80211_ap_settings_flags {
 	NL80211_AP_SETTINGS_SA_QUERY_OFFLOAD_SUPPORT	= 1 << 1,
 };
 
+/**
+ * nl80211_multi_hw_attrs - multi-hw attributes
+ *
+ * @NL80211_MULTI_HW_ATTR_INVALID: invalid
+ * @NL80211_MULTI_HW_ATTR_IDX: (u8) multi-HW index to refer the underlying HW
+ *	for which the supported channel list is advertised. Internally refer
+ *	the index of the wiphy's @hw_chans array.
+ * @NL80211_MULTI_HW_ATTR_FREQS: array of supported center frequencies
+ * @__NL80211_MULTI_HW_ATTR_LAST: internal use
+ * @NL80211_MULTI_HW_ATTR_MAX: maximum multi-hw mac attribute
+ */
+enum nl80211_multi_hw_attrs {
+	__NL80211_MULTI_HW_ATTR_INVALID,
+
+	NL80211_MULTI_HW_ATTR_IDX,
+	NL80211_MULTI_HW_ATTR_FREQS,
+
+	/* keep last */
+	__NL80211_MULTI_HW_ATTR_LAST,
+	NL80211_MULTI_HW_ATTR_MAX = __NL80211_MULTI_HW_ATTR_LAST - 1
+};
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index b4edba6b0b7b..2a5e395e2e0b 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -2392,6 +2392,47 @@ static int nl80211_put_mbssid_support(struct wiphy *wiphy, struct sk_buff *msg)
 	return -ENOBUFS;
 }
 
+static int nl80211_put_multi_hw_support(struct wiphy *wiphy,
+					struct sk_buff *msg)
+{
+	struct nlattr *hw_macs, *hw_mac;
+	struct nlattr *freqs;
+	int i, c;
+
+	if (!wiphy->num_hw)
+		return 0;
+
+	hw_macs = nla_nest_start(msg, NL80211_ATTR_MULTI_HW);
+	if (!hw_macs)
+		return -ENOBUFS;
+
+	for (i = 0; i < wiphy->num_hw; i++) {
+		hw_mac = nla_nest_start(msg, i + 1);
+		if (!hw_mac)
+			return -ENOBUFS;
+
+		if (nla_put_u8(msg, NL80211_MULTI_HW_ATTR_IDX, i))
+			return -ENOBUFS;
+
+		freqs = nla_nest_start(msg,
+				       NL80211_MULTI_HW_ATTR_FREQS);
+		if (!freqs)
+			return -ENOBUFS;
+
+		for (c = 0; c < wiphy->hw_chans[i]->n_chans; c++)
+			if (nla_put_u32(msg, c + 1,
+					wiphy->hw_chans[i]->chans[c].center_freq))
+				return -ENOBUFS;
+
+		nla_nest_end(msg, freqs);
+
+		nla_nest_end(msg, hw_mac);
+	}
+
+	nla_nest_end(msg, hw_macs);
+	return 0;
+}
+
 struct nl80211_dump_wiphy_state {
 	s64 filter_wiphy;
 	long start;
@@ -3001,6 +3042,12 @@ static int nl80211_send_wiphy(struct cfg80211_registered_device *rdev,
 				rdev->wiphy.hw_timestamp_max_peers))
 			goto nla_put_failure;
 
+		state->split_start++;
+		break;
+	case 17:
+		if (nl80211_put_multi_hw_support(&rdev->wiphy, msg))
+			goto nla_put_failure;
+
 		/* done */
 		state->split_start = 0;
 		break;
-- 
2.34.1


