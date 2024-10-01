Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C610CCE7D08
	for <ath12k@archiver.kernel.org>; Tue,  1 Oct 2024 10:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xINYJRJuHyewl3XgyedS07o0JAromGlSz5DwoaexBfo=; b=PdsxTY/3rY+rOPwe0P9Cwns8om
	L6+MkjJ2EoyyIv9y+g+5tw5wbC8COuxu6TwGKngBZ/PtG5Rn/IF7GpUmG2E0W7yJfpiMY2wz1Kwzl
	BFqG69DzCQdwVMP3qH5iBSM049jfF4xQF7BbxrswQ1WlrLdQmESKyhhySOyaI6u/+PSUi892XVOdr
	iBO0SihIIyrtUCy+15gI2rSXHGqbdXFmJhcdSjs0afTGc3D3PazkDhSCS042xFX/KyaF/pLHVjx8e
	la5jw56vtW9YM3LjiQyy+oXwvs4ZApchHg3mZNXuWs9/mcwKtkmHlERSnqLqlSL8YYScjPW1jC4Kq
	JNf19nWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZgL-00000002I0O-27rI
	for ath12k@archiver.kernel.org;
	Tue, 01 Oct 2024 10:00:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYb1-000000028JQ-3Sb9
	for ath12k@bombadil.infradead.org;
	Tue, 01 Oct 2024 08:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=xINYJRJuHyewl3XgyedS07o0JAromGlSz5DwoaexBfo=; b=HJ8veU5oRjvXAGCl6xuhqjQV78
	F/T5tRfN9oqsZp4LNE2hrQUMLzo6tMIwJ13Qmoy4mehaWrQXG0nHFG0kMqGeUBDUMa6TWL8y53CnQ
	rOdePNLIaW73fjWYV6lAcUw8tOlIZOxqabjwiCRlxh++xl+2Api7awgQAb4yQ1JHkhB6ZFlfJxfzL
	YsPdratY5dd83WeUtkVsRpys+I+VTQRfnaux0GzaLocbg7eNcASvBnAF3NnQ6VBFhmXD5nGyUmWTk
	a9n3x8GuYKqgwPZPMVcUuDmwYc5kP6SIDDR8G0CkGgj7YV0npM0JlqqaGWHkGt5xy2bsAn1Ui4cAp
	Oqyf39zA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svYaw-00000002zns-1fmL
	for ath12k@lists.infradead.org;
	Tue, 01 Oct 2024 08:51:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4913SnwE027724;
	Tue, 1 Oct 2024 08:50:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xINYJRJuHyewl3XgyedS07
	o0JAromGlSz5DwoaexBfo=; b=KzCCZrzLcfg3ko1448uqNbj3QlIw2XqOWtoHhn
	Xtstl4lWdKh+SZTLLkWwg2DscdMUerj20k3IXC+k9kbFfo06d4uDtC121WZaFx4P
	ngX+BdKGSoZ7uKqai06AEzo5jFuSXqMq96qWHjZ3NLLg36iYGWQi8feTlmhT/ujx
	3IVrL+hN2FQOHT0sP8e/ycGPIBrg+YpwUB5rVWD+GPPJHLCBHA/+LAWrN7J1uE5x
	B1yzJvs/GxhmXvkzfjRcVcKQRMHvf34NwOwWJF7Yw1aqcBPMiJfjhvb9IDfxTzbP
	2L0sJ0TJMsQOErauTQxjL/gI1Ef0Df74aQF8RslpmBCNCpWw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41xte0xbyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Oct 2024 08:50:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4918oplJ007463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Oct 2024 08:50:51 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 1 Oct 2024 01:50:48 -0700
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Aditya
 Kumar Singh" <quic_adisi@quicinc.com>
Subject: [PATCH v2] wifi: mac80211: re-order assigning channel in activate links
Date: Tue, 1 Oct 2024 14:20:34 +0530
Message-ID: <20241001085034.2745669-1-quic_adisi@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e40LJUqdbXXQ8T7So2Ucm-azmLrOOrB3
X-Proofpoint-GUID: e40LJUqdbXXQ8T7So2Ucm-azmLrOOrB3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2410010057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_095100_779276_923FE795 
X-CRM114-Status: GOOD (  21.00  )
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

The current flow in _ieee80211_set_active_links() does not align with the
operational requirements of drivers that groups multiple hardware
under a single wiphy. These drivers (e.g ath12k) rely on channel
assignment to determine the appropriate hardware for each link. Without
this, the drivers cannot correctly establish the link interface.

Currently in _ieee80211_set_active_links(), after calling
drv_change_vif_links() on the driver, the state of all connected stations
is updated via drv_change_sta_links(). This is followed by handling keys
in the links, and finally, assigning the channel to the links.
Consequently, drv_change_sta_links() prompts drivers to create the station
entry at their level and within their firmware. However, since channels
have not yet been assigned to links at this stage, drivers have not
created the necessary link interface for establishing link stations,
leading to failures in activating the links.

Therefore, re-order the logic so that after drv_change_vif_links() and
removing the old links, channels are assigned to newly added links.
Following this, the flow proceeds to station handling.

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
v2: * assigned channel after removing older links.
    * kept the call to link_info_changed() in the original place itself.
    * got rid of using word 'fix'

---
 net/mac80211/link.c | 51 +++++++++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/net/mac80211/link.c b/net/mac80211/link.c
index 0bbac64d5fa0..019e1c1311b4 100644
--- a/net/mac80211/link.c
+++ b/net/mac80211/link.c
@@ -385,6 +385,37 @@ static int _ieee80211_set_active_links(struct ieee80211_sub_if_data *sdata,
 						 jiffies);
 	}
 
+	for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct ieee80211_link_data *link;
+
+		link = sdata_dereference(sdata->link[link_id], sdata);
+
+		/*
+		 * This call really should not fail. Unfortunately, it appears
+		 * that this may happen occasionally with some drivers. Should
+		 * it happen, we are stuck in a bad place as going backwards is
+		 * not really feasible.
+		 *
+		 * So lets just tell link_use_channel that it must not fail to
+		 * assign the channel context (from mac80211's perspective) and
+		 * assume the driver is going to trigger a recovery flow if it
+		 * had a failure.
+		 * That really is not great nor guaranteed to work. But at least
+		 * the internal mac80211 state remains consistent and there is
+		 * a chance that we can recover.
+		 */
+		ret = _ieee80211_link_use_channel(link,
+						  &link->conf->chanreq,
+						  IEEE80211_CHANCTX_SHARED,
+						  true);
+		WARN_ON_ONCE(ret);
+
+		/*
+		 * inform about the link info changed parameters after all
+		 * stations are also added
+		 */
+	}
+
 	list_for_each_entry(sta, &local->sta_list, list) {
 		if (sdata != sta->sdata)
 			continue;
@@ -428,26 +459,6 @@ static int _ieee80211_set_active_links(struct ieee80211_sub_if_data *sdata,
 
 		link = sdata_dereference(sdata->link[link_id], sdata);
 
-		/*
-		 * This call really should not fail. Unfortunately, it appears
-		 * that this may happen occasionally with some drivers. Should
-		 * it happen, we are stuck in a bad place as going backwards is
-		 * not really feasible.
-		 *
-		 * So lets just tell link_use_channel that it must not fail to
-		 * assign the channel context (from mac80211's perspective) and
-		 * assume the driver is going to trigger a recovery flow if it
-		 * had a failure.
-		 * That really is not great nor guaranteed to work. But at least
-		 * the internal mac80211 state remains consistent and there is
-		 * a chance that we can recover.
-		 */
-		ret = _ieee80211_link_use_channel(link,
-						  &link->conf->chanreq,
-						  IEEE80211_CHANCTX_SHARED,
-						  true);
-		WARN_ON_ONCE(ret);
-
 		ieee80211_mgd_set_link_qos_params(link);
 		ieee80211_link_info_change_notify(sdata, link,
 						  BSS_CHANGED_ERP_CTS_PROT |

base-commit: 5a4d42c1688c88f3be6aef46b0ea6c32694cd2b8
-- 
2.34.1


