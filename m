Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5C3C282CD
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 22:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jsQYahd56p8iD7rT66MO+DkRt9uZksoQbbXlVQ/seuM=; b=f3xGgtoPqQ0tAr8r6ZYcwTeBK+
	vad8CWoHDkCESMq1zujajZUkOr/f6M/wR7D/uG5heoWq7qH52ft2wI9yxgWmd9QgRgf8vwi9/a4ck
	ZUnsEOSIZlgVljDMvNX9neTM61MoJkFB230O3FyRVIE4SEunM1JzjZAtC+ziqToTPvg6qbiuNkmVP
	HcdZJ2lc9Y66CXxAILkgsYEWWK0djyiGpv5FljwpdpC0L5MbBCnyeuOyQ1Fh3S+BIrkk+1Jdq72HP
	walXsmRsLEOrJbbDb9WufGWTAKhEsWvt99As8b40PXG8My3IjgewGkB3R2neGFvn+wyV1zSwQ1WpU
	sU5DgF8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7x-00000002SC7-3vNB
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 22:19:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7v-00000002S9I-0jhA
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 22:19:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AwCIQ022737;
	Mon, 3 Mar 2025 22:19:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jsQYahd56p8iD7rT66MO+DkRt9uZksoQbbXlVQ/seuM=; b=knP5MsAUdl+P+K2W
	b6aME/9Nn8bTh0e9MrNHuTavYZfxcRn5Bo/JsKKkfzGH1GbSwS4QCuRGZb4zMee9
	v+ISgKgrnaO4Za4ATFxvl4b96+os8o9btXtOfbYm1ktT28B26Yg+ECsJHiBcMk1+
	lqATaPd48/cbsDQG3eXq5fkMPh4jLXo7IV1yc2WFVZnzZgDb7Rcun+Su0ITa+7F3
	aKj6+n2Qae7s7Kso2NB0uLGNk0GXSjAePEyJDSLi+ke8Gg2UoUN1z8nOFyrbaPVO
	qC2DrFWpGH16Qg1/FG/22qZwzxyaru3857QXYWmnz5lH4xaIQmVjZE491dxlKkiL
	HZgNMQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453t7hx7f9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 22:19:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523MJ5cr022844
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 22:19:05 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 14:19:03 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Ramasamy
 Kaliappan" <quic_rkaliapp@quicinc.com>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v3 2/4] wifi: mac80211: update ML STA with EML capabilities
Date: Tue, 4 Mar 2025 03:48:41 +0530
Message-ID: <20250303221843.1809753-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303221843.1809753-1-quic_ramess@quicinc.com>
References: <20250303221843.1809753-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: m3mHOqIu8_Bizcv1SH6DzL_RMwB3ojm1
X-Proofpoint-ORIG-GUID: m3mHOqIu8_Bizcv1SH6DzL_RMwB3ojm1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_141907_340470_334B612C 
X-CRM114-Status: GOOD (  12.81  )
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
index c498f685d01f..99c3224a081a 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -2488,6 +2488,7 @@ struct ieee80211_link_sta {
  * @max_amsdu_subframes: indicates the maximal number of MSDUs in a single
  *	A-MSDU. Taken from the Extended Capabilities element. 0 means
  *	unlimited.
+ * @eml_cap: EML capabilities of this MLO station
  * @cur: currently valid data as aggregated from the active links
  *	For non MLO STA it will point to the deflink data. For MLO STA
  *	ieee80211_sta_recalc_aggregates() must be called to update it.
@@ -2522,6 +2523,7 @@ struct ieee80211_sta {
 	bool mlo;
 	bool spp_amsdu;
 	u8 max_amsdu_subframes;
+	u16 eml_cap;
 
 	struct ieee80211_sta_aggregates *cur;
 
diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 09708a060bb7..e73f54a36aed 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2066,6 +2066,9 @@ static int sta_apply_parameters(struct ieee80211_local *local,
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


