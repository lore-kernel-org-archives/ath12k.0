Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAC3C47DD9
	for <ath12k@archiver.kernel.org>; Wed, 27 Mar 2024 17:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lwlet65No16meZmBBzMxZZgYWWPZ3pChqCYjUW0zKo8=; b=BRwD9QkAKKj1+reoI5fjJd0uph
	xNLnLASmHM4s3W6IqYJdhFnnVUZpd80fPruGvUUWBvg5fjI/UmLBYM7fmXB7JmCrVz2vrvU6S36S1
	MpMfM/IG2aTqrsA6pQDWYViBeaIuvYy4izh7GTvDhnhKNoJa45rnOqle2tGifE/3NeLOXW3F6g7n9
	rqritu2A8NHyTTKJg25TimUyKfzCIeWzMr2XTnkCvh/5dhRgR/4UMqYdrgLnL81Oem9PKw7KIOWC3
	5huz4jcwSYX0bXC1FdNRk9di1HyMEY8VNH12xc1QJY50fXKP8Moc7qtqZlh14jf0p+8gqGTrrHgA+
	G+LJqcag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWmF-0000000ADjV-3lQI
	for ath12k@archiver.kernel.org;
	Wed, 27 Mar 2024 17:09:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWmC-0000000ADfj-2shB
	for ath12k@lists.infradead.org;
	Wed, 27 Mar 2024 17:09:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42RARFME012423;
	Wed, 27 Mar 2024 17:09:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=Lwlet65No16meZmBBzMx
	ZZgYWWPZ3pChqCYjUW0zKo8=; b=I/1QmogadbajZbMbR0h3rLfmys/N1aebQcbY
	hyGlnGSucJRYpUbjQB9rS+pFP6mGWJ4psxCk8UMMU4WhD/epWFDurBJK5MgUNYa3
	L7O8XuDX3VeLan54JpSybELiA53xcaHyUq7577Al/86jHk0GsZ9k5PL5Paq9dpVQ
	oNeeJsDvu+vxzNRq4kkQhhb0+eBu6Totsw9X0BSaVrIE6cShgoLTrrXVcYOnMkaf
	NjdiYXNyI0hLqLyLgrpHb0T+5x78SQMNQ66kNCRlVcsy+VwgRs4ipmXr49v5UwRP
	Ye4pTeF0NTo1tbNgy+SwY+xMiGXnabM8t6PmZ7bXk4iy7tZhWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x47832fe5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 17:09:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42RH9KXj030147
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 17:09:20 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 27 Mar 2024 10:09:20 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v2 01/10] wifi: mac80211: Add EHT UL MU-MIMO flag in ieee80211_bss_conf
Date: Wed, 27 Mar 2024 10:09:01 -0700
Message-ID: <20240327170910.23975-2-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
References: <20240327170910.23975-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mhT8Evfo5OLXqQkJ076lcwNYRjsipNbc
X-Proofpoint-ORIG-GUID: mhT8Evfo5OLXqQkJ076lcwNYRjsipNbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_13,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403270119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_100924_919529_9C3939C8 
X-CRM114-Status: GOOD (  13.25  )
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
to pass EHT MU-MIMO configurations from user space to driver.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 include/net/mac80211.h | 4 ++++
 net/mac80211/cfg.c     | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 353488ab94a2..54bd2a988d91 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -701,6 +701,9 @@ struct ieee80211_fils_discovery {
  *	beamformee
  * @eht_mu_beamformer: in AP-mode, does this BSS enable operation as an EHT MU
  *	beamformer
+ * @eht_80mhz_full_bw_ul_mumimo: does this BSS support the reception (AP) or transmission
+ *	(non-AP STA) of an EHT TB PPDU on an RU that spans the entire PPDU
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
index f03452dc716d..894c7b6ddb0a 100644
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


