Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3287CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IHdaB5tukL+SGpjAgWM2U8+XAfoU2eBIdaq4WWMhv0=; b=fIqKdV/QGhpqFJuDXVwUCbqYoX
	oLaHbHJqcSOM7zZ9AUt/q/hDtfwDMJbfpt4KIHlyHSkgoQngDQQWn1ryArJlLkJlXoOJ7gJSZ93iU
	vd3HA9ztJ0lL/mn1nWXbsLFD+sl+n3CRYBptNrbyWpaqPzuaPHk4U1n97utXkcR0tFBMmL2jtWVd6
	ouQZ9QCI94lsO78RN6gRS/LqLXa5V0I2IqilIcFrNlJmCaNPZIfFz5jNqKEBUVRcyHHw0gZ7vU550
	STs+GIxsTcf0inZmsrnwPR0kn9PNNIg/0AeRkAfAmFP0+FCAfHswzFqZ/hqM/2WHxom+yuqwcWMMn
	iClNHFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEPx-0000000GtWH-2JKU;
	Thu, 15 Oct 2026 05:54:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEPv-0000000GtVw-06r9
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:54:16 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMXZWm644564
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=2IHdaB5tukL+SGpjAgWM2U8+XAfoU2eBIda
	q4WWMhv0=; b=es4i1p06vgDlKQxNForeXPtLPzshZErKDPaZHQO3VXrdJD1+06L
	oJ2du2ajHOb2hNpRkEnLnvG/TkmhUJSNBsFeaIMo8i24nfWCt1HzZ4yXjHcLljzs
	0MwdmDuQJ0wEcHjNK2q6YdeWlFtIDyEZMg/TXM9V3WU0cLfKYQjHH4ym79+sMciL
	3TH16TLKgYAcCiPpTYclnSpTrcljzVWaE4H8dpN1XN2XUoNF2VZHlFqNPEg/qZ6A
	adYoNIU6MsVG9/T49Kjxz5lffsf2F9DHMpLVDYMflNPi5YEBdZGGISe/QdYdnDuS
	ZYM252cYomEEFz3stQmvijlRSnKzKHCsX8g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hajmy9b5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:13 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac450b74b0so3426462a91.0
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043653; x=1792648453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2IHdaB5tukL+SGpjAgWM2U8+XAfoU2eBIdaq4WWMhv0=;
        b=jpoq9qf5h8RWVRgIEb8uviDmsnA18PWA89VkWg9XlVo9gKTqe+abyOvKioxSwFUgKk
         nbMvPt9B0mTSDAfyTu37p+r5U0z35TX3ZFEiCyXL2xZUFl2ryBMKdU9xx9+uZZusIi3Z
         JHkVbLVhwi5hlGQeM++TRei/NDT4N3HQTxnyOT2amt4uMP8kwHv2fgjRoyiSauk9DZat
         /tQjtNPyiPNVMVutiHQraphCzklmbbTeEvPOAWmHCBIIi6AYvTDceYpXcb+XalythFtf
         CnN88VuMB4C1GLbntJGMkTYmCdCO0hdvSXBxXgpe+1uu+v882XlIoHACJM3zoY5K6hvQ
         iudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043653; x=1792648453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IHdaB5tukL+SGpjAgWM2U8+XAfoU2eBIdaq4WWMhv0=;
        b=1rOJYkfbbprjUIswvrLMELKsT7xHGnqF11zW5kljtVkTgF54Emj9qUDAL+4sbZM/Pd
         /LK46rdlfOC9h6uT+UKgwc0rvp7VAHFQ1zqDDBMZrVnKEAgssfPMbgAunX2aMdE/oVHF
         0XYC56VpZiKcSOCgbAnh4ZtX+/gHp49LwR8RLJBI3eYOJBeq3eSzMoPiQU5DAdO3HJ6J
         OcJTxNsff/nwkntWi803UXG9oC/OBGrJhvDFqUrJO16L1F2OYuD/Z6gqMIoUY/Ub/WQy
         0yjKeko2soETg9oJFdLQh4kztQkyb6ZVZSnfykyJYK1nRBfbGV9eGbtb0ukSLF0zukCA
         Nl1w==
X-Forwarded-Encrypted: i=1; AKwUvBw7sHpch4By9uPejuEQELHjW8E6xHcxLINGUuo2XeIzfqv6bYqIux1/srwYWMBGt+r+47U6S44=@lists.infradead.org
X-Gm-Message-State: AFq9FYKGwGBC1Rdqp+xehbe+gOv+rC+/EorUBmu0N7kdjOMKeWnK2e2y
	UwIibAP8gLgKgD4SV1JyiYauY0vuKBSL8/NIH1VjoV08YXxJ/mxr80G/bkMtMXxXJ2stAlSyqdB
	HZhycLtdIoqRZ5+azOcCuag/iJ6QIUVtZw+zoyiccTOaMT7Yd8yp2uW109fn2jebO
X-Gm-Gg: AYBFou3rqjAYuDBa3+PDctJszKRy7FJ6KUbAhElQCfmI6UzepVO/lBm/RL5ho8yBGC7
	AL3LEpWqpwiSBcrnHB/XUJp+Mv2Ak7qEaCwwXnoxtGtrL6YjfTSn7MhTy0Igzeh7PZyz3z1vfCL
	J9l703dqhjp+CSWKhgpl7pcZzUtL7cLSe/NuKnS5B4K3mVvG19LXu6f2SwQXVUBZQ+vmwAyvnY+
	Sx+AWAmbL4C59NvCds4STuhOMDMRs/pxFBNYtZUZ/anyoR4nKunHVWHvh0Yv/MGAtmruVH/PI0X
	JcVE8hO6d9T61k+8M9a4Pg7uwaKYDS2pkUrgpnH9cVtOFwVkdybqXyrpICBA1eI1D7edUG/n61U
	JJbdaS8//duP66KIl6B+uUx+OFrrDlZt2a5zyoCjWcpjImVH6jkgQGsB74XhG5h0BTi+xa04qn8
	jpDje3KUcQ36vpEQ==
X-Received: by 2002:a17:90b:258f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ab3a8d974emr15234296a91.58.1792043652966;
        Wed, 14 Oct 2026 22:54:12 -0700 (PDT)
X-Received: by 2002:a17:90b:258f:b0:3a6:f1d2:57f3 with SMTP id 98e67ed59e1d1-3ab3a8d974emr15234283a91.58.1792043652364;
        Wed, 14 Oct 2026 22:54:12 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9449ae48sm2734448a91.13.2026.10.14.22.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:54:11 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Arun Vikas T <arun.t@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 1/7] wifi: nl80211: add QoS Management UAPI
Date: Thu, 15 Oct 2026 11:24:06 +0530
Message-Id: <20261015055406.680511-1-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Z-Pc_HGMSv13GwSRzP1Rx6PVt3EZOFMp
X-Proofpoint-ORIG-GUID: Z-Pc_HGMSv13GwSRzP1Rx6PVt3EZOFMp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfXwtrURRndG4Dp
 r35WfI+Tb9WrKmDqMyb9s8gz1b3gq1kw9aBdPsmq4vQF2gmQLR4TcA81XSLKvVZ023CkK6sZW8y
 AcyqMj8OElgd/WPXTPorUtyYsUxo6HE=
X-Authority-Analysis: v=2.4 cv=TbQDJhQh c=1 sm=1 tr=0 ts=6ad06a86 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=BHmDPy62uHH8tM3u7LoA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX4r2GICglzMzs
 lq9EbtgcvzsC2tileb090IZU4P3BkpJtnPhlL/pyuDYdBN8+YLyigcVQSFGXMh/bPKrdsg8DQtF
 8bQ+x/Bz7r3NOdtk5B4GQH14tOkuOdAh3rIL0B8gCLU+nZm79P7/Rm5o7omUHvxAwGOQj2bDrd0
 sw2PeDa9ynv0vEU0p/OspPcNCE+Zuljr6Q3g7ka/bYvvwfbu6xNi68UpFnaBnV5Stsdpn2rpkRw
 soa7p3LC8Ydxj6PnnhI3pK7iHYTk+kOj4lmBeCf+h3zwU1rYGReiJ2OH5fk097c3c4OtO5CYDvH
 Yrb2SInKxe43ho45bUqe1cvwAOaeug/esks6JE5HSYj9P7sJLRPcwTqdJZitsP78Q/QSbmw64nP
 CUw96NEiF0brCD7HATcpTzoclkRKAyhn3Jt3ARmJktW6usvsQh1aIVP7E9nTuSU4BvIQvJLV30n
 XUJNAUkT8RHN5u5GUpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_225415_119754_C8307CCB 
X-CRM114-Status: GOOD (  13.49  )
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

Add the UAPI definitions and nested netlink policies used by the generic
QoS Management (QM) framework.

Introduce protocol identifiers for Stream Classification Service (SCS)
and Mirrored Stream Classification Service (MSCS), request operation
types, QoS characteristics direction encoding, response status codes,
and the NL80211_CMD_QOS_MGMT command.

The NL80211_ATTR_QOS_MGMT payload contains the protocol selector and
nested descriptor, SCS TCLAS and QoS attributes, and MSCS-specific
attributes. The corresponding nl80211 policies validate the attribute types
and ranges before parsing.

The SCS and MSCS procedures are specified in 11.25.2 and 11.25.3,
IEEE Std 802.11-2024. The SCS Descriptor and MSCS Descriptor elements are
specified in 9.4.2.120 and 9.4.2.242, IEEE Std 802.11-2024, respectively.
The TCLAS element and TCLAS Processing element are specified in 9.4.2.29
and 9.4.2.31, IEEE Std 802.11-2024. The QoS Characteristics element is
specified in 9.4.2.326, IEEE Std 802.11be-2024.

Co-developed-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 include/uapi/linux/nl80211.h | 344 +++++++++++++++++++++++++++++++++++
 net/wireless/nl80211.c       |  88 +++++++++
 2 files changed, 432 insertions(+)

diff --git a/include/uapi/linux/nl80211.h b/include/uapi/linux/nl80211.h
index b56a96f57bec..4106fe662945 100644
--- a/include/uapi/linux/nl80211.h
+++ b/include/uapi/linux/nl80211.h
@@ -1468,6 +1468,10 @@
  *	and multiple can be nested in %NL80211_ATTR_MLO_LINKS but then the
  *	update isn't atomic if any failures happen.
  *	Only supported with %NL80211_EXT_FEATURE_UPDATE_BEACON.
+ * @NL80211_CMD_QOS_MGMT: QoS Management configuration for a station. Used
+ *	by userspace to send QoS Management (QM) requests and to receive the
+ *	corresponding status response via %NL80211_ATTR_QOS_MGMT.
+ *
  * @NL80211_CMD_MAX: highest used command number
  * @__NL80211_CMD_AFTER_LAST: internal use
  */
@@ -1750,6 +1754,8 @@ enum nl80211_commands {
 
 	NL80211_CMD_UPDATE_BEACON,
 
+	NL80211_CMD_QOS_MGMT,
+
 	/* add new commands above here */
 
 	/* used to define NL80211_CMD_MAX below */
@@ -3243,6 +3249,13 @@ enum nl80211_commands {
  * @NL80211_ATTR_ASSOC_PROTECTED_TWT: Enable protected TWT for the association,
  *	requires protected TWT support (flag attribute)
  *
+ * @NL80211_ATTR_QOS_MGMT: Used with %NL80211_CMD_QOS_MGMT to configure
+ *	QoS Management (QM) features for a station. The nested payload is
+ *	described by &enum nl80211_qm_attrs. It contains a nested array of
+ *	&enum nl80211_qm_desc_attrs entries; SCS TCLAS and QoS attributes use
+ *	&enum nl80211_qm_tclas_attrs and &enum nl80211_qm_qos_attrs,
+ *	respectively.
+ *
  * @NUM_NL80211_ATTR: total number of nl80211_attrs available
  * @NL80211_ATTR_MAX: highest attribute number currently defined
  * @__NL80211_ATTR_AFTER_LAST: internal use
@@ -3850,6 +3863,8 @@ enum nl80211_attrs {
 
 	NL80211_ATTR_ASSOC_PROTECTED_TWT,
 
+	NL80211_ATTR_QOS_MGMT,
+
 	/* add attributes here, update the policy in nl80211.c */
 
 	__NL80211_ATTR_AFTER_LAST,
@@ -9200,4 +9215,333 @@ enum nl80211_nan_peer_map_attrs {
 
 #define NL80211_NAN_SCHED_NOT_AVAIL_SLOT 0xff
 
+#define NL80211_IPADDR_MAX_LEN			16
+#define NL80211_QM_TCLAS_TYPE10_MAX_FILTER_LEN	12
+#define NL80211_QM_TCLAS_TYPE4_FLOW_LABEL_LEN	3
+
+/*
+ * The TCLAS element (reference 9.4.2.29, IEEE Std 802.11-2024) is used by
+ * SCS for traffic classification.
+ */
+/**
+ * enum nl80211_qm_tclas_type4_attrs - TCLAS classifier type 4 attributes
+ *
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_INVALID: Invalid
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_CLASSIFIER_MASK: Classifier mask (u8), see
+ *	&enum nl80211_qm_tclas_type4_mask
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_IP_VERSION: IP version, 4 or 6 (u8)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_SRC_IP: Source IP address
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_DST_IP: Destination IP address
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_SRC_PORT: Source port (u16)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_DST_PORT: Destination port (u16)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_DSCP: DSCP value, 0-63 (u8)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_PROTOCOL: IP protocol number, IPv4 only (u8)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_NEXT_HEADER: Next header, IPv6 only (u8)
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_FLOW_LABEL: Flow label, IPv6 only
+ * @__NL80211_QM_TCLAS_TYPE4_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_TCLAS_TYPE4_ATTR_MAX: highest type 4 attribute number currently
+ *	defined
+ */
+enum nl80211_qm_tclas_type4_attrs {
+	NL80211_QM_TCLAS_TYPE4_ATTR_INVALID,
+	NL80211_QM_TCLAS_TYPE4_ATTR_CLASSIFIER_MASK,
+	NL80211_QM_TCLAS_TYPE4_ATTR_IP_VERSION,
+	NL80211_QM_TCLAS_TYPE4_ATTR_SRC_IP,
+	NL80211_QM_TCLAS_TYPE4_ATTR_DST_IP,
+	NL80211_QM_TCLAS_TYPE4_ATTR_SRC_PORT,
+	NL80211_QM_TCLAS_TYPE4_ATTR_DST_PORT,
+	NL80211_QM_TCLAS_TYPE4_ATTR_DSCP,
+	NL80211_QM_TCLAS_TYPE4_ATTR_PROTOCOL,
+	NL80211_QM_TCLAS_TYPE4_ATTR_NEXT_HEADER,
+	NL80211_QM_TCLAS_TYPE4_ATTR_FLOW_LABEL,
+
+	/* keep last */
+	__NL80211_QM_TCLAS_TYPE4_ATTR_AFTER_LAST,
+	NL80211_QM_TCLAS_TYPE4_ATTR_MAX =
+		__NL80211_QM_TCLAS_TYPE4_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_tclas_type10_attrs - TCLAS classifier type 10 attributes
+ *
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_INVALID: Invalid
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_PROT_INSTANCE: Protocol instance (u8)
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_PROT_NUMBER: Protocol number (u8)
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_VALUE: Filter value bytes
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_MASK: Filter mask bytes
+ * @__NL80211_QM_TCLAS_TYPE10_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_TCLAS_TYPE10_ATTR_MAX: highest type 10 attribute number currently
+ *	defined
+ */
+enum nl80211_qm_tclas_type10_attrs {
+	NL80211_QM_TCLAS_TYPE10_ATTR_INVALID,
+	NL80211_QM_TCLAS_TYPE10_ATTR_PROT_INSTANCE,
+	NL80211_QM_TCLAS_TYPE10_ATTR_PROT_NUMBER,
+	NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_VALUE,
+	NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_MASK,
+
+	/* keep last */
+	__NL80211_QM_TCLAS_TYPE10_ATTR_AFTER_LAST,
+	NL80211_QM_TCLAS_TYPE10_ATTR_MAX =
+		__NL80211_QM_TCLAS_TYPE10_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_tclas_attrs - TCLAS element attributes
+ *
+ * @NL80211_QM_TCLAS_ATTR_INVALID: Invalid
+ * @NL80211_QM_TCLAS_ATTR_USER_PRIORITY: User priority, 0-7 (u8)
+ * @NL80211_QM_TCLAS_ATTR_CLASSIFIER_TYPE: Classifier type, 4 or 10 (u8)
+ * @NL80211_QM_TCLAS_ATTR_TYPE4_PARAMS: Nested type 4 classifier params, see
+ *	&enum nl80211_qm_tclas_type4_attrs
+ * @NL80211_QM_TCLAS_ATTR_TYPE10_PARAMS: Nested type 10 classifier params, see
+ *	&enum nl80211_qm_tclas_type10_attrs
+ * @__NL80211_QM_TCLAS_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_TCLAS_ATTR_MAX: highest TCLAS attribute number currently defined
+ */
+enum nl80211_qm_tclas_attrs {
+	NL80211_QM_TCLAS_ATTR_INVALID,
+	NL80211_QM_TCLAS_ATTR_USER_PRIORITY,
+	NL80211_QM_TCLAS_ATTR_CLASSIFIER_TYPE,
+	NL80211_QM_TCLAS_ATTR_TYPE4_PARAMS,
+	NL80211_QM_TCLAS_ATTR_TYPE10_PARAMS,
+
+	/* keep last */
+	__NL80211_QM_TCLAS_ATTR_AFTER_LAST,
+	NL80211_QM_TCLAS_ATTR_MAX = __NL80211_QM_TCLAS_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_tclas_classifier_type - TCLAS classifier type values sent
+ *	in %NL80211_QM_TCLAS_ATTR_CLASSIFIER_TYPE
+ * @NL80211_QM_TCLAS_CLASSIFIER_TYPE4: Classifier type 4, 5-tuple based;
+ *	reference 9.4.2.29, IEEE Std 802.11-2024.
+ * @NL80211_QM_TCLAS_CLASSIFIER_TYPE10: Classifier type 10, filter based;
+ *	reference 9.4.2.29, IEEE Std 802.11-2024.
+ *
+ * The SCS interface currently supports only classifier types 4 and 10.
+ */
+enum nl80211_qm_tclas_classifier_type {
+	NL80211_QM_TCLAS_CLASSIFIER_TYPE4 = 4,
+	NL80211_QM_TCLAS_CLASSIFIER_TYPE10 = 10,
+};
+
+/**
+ * enum nl80211_qm_tclas_type4_mask - classifier mask bits for TCLAS type 4
+ * @NL80211_QM_TCLAS_TYPE4_MASK_VERSION: IP version field
+ * @NL80211_QM_TCLAS_TYPE4_MASK_SRC_IP: source IP address
+ * @NL80211_QM_TCLAS_TYPE4_MASK_DST_IP: destination IP address
+ * @NL80211_QM_TCLAS_TYPE4_MASK_SRC_PORT: source port
+ * @NL80211_QM_TCLAS_TYPE4_MASK_DST_PORT: destination port
+ * @NL80211_QM_TCLAS_TYPE4_MASK_DSCP: DSCP field
+ * @NL80211_QM_TCLAS_TYPE4_MASK_PROTOCOL: protocol / next-header field
+ * @NL80211_QM_TCLAS_TYPE4_MASK_FLOW_LABEL: IPv6 flow label
+ */
+enum nl80211_qm_tclas_type4_mask {
+	NL80211_QM_TCLAS_TYPE4_MASK_VERSION    = 1 << 0,
+	NL80211_QM_TCLAS_TYPE4_MASK_SRC_IP     = 1 << 1,
+	NL80211_QM_TCLAS_TYPE4_MASK_DST_IP     = 1 << 2,
+	NL80211_QM_TCLAS_TYPE4_MASK_SRC_PORT   = 1 << 3,
+	NL80211_QM_TCLAS_TYPE4_MASK_DST_PORT   = 1 << 4,
+	NL80211_QM_TCLAS_TYPE4_MASK_DSCP       = 1 << 5,
+	NL80211_QM_TCLAS_TYPE4_MASK_PROTOCOL   = 1 << 6,
+	NL80211_QM_TCLAS_TYPE4_MASK_FLOW_LABEL = 1 << 7,
+};
+
+/**
+ * enum nl80211_qm_tclas_processing - TCLAS processing rules
+ *
+ * Processing field values are defined in 9.4.2.31, IEEE Std 802.11-2024.
+ *
+ * @NL80211_QM_TCLAS_PROCESSING_MATCH_ALL: all TCLAS elements must match
+ * @NL80211_QM_TCLAS_PROCESSING_MATCH_ANY: any TCLAS element may match
+ * @NL80211_QM_TCLAS_PROCESSING_MATCH_ALL_EXCEPT_FIRST: all except the first
+ *	must match
+ */
+enum nl80211_qm_tclas_processing {
+	NL80211_QM_TCLAS_PROCESSING_MATCH_ALL = 0,
+	NL80211_QM_TCLAS_PROCESSING_MATCH_ANY = 1,
+	NL80211_QM_TCLAS_PROCESSING_MATCH_ALL_EXCEPT_FIRST = 2,
+};
+
+/**
+ * enum nl80211_qm_qos_attrs - QoS Management QoS attributes
+ *
+ * The QoS Characteristics element is specified in 9.4.2.326,
+ * IEEE Std 802.11be-2024.
+ *
+ * @NL80211_QM_QOS_ATTR_INVALID: Invalid
+ * @NL80211_QM_QOS_ATTR_CONTROL_INFO: QoS characteristics control info (u32)
+ * @NL80211_QM_QOS_ATTR_MIN_SVC_INTERVAL: Minimum service interval, us (u32)
+ * @NL80211_QM_QOS_ATTR_MAX_SVC_INTERVAL: Maximum service interval, us (u32)
+ * @NL80211_QM_QOS_ATTR_MIN_DATA_RATE: Minimum data rate, kbps (u32)
+ * @NL80211_QM_QOS_ATTR_DELAY_BOUND: Delay bound, us (u32)
+ * @NL80211_QM_QOS_ATTR_MAX_MSDU_SIZE: Maximum MSDU size, bytes (u16)
+ * @NL80211_QM_QOS_ATTR_SVC_START_TIME: Service start time, us (u32)
+ * @NL80211_QM_QOS_ATTR_SVC_START_TIME_LINK_ID: Link ID for service start
+ *	time (u8)
+ * @NL80211_QM_QOS_ATTR_MEAN_DATA_RATE: Mean data rate, kbps (u32)
+ * @NL80211_QM_QOS_ATTR_BURST_SIZE: Burst size, bytes (u32)
+ * @NL80211_QM_QOS_ATTR_MSDU_LIFETIME: MSDU lifetime, ms (u16)
+ * @NL80211_QM_QOS_ATTR_MSDU_DELIVERY_INFO: MSDU delivery ratio and count
+ *	exponent (u8)
+ * @NL80211_QM_QOS_ATTR_MEDIUM_TIME: Medium time, 32 us units (u16)
+ * @__NL80211_QM_QOS_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_QOS_ATTR_MAX: highest QoS attribute number currently defined
+ */
+enum nl80211_qm_qos_attrs {
+	NL80211_QM_QOS_ATTR_INVALID,
+	NL80211_QM_QOS_ATTR_CONTROL_INFO,
+	NL80211_QM_QOS_ATTR_MIN_SVC_INTERVAL,
+	NL80211_QM_QOS_ATTR_MAX_SVC_INTERVAL,
+	NL80211_QM_QOS_ATTR_MIN_DATA_RATE,
+	NL80211_QM_QOS_ATTR_DELAY_BOUND,
+	NL80211_QM_QOS_ATTR_MAX_MSDU_SIZE,
+	NL80211_QM_QOS_ATTR_SVC_START_TIME,
+	NL80211_QM_QOS_ATTR_SVC_START_TIME_LINK_ID,
+	NL80211_QM_QOS_ATTR_MEAN_DATA_RATE,
+	NL80211_QM_QOS_ATTR_BURST_SIZE,
+	NL80211_QM_QOS_ATTR_MSDU_LIFETIME,
+	NL80211_QM_QOS_ATTR_MSDU_DELIVERY_INFO,
+	NL80211_QM_QOS_ATTR_MEDIUM_TIME,
+
+	/* keep last */
+	__NL80211_QM_QOS_ATTR_AFTER_LAST,
+	NL80211_QM_QOS_ATTR_MAX = __NL80211_QM_QOS_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_desc_attrs - QoS Management descriptor attributes
+ *
+ * @NL80211_QM_DESC_ATTR_INVALID: Invalid
+ * @NL80211_QM_DESC_ATTR_QM_ID: Userspace-assigned identifier (u8) used
+ *	to correlate a request descriptor with its response descriptor
+ * @NL80211_QM_DESC_ATTR_REQUEST_TYPE: Request type, see
+ *	&enum nl80211_qm_req_type (u8)
+ * @NL80211_QM_DESC_ATTR_PRIORITY: SCS descriptor priority (u8)
+ * @NL80211_QM_DESC_ATTR_TCLAS_ELEMENTS: Nested array of SCS TCLAS elements,
+ *	see &enum nl80211_qm_tclas_attrs
+ * @NL80211_QM_DESC_ATTR_TCLAS_PROCESSING: SCS TCLAS processing rule (u8),
+ *	see &enum nl80211_qm_tclas_processing
+ * @NL80211_QM_DESC_ATTR_QOS_ATTRIBUTES: Nested SCS QoS attributes, see
+ *	&enum nl80211_qm_qos_attrs
+ * @NL80211_QM_DESC_ATTR_STATUS: Response status for this descriptor (u8),
+ *	see &enum nl80211_qm_status
+ * @NL80211_QM_DESC_ATTR_USER_PRIORITY_BITMAP: MSCS user priority bitmap of
+ *	TID values sent by the non-AP STA (u8)
+ * @NL80211_QM_DESC_ATTR_USER_PRIORITY_LIMIT: MSCS user priority limit sent
+ *	by the non-AP STA (u8)
+ * @NL80211_QM_DESC_ATTR_TCLAS_MASK: MSCS traffic classifier mask with a
+ *	bitmap of parameters to match in an uplink flow for downlink
+ *	prioritization (u8)
+ * @__NL80211_QM_DESC_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_DESC_ATTR_MAX: highest QoS Management descriptor attribute
+ *	number currently defined
+ */
+enum nl80211_qm_desc_attrs {
+	NL80211_QM_DESC_ATTR_INVALID,
+	NL80211_QM_DESC_ATTR_QM_ID,
+	NL80211_QM_DESC_ATTR_REQUEST_TYPE,
+	NL80211_QM_DESC_ATTR_PRIORITY,
+	NL80211_QM_DESC_ATTR_TCLAS_ELEMENTS,
+	NL80211_QM_DESC_ATTR_TCLAS_PROCESSING,
+	NL80211_QM_DESC_ATTR_QOS_ATTRIBUTES,
+	NL80211_QM_DESC_ATTR_STATUS,
+	NL80211_QM_DESC_ATTR_USER_PRIORITY_BITMAP,
+	NL80211_QM_DESC_ATTR_USER_PRIORITY_LIMIT,
+	NL80211_QM_DESC_ATTR_TCLAS_MASK,
+
+	/* keep last */
+	__NL80211_QM_DESC_ATTR_AFTER_LAST,
+	NL80211_QM_DESC_ATTR_MAX = __NL80211_QM_DESC_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_attrs - QoS Management attributes
+ *
+ * @NL80211_QM_ATTR_INVALID: Invalid
+ * @NL80211_QM_ATTR_MAC_ADDR: Target station MAC address (6 bytes)
+ * @NL80211_QM_ATTR_QM_TYPE: QoS Management protocol type, see
+ *	&enum nl80211_qm_type (u8)
+ * @NL80211_QM_ATTR_DESCRIPTOR_PARAMS: Nested array of QM descriptors, see
+ *	&enum nl80211_qm_desc_attrs
+ * @__NL80211_QM_ATTR_AFTER_LAST: internal use
+ * @NL80211_QM_ATTR_MAX: highest QoS Management attribute number currently
+ *	defined
+ */
+enum nl80211_qm_attrs {
+	NL80211_QM_ATTR_INVALID,
+	NL80211_QM_ATTR_MAC_ADDR,
+	NL80211_QM_ATTR_QM_TYPE,
+	NL80211_QM_ATTR_DESCRIPTOR_PARAMS,
+
+	/* keep last */
+	__NL80211_QM_ATTR_AFTER_LAST,
+	NL80211_QM_ATTR_MAX = __NL80211_QM_ATTR_AFTER_LAST - 1
+};
+
+/**
+ * enum nl80211_qm_type - QoS Management protocol types
+ * @NL80211_QM_TYPE_SCS: Stream Classification Service (SCS) protocol,
+ *	reference 11.25.2, IEEE Std 802.11-2024.
+ * @NL80211_QM_TYPE_MSCS: Mirrored Stream Classification Service (MSCS)
+ *	protocol, reference 11.25.3, IEEE Std 802.11-2024.
+ * @NL80211_QM_TYPE_MAX: Maximum value for QoS Management protocol types
+ *
+ * Enumerates the QoS Management protocols supported through the generic
+ * QoS Management (QM) request/response framework.
+ *
+ */
+enum nl80211_qm_type {
+	NL80211_QM_TYPE_SCS,
+	NL80211_QM_TYPE_MSCS,
+	/* Future QM protocols to be added here */
+	NL80211_QM_TYPE_MAX,
+};
+
+/**
+ * enum nl80211_qm_direction - QoS Management descriptor
+ *	traffic direction
+ * @NL80211_QM_DIRECTION_UPLINK: Traffic direction is uplink, from the
+ *	non-AP STA to the AP.
+ * @NL80211_QM_DIRECTION_DOWNLINK: Traffic direction is downlink, from
+ *	the AP to the non-AP STA.
+ * @NL80211_QM_DIRECTION_DIRECT: Direct link traffic between STAs (P2P).
+ *
+ * Encodes the QoS characteristics element direction subfield, denoting
+ * which traffic direction a set of QoS attributes applies to. The QoS
+ * Characteristics element is specified in 9.4.2.326, IEEE Std 802.11be-2024.
+ */
+enum nl80211_qm_direction {
+	NL80211_QM_DIRECTION_UPLINK = 0,
+	NL80211_QM_DIRECTION_DOWNLINK = 1,
+	NL80211_QM_DIRECTION_DIRECT = 2,
+};
+
+/**
+ * enum nl80211_qm_req_type - QoS Management request types
+ * @NL80211_QM_ADD_REQ: Add a new QoS Management configuration
+ * @NL80211_QM_REMOVE_REQ: Remove an existing QoS Management configuration
+ * @NL80211_QM_CHANGE_REQ: Modify an existing QoS Management configuration
+ *
+ * Identifies the operation requested in a QoS Management transaction.
+ * Reference 11.25.2 and 11.25.3, IEEE Std 802.11-2024, for the operation
+ * values.
+ */
+enum nl80211_qm_req_type {
+	NL80211_QM_ADD_REQ,
+	NL80211_QM_REMOVE_REQ,
+	NL80211_QM_CHANGE_REQ,
+};
+
+/**
+ * enum nl80211_qm_status - QoS Management response status codes
+ * @NL80211_QM_STATUS_SUCCESS: request accepted
+ * @NL80211_QM_STATUS_DECLINED: request declined
+ */
+enum nl80211_qm_status {
+	NL80211_QM_STATUS_SUCCESS = 0,
+	NL80211_QM_STATUS_DECLINED = 1,
+};
+
 #endif /* __LINUX_NL80211_H */
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index d790e204aee3..3bf7aa5c9386 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -798,6 +798,93 @@ static const struct netlink_range_validation q_range = {
 	.max = INT_MAX,
 };
 
+static const struct nla_policy
+nl80211_qm_tclas_type4_policy[NL80211_QM_TCLAS_TYPE4_ATTR_MAX + 1] = {
+	[NL80211_QM_TCLAS_TYPE4_ATTR_CLASSIFIER_MASK] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_IP_VERSION] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_SRC_IP] = { .type = NLA_BINARY,
+					      .len = NL80211_IPADDR_MAX_LEN },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_DST_IP] = { .type = NLA_BINARY,
+					      .len = NL80211_IPADDR_MAX_LEN },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_SRC_PORT] = { .type = NLA_U16 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_DST_PORT] = { .type = NLA_U16 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_DSCP] = NLA_POLICY_MAX(NLA_U8, 63),
+	[NL80211_QM_TCLAS_TYPE4_ATTR_PROTOCOL] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_NEXT_HEADER] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE4_ATTR_FLOW_LABEL] =
+		NLA_POLICY_EXACT_LEN(NL80211_QM_TCLAS_TYPE4_FLOW_LABEL_LEN),
+};
+
+static const struct nla_policy
+nl80211_qm_tclas_type10_policy[NL80211_QM_TCLAS_TYPE10_ATTR_MAX + 1] = {
+	[NL80211_QM_TCLAS_TYPE10_ATTR_PROT_INSTANCE] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE10_ATTR_PROT_NUMBER] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_VALUE] = {
+			.type = NLA_BINARY,
+			.len = NL80211_QM_TCLAS_TYPE10_MAX_FILTER_LEN },
+	[NL80211_QM_TCLAS_TYPE10_ATTR_FILTER_MASK] = {
+			.type = NLA_BINARY,
+			.len = NL80211_QM_TCLAS_TYPE10_MAX_FILTER_LEN },
+};
+
+static const struct nla_policy
+nl80211_qm_tclas_policy[NL80211_QM_TCLAS_ATTR_MAX + 1] = {
+	[NL80211_QM_TCLAS_ATTR_USER_PRIORITY] =
+			NLA_POLICY_MAX(NLA_U8, IEEE80211_NUM_UPS - 1),
+	[NL80211_QM_TCLAS_ATTR_CLASSIFIER_TYPE] = { .type = NLA_U8 },
+	[NL80211_QM_TCLAS_ATTR_TYPE4_PARAMS] =
+			NLA_POLICY_NESTED(nl80211_qm_tclas_type4_policy),
+	[NL80211_QM_TCLAS_ATTR_TYPE10_PARAMS] =
+			NLA_POLICY_NESTED(nl80211_qm_tclas_type10_policy),
+};
+
+static const struct nla_policy
+nl80211_qm_qos_policy[NL80211_QM_QOS_ATTR_MAX + 1] = {
+	[NL80211_QM_QOS_ATTR_CONTROL_INFO] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_MIN_SVC_INTERVAL] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_MAX_SVC_INTERVAL] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_MIN_DATA_RATE] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_DELAY_BOUND] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_MAX_MSDU_SIZE] = { .type = NLA_U16 },
+	[NL80211_QM_QOS_ATTR_SVC_START_TIME] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_SVC_START_TIME_LINK_ID] =
+			NLA_POLICY_MAX(NLA_U8, IEEE80211_MLD_MAX_NUM_LINKS - 1),
+	[NL80211_QM_QOS_ATTR_MEAN_DATA_RATE] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_BURST_SIZE] = { .type = NLA_U32 },
+	[NL80211_QM_QOS_ATTR_MSDU_LIFETIME] = { .type = NLA_U16 },
+	[NL80211_QM_QOS_ATTR_MSDU_DELIVERY_INFO] = { .type = NLA_U8 },
+	[NL80211_QM_QOS_ATTR_MEDIUM_TIME] = { .type = NLA_U16 },
+};
+
+static const struct nla_policy
+nl80211_qm_desc_params_policy[NL80211_QM_DESC_ATTR_MAX + 1] = {
+	[NL80211_QM_DESC_ATTR_QM_ID] = { .type = NLA_U8 },
+	[NL80211_QM_DESC_ATTR_REQUEST_TYPE] =
+		NLA_POLICY_MAX(NLA_U8, NL80211_QM_CHANGE_REQ),
+	[NL80211_QM_DESC_ATTR_PRIORITY] = { .type = NLA_U8 },
+	[NL80211_QM_DESC_ATTR_TCLAS_ELEMENTS] =
+			NLA_POLICY_NESTED_ARRAY(nl80211_qm_tclas_policy),
+	[NL80211_QM_DESC_ATTR_TCLAS_PROCESSING] =
+		NLA_POLICY_MAX(NLA_U8,
+			       NL80211_QM_TCLAS_PROCESSING_MATCH_ALL_EXCEPT_FIRST),
+	[NL80211_QM_DESC_ATTR_QOS_ATTRIBUTES] =
+			NLA_POLICY_NESTED(nl80211_qm_qos_policy),
+	[NL80211_QM_DESC_ATTR_STATUS] = { .type = NLA_REJECT },
+	[NL80211_QM_DESC_ATTR_USER_PRIORITY_BITMAP] = { .type = NLA_U8 },
+	[NL80211_QM_DESC_ATTR_USER_PRIORITY_LIMIT] =
+		NLA_POLICY_MAX(NLA_U8, IEEE80211_NUM_UPS - 1),
+	[NL80211_QM_DESC_ATTR_TCLAS_MASK] = { .type = NLA_U8 },
+};
+
+static const struct nla_policy
+nl80211_qm_policy[NL80211_QM_ATTR_MAX + 1] = {
+	[NL80211_QM_ATTR_MAC_ADDR] = NLA_POLICY_EXACT_LEN_WARN(ETH_ALEN),
+	[NL80211_QM_ATTR_QM_TYPE] = NLA_POLICY_MAX(NLA_U8,
+						   NL80211_QM_TYPE_MAX - 1),
+	[NL80211_QM_ATTR_DESCRIPTOR_PARAMS] =
+			NLA_POLICY_NESTED_ARRAY(nl80211_qm_desc_params_policy),
+};
+
 static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[0] = { .strict_start_type = NL80211_ATTR_HE_OBSS_PD },
 	[NL80211_ATTR_WIPHY] = { .type = NLA_U32 },
@@ -1201,6 +1288,7 @@ static const struct nla_policy nl80211_policy[NUM_NL80211_ATTR] = {
 	[NL80211_ATTR_ASSOC_CIP] = { .type = NLA_FLAG },
 	[NL80211_ATTR_CIP_CAPABILITIES] = { .type = NLA_U8 },
 	[NL80211_ATTR_ASSOC_PROTECTED_TWT] = { .type = NLA_FLAG },
+	[NL80211_ATTR_QOS_MGMT] = NLA_POLICY_NESTED(nl80211_qm_policy),
 };
 
 /* policy for the key attributes */
-- 
2.34.1


