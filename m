Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4F97C369A1
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 04:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x3htg6sc6yWZqF0xgEqHwaH74+4CkR+f6D01ur5Wd9c=; b=rGfiSaEJsekr8BbPNMj+rgFpXQ
	Masv7PXZls9Cz/w5I0aDF5PJdyCAuE5rcXTe26anbe7MLfl0/Nqz9XBmDq7+SkPwQ+zPW0BVIi57r
	eAvtKeFNSqmj2FAYfC5NHdhPsPRYPnduUaoHWSuP6mnshe2kKoHsuwSe9n3HOi3RZjQ8CE9pKK7E+
	ym5CTLxGYGGWTVr8pHorIw28QBLPcFjyhMmadt9BrwwZ5DQXqjF/nmDHxGTsz0UsPl/rZUV8bFsw8
	vBdPI779JkJzotbm3Yk0szym7A/KA2XSWPR9BwcNBhv6YEdNcBDPnOCZaReo7rwi6V7G0yfoL2YOm
	pEyFLSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20T8-00000002gbv-1n0g
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 04:21:50 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u20T6-00000002gbF-1fGV
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 04:21:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GL4O008070;
	Tue, 8 Apr 2025 04:21:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x3htg6sc6yWZqF0xgEqHwaH74+4CkR+f6D01ur5Wd9c=; b=JHQkBKyWJQVR7B18
	jd9zCA7fQkjNKePcHtRvJaDZGJS9SAZr6eMmkC3jJh8iPfYgc8HxcSd55cH+SS/r
	SWgo870nMsIyE7uvHtV/0N6xcHo+Ci54YEDl8bsufMiuehrt+WGwEDzVqmxs9PGd
	ZYuvlh2QnGx86pUfWuxbRtRbKKLzTa9Wu5nr2WGxlFb4oMn3YSKkUAxHhChsKEdY
	3YQhxFt2C4rrjH9rikmrhySfvZ0IQHvMvr68WQdNXr5hJ1nEzbyuPYsV0+UxaZ1S
	22bIVH4tZvKSHS4Ai+BQ9YJBIgOxP75dIDH8/kCKhrSrGXiMxO1xweeUrUiI2+wk
	fH514g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtaxg1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 04:21:47 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5384LlPh011779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 04:21:47 GMT
Received: from hu-rajson-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 7 Apr 2025 21:21:45 -0700
From: Rajat Soni <quic_rajson@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH ath-next 1/3] wifi: ath12k: Add helper function ath12k_mac_update_freq_range()
Date: Tue, 8 Apr 2025 09:51:26 +0530
Message-ID: <20250408042128.720263-2-quic_rajson@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408042128.720263-1-quic_rajson@quicinc.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s9uKFjnk-7DBCz4o_URiQ2DPxI7oDfGE
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f4a45b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=ZBC4GIfCeQsqTZ2mr1YA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: s9uKFjnk-7DBCz4o_URiQ2DPxI7oDfGE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_01,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_212148_437999_DC772395 
X-CRM114-Status: GOOD (  14.73  )
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

In a subsequent change, the frequency range needs to be updated with
each regulatory update. Since the current function also modifies the
DISABLED flag in the actual channel list, which should always align
with hardware-supported start and end frequencies rather than the
current operating ones, the existing function cannot be called again.
Therefore, the logic for setting the frequency range needs to be
refactored.

To address this, refactor the frequency setting part into a new
helper function, ath12k_mac_update_freq_range(). Since this needs
to be done independently of updating the DISABLED flag, call the new
helper function ath12k_mac_update_freq_range() after updating the
channel list for each band.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 +++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mac.h |  2 ++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2b6bdc3d2b11..449aca719ad3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10811,6 +10811,16 @@ static const struct ieee80211_ops ath12k_ops = {
 #endif
 };
 
+void ath12k_mac_update_freq_range(struct ath12k *ar,
+				  u32 freq_low, u32 freq_high)
+{
+	if (!(freq_low && freq_high))
+		return;
+
+	ar->freq_range.start_freq = MHZ_TO_KHZ(freq_low);
+	ar->freq_range.end_freq = MHZ_TO_KHZ(freq_high);
+}
+
 static void ath12k_mac_update_ch_list(struct ath12k *ar,
 				      struct ieee80211_supported_band *band,
 				      u32 freq_low, u32 freq_high)
@@ -10825,9 +10835,6 @@ static void ath12k_mac_update_ch_list(struct ath12k *ar,
 		    band->channels[i].center_freq > freq_high)
 			band->channels[i].flags |= IEEE80211_CHAN_DISABLED;
 	}
-
-	ar->freq_range.start_freq = MHZ_TO_KHZ(freq_low);
-	ar->freq_range.end_freq = MHZ_TO_KHZ(freq_high);
 }
 
 static u32 ath12k_get_phy_id(struct ath12k *ar, u32 band)
@@ -10885,6 +10892,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 		ath12k_mac_update_ch_list(ar, band,
 					  reg_cap->low_2ghz_chan,
 					  reg_cap->high_2ghz_chan);
+
+		ath12k_mac_update_freq_range(ar, reg_cap->low_2ghz_chan,
+					     reg_cap->high_2ghz_chan);
 	}
 
 	if (supported_bands & WMI_HOST_WLAN_5GHZ_CAP) {
@@ -10907,6 +10917,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
 						  reg_cap->high_5ghz_chan);
+
+			ath12k_mac_update_freq_range(ar, reg_cap->low_5ghz_chan,
+						     reg_cap->high_5ghz_chan);
 			ah->use_6ghz_regd = true;
 		}
 
@@ -10936,6 +10949,9 @@ static int ath12k_mac_setup_channels_rates(struct ath12k *ar,
 			ath12k_mac_update_ch_list(ar, band,
 						  reg_cap->low_5ghz_chan,
 						  reg_cap->high_5ghz_chan);
+
+			ath12k_mac_update_freq_range(ar, reg_cap->low_5ghz_chan,
+						     reg_cap->high_5ghz_chan);
 		}
 	}
 
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 6c5f9d587a60..da37332352fe 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -126,4 +126,6 @@ struct ath12k *ath12k_get_ar_by_vif(struct ieee80211_hw *hw,
 				    struct ieee80211_vif *vif,
 				    u8 link_id);
 int ath12k_mac_get_fw_stats(struct ath12k *ar, struct ath12k_fw_stats_req_params *param);
+void ath12k_mac_update_freq_range(struct ath12k *ar,
+				  u32 freq_low, u32 freq_high);
 #endif
-- 
2.34.1


