Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD79EB8FAF
	for <ath12k@archiver.kernel.org>; Wed,  6 Sep 2023 10:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QAoJueCgEnhv9+thDhrPwLZuiuJ1X5+XgWM3GQDkgLE=; b=EpM9GdRN2RhTbF
	a7Sl9/fscur5TAD3RAbiVzpIieTujz892nLcD+L6Gve1wzVZmbZq7m2zpOS7rEEW3e5Ap/cxPC1nt
	2rs/Fwt6a8jFG4kxVub+hf1oxr/zyWifxm6PVgYyVd66HCX4ucPLhFpUYUTKZo7ivLxzkHn2Tf3JX
	tjFCQHJnhFycSCLkbrrgW+vdLh+Xqdcn7PXo9A8j8j37CXl9O3zn1SaUcrofGyflkFPoWpLq4igcN
	ysl3yIoB9qtRGVsWvikL2cds86EPY/ngvPDqlEqCFpLX2J7tjTM0htx3/HMBQ/oIbray3wN5+hJ8T
	KUReKShh2exhD8Rj7cGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpsc-008CaZ-2S
	for ath12k@archiver.kernel.org;
	Wed, 06 Sep 2023 10:35:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdpsY-008CWJ-06
	for ath12k@lists.infradead.org;
	Wed, 06 Sep 2023 10:35:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3869QqhP007229;
	Wed, 6 Sep 2023 10:35:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=DjRVxvL85VlD/zWd0EAa8JCvkD/VGvroPecUIbNfsQk=;
 b=oQ6OxqSsWp9eUqn7CluGGp/pqfe38u9l5VMdzXa2hk0rWpuj+1G9fBoWz3Oc7K/BksQm
 Fzvt/vnm0kXMyWyu7vS1gfAnVQbQZR7QUDrZ2F/PldsfBlB+6XA/L1GjH+VLckUdPKhY
 JvYvElingEXLlXx/mtowpZiKirkoHohj0iOv8Ds2+Y5y3RJ1WsuyTneeDfqgWSIY4Ihp
 r5hBcGg3hXo5JUri2TntxZECfns+v+9IJFYY/1pwtsGcGHxKm1k8r/C5CmddYj5Pmxg/
 JbizxfS4mB97jggc1XiWdc8YSGBncvDduXhCDYf8ZGWIHJK7D77Aj6xVxO48UnqO5Eus og== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sxpt008ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Sep 2023 10:35:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 386AZI2t030288
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Sep 2023 10:35:18 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Wed, 6 Sep 2023 03:35:17 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 3/3] wifi: mac80211: update link RX NSS by ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link()
Date: Wed, 6 Sep 2023 06:34:58 -0400
Message-ID: <20230906103458.24092-4-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230906103458.24092-1-quic_wgong@quicinc.com>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dMAxWrup3Rz-CVJIFjk8lwBVIWq9YpAL
X-Proofpoint-GUID: dMAxWrup3Rz-CVJIFjk8lwBVIWq9YpAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 mlxscore=0 phishscore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_033522_124186_64B32531 
X-CRM114-Status: GOOD (  15.64  )
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

Currently for MLO connection, only deflink's rx_nss is set to correct
value. The others links' rx_nss of struct ieee80211_link_sta is
value 0 in ieee80211_set_associated(), because they are not pass into
ieee80211_sta_set_rx_nss() in mac80211 except the deflink in
rate_control_rate_init(). This leads driver get NSS = 0 for other links.
Add the ieee80211_sta_set_rx_nss() in ieee80211_assoc_config_link(),
then the other links' rx_nss will be set to the correct value.

Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
---
 net/mac80211/mlme.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 1679d5011fb6..0a2fb660fa00 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4354,6 +4354,8 @@ static bool ieee80211_assoc_config_link(struct ieee80211_link_data *link,
 	bss_conf->assoc_capability = capab_info;
 
 	ret = true;
+
+	ieee80211_sta_set_rx_nss(link_sta);
 out:
 	kfree(elems);
 	kfree(bss_ies);
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
