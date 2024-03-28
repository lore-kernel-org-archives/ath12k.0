Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87086CD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAA7rlFgKmMrThlT0BEckk99yJ8QCub2J11vEDLCuZ8=; b=ZHD70hUS7beLkW4rLzYJoxGzVA
	DIe1VEEjhHXPR2GSFMSFFQ5Pp0yEzrcOOaLGW8LsjfRCBajeK9Y1UaQioB9pOYSYwKV++EtmdiHE0
	SQi1z8AU4M4QKL2GH7AZKzMTQN5wmAmZWwNhFAyBAXws8d6rw2dm4L+4/AVa3LA6nUUnQiavQMM0O
	zrbJ+14AxHVbzBKKlI2iaZGQAJ4cMficQcDU6DjZPrCAWu6cZSwZv12WpYg3nkxtpaVlFK073zxRn
	srN3PnTTS1aoxt+9ByZz2zMXMsszQQf37wPaz+IphAS0k5ZHy55N67NrKWRrSBZ6pCwkMwvkjxekn
	rcrjEM+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkD7-0000000CsHX-08kN
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:30:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkD3-0000000CsEw-0RT0
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:30:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S6qjdr027622;
	Thu, 28 Mar 2024 07:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=mAA7rlFgKmMrThlT0BEckk99yJ8QCub2J11vEDLCuZ8=; b=af
	wzXtg4gPNeQqliKrh/oN5NY5CYZlz/0gML45xWN2MdP/3GMNTNTuJc8eBgJ39KgO
	MbMWrfglYDzn4YroVX5WrEcHZGuWqwh0N5roI9zhiQ+5LxPYzimBP125WFdiBPH3
	Ig4lpqdGFKCC1rPqJzvecNCndW9etmTffhiCvNf73ECdp7pRp9fxAdtam/No5r3g
	9nUehTsgkaYGlGexsLqwK3C9GnmdtNAYwkLvuxm2Q50FOGLBeKOjl3JmvsvNcBUT
	+WWmBeHq4uW0q5dNGlN4nRFEoxNPM/7p4XdIbzDh+oLcqnkYDb42k9+FYHMHDT7M
	BwnV3cn4N4RkQ8YnJERQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x53nxg4wg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:30:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7U01T001180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:30:00 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:57 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 07/13] wifi: cfg80211/mac80211: Refactor iface comb iterate callback for multi-hardware dev
Date: Thu, 28 Mar 2024 12:59:10 +0530
Message-ID: <20240328072916.1164195-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
References: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8S-Xuw1nM8TK4Aai6Z_1qdbLzqAKqstW
X-Proofpoint-ORIG-GUID: 8S-Xuw1nM8TK4Aai6Z_1qdbLzqAKqstW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=916 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_003001_286903_AAB9A410 
X-CRM114-Status: GOOD (  13.20  )
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

From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>

Currently, interface combination iterate callback gets notified for each
matching combination. To support multi-physical hardware interface
combination advertisements, the callback subscriber should additionally
receive the hardware index information to indicate which physical hardware
is chosen in the matching combination. Refactor the iterate callback by
introducing an argument for passing the hardware index. This hardware
index is valid for the multi-hardware advertisements and invalid (-1) for
the single hardware combination advertisement.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 include/net/cfg80211.h | 2 +-
 net/mac80211/util.c    | 2 +-
 net/wireless/util.c    | 8 ++++----
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 491d074fe430..246a8c07becf 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -9233,7 +9233,7 @@ int cfg80211_check_combinations(struct wiphy *wiphy,
 int cfg80211_iter_combinations(struct wiphy *wiphy,
 			       struct iface_combination_params *params,
 			       void (*iter)(const struct ieee80211_iface_combination *c,
-					    void *data),
+					    int hw_chan_idx, void *data),
 			       void *data);
 
 /*
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index cda398d8f60d..b1f3b1eb053d 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -4014,7 +4014,7 @@ int ieee80211_check_combinations(struct ieee80211_sub_if_data *sdata,
 
 static void
 ieee80211_iter_max_chans(const struct ieee80211_iface_combination *c,
-			 void *data)
+			 int hw_chan_idx, void *data)
 {
 	u32 *max_num_different_channels = data;
 
diff --git a/net/wireless/util.c b/net/wireless/util.c
index 2bde8a354631..b60a6a6da744 100644
--- a/net/wireless/util.c
+++ b/net/wireless/util.c
@@ -2363,13 +2363,13 @@ int cfg80211_validate_beacon_int(struct cfg80211_registered_device *rdev,
 int cfg80211_iter_combinations(struct wiphy *wiphy,
 			       struct iface_combination_params *params,
 			       void (*iter)(const struct ieee80211_iface_combination *c,
-					    void *data),
+					    int hw_chan_idx, void *data),
 			       void *data)
 {
 	const struct ieee80211_regdomain *regdom;
 	enum nl80211_dfs_regions region = 0;
 	int i, j, iftype;
-	int num_interfaces = 0;
+	int num_interfaces = 0, hw_chan_idx = -1;
 	u32 used_iftypes = 0;
 	u32 beacon_int_gcd;
 	bool beacon_int_different;
@@ -2460,7 +2460,7 @@ int cfg80211_iter_combinations(struct wiphy *wiphy,
 		 * supported the requested numbers, so we're good.
 		 */
 
-		(*iter)(c, data);
+		(*iter)(c, hw_chan_idx, data);
  cont:
 		kfree(limits);
 	}
@@ -2471,7 +2471,7 @@ EXPORT_SYMBOL(cfg80211_iter_combinations);
 
 static void
 cfg80211_iter_sum_ifcombs(const struct ieee80211_iface_combination *c,
-			  void *data)
+			  int hw_chan_idx, void *data)
 {
 	int *num = data;
 	(*num)++;
-- 
2.34.1


