Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A338FC0218B
	for <ath12k@archiver.kernel.org>; Fri, 17 Jan 2025 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EUDjvYLYB1qw3EJhDCB5ckEKJ+Qhc+EiqKr7Qiiqb/o=; b=DnDMJ3oXr5FrFLyj8q/fAxBZGF
	5NUmJV2t1QbDIHvr4ZG4E1cdVgbkGsoByyd9fGlRaUVP0JjquhkR4IBuFwPGME2sfM5FTiTF8nTcY
	rzzwBBDEerUthK0H/26+OyTYb9M9+QiXcbrTgHmqnGUh0zL/8uPl17SzC00az6PB+xTbs15dIMN/d
	LZ0NKiBWfcFUclkbI5myCuVsdDLwIQUj9mOMumNPYVsQtk2mAlAuzsGG+//Ivn0Zxc7MnnYTOt8UA
	I9WYgxDvyvQTleL/avcn7jHpH7U87g/ssFemF4nCILVhjyqPD0sSo+SdaXkBXctYQhBgU7V6vyVBq
	ZQW33GPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpu7-00000000ve6-1bFR
	for ath12k@archiver.kernel.org;
	Fri, 17 Jan 2025 17:13:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpm1-00000000ttW-1qgh
	for ath12k@lists.infradead.org;
	Fri, 17 Jan 2025 17:04:46 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HE5mrh010741;
	Fri, 17 Jan 2025 17:04:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUDjvYLYB1qw3EJhDCB5ckEKJ+Qhc+EiqKr7Qiiqb/o=; b=VZyMno8kfAtzM+ef
	Pyy/tp0OmCFVuZLzsmHJ+lsLTlAVJt/WF18d24tEwymPqVUoGPCQ9tDG1p6yOIyc
	VgFVxjhBL2lUTYws9QKkbke0cwREbcFI6MLWl2bP9t4KuM/OOYTw+XBQzUzvxen5
	rPY4njGQCzxMosKUTm4Dyjo30TQhJ1zmz8rwPWZBJ9uG/h6C7DuIgBWMjOYnyNdE
	aFnuc1XKLaFQgkHoEbTfqo3MAS1RLcduBW6wesAQx05eswZ4UWs/TPEK68d2UK3W
	i5MHuS8MVhj/AuLNRFzCj8/ymeLlYKVAELc1mKbCSMs5oq260HnNYptWAHfAaWfV
	lD3C/g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 447rnx0eqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:04:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50HH4h0c020869
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 17:04:43 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 17 Jan 2025 09:04:41 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Ramasamy
 Kaliappan" <quic_rkaliapp@quicinc.com>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v2 2/3] wifi: mac80211: update ML STA with EML capabilities
Date: Fri, 17 Jan 2025 22:34:15 +0530
Message-ID: <20250117170416.2907530-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117170416.2907530-1-quic_ramess@quicinc.com>
References: <20250117170416.2907530-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OxIKIkUnkZdUoMID8iYvFbTBGOT5RDJA
X-Proofpoint-GUID: OxIKIkUnkZdUoMID8iYvFbTBGOT5RDJA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 mlxlogscore=990 mlxscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501170134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_090445_599665_058B1085 
X-CRM114-Status: GOOD (  13.12  )
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

From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>

When an AP and Non-AP MLD operates in EMLSR mode, EML capabilities
advertised during Association contains information such as EMLSR
transition delay, padding delay and transition timeout values.

Save the EML capabilities information that is received during station
addition and capabilities update in ieee80211_sta so that drivers can use
it for triggering EMLSR operation.

Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 include/net/mac80211.h | 2 ++
 net/mac80211/cfg.c     | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index c3ed2fcff8b7..3a396b0f5421 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2487,6 +2487,7 @@ struct ieee80211_link_sta {
  * @max_amsdu_subframes: indicates the maximal number of MSDUs in a single
  *	A-MSDU. Taken from the Extended Capabilities element. 0 means
  *	unlimited.
+ * @eml_cap: EML capabilities of this MLO station
  * @cur: currently valid data as aggregated from the active links
  *	For non MLO STA it will point to the deflink data. For MLO STA
  *	ieee80211_sta_recalc_aggregates() must be called to update it.
@@ -2521,6 +2522,7 @@ struct ieee80211_sta {
 	bool mlo;
 	bool spp_amsdu;
 	u8 max_amsdu_subframes;
+	u16 eml_cap;
 
 	struct ieee80211_sta_aggregates *cur;
 
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 9351c64608a9..ed1bf9f3d564 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2067,6 +2067,9 @@ static int sta_apply_parameters(struct ieee80211_local *local,
 	if (params->listen_interval >= 0)
 		sta->listen_interval = params->listen_interval;
 
+	if (params->eml_cap_present)
+		sta->sta.eml_cap = params->eml_cap;
+
 	ret = sta_link_apply_parameters(local, sta, STA_LINK_MODE_STA_MODIFY,
 					&params->link_sta_params);
 	if (ret)
-- 
2.34.1


