Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BC8C4167B
	for <ath12k@archiver.kernel.org>; Mon,  6 Nov 2023 18:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnAqvsHBDwXRtBtcvgxb7xpbjZA2rSS9aNRhkLsW5ww=; b=C2CteFgSbAbeFX
	iAofPKRRry0sRhBjh9uJGGtPqa+TbFJSR/BwpQfkpaWkCIT7kYMIqdEXAq1mCXzbAqgA19ZdgL7a0
	YgRX32n6/gk7bEdJYAsHbyDCXX1rbZjDTJkE8Wc9jm4lv/uYg+6HwZO2fE15I48Hb+7GzXxj7Wefl
	hS9xLqeDP0WDtbC+QJBTrWSTnWPXYnstzmyyEJkQAcOUSm8KcrGygDJ6CA6VjiMFJkuNjIHWiFq/C
	eYHkTb32J0TYRMEi9SyDDOfCslfxv8PkLgCs6en4r1mQoHj7m5ZFsbeynASv2O7tcgCV1SSyYLwex
	xM37lrzl7xNq1Ns6E9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Il-00HJk8-1E
	for ath12k@archiver.kernel.org;
	Mon, 06 Nov 2023 18:26:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ie-00HJes-1n;
	Mon, 06 Nov 2023 18:26:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6G1lpY017922;
	Mon, 6 Nov 2023 18:26:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=SJKlOS1E2M2M5RmYQFKiqfdV74N+yh3PGJefhyKs7wc=;
 b=faoC2llptdXpksEeEhrMuH6FXJvlJIkmNchqEjO66p/eKFEy2nLGaRCwkv9znUZUBYxE
 dy4HDqWEK/LjvwJULuNf8WVyudIKSG95z4FY8Gp+8bzLNF2+uUrme20jR5J5S8FB3FO2
 kH+ihXJdOwBuR+SRZ+Io+BQQxqY6b5vLdcduvSYT1/H04AktJY1fq/xtsqrEJ7F45BkS
 GaLxrU9BXOeeHHFBuGoit5E0kbUhT90Bk9GAm6JjFVAFA/mfh8Uv9qxVi+IaF7uujW2G
 hOyPAo2p4eLFOzENWc3IoKfUeHQW2/inrUXhiLBpoSHzukWR1sJ/VU3uFS40EIGilCVw NQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u73a70c9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:26:06 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IQ5Vc013143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:26:05 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:26:04 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 6 Nov 2023 10:26:05 -0800
Subject: [PATCH 3/4] wifi: ath11k: Consolidate WMI peer flags
MIME-Version: 1.0
Message-ID: <20231106-ath-peer-flags-v1-3-781e83b7e8e8@quicinc.com>
References: <20231106-ath-peer-flags-v1-0-781e83b7e8e8@quicinc.com>
In-Reply-To: <20231106-ath-peer-flags-v1-0-781e83b7e8e8@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3FwCrPLH8hQHsJsPf31EomVw8TDlJHk2
X-Proofpoint-GUID: 3FwCrPLH8hQHsJsPf31EomVw8TDlJHk2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_13,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=894 adultscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102612_717876_1EA91FCF 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently wmi.h has two separate set of definitions for peer
flags. One set of flags is defined in enum wmi_tlv_peer_flags, and,
except for the last three, are named WMI_TLV_PEER_*. The other set of
flags are defined as macros, and are named WMI_PEER_*. The last three
macros have the same name as the last three wmi_tlv_peer_flags
enumerators.

The code only uses the WMI_PEER_* names; the WMI_TLV_PEER_* names are
unused. So as a first step in consolidation, remove all the
WMI_TLV_PEER_* names.

But since having an enum to define all the flags is actually a good
thing since that provides a handle by which to refer to the entire set
of flags, recast the WMI_PEER_* macros into enumerators.

Compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 59 +++++++++++------------------------
 1 file changed, 18 insertions(+), 41 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 42e4234be69b..3ad29d5d0999 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -1096,25 +1096,27 @@ enum wmi_tlv_vdev_param {
 };
 
 enum wmi_tlv_peer_flags {
-	WMI_TLV_PEER_AUTH = 0x00000001,
-	WMI_TLV_PEER_QOS = 0x00000002,
-	WMI_TLV_PEER_NEED_PTK_4_WAY = 0x00000004,
-	WMI_TLV_PEER_NEED_GTK_2_WAY = 0x00000010,
-	WMI_TLV_PEER_APSD = 0x00000800,
-	WMI_TLV_PEER_HT = 0x00001000,
-	WMI_TLV_PEER_40MHZ = 0x00002000,
-	WMI_TLV_PEER_STBC = 0x00008000,
-	WMI_TLV_PEER_LDPC = 0x00010000,
-	WMI_TLV_PEER_DYN_MIMOPS = 0x00020000,
-	WMI_TLV_PEER_STATIC_MIMOPS = 0x00040000,
-	WMI_TLV_PEER_SPATIAL_MUX = 0x00200000,
-	WMI_TLV_PEER_VHT = 0x02000000,
-	WMI_TLV_PEER_80MHZ = 0x04000000,
-	WMI_TLV_PEER_PMF = 0x08000000,
+	WMI_PEER_AUTH		= 0x00000001,
+	WMI_PEER_QOS		= 0x00000002,
+	WMI_PEER_NEED_PTK_4_WAY	= 0x00000004,
+	WMI_PEER_NEED_GTK_2_WAY	= 0x00000010,
+	WMI_PEER_HE		= 0x00000400,
+	WMI_PEER_APSD		= 0x00000800,
+	WMI_PEER_HT		= 0x00001000,
+	WMI_PEER_40MHZ		= 0x00002000,
+	WMI_PEER_STBC		= 0x00008000,
+	WMI_PEER_LDPC		= 0x00010000,
+	WMI_PEER_DYN_MIMOPS	= 0x00020000,
+	WMI_PEER_STATIC_MIMOPS	= 0x00040000,
+	WMI_PEER_SPATIAL_MUX	= 0x00200000,
+	WMI_PEER_TWT_REQ	= 0x00400000,
+	WMI_PEER_TWT_RESP	= 0x00800000,
+	WMI_PEER_VHT		= 0x02000000,
+	WMI_PEER_80MHZ		= 0x04000000,
+	WMI_PEER_PMF		= 0x08000000,
 	WMI_PEER_IS_P2P_CAPABLE = 0x20000000,
 	WMI_PEER_160MHZ         = 0x40000000,
 	WMI_PEER_SAFEMODE_EN    = 0x80000000,
-
 };
 
 /** Enum list of TLV Tags for each parameter structure type. */
@@ -4061,31 +4063,6 @@ struct wmi_unit_test_cmd {
 
 #define MAX_SUPPORTED_RATES 128
 
-#define WMI_PEER_AUTH		0x00000001
-#define WMI_PEER_QOS		0x00000002
-#define WMI_PEER_NEED_PTK_4_WAY	0x00000004
-#define WMI_PEER_NEED_GTK_2_WAY	0x00000010
-#define WMI_PEER_HE		0x00000400
-#define WMI_PEER_APSD		0x00000800
-#define WMI_PEER_HT		0x00001000
-#define WMI_PEER_40MHZ		0x00002000
-#define WMI_PEER_STBC		0x00008000
-#define WMI_PEER_LDPC		0x00010000
-#define WMI_PEER_DYN_MIMOPS	0x00020000
-#define WMI_PEER_STATIC_MIMOPS	0x00040000
-#define WMI_PEER_SPATIAL_MUX	0x00200000
-#define WMI_PEER_TWT_REQ	0x00400000
-#define WMI_PEER_TWT_RESP	0x00800000
-#define WMI_PEER_VHT		0x02000000
-#define WMI_PEER_80MHZ		0x04000000
-#define WMI_PEER_PMF		0x08000000
-/* TODO: Place holder for WLAN_PEER_F_PS_PRESEND_REQUIRED = 0x10000000.
- * Need to be cleaned up
- */
-#define WMI_PEER_IS_P2P_CAPABLE	0x20000000
-#define WMI_PEER_160MHZ		0x40000000
-#define WMI_PEER_SAFEMODE_EN	0x80000000
-
 struct beacon_tmpl_params {
 	u8 vdev_id;
 	u32 tim_ie_offset;

-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
