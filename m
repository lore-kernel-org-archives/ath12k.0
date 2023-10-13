Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0591CDB484
	for <ath12k@archiver.kernel.org>; Fri, 13 Oct 2023 07:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3WNyh43sppKYwfQTmb5NbMI5wYJ0BiZ6+PNw7gIoDI=; b=Bz1+0GI8T+iV4t
	urZP0ZavWH0qONNhw9C1Fv1yOg/MLEC0XT1BgW2PNzoyfFZfZiAHtSrSRoff4hGYc/B9vrNdtOifB
	lh62mRwx9UgTfsodJtkEP9JLE5ee9zQG8T06F2c9kHjimIvTGDL6wsZrhviPZlZ0CovdA7mkYv0cd
	wChTO8J3U7SwaLKFCiIF2gm3dM6l1GFwWzyWyRDBNzeKcpMZx8l2L5OexsK3XVI02cWWWgTA/P92K
	fI0hUZah4mF2ls6tRHnI5ZO66gzeWXdMGZkfD0g3rJAubem81FdwnZzlcRcgPW+NTXoxwhvzAqEZC
	xiSfrTeRjMdZ4P01GM8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qrC9m-002g1i-19
	for ath12k@archiver.kernel.org;
	Fri, 13 Oct 2023 07:00:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qrC9g-002fzQ-2K
	for ath12k@lists.infradead.org;
	Fri, 13 Oct 2023 07:00:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D6K8mN004841;
	Fri, 13 Oct 2023 07:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=1iTuwP352xzZDvTi8jqrD/tRqg8F/XkjG7R0hkSBj1c=;
 b=chjbLLwLreGztcTws08uRe/57IrutQaEZDHbZ3NNxPyQrO9z6GS8y7fSXCPIfAnkNOO7
 XRhiXmh4RJW/DfECFgtHUJvaBaMR2/beE+spHV107oSXllWsUv1iROtnrm5f7DJj0Mau
 Q4sN+rrvXzdJePdjJZfXBE6aczNcauqsZ4/vYj2GYViG7+7NItAFzQEWVVKoERmIDvT0
 Ub3dXO2YmurS5npDh2sdcDcdGi0J4gW/qIsVmv2/8n4XdViHZDZGIWaEBiq6QatrdN3w
 EF+vLgWDMmQoyaOyRZ+LB26iTCM36XylvbTrnpbM6cKQLDtGZ0WqbDX1jMT1jtMGzRlB LA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tpt1yrv88-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:00:13 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39D70AKD020104;
	Fri, 13 Oct 2023 07:00:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3tk0dkvxwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Oct 2023 07:00:10 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39D70A9r020088;
	Fri, 13 Oct 2023 07:00:10 GMT
Received: from rgnanase-linux.qualcomm.com (rgnanase-linux.qualcomm.com [10.201.162.135])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 39D70AET020085;
	Fri, 13 Oct 2023 07:00:10 +0000
Received: by rgnanase-linux.qualcomm.com (Postfix, from userid 2378837)
	id 3FCFB1101FE3; Fri, 13 Oct 2023 12:30:09 +0530 (IST)
From: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <quic_rgnanase@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: Enable Mesh support for QCN9274
Date: Fri, 13 Oct 2023 12:30:06 +0530
Message-Id: <20231013070007.25597-2-quic_rgnanase@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231013070007.25597-1-quic_rgnanase@quicinc.com>
References: <20231013070007.25597-1-quic_rgnanase@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: prfP12_RnrL5fJvnB46t0fvwk6gAwoQs
X-Proofpoint-ORIG-GUID: prfP12_RnrL5fJvnB46t0fvwk6gAwoQs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 clxscore=1011 lowpriorityscore=0 bulkscore=0 impostorscore=0 mlxscore=0
 phishscore=0 mlxlogscore=791 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231013_000016_883586_717AC5DF 
X-CRM114-Status: GOOD (  13.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently QCN9274 supports only AP and station interface modes.

Add interface type mesh to ath12k_hw_params for
QCN9274 to provide support for mesh mode as well.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-02903-QCAHKSWPL_SILICONZ-1
Signed-off-by: Ramya Gnanasekar <quic_rgnanase@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index f69649f58e82..ac2106fa8b56 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -886,7 +886,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.vdev_start_delay = false,
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
 		.supports_monitor = false,
 
 		.idle_ps = false,
@@ -1006,7 +1007,8 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 		.vdev_start_delay = false,
 
 		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
-					BIT(NL80211_IFTYPE_AP),
+					BIT(NL80211_IFTYPE_AP) |
+					BIT(NL80211_IFTYPE_MESH_POINT),
 		.supports_monitor = false,
 
 		.idle_ps = false,
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
