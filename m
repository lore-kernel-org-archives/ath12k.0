Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370D1C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 17:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9/FolBaqxax0dO5vPvpK29kXI5rywEFdHAaxt1IhD9k=; b=MozF11UKDZW2KK56HyONhFrA2M
	pk/zVgVt8Y5uXkDs/PWI9WuyjlLAU+tcQqSg5B+CIkNDKxWfevclA7xCSFbd9qD+oeTitw5OzrujR
	MQb8ji/e/TwQx625S61vdoPZmhj2IgOYlTGMlB4qx9BfK/yDVTBu882Fk5HMhY+1KlFHwJZPvuwKr
	6tSYENmiNRfsFj4dVJPyj2lN/oQE9OOePuXLmasZ9ZgwYN+rpyOX1KKoGn0uJIrBSiuVv+foJrY2/
	0fJ2RqJURpDOnv+p8+J6tLuRTnVMRNAEv+PBMnsRsCDPxUnDaVYeWtNza09craRczxLjftOY0udrP
	LzDu+6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKY-0000000FCG8-43sX
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 17:18:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKW-0000000FCEj-3gu7
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 17:18:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAlvKj031260;
	Fri, 24 Jan 2025 17:18:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/FolBaqxax0dO5vPvpK29kXI5rywEFdHAaxt1IhD9k=; b=L/pvVb4Wi3ZUQaHp
	mzzbsqw7dfrre2sV3iOAjFD7JKqVyDnl7rpGeOpR6Cbmnx2gkhSlrii+hgquEerM
	g326h6jy+3pdPXkFmapUyVCVs2YuFIdryegC4h8heH5hZTPp11o9LjNZB3qA5pHj
	9Y9uxK0f/cpuv9F79nJw9WpTznHCTD2WO82Wbu6Rsx++Bha3pxgeIk6GCai4kzUO
	m7sNVTJVMHejxsmmYckIAaWofKqi7ShdnNFOT6L8MpdC/6qQIfuVT2sRKw68yHMp
	YsjKtixod8KRpBOzaE6wYak9f0xuozbcvH2lT4su78stnuoSi+KaR7LzL6I0hAe8
	PDnHBg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9e20yc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:51 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OHIoEJ022491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:50 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 Jan 2025 09:18:49 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v2 5/5] wifi: mac80211: set tx power per radio in a wiphy
Date: Fri, 24 Jan 2025 22:47:56 +0530
Message-ID: <20250124171756.3418663-6-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124171756.3418663-1-quic_rdevanat@quicinc.com>
References: <20250124171756.3418663-1-quic_rdevanat@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oSXjcRWbTYfueGFyQphdGWKoEkJADqMZ
X-Proofpoint-ORIG-GUID: oSXjcRWbTYfueGFyQphdGWKoEkJADqMZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_091853_039602_BB04AC1F 
X-CRM114-Status: GOOD (  14.76  )
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

From: Rameshkumar Sundaram <quic_ramess@quicinc.com>

If set tx power is being done without a valid wdev/sdata
then the configuration applies to the radio but currently
it is being done at wiphy level(i.e. to all radios of wiphy)
since radio identifier is not available.

Use the radio_id argument of ieee80211_set_tx_power() to identify
to which radio of the wiphy the configuration should be applied.
If the wiphy is a multi-radio wiphy(wiphy.n_radios > 0), validate the
radio index of link's channel context against the radio id provided
and apply the configuration.

radio id value of NL80211_WIPHY_RADIO_ID_MAX(255) indicates that radio
index is not mentioned and the configuration applies to all radio(s) of
the wiphy.

Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 net/mac80211/cfg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index f86350b3a668..ed769672ea77 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -3079,6 +3079,7 @@ static int ieee80211_set_tx_power(struct wiphy *wiphy,
 	struct ieee80211_local *local = wiphy_priv(wiphy);
 	struct ieee80211_sub_if_data *sdata;
 	enum nl80211_tx_power_setting txp_type = type;
+	struct ieee80211_chanctx_conf *conf;
 	bool update_txp_type = false;
 	bool has_monitor = false;
 	int user_power_level;
@@ -3154,6 +3155,12 @@ static int ieee80211_set_tx_power(struct wiphy *wiphy,
 			if (!link)
 				continue;
 
+			if (radio_id < wiphy->n_radio) {
+				conf = wiphy_dereference(wiphy, link->conf->chanctx_conf);
+				if (!conf || conf->radio_idx != radio_id)
+					continue;
+			}
+
 			link->user_power_level = local->user_power_level;
 			if (txp_type != link->conf->txpower_type)
 				update_txp_type = true;
@@ -3174,6 +3181,12 @@ static int ieee80211_set_tx_power(struct wiphy *wiphy,
 			if (!link)
 				continue;
 
+			if (radio_id < wiphy->n_radio) {
+				conf = wiphy_dereference(wiphy, link->conf->chanctx_conf);
+				if (!conf || conf->radio_idx != radio_id)
+					continue;
+			}
+
 			ieee80211_recalc_txpower(link, update_txp_type);
 		}
 	}
-- 
2.17.1


