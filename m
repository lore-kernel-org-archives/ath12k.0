Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98756C10DCE
	for <ath12k@archiver.kernel.org>; Wed,  6 Dec 2023 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tOb0i94BXrphYlWkVqGJbav+T8VJNdzoLbiXPs7lrwA=; b=OHCvPgSWkwCpFvaW5jR3Ta3ozv
	iIkhghmZJovV1JqFzyuPSe7viSWL15mc8LXYSGTWMcTs4NX5Ri5+5HjY1ziYs96sd38RL3FALdSbz
	l8s42eS9ew1JrnYPGI0uCFPnZ9VqgNOa+L/mDKZjEvPwKAcN7/v4yyar2xMU282W+cz7tkMCtWVDO
	DiFCaEiydC0apOrxspDniO/mkfmt8Wi6xM1RlTcr9dJ+pZrARFNKi4ZRIebGOU5DHJvb2o6fjZIQs
	C8l8TVqfb9BsW5HoF/UrYDyx1pqXFN+WR3HrtW0nE7EALNqFVEnbNxGY0nrBkG1HgzLn3be21lcij
	XxnHrAvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiuz-008za8-18
	for ath12k@archiver.kernel.org;
	Wed, 06 Dec 2023 03:49:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAiuu-008zYk-2D
	for ath12k@lists.infradead.org;
	Wed, 06 Dec 2023 03:49:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B61gIrr009539;
	Wed, 6 Dec 2023 03:49:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=tOb0i94BXrphYlWkVqGJbav+T8VJNdzoLbiXPs7lrwA=;
 b=f9IiPKSjeoqu24P07MJqXJuVfQX5poj7ahZqtpioPEkXO6e40oSN+NhklQYp0aq8aeaT
 YvNN5plsQOglIH9h1HP4t1D/uiiPo6+P1lGHOj3TWoYzzbkdmO+nRazpaZFoVpuxaZK4
 AO5mqrzmH9M9iIDcsmBKV/KtuHWyNXky4P62eul+jY9j2OJXTY4kj3fRxgjPl6YsJysT
 cY3g/sV7GEkYaIafpfm5ZPehKvfik8JCU4WEgFo4ApIcl79ei/kYoEF0k1XU/8opR/jF
 MAw6fXerwccNdCOBaBFxmexFKdeuWsYESj8lQH6vPh2KWr099kbxwaT9hJhxLakuYeRw oQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utddjrehf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 03:49:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B63ngnj000822
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Dec 2023 03:49:42 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 5 Dec 2023 19:49:41 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 1/4] wifi: ath12k: Refactor the DP pdev pre alloc call sequence
Date: Wed, 6 Dec 2023 09:19:17 +0530
Message-ID: <20231206034920.1037449-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
References: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q35iMVU68DYXvXc_fPljYu4NWKTCY5c5
X-Proofpoint-GUID: q35iMVU68DYXvXc_fPljYu4NWKTCY5c5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1011 priorityscore=1501 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 mlxlogscore=789 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312060031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_194944_728977_3C520708 
X-CRM114-Status: GOOD (  17.41  )
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

Currently, the data path pdev pre alloc and mac allocate are called
separately from the core start procedure. The data path pdev pre alloc
can be called from the mac allocate procedure itself since initialization
related to pdev happens in the mac allocate procedure. So move the caller
of DP pdev pre alloc from the core start procedure to the mac allocate
procedure. This change helps in the future to easily decouple the mac
allocate procedure from core start handling in order to support MLO in
multi chip.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 2 --
 drivers/net/wireless/ath/ath12k/mac.c  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 6c01b282fcd3..6f634b57dde8 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -592,8 +592,6 @@ static int ath12k_core_start(struct ath12k_base *ab,
 
 	ath12k_dp_cc_config(ab);
 
-	ath12k_dp_pdev_pre_alloc(ab);
-
 	ret = ath12k_dp_rx_pdev_reo_setup(ab);
 	if (ret) {
 		ath12k_err(ab, "failed to initialize reo destination rings: %d\n", ret);
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 88cec54c6c2e..49d56f5d8896 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7667,6 +7667,8 @@ int ath12k_mac_allocate(struct ath12k_base *ab)
 		clear_bit(ATH12K_FLAG_MONITOR_ENABLED, &ar->monitor_flags);
 	}
 
+	ath12k_dp_pdev_pre_alloc(ab);
+
 	return 0;
 
 err_free_mac:
-- 
2.34.1


