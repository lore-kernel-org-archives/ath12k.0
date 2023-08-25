Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C283AC3DA6F
	for <ath12k@archiver.kernel.org>; Fri, 25 Aug 2023 07:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BJBvNShvr3yZhvEdrpBAKzRzWui1L9ivfB5fW45cx4M=; b=ZDKI6Jhbr67QlY
	/bcoknxXpayu9n78ZISqt1o/0a3px4gdkdBmctk0IsXF4hxFBJ31ftGdrjtbsA+cYQdYFGxSJUhXS
	uxYDY7/T7vFzjrka6MwhzVDbpvjS6U+HSyP9QxQTxCSojJI7nGUs015+cOfsx4zjoU9y8UkwsPjbK
	STWZ8HSaWNZ7V/fFwQnHsOBpqVmHqdIYHj+p03Mij80qDcqGawYGT139eI49E8dg2j19ubeJpN/J8
	9lZqL69f16j1lIto3jiWZatIC9a5AbKSqispehsiHL0mS1GNak8MGsAyMpHAbO4iCWuu/SbKtS8VT
	bZWXVB8WCKNKRbx6wIvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQor-004VUJ-0h
	for ath12k@archiver.kernel.org;
	Fri, 25 Aug 2023 07:01:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZQon-004VTs-1j
	for ath12k@lists.infradead.org;
	Fri, 25 Aug 2023 07:01:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37P6rVJp026341;
	Fri, 25 Aug 2023 07:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=4iXanCCvR5Eu6eyLHoS0cPmIsXLtTz6aT/spc97lPCc=;
 b=dEOIxPwH5i5SJYJdkkG2qadBWgWAnkhi283X7HDqxIBnWAsPMEVA72lUMBjxg+V4rVUi
 u1R9uG6GyZ1gBJvt/gOWjpS//zPkH+7x1H/WU3VmrAFYG/XSEetJ7jyk3mmsZIxmOSCJ
 h/W7FpZGm6hqjSYwyA9oIbB8i8JVju3Tofr80zlHRoYoFlLgXRICPs9U7erB9KpoV/oT
 FN8giRyaMV4M0fTjStQ04ZFHEV3VhAxFe3/XQScK+N8KVAUfpZ/YvFh3GCr7PiMCTA6E
 YEr5ACWcecmpHRjlfXRPU4G548S8P7umAogRO/a4oZ5HM0bjqItcyCY8AVgPT2/cDHjw Xw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3spmn38ab3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 07:01:14 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37P71CIv007005
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Aug 2023 07:01:12 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Fri, 25 Aug 2023 00:01:11 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH v3] wifi: mac80211: fix cfg80211_bss always hold when assoc response fail for MLO connection
Date: Fri, 25 Aug 2023 03:00:55 -0400
Message-ID: <20230825070055.28164-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _YiLU49mP2TUjupYAWoOnrJTUk-FQJje
X-Proofpoint-GUID: _YiLU49mP2TUjupYAWoOnrJTUk-FQJje
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_04,2023-08-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_000117_741212_9AFD5DA6 
X-CRM114-Status: GOOD (  24.20  )
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

When connect to MLO AP with more than one link, and the assoc response of
AP is not success, then cfg80211_unhold_bss() is not called for all the
links' cfg80211_bss except the primary link which means the link used by
the latest successful association request. Thus the hold value of the
cfg80211_bss is not reset to 0 after the assoc fail, and then the
__cfg80211_unlink_bss() will not be called for the cfg80211_bss by
__cfg80211_bss_expire().

Then the AP always looks exist even the AP is shutdown or reconfigured
to another type, then it will lead error while connecting it again.

The detail info are as below.

When connect with muti-links AP, cfg80211_hold_bss() is called by
cfg80211_mlme_assoc() for each cfg80211_bss of all the links. When
assoc response from AP is not success(such as status_code==1), the
ieee80211_link_data of non-primary link(sdata->link[link_id]) is NULL
because ieee80211_assoc_success()->ieee80211_vif_update_links() is
not called for the links.

Then struct cfg80211_rx_assoc_resp resp in cfg80211_rx_assoc_resp() and
struct cfg80211_connect_resp_params cr in __cfg80211_connect_result()
will only have the data of the primary link, and finally function
cfg80211_connect_result_release_bsses() only call cfg80211_unhold_bss()
for the primary link. Then cfg80211_bss of the other links will never free
because its hold is always > 0 now.

Hence assign value for the bss and status from assoc_data since it is
valid for this case. Also assign value of addr from assoc_data when the
link is NULL because the addrs of assoc_data and link both represent the
local link addr and they are same value for success connection.

Fixes: 81151ce462e5 ("wifi: mac80211: support MLO authentication/association with one link")
Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
v3: add is_valid_ether_addr() for cr.links[link_id].addr
    remove "mgmt->u.assoc_resp.status_code = 1" in commit log

v2: change logic per johannes

 include/net/cfg80211.h |  2 +-
 net/mac80211/mlme.c    | 11 ++++++-----
 net/wireless/mlme.c    |  3 ++-
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 7c7d03aa9d06..5a53cc0edb30 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -7229,7 +7229,7 @@ struct cfg80211_rx_assoc_resp {
 	int uapsd_queues;
 	const u8 *ap_mld_addr;
 	struct {
-		const u8 *addr;
+		u8 addr[ETH_ALEN] __aligned(2);
 		struct cfg80211_bss *bss;
 		u16 status;
 	} links[IEEE80211_MLD_MAX_NUM_LINKS];
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index f93eb38ae0b8..46d46cfab6c8 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -5429,17 +5429,18 @@ static void ieee80211_rx_mgmt_assoc_resp(struct ieee80211_sub_if_data *sdata,
 	for (link_id = 0; link_id < IEEE80211_MLD_MAX_NUM_LINKS; link_id++) {
 		struct ieee80211_link_data *link;
 
-		link = sdata_dereference(sdata->link[link_id], sdata);
-		if (!link)
-			continue;
-
 		if (!assoc_data->link[link_id].bss)
 			continue;
 
 		resp.links[link_id].bss = assoc_data->link[link_id].bss;
-		resp.links[link_id].addr = link->conf->addr;
+		ether_addr_copy(resp.links[link_id].addr,
+				assoc_data->link[link_id].addr);
 		resp.links[link_id].status = assoc_data->link[link_id].status;
 
+		link = sdata_dereference(sdata->link[link_id], sdata);
+		if (!link)
+			continue;
+
 		/* get uapsd queues configuration - same for all links */
 		resp.uapsd_queues = 0;
 		for (ac = 0; ac < IEEE80211_NUM_ACS; ac++)
diff --git a/net/wireless/mlme.c b/net/wireless/mlme.c
index ac059cefbeb3..922f21254417 100644
--- a/net/wireless/mlme.c
+++ b/net/wireless/mlme.c
@@ -52,7 +52,8 @@ void cfg80211_rx_assoc_resp(struct net_device *dev,
 		cr.links[link_id].bssid = data->links[link_id].bss->bssid;
 		cr.links[link_id].addr = data->links[link_id].addr;
 		/* need to have local link addresses for MLO connections */
-		WARN_ON(cr.ap_mld_addr && !cr.links[link_id].addr);
+		WARN_ON(cr.ap_mld_addr &&
+			!is_valid_ether_addr(cr.links[link_id].addr));
 
 		BUG_ON(!cr.links[link_id].bss->channel);
 

base-commit: 3f257461ab0ab19806bae2bfde4c3cd88dbf050e
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
