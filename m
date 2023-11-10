Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AD28C4167B
	for <ath12k@archiver.kernel.org>; Fri, 10 Nov 2023 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AHzousDYjW7EpkKegTseCPACwlNnRjOXnEEDEuKpiLo=; b=BQRhSWSqU5J0v1
	hL+RhcEk4LdrC1M/i+suyN4A/+H4hB3wnkwXQqCnZB+EKhM7HHi/jTaASfSPfnKmyIEHL70cfi2Ue
	2HbH8p7H/+teBLUKORgJT5gwjvX5MpUhh9sbjOBR9fo/kIQvlvNUZWBRnZHQieqgbBDFwk/fGFHhC
	HVsM40f3RbfGNLZ87OdgImttdtKVDk4n4mMQ+Z4VgDWmISJq9xrk4mzO68zPWuI4uSBLvoMW1ubtq
	dJz6digeopV3s/xmaczLjNBhuT4nTkDoZomKp1uzVjoo7six171xRMbOFB96MUPF1NoTn5cozcvOu
	LWUNcERTva0Z1+75mgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1LwG-0081kb-0W
	for ath12k@archiver.kernel.org;
	Fri, 10 Nov 2023 07:28:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1LwC-0081kA-2X
	for ath12k@lists.infradead.org;
	Fri, 10 Nov 2023 07:28:22 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AA4xZwT002493;
	Fri, 10 Nov 2023 07:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=F29z0DH6ltzPxFbZVijda5qq2mYS1r+J36j+smma3a0=;
 b=AubLtytXvuHfQQs+HMhOdUMHBO1XM51d6GWgyUYjvg8kbwKBCEuta+uVz0M/EjZG0E1v
 ikrrhB4njNSqYs/221ublfHiL/w6K3JsyyyvjZWsRwBUD2IFLBOs9HRxLipxN66HqksY
 sX9z3XjXciPhqUDPGL7l5+1KGGYueIK1BxSxOH7M1kWcvLn4Fk4vPvUxT4/wFCObNqBu
 C3b96sMZzaVfSPfSbGpDEieW/ciuwqoyEBJ0MqRFuA5+wtFh+2UAnY2lfQXrxHmoTipK
 U7MpzBQBvIuRjYVCLL6k2vdh1LGFvm/+7Q+bZmsG5BSSKeejjdzgr1EHKXePY2iTR/Li FA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u93tq9g5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 07:28:17 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AA7SHR7018044
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Nov 2023 07:28:17 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Thu, 9 Nov 2023 23:28:15 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix the error handler of rfkill config
Date: Fri, 10 Nov 2023 12:58:02 +0530
Message-ID: <20231110072802.25290-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GgDle1GoykzNTQP0El6k9JvG-UpzS6dv
X-Proofpoint-ORIG-GUID: GgDle1GoykzNTQP0El6k9JvG-UpzS6dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-10_03,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 mlxlogscore=688
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311100061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_232820_831562_DF29F769 
X-CRM114-Status: GOOD (  16.23  )
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

When the core rfkill config throws error, it should free the
allocated resources. Currently it is not freeing the core pdev
create resources. Avoid this issue by calling the core pdev
destroy in the error handler of core rfkill config.

Found this issue in the code review and it is compile tested only.

Fixes: 004ccbc0dd49 ("wifi: ath12k: add support for hardware rfkill for WCN7850")
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index b936760b5140..5ba680379f7e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -698,13 +698,15 @@ int ath12k_core_qmi_firmware_ready(struct ath12k_base *ab)
 	ret = ath12k_core_rfkill_config(ab);
 	if (ret && ret != -EOPNOTSUPP) {
 		ath12k_err(ab, "failed to config rfkill: %d\n", ret);
-		goto err_core_stop;
+		goto err_core_pdev_destroy;
 	}
 
 	mutex_unlock(&ab->core_lock);
 
 	return 0;
 
+err_core_pdev_destroy:
+	ath12k_core_pdev_destroy(ab);
 err_core_stop:
 	ath12k_core_stop(ab);
 	ath12k_mac_destroy(ab);

base-commit: 553d0057523dc1d6935160613f1fbf9bb8db88f6
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
