Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8F97EB8FB7
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 11:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2iln0AgPRJKQkQu7ADl2Qsy54W5KExwfreq2SAs8TBY=; b=ggUfjEogf+BmS/
	HP0LtNrmZyraFtPTd9acZx/1bLfkn+pp77ERlnJwo4NMKl4BiTLUS/GxS469DjES5Hv4bk3Jsc516
	tWJoBsn0fevDfCTcHRbHN8z9CiwgP+q1qovEyT5vyDK+CVOOBPLiMFDA96wZNB+hLDntJi6uYMZEl
	dvVOYN7W4KkRCi1lPOcm1yhTfce+ZYMVT+18hA2woJVD4VlPagA8O6PqfMD+r3jpyP1KuWR7CIhjA
	KA8xBI0IWr4LbnwzVFrr8KXJgfE/DNFhVXpmrHFTVGN/ylROkwvn/jMqlp72nlkkPyWOIcrtTZQpl
	S6JSqQ0empmhlzBnKMNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqyw-008x4h-1l
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 11:46:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpsT-008CUj-1a
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 10:35:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 386AGIeR017626;
	Wed, 6 Sep 2023 10:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=tWqkHgvc+q2bKIrJYk4xfod6IIugjpP/FP0d9unZd0s=;
 b=m3P9UJuA8+09BfaKHbDUmgiZNAMDRtYVYTupQUcOpU6vDQfN4445LA0lomkB4BHR/YKr
 aocVc2XgZMnlmIPcsG2SFGYFicZ+H85VecchwCJPhXRT34kycTv+zZpT6l9gahRk7gMw
 6M0i2tgOCsfAnJF70Uvo5P8qdhBLHNyTPBElk5c/6LsfrSrBq8grO/I6gt2jvx/14hH5
 uWz8ER8vnP+EQuq2BqmRlBd1vgzx+8FXhC3ELSC2bxb1NWTR/zEGwFsPXsjG0PP+8NzY
 YRO7Ow7T607x9Hz4B+mstHUgYmhU5SWF2VznOi4r7ZBC5Q80tt7SN6FpmgTmU1vyDTyt Zw== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxqha03ds-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 10:35:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386AZFja029315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 10:35:15 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 03:35:14 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 1/3] wifi: mac80211: add support to allow driver to generate local link address for station
Date: Wed, 6 Sep 2023 06:34:56 -0400
Message-ID: <20230906103458.24092-2-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906103458.24092-1-quic_wgong@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: UO2qx8LCKC0N939BOm_w9FxsWLbwS8l3
X-Proofpoint-GUID: UO2qx8LCKC0N939BOm_w9FxsWLbwS8l3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_033517_665689_F18170D5 
X-CRM114-Status: GOOD (  26.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently the local link address of all links is random generated by
eth_random_addr() in mac80211 while connecting to a MLO AP for station
mode. The MAC address of link is not passed from NL command. The 1st
link address is generated while authenticate with AP, the other links'
addresses are generated after assoc success with AP.

It is not convenient for some driver, reason is, for station mode,
the interface with its mac address is already created in driver after
wlan load, it is used for hw scan and non-MLO connection.

When connecting to MLO AP, driver reuse the interface as the 1st link of
MLO. If the mac address of the 1st link changed to a new value, then
driver need to change the mac address and do many synchronous operation
with firmware. Thus the operation become complex. After MLO disconnect,
driver need to restore the old mac address, it is also another complex
operation.

The hw scan maybe happen through the MLO connection/disconnection. And
the hw scan uses the 1st link address while MLO connected and uses the
interface address while MLO is disconnected, this leads hw scan complex.

Hence add this interface to allow driver to generate the address of each
link while MLO connection. Then driver could provide the same mac address
for the 1st link, thus hw scan/NON-MLO connection/1st link of MLO will use
the same mac address, then operation become easy.

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 include/net/mac80211.h    |  7 +++++++
 net/mac80211/driver-ops.h | 21 +++++++++++++++++++++
 net/mac80211/mlme.c       | 24 ++++++++++++++++++------
 net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
 4 files changed, 73 insertions(+), 6 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 3a8a2d2c58c3..c7f92a3db359 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -3746,6 +3746,11 @@ struct ieee80211_prep_tx_info {
  *	non-MLO connections.
  *	The callback can sleep.
  *
+ * @generate_link_addr: Generate mac address of link.
+ *	This callback is optional. Returns zero if mac address is generated successfully
+ *	for the link.
+ *	This callback can sleep.
+ *
  * @prepare_multicast: Prepare for multicast filter configuration.
  *	This callback is optional, and its return value is passed
  *	to configure_filter(). This callback must be atomic.
@@ -4298,6 +4303,8 @@ struct ieee80211_ops {
 				  struct ieee80211_bss_conf *info,
 				  u64 changed);
 
+	int (*generate_link_addr)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+				  unsigned int link_id, u8 *link_local_addr);
 	int (*start_ap)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			struct ieee80211_bss_conf *link_conf);
 	void (*stop_ap)(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
diff --git a/net/mac80211/driver-ops.h b/net/mac80211/driver-ops.h
index c4505593ba7a..da164d4ca9a1 100644
--- a/net/mac80211/driver-ops.h
+++ b/net/mac80211/driver-ops.h
@@ -962,6 +962,27 @@ int drv_switch_vif_chanctx(struct ieee80211_local *local,
 			   struct ieee80211_vif_chanctx_switch *vifs,
 			   int n_vifs, enum ieee80211_chanctx_switch_mode mode);
 
+static inline int drv_generate_link_addr(struct ieee80211_local *local,
+					 struct ieee80211_sub_if_data *sdata,
+					 unsigned int link_id, u8 *link_local_addr)
+{
+	int ret = -EOPNOTSUPP;
+
+	might_sleep();
+
+	if (!check_sdata_in_driver(sdata))
+		return -EIO;
+
+	if (local->ops->generate_link_addr) {
+		ret = local->ops->generate_link_addr(&local->hw, &sdata->vif,
+						     link_id, link_local_addr);
+		trace_drv_generate_link_addr(local, sdata, link_local_addr, link_id);
+	}
+
+	trace_drv_return_int(local, ret);
+	return ret;
+}
+
 static inline int drv_start_ap(struct ieee80211_local *local,
 			       struct ieee80211_sub_if_data *sdata,
 			       struct ieee80211_bss_conf *link_conf)
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index f93eb38ae0b8..1679d5011fb6 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -6852,6 +6852,7 @@ void ieee80211_mgd_setup_link(struct ieee80211_link_data *link)
 	struct ieee80211_sub_if_data *sdata = link->sdata;
 	struct ieee80211_local *local = sdata->local;
 	unsigned int link_id = link->link_id;
+	int ret;
 
 	link->u.mgd.p2p_noa_index = -1;
 	link->u.mgd.conn_flags = 0;
@@ -6867,11 +6868,15 @@ void ieee80211_mgd_setup_link(struct ieee80211_link_data *link)
 	wiphy_delayed_work_init(&link->u.mgd.chswitch_work,
 				ieee80211_chswitch_work);
 
-	if (sdata->u.mgd.assoc_data)
+	if (sdata->u.mgd.assoc_data) {
 		ether_addr_copy(link->conf->addr,
 				sdata->u.mgd.assoc_data->link[link_id].addr);
-	else if (!is_valid_ether_addr(link->conf->addr))
-		eth_random_addr(link->conf->addr);
+	} else if (!is_valid_ether_addr(link->conf->addr)) {
+		ret = drv_generate_link_addr(sdata->local, sdata,
+					     link_id, link->conf->addr);
+		if (ret)
+			eth_random_addr(link->conf->addr);
+	}
 }
 
 /* scan finished notification */
@@ -7448,11 +7453,18 @@ int ieee80211_mgd_assoc(struct ieee80211_sub_if_data *sdata,
 			if (!req->links[i].bss)
 				continue;
 			link = sdata_dereference(sdata->link[i], sdata);
-			if (link)
+			if (link) {
 				ether_addr_copy(assoc_data->link[i].addr,
 						link->conf->addr);
-			else
-				eth_random_addr(assoc_data->link[i].addr);
+			} else {
+				u8 *link_addr = assoc_data->link[i].addr;
+				int ret;
+
+				ret = drv_generate_link_addr(sdata->local, sdata,
+							     i, link_addr);
+				if (ret)
+					eth_random_addr(link_addr);
+			}
 		}
 	} else {
 		memcpy(assoc_data->link[0].addr, sdata->vif.addr, ETH_ALEN);
diff --git a/net/mac80211/trace.h b/net/mac80211/trace.h
index b8c53b4a710b..b140a4e70df9 100644
--- a/net/mac80211/trace.h
+++ b/net/mac80211/trace.h
@@ -727,6 +727,33 @@ TRACE_EVENT(drv_sw_scan_start,
 		  LOCAL_PR_ARG, VIF_PR_ARG, __entry->mac_addr)
 );
 
+TRACE_EVENT(drv_generate_link_addr,
+	TP_PROTO(struct ieee80211_local *local,
+		 struct ieee80211_sub_if_data *sdata,
+		 const u8 *mac_addr,
+		 unsigned int link_id),
+
+	TP_ARGS(local, sdata, mac_addr, link_id),
+
+	TP_STRUCT__entry(
+		LOCAL_ENTRY
+		VIF_ENTRY
+		__array(char, mac_addr, ETH_ALEN)
+		__field(unsigned int, link_id)
+	),
+
+	TP_fast_assign(
+		LOCAL_ASSIGN;
+		VIF_ASSIGN;
+		memcpy(__entry->mac_addr, mac_addr, ETH_ALEN);
+		__entry->link_id = link_id;
+	),
+
+	TP_printk(LOCAL_PR_FMT ", " VIF_PR_FMT ", link addr: %pM link id: %#x",
+		  LOCAL_PR_ARG, VIF_PR_ARG, __entry->mac_addr,
+		  __entry->link_id)
+);
+
 DEFINE_EVENT(local_sdata_evt, drv_sw_scan_complete,
 	TP_PROTO(struct ieee80211_local *local,
 		 struct ieee80211_sub_if_data *sdata),
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
