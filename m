Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5F3CC6B2F
	for <ath12k@archiver.kernel.org>; Thu, 15 Oct 2026 05:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QBpv3t6ikNd+LnVjYPe5kHl+Iat49RGi90R+sOLuZX0=; b=Cu/Ynie0XsWdB9Zsr3/QFc33Cc
	ua1So5L8d0hCskZYC38sYssAHFyB58JDHlcCaVbBvHTcF+fvdOjVUAa80VpWOVicwBS7lIaIh4cHj
	qSroDa2SHYEoMRGHtOYmrcJuW3S98sXaJ2+fV2yX/IzEf3yBl5+OFLmRgwX0PLlqeFc6TPqVkRnNl
	NYyVr0z4oicjcY/ROh7MYIMFSahFBPDVRdPh+lu1R8UWmpKyEjGxpeq9wYYXwl09NQ4/1QGO0eKWY
	CsbzLY7bP5mtXZStnyAOsocuA94Hlcd+YntVZCB4vW6nx1aZPF4ZraMgBp7hgR1jqAFn/m4s61zkL
	1iOBa5Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQi-0000000GteP-0eWg;
	Thu, 15 Oct 2026 05:55:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHEQc-0000000Gtbw-0smC
	for ath12k@lists.infradead.org;
	Thu, 15 Oct 2026 05:54:59 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F1iJr83468831
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QBpv3t6ikNd
	+LnVjYPe5kHl+Iat49RGi90R+sOLuZX0=; b=HctEAXU+w809R/dx1e0EDK/E4po
	fm0FZZSt7FvoZ6qhKgdW5pFPveQ+hVM0tiA/pA/dUa72MvZ6rKFrqoLz6tUGwlTD
	fFR5TXfX1qJtvxKliQK+Dj3N7rZqOPrukLyIIw+dkZk3sE6gNq5y+RGpH9lys/pV
	D7nqVmJGUj78OC7Z9ybF7zCTBgnjOGzfUo7gned8MTTA7DQ9Al+nNzBJ+76998A5
	Ru0vlnPN75Luh3lJ7PxB9crkUIBAI5wZNr4L11ZUVs+Kkja/ram7S2Wg8voqRLQG
	97ctSi7FEp+Y278oZzT1oL9dCforB10Aea/R2A5OWaa/Q8H3B/SABKL+45A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hadd7aky1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 15 Oct 2026 05:54:57 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso46537905ad.3
        for <ath12k@lists.infradead.org>; Wed, 14 Oct 2026 22:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792043697; x=1792648497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QBpv3t6ikNd+LnVjYPe5kHl+Iat49RGi90R+sOLuZX0=;
        b=XTWtTQ1XmTbSgkdrMJ+Y3hrd8kYjCoUXNzLeQNDMZzZnpl6HkJCgCw7/FPtqsfQm03
         sQDZQ5Lh6WJsIQKKSgXiPpGr1+Ynm9h5NVWpBIg59s25o2wh5OWlWsL2R21EZVmhb9uD
         bmAPQVMaxSq8zfOWUcTRZs1axc6tC1NvWOhyofaLGOt/bKURQy4g+WIcy77o83uGz0c5
         pR6WMkpT0+vytmQeZUr4Yl19LjC2N/r7uDOMCL46eDyySw0iAqqQVmWbhnqiNvuaxf4W
         sITUyc2V8XoCvzD1x8j5gXle52vmDM5xzT1jGf49VEYzmYO26E1zlaQlsfIeRTmyyHRB
         p/3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792043697; x=1792648497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QBpv3t6ikNd+LnVjYPe5kHl+Iat49RGi90R+sOLuZX0=;
        b=Hk5wqf/yhTFEayM3+G5RQ7JNvQhd/YKQJo9uE7DePnvcNnQ2gIipogryhFUbZx/Zsc
         ueGH/Bvh5mBnmq9H4w2WtHwXZCLFCyO+QfZtC8Od2RC1fppS0s0eHRbSIEVnATner1US
         MuV1nPHLmYskHG/bi/ZEIWvm6RpUNuw5KWhC3F+4ZeiE0asBoEQv7KhcNOgoqZxXb2Gd
         /nDixE6unbQL8I3r/nBQEJR6yS8Vru+S39pygH1NzbRdP8cJxsmwlxGpbpwtgB7WRs3u
         sv2uQpSjWcT+5Z4Dpi8Ei5g895xGyUJTxl8jR8Z8Kj2QfXLmVkXaeOIpxq+Smylhdk+/
         Z5Nw==
X-Forwarded-Encrypted: i=1; AKwUvBwsLmyW6sVZSAHj/1QcrP/9INu4KQllKKgd3gEvvJRjznmDX0mywmxKBPOmF3OVQArgUWQ6w3o=@lists.infradead.org
X-Gm-Message-State: AFq9FYLb4b9oSipPp6DkyQteYObVCxU29ibL3HI6nBRSZd6BkKSpijt3
	3V3iC9rQT+X2xWMSDDP803zXKWJvWn2LSQ6EDkwtdljwTheQrFcPIFJFLzj5WpsxTr9a3QEQO4O
	IQLRcAdWUWrF2+nFlIpysMSFY3QohHABGxK8rloOR/XlYPVpR6gDiKaqXj7oVcYg+
X-Gm-Gg: AYBFou0d2S0YMe+mVvvf08KZhbipHh4Je4kVNx5rGojSaOlHFTsEhg14SaKQHIDaUXV
	58zFO2eLxER3sHtrDQ1437TCTUVPBc98J0CxmI2btQmjWuXfoGnNLsb4yxbbr3UFE/OZEgPGMgy
	W6075q/zQ5OwKI8hbfaB6QCiltNkyTa0ZlKYN80DVKq5IGAnKoprHH6EEQQnJW/B/jep/3sQrZj
	sHv/7dbJmyejlb5GGWIV7rhXRKGz/fzIaLmGx5GxiPKFQXP2QbHCsUEEI1ll0foKWeCYcc1Evw1
	cwbx87wxzJfC7Se4F86I+JwPY7rAQQH7H/bDNfVVj3AVnq3no7hxYBjN9Y7JXj9s8dY8Cwv+h0v
	MA0dXFyY/jaB+J797hmINgGYivmAdfklrKeFtB2NRIo513WR56kC7Y04F+q+LCWp3YmbC9UzAad
	rf8WSrmwF994Jb
X-Received: by 2002:a17:90b:1645:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ac9a5e9febmr1298563a91.49.1792043696677;
        Wed, 14 Oct 2026 22:54:56 -0700 (PDT)
X-Received: by 2002:a17:90b:1645:b0:3ac:9a5e:9ce7 with SMTP id 98e67ed59e1d1-3ac9a5e9febmr1298543a91.49.1792043695941;
        Wed, 14 Oct 2026 22:54:55 -0700 (PDT)
Received: from hu-aisr-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac944af2f1sm2629054a91.15.2026.10.14.22.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 22:54:55 -0700 (PDT)
From: Aishwarya R <aishwarya.r@oss.qualcomm.com>
To: johannes@sipsolutions.net
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>,
        Arun Vikas T <arun.t@oss.qualcomm.com>
Subject: [PATCH RFC wireless-next 2/7] wifi: cfg80211: add QoS Management data structures
Date: Thu, 15 Oct 2026 11:24:36 +0530
Message-Id: <20261015055441.680588-3-aishwarya.r@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
References: <20261015055441.680588-1-aishwarya.r@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BaVNQbt2 c=1 sm=1 tr=0 ts=6ad06ab1 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=mZ3xVG7Sy6TkxvAkkpAA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: v8Mx5nZo36gSYPizzVu0u51dmzW0TcZ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX9PZkRKOFAF+D
 roXKz3qbsO+Qr+zhRusyL/X3BeOhnDvzR9ygdfFsKrIH7ZVqikpJrDgZRYTSmUE5lc5oBw7Lwjx
 /8Dq0wDa4hXfLZBud9vWpMN4RNGuNRbcWLT5uRqH4C3bDXhji6ItJx/wlz9tXauy2smb6A2mB7x
 hfkNZpYnmqCroAaRB2lPjExQ/cG94dtNWGwSqfjz1wdUlltmnQxAvl2+Shca0aU56rEgSpO4wSO
 rvpYzrboM9sXdTzJq3Q5VRF52hNG37h0YmOM1PqHIEVQWD6jumcGyet1+4CIy+NVN8ql6aLkxqz
 pnX1SCN+FvOitDpjyEWsaWMwS2Gt9wqWi4YZPQ7MQkPm0R1wtD5b0I27ZhC9tre9OjrT1flTEBX
 4+85HZsVwWrFzO/pqiZFd4vtz3NsiRjVZ119CPDEUSRCCM90OvyCkLrew+Qy4XDJzc6GnZCYxib
 z+2psebEqNcbqJuyHFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAyMyBTYWx0ZWRfX75A8/Eh2wgaP
 Dgk0A3jUzQ26bHpr7g7zhGZ7nM/Y6j4TkvCePYZ3iEtaw6pF4s/zClVLC0f6D4ky69GKWcffspr
 kstpOUjzjgSsD7OrO+d0Yffggcmwpwk=
X-Proofpoint-ORIG-GUID: v8Mx5nZo36gSYPizzVu0u51dmzW0TcZ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_225458_440072_52DF28CA 
X-CRM114-Status: GOOD (  21.02  )
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

Introduce cfg80211 data structures to support QoS Management (QM) requests
from userspace and the corresponding driver responses.

A QM request contains the peer address, protocol type and a dynamically
sized descriptor list. Each descriptor carries the requested operation and
SCS-specific priority, TCLAS type 4 or type 10 classification elements, and
QoS characteristics, and protocol-specific fields for SCS or MSCS.

Add the set_qos_mgmt_cfg() cfg80211_ops callback to deliver a parsed QM
request to the driver. The driver returns the processing result through a
cfg80211_qm_resp_data container populated with one response descriptor per
request descriptor. Each response descriptor carries the corresponding
qm_id together with an IEEE 802.11 QM status code indicating whether the
request was accepted or declined.

Co-developed-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Arun Vikas T <arun.t@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
---
 include/net/cfg80211.h | 220 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 220 insertions(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index f773856c1818..74abe25bb107 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -4860,6 +4860,216 @@ struct cfg80211_update_owe_info {
 	u8 peer_mld_addr[ETH_ALEN] __aligned(2);
 };
 
+/* QoS Management IP address lengths */
+#define QM_IPV4_LEN	4
+#define QM_IPV6_LEN	16
+
+/**
+ * enum cfg80211_qm_ip_version - IP protocol version identifiers used in
+ *	QoS Management traffic classification
+ * @QM_IP_VERSION_4: Internet Protocol version 4 (IPv4)
+ * @QM_IP_VERSION_6: Internet Protocol version 6 (IPv6)
+ */
+enum cfg80211_qm_ip_version {
+	QM_IP_VERSION_4 = 4,
+	QM_IP_VERSION_6 = 6,
+};
+
+/**
+ * struct cfg80211_qm_tclas4_params - TCLAS classifier type 4 parameters
+ * @classifier_mask: bitmask indicating which fields are used for
+ *	classification; the version bit is mandatory and the remaining bits
+ *	identify fields used for classification, as defined by
+ *	&enum nl80211_qm_tclas_type4_mask
+ * @ip_ver: IP version of @src_ip / @dst_ip
+ * @src_ip: source IP address (IPv4 or IPv6)
+ * @dst_ip: destination IP address (IPv4 or IPv6)
+ * @src_port: source port number
+ * @dst_port: destination port number
+ * @dscp: Differentiated Services Code Point
+ * @protocol: IP protocol number, valid for IPv4 only
+ * @next_header: next header field, valid for IPv6 only
+ * @flow_label: flow label, valid for IPv6 only
+ */
+struct cfg80211_qm_tclas4_params {
+	u8 classifier_mask;
+	enum cfg80211_qm_ip_version ip_ver;
+	union {
+		u8 ipv4[QM_IPV4_LEN];
+		u8 ipv6[QM_IPV6_LEN];
+	} src_ip;
+	union {
+		u8 ipv4[QM_IPV4_LEN];
+		u8 ipv6[QM_IPV6_LEN];
+	} dst_ip;
+	u16 src_port;
+	u16 dst_port;
+	u8 dscp;
+	u8 protocol;
+	u8 next_header;
+	u8 flow_label[NL80211_QM_TCLAS_TYPE4_FLOW_LABEL_LEN];
+};
+
+/**
+ * struct cfg80211_qm_tclas10_params - TCLAS classifier type 10 parameters
+ * @protocol_instance: protocol instance identifier
+ * @protocol_number: protocol number
+ * @filter_value: filter value bytes
+ * @filter_mask: filter mask bytes
+ * @filter_len: length of @filter_value / @filter_mask
+ */
+struct cfg80211_qm_tclas10_params {
+	u8 protocol_instance;
+	u8 protocol_number;
+	u8 filter_value[NL80211_QM_TCLAS_TYPE10_MAX_FILTER_LEN];
+	u8 filter_mask[NL80211_QM_TCLAS_TYPE10_MAX_FILTER_LEN];
+	u8 filter_len;
+};
+
+/**
+ * struct cfg80211_qm_tclas_elements - a single TCLAS element
+ * @up: user priority
+ * @classifier_type: classifier type, see
+ *	&enum nl80211_qm_tclas_classifier_type
+ * @tclas_elem: classifier-specific parameters
+ */
+struct cfg80211_qm_tclas_elements {
+	u8 up;
+	enum nl80211_qm_tclas_classifier_type classifier_type;
+	union {
+		struct cfg80211_qm_tclas4_params type4_params;
+		struct cfg80211_qm_tclas10_params type10_params;
+	} tclas_elem;
+};
+
+/**
+ * struct cfg80211_qm_qos_attributes - QoS attributes of a QoS Management
+ *	request
+ * @direction: traffic direction, see &enum nl80211_qm_direction
+ * @tid: traffic identifier
+ * @up: user priority
+ * @bitmap: TID/UP bitmap
+ * @link_id: link identifier
+ * @min_service_interval: minimum service interval, in microseconds
+ * @max_service_interval: maximum service interval, in microseconds
+ * @min_data_rate: minimum data rate, in kbps
+ * @delay_bound: delay bound, in microseconds
+ * @max_msdu_size: maximum MSDU size, in bytes
+ * @service_start_time: service start time, in microseconds
+ * @service_start_time_link_id: link ID for @service_start_time
+ * @mean_data_rate: mean data rate, in kbps
+ * @burst_size: burst size, in bytes
+ * @msdu_lifetime: MSDU lifetime, in milliseconds
+ * @msdu_delivery_ratio: MSDU delivery ratio
+ * @msdu_count_exponent: MSDU count exponent
+ * @medium_time: medium time, in units of 32 microseconds
+ */
+struct cfg80211_qm_qos_attributes {
+	enum nl80211_qm_direction direction;
+	u8 tid;
+	u8 up;
+	u16 bitmap;
+	u8 link_id;
+	u32 min_service_interval;
+	u32 max_service_interval;
+	u32 min_data_rate;
+	u32 delay_bound;
+	u16 max_msdu_size;
+	u32 service_start_time;
+	u8 service_start_time_link_id;
+	u32 mean_data_rate;
+	u32 burst_size;
+	u16 msdu_lifetime;
+	u8 msdu_delivery_ratio;
+	u8 msdu_count_exponent;
+	u16 medium_time;
+};
+
+/**
+ * struct cfg80211_qm_req_desc_data - a single QoS Management request
+ *	descriptor
+ * @qm_id: identifier for this descriptor within the request
+ * @request_type: request type, see &enum nl80211_qm_req_type
+ * @priority: SCS descriptor priority
+ * @num_tclas_elements: number of entries in @tclas
+ * @tclas: SCS TCLAS elements used for traffic classification
+ * @tclas_processing: SCS TCLAS processing rule, see
+ *	&enum nl80211_qm_tclas_processing
+ * @is_qos_present: whether @qos_attr is populated
+ * @qos_attr: SCS QoS attributes associated with this descriptor
+ * @user_priority_bitmap: user priority bitmap of TID values sent by the
+ *	non-AP STA in an MSCS request
+ * @user_priority_limit: user priority limit sent by the non-AP STA in an
+ *	MSCS request
+ * @tclas_mask: traffic classifier mask with a bitmap of parameters to
+ *	match in an uplink flow for downlink prioritization
+ */
+struct cfg80211_qm_req_desc_data {
+	u8 qm_id;
+	enum nl80211_qm_req_type request_type;
+	u8 priority;
+	unsigned int num_tclas_elements;
+	struct cfg80211_qm_tclas_elements *tclas;
+	enum nl80211_qm_tclas_processing tclas_processing;
+	bool is_qos_present;
+	struct cfg80211_qm_qos_attributes qos_attr;
+	u8 user_priority_bitmap;
+	u8 user_priority_limit;
+	u8 tclas_mask;
+};
+
+/**
+ * struct cfg80211_qm_req_data - a complete QoS Management request for a
+ *	peer
+ * @peer_mac: MAC address of the peer
+ * @qm_type: QoS Management protocol, see &enum nl80211_qm_type
+ * @num_qm_desc: number of entries in @qm_req_desc
+ * @qm_req_desc: QoS Management request descriptors
+ *
+ * This is the parsed representation passed to the driver by the
+ * &struct cfg80211_ops.set_qos_mgmt_cfg callback. The descriptor and TCLAS
+ * arrays are owned by cfg80211 and are valid only for the duration of the
+ * callback. The driver must not retain these pointers after the callback
+ * returns.
+ */
+struct cfg80211_qm_req_data {
+	u8 peer_mac[ETH_ALEN];
+	enum nl80211_qm_type qm_type;
+	unsigned int num_qm_desc;
+	struct cfg80211_qm_req_desc_data *qm_req_desc;
+};
+
+/**
+ * struct cfg80211_qm_resp_desc_data - result of processing a single QoS
+ *	Management request descriptor
+ * @qm_id: identifier matching the corresponding request descriptor
+ * @status: response status, see &enum nl80211_qm_status
+ */
+struct cfg80211_qm_resp_desc_data {
+	u8 qm_id;
+	enum nl80211_qm_status status;
+};
+
+/**
+ * struct cfg80211_qm_resp_data - a complete QoS Management response
+ * @qm_resp_desc: response descriptors corresponding to the request
+ *
+ * cfg80211 allocates and initializes one response descriptor for each
+ * request descriptor with the corresponding
+ * &struct cfg80211_qm_req_desc_data.qm_id and a declined status.
+ * The driver updates the status for each descriptor it processes. The
+ * response array is parallel to the request descriptor array: entry @i
+ * corresponds to request descriptor @i, and the driver must update entries
+ * in place without reordering them. The initialized @qm_id values must be
+ * left unchanged. The response array is valid only for the duration of the
+ * callback and must not be retained by the driver.
+ * cfg80211/nl80211 supplies the peer address and protocol type from the
+ * request when it builds the reply.
+ */
+struct cfg80211_qm_resp_data {
+	struct cfg80211_qm_resp_desc_data *qm_resp_desc;
+};
+
 /**
  * struct mgmt_frame_regs - management frame registrations data
  * @global_stypes: bitmap of management frame subtypes registered
@@ -5332,6 +5542,13 @@ struct mgmt_frame_regs {
  *
  * @start_pd: Start the PD interface.
  * @stop_pd: Stop the PD interface.
+ *
+ * @set_qos_mgmt_cfg: Configure QoS Management (QM) parameters such as
+ *	traffic classification (TCLAS) and QoS attributes for a station. The
+ *	request has already been parsed from the nested nl80211 attributes.
+ *	The driver or firmware applies the protocol-specific configuration and
+ *	populates the response structure with a status for each descriptor.
+ *	This callback provides the control-path interface for the driver.
  */
 struct cfg80211_ops {
 	int	(*suspend)(struct wiphy *wiphy, struct cfg80211_wowlan *wow);
@@ -5730,6 +5947,9 @@ struct cfg80211_ops {
 			    bool val);
 	int	(*start_pd)(struct wiphy *wiphy, struct wireless_dev *wdev);
 	void	(*stop_pd)(struct wiphy *wiphy, struct wireless_dev *wdev);
+	int	(*set_qos_mgmt_cfg)(struct wiphy *wiphy, struct net_device *dev,
+				    struct cfg80211_qm_req_data *qm_req,
+				    struct cfg80211_qm_resp_data *qm_resp);
 };
 
 /*
-- 
2.34.1


