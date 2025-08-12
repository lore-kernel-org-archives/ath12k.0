Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C5BCA0EDC
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+gaxpLs05l9kYZ2jejuyprZBJK2egG1VMc4675dTbj8=; b=a5C8Evk82Yn80V+DhvRm7dBj/5
	vPj+742jKqRILocMfFTEeyMTotq3uiRIiUIBycVWFNaF5/d/EwX4hJ+7wVAb4TZmW3TfASw/zEoFR
	e51uO//qAEJ2PAjmrZ6FL/1BbvofpTUbiXPWoWF1i+jrZMH3a/GO+dr9syegOaJ7cMzWzGliS+YTW
	5UtdvCE7oGLFxE36zbiGr20g8RE+5H7faSiQTzoZexV3AmL9Z8EKjEso9YE/v9gJ2z7VRSqPfqLyk
	do88axTNNzJzF48Y8FCIcn7l1kv0AU9mDd97bY/d5Yem9iOwOgtq80SEmlqegsZz4o7CgovXvQ0uv
	I6NHvWTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjn-0000000BK7T-382g;
	Tue, 12 Aug 2025 16:20:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln0O-0000000AaoF-0aI8
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 11:17:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgZI032229
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=+gaxpLs05l9kYZ2jejuyprZBJK2egG1VMc4675dTbj8=; b=Mj
	xvzBA0D0pki1jutul8YJVTcoyaURX1sOzgdcXZsgGS4tf0cWIpRro/DP+oNYUi17
	aw1ATYbMuqmUl8ggn6qEJrGrBqYoy9z1UyrUzbZArFe0aapubwhwbP0KQ58FXJOa
	mPyg/GPpwpYXtKEE7PQKeii/Q3cBsuQaO5lNqSpDs38bvDUn6fehfJA/ieS3FxmP
	ULv/HBo3ZOGBOnI1oYGU4Op1O5Uljqu+8DyfU8GRN1Wtug3PoQpUvGep8B8U/yWr
	AaGqMp+D/miew9M+tTkyl5uMrIBOWBOJc0O/2+BXuuR5EicQWyLHUNxjycHd8CEC
	WxAtTHYjt5GUnz7BWKpw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vjsb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:23 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2400a0ad246so43192485ad.2
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 04:17:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997442; x=1755602242;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+gaxpLs05l9kYZ2jejuyprZBJK2egG1VMc4675dTbj8=;
        b=DFQMUH4br25LHcA8NgB+tO4KbhR5m4s4jyGIdO8Txq4S8DaqhXnevzDsIAJs+gavuC
         fuE9w4ZKqSRi9YevghxN7GlIBRl1AA0q/hc9igwGtd0rTx7tpkzAnHNBs2QLMdhhdbai
         uptIM+exalZAjSRCnxCOiaMOrUmr0Otz/yaonAIoDApyXaPX2WzVt1Ca4XL0H0WI817o
         rsH2IHOf5iLftLsskGpANeQ3kriIicEOdDQMg+04nTkGqqXNntzyaHWK301ikCX79xvj
         hWow0rgqjjzcNDH6vTE4iAfJFnlVl3SI7NAEcB1uWHcRBliYFIj5cFK/d8bRILdV8kE0
         OyYg==
X-Gm-Message-State: AOJu0YzOxvtAbNwWzPk3wcEwopJN8Y3XASYW+wq+9TSX1bzWznxIwrwC
	oJCINtvMZ4VL/30KvgS+qJSHo7Rt8NN7HCkKnno+UHdrEuiWT8ZYPUX+UBsUMHtT1KYlzCqx/Yj
	qt2s3C+jm4H00an1FicDlSwxSsplB42SZ796d62H8qPyc7CEMM4/fnWxcc3x27BICoRd52WoI
X-Gm-Gg: ASbGnct/RlbE0U9+3fl0P79uzCcKroERj2axg/j0QjJlKLNLXZJUvKvdfxi0VtIg12G
	xuYVGDZ7sUW4Ybz1PtVgDAw+Vsq3hkQiaZMRYlXccIg83dQhUIzENJTCYrkAMpJb7D0deGbUxM6
	8z9NAbZE/2lN87tJaZFnyuL2w7CVTVtWLBwKCOMb7EF32gAnm7QP1mxTqOpNjyKFFCdcoVESmIy
	D0hw0/wq4UHW6Y6yYaI3wwdrnrnA8LM7rSTkvQMZQUGU4xgPFd2cDhDkOh6brvSXnjqq5GtGOQy
	iT3R/DJLbNYwYbpawBOAiC7V6PvSBHPKLlakp3cQQNr2rb1yb112nzvyzEwppFAX+8TWybZtu+L
	7VhGShK4=
X-Received: by 2002:a17:903:1b70:b0:242:fe99:eb20 with SMTP id d9443c01a7336-242fe99eeafmr34563865ad.9.1754997441599;
        Tue, 12 Aug 2025 04:17:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPq0dStUkPx4cTX88OhK3zqVQL4Wzn9gJ3/yYPkTrkianwgxlmegZz8QKD0a+E8z7sGcB19g==
X-Received: by 2002:a17:903:1b70:b0:242:fe99:eb20 with SMTP id d9443c01a7336-242fe99eeafmr34563305ad.9.1754997440985;
        Tue, 12 Aug 2025 04:17:20 -0700 (PDT)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1ebc1sm296048935ad.67.2025.08.12.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:17:20 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Arulanbu Balusamy <quic_abalusam@quicinc.com>,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/3] wifi: ath12k: Add support to handle reason inactivity STA kickout event for QCN9274/IPQ5332
Date: Tue, 12 Aug 2025 16:47:07 +0530
Message-Id: <20250812111708.3686-3-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXzsM7QPn6OvP9
 pBOTJ2tkPVFM/X4SlDNRZlHm+mj1qVksrj3rxP29NYLAb0lKrZ5qwoMcZU7TpVLVWku9EGoEyY3
 z8TgD7iKsPCfWyEr1hwuv07HKMrRWsHTyLxKPubgc1L+ZkeRK+K89l919gErfJRgHxLncs5AvQQ
 QG/zOtWMTnqEIEklJmlEHAtqAB7+QZ1uyeqS8OZDWEVIyHW7mffNQCxkhOjrcbY4LbY8fQcGSaf
 V8PJzOMIntJGVmwCdrQ6OzWYpM0INysUvqxU+hgdJXWznsYTo47WUOVR464Frnt1DU612H3FxBc
 U5r76tEwTOi+8291hkKUlURMB9zM0Dw+CZd3xkKtNeWrZbaiEZAVnWYgUUmpLUuXhqqlYDE2SNL
 LTumejni
X-Proofpoint-GUID: 2e6Jd58p-d_Zv1TYPuP3FcnN1UTLXjyl
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b22c3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pF2EGbSXpo1r09cqILgA:9
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2e6Jd58p-d_Zv1TYPuP3FcnN1UTLXjyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041724_297370_DD2B1334 
X-CRM114-Status: GOOD (  16.32  )
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

From: Arulanbu Balusamy <quic_abalusam@quicinc.com>

Currently, when the non-AP STA connected to the AP STA, and the AP STA goes
down or becomes inactive without indication, firmware detects the beacon
miss and sends the WMI event WMI_PEER_STA_KICKOUT_EVENTID with reason as
INACTIVITY. The host driver handles this event as low ACK and reports it to
the mac80211 driver.

However, the expectation is that non-AP STA should be disconnected from
AP STA instantly once it receives the STA kickout event with reason of
inactivity.

Trigger a disconnect from AP STA through beacon miss handling upon
receiving non-AP STA peer kickout event with reason code inactivity.

Replace the helper function ath12k_mac_get_ar_by_vdev_id() with
ath12k_mac_get_arvif_by_vdev_id() due to the following reasons.

1. Check the station VIF type for handling the beacon miss.

2. Retrieve the proper ar from the arvif by checking the vdev_id with
   vdev_map and link_map lookup which is needed for the MLO case in the
   following patch.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Co-developed-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
Signed-off-by: Arulanbu Balusamy <quic_abalusam@quicinc.com>
Co-developed-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index cb686c68987a..113ce1390eb1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -7299,6 +7299,7 @@ static void ath12k_scan_event(struct ath12k_base *ab, struct sk_buff *skb)
 static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff *skb)
 {
 	struct wmi_peer_sta_kickout_arg arg = {};
+	struct ath12k_link_vif *arvif;
 	struct ieee80211_sta *sta;
 	struct ath12k_peer *peer;
 	struct ath12k *ar;
@@ -7320,13 +7321,15 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 		goto exit;
 	}
 
-	ar = ath12k_mac_get_ar_by_vdev_id(ab, peer->vdev_id);
-	if (!ar) {
+	arvif = ath12k_mac_get_arvif_by_vdev_id(ab, peer->vdev_id);
+	if (!arvif) {
 		ath12k_warn(ab, "invalid vdev id in peer sta kickout ev %d",
 			    peer->vdev_id);
 		goto exit;
 	}
 
+	ar = arvif->ar;
+
 	sta = ieee80211_find_sta_by_ifaddr(ath12k_ar_to_hw(ar),
 					   arg.mac_addr, NULL);
 	if (!sta) {
@@ -7339,7 +7342,16 @@ static void ath12k_peer_sta_kickout_event(struct ath12k_base *ab, struct sk_buff
 		   "peer sta kickout event %pM reason: %d rssi: %d\n",
 		   arg.mac_addr, arg.reason, arg.rssi);
 
-	ieee80211_report_low_ack(sta, 10);
+	switch (arg.reason) {
+	case WMI_PEER_STA_KICKOUT_REASON_INACTIVITY:
+		if (arvif->ahvif->vif->type == NL80211_IFTYPE_STATION) {
+			ath12k_mac_handle_beacon_miss(ar, peer->vdev_id);
+			break;
+		}
+		fallthrough;
+	default:
+		ieee80211_report_low_ack(sta, 10);
+	}
 
 exit:
 	spin_unlock_bh(&ab->base_lock);
-- 
2.17.1


