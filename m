Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9B56C54E58
	for <ath12k@archiver.kernel.org>; Tue, 12 Mar 2024 05:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3My/Q3uDWsMrZ/6tGoLR0ZWYNf8MqmL+RIMvOsbltJY=; b=RcfFCX6vHVJam8uRdM/F4nWZdA
	4na/vNNewvDJbt3CA5FF3up+ZiSPHqUm2IN8xt0tQuqIfK0y70Mv0DtVEeNa/MPUPXO0dxNy5XbVE
	qMHvwiJMtC8/Kyoc/SIvWOcdb5ZaVYPAJ/IWMIWS5y8GAzUL9QUzPIMUxtwbDyR1CljnVYFvEESGu
	vauDlfigGjNySDlekzZVjBUZyFWFcmA3mhM94HmXHftTwRuJQQjQq4fyjdWJ/199zLpNUk+Gndzfi
	uoFpPANrEF2wF/RWGDaanPWmmPp9e5Y1lWtJGJcAdP5ToRZvYuts4ioM/X19bNuTebzgMYiuH0gY9
	hNzqXkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjuGG-00000004LCb-0kNc
	for ath12k@archiver.kernel.org;
	Tue, 12 Mar 2024 05:01:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjuGC-00000004LB7-2c8f
	for ath12k@lists.infradead.org;
	Tue, 12 Mar 2024 05:01:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42C3HLTu017796;
	Tue, 12 Mar 2024 05:01:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=3My/Q3uDWsMrZ/6tGoLR0ZWYNf8MqmL+RIMvOsbltJY=; b=ID
	g6UJp5yPAh2nHsAbuItdLRE6P71IEc1iPQav0ZRCz2wb5Jbepws1LinU/GKp84SX
	fgFn3hWtpr4Sbu6W9DgPvaE35rtyYacnwryagL8KY3eqpOK0Siyqfu0FkYojQ4xt
	x0tQl2DaokVdsO+IUvNk6c+SmfOyPiIrPnjdfgogX+SLz152BCUPxVtRltUVewvf
	x92N7NxXgm/te8AbKnAFZx0gN5N2OUfkuKAYu/v8KZayoXx2twTBGGEPARUctpd0
	JXyFzz0+hCR0YTJIKrOA0ASE5KuZ7oSWdw/okQFELIrr2N5ABp4lb74xHTtKITNr
	+uciz1mOPIY2cs8vwaRA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wtd508bq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:01:01 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42C510KT003457
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Mar 2024 05:01:00 GMT
Received: from Mayan.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Mar 2024 22:00:59 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 1/2] wifi: mac80211: supplement parsing of puncturing bitmap
Date: Tue, 12 Mar 2024 12:59:46 +0800
Message-ID: <20240312045947.576231-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312045947.576231-1-quic_kangyang@quicinc.com>
References: <20240312045947.576231-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AUB35Rdk9atGF73OfsZ1J9Z06mraisCe
X-Proofpoint-ORIG-GUID: AUB35Rdk9atGF73OfsZ1J9Z06mraisCe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-12_04,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 bulkscore=0 adultscore=0
 malwarescore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2402120000 definitions=main-2403120037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_220108_888195_90B8027D 
X-CRM114-Status: GOOD (  10.60  )
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

Current mac80211 won't parsing puncturing bitmap when process EHT
Operation element in 6 GHz band or Bandwidth Indication element. This
leads to puncturing bitmap cannot be updated in related situations, such
as connecting to an EHT AP in 6 GHz band.

So supplement parsing of puncturing bitmap for these elements.

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 net/mac80211/spectmgmt.c | 4 ++++
 net/mac80211/util.c      | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/net/mac80211/spectmgmt.c b/net/mac80211/spectmgmt.c
index 327c74e296e2..077d7c7efc82 100644
--- a/net/mac80211/spectmgmt.c
+++ b/net/mac80211/spectmgmt.c
@@ -348,6 +348,10 @@ int ieee80211_parse_ch_switch_ie(struct ieee80211_sub_if_data *sdata,
 		new_chandef = csa_ie->chanreq.oper;
 		/* and update the width accordingly */
 		ieee80211_chandef_eht_oper(&bwi->info, &new_chandef);
+
+		if (bwi->params & IEEE80211_BW_IND_DIS_SUBCH_PRESENT)
+			new_chandef.punctured =
+				get_unaligned_le16(bwi->info.optional);
 	} else if (!wide_bw_chansw_ie || !wbcs_elem_to_chandef(wide_bw_chansw_ie,
 							       &new_chandef)) {
 		if (!ieee80211_operating_class_to_chandef(new_op_class, new_chan,
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index a237cbcf7b49..a5d5e05688b4 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -3136,6 +3136,8 @@ bool ieee80211_chandef_he_6ghz_oper(struct ieee80211_local *local,
 	} else {
 		ieee80211_chandef_eht_oper((const void *)eht_oper->optional,
 					   &he_chandef);
+		he_chandef.punctured =
+			ieee80211_eht_oper_dis_subchan_bitmap(eht_oper);
 	}
 
 	if (!cfg80211_chandef_valid(&he_chandef))
-- 
2.34.1


