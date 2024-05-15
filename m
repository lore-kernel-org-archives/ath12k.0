Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60506C25B79
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8y5s/satLN+ZXz6hQpTy8LyMEbsMT1shxCuT2UR3U4=; b=fCDz1DW1oE48HvQuXJVzfww41E
	D/nJW4rZcoJeB1SQvdueAb8p9eVZw5TP6eOJU+NTby4D+iq6gfDCcEl+k+ZENY8XaflujP54mGoEP
	xAa8hry3b74f63DTBgDVPcgWQbMnbzwtWBdYTuWjwecDF9+FL5rZYoFoyvoO2f9JGu2PX8/GhThxk
	DaZqs2CvquxawdkYrEH/GjuaareJS9BaKF5I4jxb6T/Tv786FB3OffbkJVGfrXX7HJw5JkrQ1btHe
	Tcrrgdhem+cBdr6Npczek/UaPAbVwtlaaU/GHrQKoCdBeHVY8HN3BrAJ3de+s3IXlO4xVfbw+dL/k
	+osJ3h+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8g-00000002W50-3oGF
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 18:14:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7J8N-00000002VpL-1jpU
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 18:13:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90ckF012291;
	Wed, 15 May 2024 18:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=r8y5s/satLN+ZXz6hQpT
	y8LyMEbsMT1shxCuT2UR3U4=; b=Dc52HYGtm/fw6BtwCHhXAVaKBHXuJRKoKeTc
	QvGi2i757h7yY3JPS0tabWSvkX/zhrpDKUAmCzMD5wllxQG8sYxtGD3Tecjw7sv3
	IyJQYxftOJAf7Q5dD4JlWxGJoYVkj1x0YlHeO8c5bfSabQ7jaegJUVRDWPetmObX
	lQiG+zMoPT8XgGU7ObZZZsOWxwoeLmbg6ENc/ean8U+dnIAcJll7+JFbBv20bcNz
	BKhjthP+Edfm/0FDeoARAZW+dwlWcxzqweZG3bRpQ9Tv3GcvDKiYiiZ2vlh9M443
	jR6zLGPM8Rv7plrELH/BICutFnDTc/Wb2TsdSKqHRRDWSDHjuw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28pds9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FIDcTV024538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 18:13:38 GMT
Received: from pradeepc-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 11:13:38 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V6 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in ieee80211_bss_conf
Date: Wed, 15 May 2024 11:13:18 -0700
Message-ID: <20240515181327.12855-2-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515181327.12855-1-quic_pradeepc@quicinc.com>
References: <20240515181327.12855-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: n6rH08rxGU0PsWDz-xHEiahQ4YZvmLVc
X-Proofpoint-GUID: n6rH08rxGU0PsWDz-xHEiahQ4YZvmLVc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_11,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=990
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_111348_168480_A2307A29 
X-CRM114-Status: GOOD (  12.38  )
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

Add flag for Full Bandwidth UL MU-MIMO for EHT. This is utilized
to pass EHT MU-MIMO configurations from user space to driver
in AP mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 include/net/mac80211.h | 4 ++++
 net/mac80211/cfg.c     | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index cafc664ee531..bb8abe6735a8 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -701,6 +701,9 @@ struct ieee80211_fils_discovery {
  *	beamformee
  * @eht_mu_beamformer: in AP-mode, does this BSS enable operation as an EHT MU
  *	beamformer
+ * @eht_80mhz_full_bw_ul_mumimo: in AP-mode, does this BSS support the
+ *	reception of an EHT TB PPDU on an RU that spans the entire PPDU
+ *	bandwidth
  */
 struct ieee80211_bss_conf {
 	struct ieee80211_vif *vif;
@@ -793,6 +796,7 @@ struct ieee80211_bss_conf {
 	bool eht_su_beamformer;
 	bool eht_su_beamformee;
 	bool eht_mu_beamformer;
+	bool eht_80mhz_full_bw_ul_mumimo;
 };
 
 /**
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index b08e5d7687e3..96b2f31f0c8a 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1379,6 +1379,11 @@ static int ieee80211_start_ap(struct wiphy *wiphy, struct net_device *dev,
 				(IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_80MHZ |
 				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_160MHZ |
 				 IEEE80211_EHT_PHY_CAP7_MU_BEAMFORMER_320MHZ);
+		link_conf->eht_80mhz_full_bw_ul_mumimo =
+			params->eht_cap->fixed.phy_cap_info[7] &
+				(IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_80MHZ |
+				 IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_160MHZ |
+				 IEEE80211_EHT_PHY_CAP7_NON_OFDMA_UL_MU_MIMO_320MHZ);
 	} else {
 		link_conf->eht_su_beamformer = false;
 		link_conf->eht_su_beamformee = false;
-- 
2.17.1


