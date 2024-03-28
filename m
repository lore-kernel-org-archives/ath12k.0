Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E5ECD11DD
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UZbA36QIpM4yifccyxCOLoRUvteQcmHywRf1LnmTIx0=; b=O1F8ABAEVz4udOHzb2I0vPoiNu
	WNQ25KxTGXs2rTCloohJ3Uam5rY8jdi/7/tifgTAwZ5/GZLS08IsQldGLsLXd9w8auGtN3fb9Hm9l
	39ThPDhEeOq+1AqCoficsxO3lMa3LFrPEE1FjcHup8aAIeXS5b3f/lSkRXANKnWVZSBIehiAeTkT8
	WRuZjb7FEcftDhaIsQKUNltwXLn1H+8U1JIEXS2Suhp0AllCapysAgyv5T9AKwiU80a31MciW2wWU
	kP2SCjq/ClZ7qQ2rrQvZoNf7OM7Wo1ZezoZ4xpprOPj/pAGjlaQ8T/hp6oLsHGBGeyhamrQmd3yFp
	0H/nZbhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkD1-0000000CsE5-3sDW
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:29:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkCy-0000000CsCI-2B2g
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:29:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S6qjxR027529;
	Thu, 28 Mar 2024 07:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=UZbA36QIpM4yifccyxCOLoRUvteQcmHywRf1LnmTIx0=; b=f+
	BRoVmpTgd+A5R35LdjWt0/rKHg+pbDrvJ9phtePA6cNtGNxgYWfONudMAU706Irz
	POAy9jfYVyo1KWyBAAiXfhose7+54yuMCaiMj6yqauS1d69FnDXFkrzVFUO5rIZX
	NibCo8xuhIRJnfEr1HdIT74DsNcx98yf2i14lIKaKESdZJ7ir7os+lQkozTb8TOp
	g3/Hzi8zG2GssFD6mA6tIb2Igf9kMHlmePL0cajqW1hCPStcltJSoK9i1F8yJFI/
	9GHgbM4ruV/l86GhUB68ZpQVFxfbMfmEWUP9LKYYKXQm3uDKlBkmDQuzGHaJmNni
	TvetS9XNp+Hpuwo2doKQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x53nxg4w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7Ttrr003744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:55 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:53 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Vasanthakumar Thiagarajan
	<quic_vthiagar@quicinc.com>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 05/13] wifi: nl80211: Refactor the interface combination limit check
Date: Thu, 28 Mar 2024 12:59:08 +0530
Message-ID: <20240328072916.1164195-6-quic_periyasa@quicinc.com>
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
X-Proofpoint-GUID: KYxEzmzAXEVj4iWXi9RkaQgAtKeYEvuC
X-Proofpoint-ORIG-GUID: KYxEzmzAXEVj4iWXi9RkaQgAtKeYEvuC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002956_711852_18CE0167 
X-CRM114-Status: GOOD (  14.25  )
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

Move the nl80211 interface combination limit advertisement into a helper
function. This will make the iface combination limit advertisement
functionality more scalable for supporting multiple physical hardware
interface combination.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
Co-developed-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 net/wireless/nl80211.c | 49 +++++++++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 15 deletions(-)

diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index 2a5e395e2e0b..37524a61f417 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -1622,12 +1622,43 @@ static int nl80211_put_iftypes(struct sk_buff *msg, u32 attr, u16 ifmodes)
 	return -ENOBUFS;
 }
 
+static int
+nl80211_put_iface_limits(struct sk_buff *msg,
+			 const struct ieee80211_iface_limit *limits,
+			 u8 n_limits)
+{
+	int i;
+
+	for (i = 0; i < n_limits; i++) {
+		struct nlattr *nl_limit;
+
+		nl_limit = nla_nest_start_noflag(msg, i + 1);
+		if (!nl_limit)
+			goto nla_put_failure;
+
+		if (nla_put_u32(msg, NL80211_IFACE_LIMIT_MAX,
+				limits[i].max))
+			goto nla_put_failure;
+
+		if (nl80211_put_iftypes(msg, NL80211_IFACE_LIMIT_TYPES,
+					limits[i].types))
+			goto nla_put_failure;
+
+		nla_nest_end(msg, nl_limit);
+	}
+
+	return 0;
+
+nla_put_failure:
+	return -ENOBUFS;
+}
+
 static int nl80211_put_iface_combinations(struct wiphy *wiphy,
 					  struct sk_buff *msg,
 					  bool large)
 {
 	struct nlattr *nl_combis;
-	int i, j;
+	int i;
 
 	nl_combis = nla_nest_start_noflag(msg,
 					  NL80211_ATTR_INTERFACE_COMBINATIONS);
@@ -1649,20 +1680,8 @@ static int nl80211_put_iface_combinations(struct wiphy *wiphy,
 		if (!nl_limits)
 			goto nla_put_failure;
 
-		for (j = 0; j < c->n_limits; j++) {
-			struct nlattr *nl_limit;
-
-			nl_limit = nla_nest_start_noflag(msg, j + 1);
-			if (!nl_limit)
-				goto nla_put_failure;
-			if (nla_put_u32(msg, NL80211_IFACE_LIMIT_MAX,
-					c->limits[j].max))
-				goto nla_put_failure;
-			if (nl80211_put_iftypes(msg, NL80211_IFACE_LIMIT_TYPES,
-						c->limits[j].types))
-				goto nla_put_failure;
-			nla_nest_end(msg, nl_limit);
-		}
+		if (nl80211_put_iface_limits(msg, c->limits, c->n_limits))
+			goto nla_put_failure;
 
 		nla_nest_end(msg, nl_limits);
 
-- 
2.34.1


