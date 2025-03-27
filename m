Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DCC3600E
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 05:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=foPymDjhSlLbogynWXRKQar/hFnoXKGCHwUzJj3pnBQ=; b=R+faPTspQe6bnJJeg0BSYPgwS7
	AH8kbrrPcRfqHc+XtKhICNgWrqcitmtxgz0zwj61006jpdmfs+7ByJAqzGOKnj1liGXmaX8aUL0I1
	J6KnXB3cXPr3z52hV7Zws61OFbslBVrS7a4/OKnWugFFjs9XwB+tme+T6DjkWkY2yuLRRA1HY0IkD
	h1W53TKJRTAniKYW6i69yLPN3GOQ2MG6vYq9MXmmZvDhXdpKttzVoK9/5Aab5fZQK2Q5kx1LbCtdC
	K4fWCXLYe4Cc09FxhbgU8JcUpk200lV6FDFpT80sXI9zJ5ukCOsxm70o7VOd7f02WGa2ql2Q+AoI9
	syGUvnPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZX-0000000ACjw-1zLm
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 05:14:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZW-0000000ACjU-1fcZ
	for ath12k@bombadil.infradead.org;
	Thu, 27 Mar 2025 05:14:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=foPymDjhSlLbogynWXRKQar/hFnoXKGCHwUzJj3pnBQ=; b=dQI0+KPkKqdIGOLAnbX2BXwokY
	p5HdJkf3KeEidEKTRSpBgQCOwhCDonR3KcRGSwBX7zulmR73NWALpo9w9I6UR2HGCGYSzM04yIpV4
	xNcUR9N1gI+q01rA9bUGjBOki8Yt9peMAHTJdXPjYh4eCdZ3N+6ncgxyNe7tGm+QULQdnlq7scwTi
	5N474DBVfIOidffyjoJ1/Vg7182OjJ3dlaHPUz65zIFVALaZDtPr1MmPntuCEMxcI2fD0jZaHGS/F
	wcwjkcfVxT8qdAt7e30Q2rnaK0YV95P8PtxEQA0bp1Rcb2NEB7NAHhB8ql3whE9VmZAFrElWDebTA
	OUCpe+Ag==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZS-00000005uxG-31Rn
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 05:14:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R403mC006076;
	Thu, 27 Mar 2025 05:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foPymDjhSlLbogynWXRKQar/hFnoXKGCHwUzJj3pnBQ=; b=Aicr6KezuDXbjHKP
	rBL5x6SDKQWgfT+Uw6hqTSZGfkSbAZlFrSZSI5LT3sdjgDigy13iFHQbdsfdYFvO
	leON7hchsY4OOOBZRXFgIhUtC3QcUovl3UFesq4hjP4Q+5CRTso0f/KtpkaqcVvy
	yxMgKSbphD8au9dxbMkyJQk+gdRnH/UnRXwzxsvP6Uo8+O1t1Vw1nQyGxHcDTLo2
	78CK9GM0hc8/8RQXhSWu+iOkxiOQyIwQGgQz6dQUCMinx4uT4h3ZCu6OPNlSRlQB
	o8uY/q+ii5Duq/vjy8cd5L9h5MWk0QYnLyOb4ATUmgs2Tgj9QHGTzfzLAytx6PL1
	Y0B8bQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45manj3qbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5EKgx024338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:20 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Mar 2025 22:13:54 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ramasamy Kaliappan
	<quic_rkaliapp@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v5 2/4] wifi: mac80211: update ML STA with EML capabilities
Date: Thu, 27 Mar 2025 10:43:18 +0530
Message-ID: <20250327051320.3253783-3-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327051320.3253783-1-quic_ramess@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2zbsjztJ0Hfj1jVNcL5kyJNpl6tkmC-H
X-Proofpoint-ORIG-GUID: 2zbsjztJ0Hfj1jVNcL5kyJNpl6tkmC-H
X-Authority-Analysis: v=2.4 cv=KvJN2XWN c=1 sm=1 tr=0 ts=67e4dead cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=1LoY2HbNQILQZSRJ-oMA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_051427_215635_C06C799F 
X-CRM114-Status: GOOD (  12.24  )
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
index 9f683f838431..2676b368e5a6 100644
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


