Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FDFC61DA4
	for <ath12k@archiver.kernel.org>; Wed, 15 Mar 2023 09:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h+ZuS6WHPw2Yk71zqYvOaDYrzytJdnAB7gh+UCo2tfM=; b=qOZnHXVcq6RSBq
	QZabO2juzl6j9gDyul9odJMGEIfRcsOppPoADD+tkLJ/7l9rp9TDBMTmxc5VT+LJMWVUbccYjX78/
	D/xO39fuaXFgMb3lj2bqPj5TVBvLQNzcw5FzYFPKnXLgkLJZy3mjLH6lhheBC+keomVekgfjXRXTz
	8TAFXl25GoyKhVfOf3/SEbR7aoLCzwd0sxxjsIx37epMMb7NAm6HXFugraH8351sa2qPiQkrBC90B
	FWbFxLFW/K7O7Vcf1pLec90dFURvaZwU2Uz21y5JzIRgAsWlqzWAZEXcVpAXmvDbC6B+RK4W91HFn
	bq/KmJ0EOmjiHLU9Y9hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN6r-00CtMd-34
	for ath12k@archiver.kernel.org;
	Wed, 15 Mar 2023 09:07:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcN6o-00CtKS-1b
	for ath12k@lists.infradead.org;
	Wed, 15 Mar 2023 09:07:48 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32F6CVbi031070;
	Wed, 15 Mar 2023 09:07:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=+HAYdprAXADx6oWeuYZM1bSTfuwFc7QgFqEhugCHaOg=;
 b=BKzCCqx5Vj9kq6cgqjKwChmVVuTY147OSWhzZgO1t1JqboN5TKlzt6z7H8oeLdE7qGbA
 7d/EjluWOsAVPm2EsDCX71A77P1w6wIFV0Y0/1sniWa8tWicXA3LQvG0ieUKIuDfDgr8
 M1G9xpPctY0g8ykjMtf9RmUo+6ESnGUEUIRd2mG+p1JnmCrTua4Kk6yWh0YmAL0Y0paj
 Y41suB6X4QW0vq500K9VkmjJsFKcToZp0vKxyHTlsYvcjTZomQwiqVtu9dh2a4gRl1gz
 UMZGlrOAI6ma3nHFcfkvDuSWlxpS3bhcVKuBaQQ1W/3/z2dhQr/gtrd90eWHKoqAX2wC qw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pb2crh2q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 09:07:40 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32F97dgA027477
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Mar 2023 09:07:40 GMT
Received: from rajson-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Wed, 15 Mar 2023 02:07:38 -0700
From: Rajat Soni <quic_rajson@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix memory leak in ath12k_qmi_driver_event_work()
Date: Wed, 15 Mar 2023 14:36:32 +0530
Message-ID: <20230315090632.15065-1-quic_rajson@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MHZ1LfykRlekh_ygDfCrTfIzsy4Hj_-7
X-Proofpoint-ORIG-GUID: MHZ1LfykRlekh_ygDfCrTfIzsy4Hj_-7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-15_04,2023-03-14_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 adultscore=0 mlxlogscore=942 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2302240000 definitions=main-2303150076
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_020746_690449_ACAB32B9 
X-CRM114-Status: GOOD (  14.62  )
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

Currently the buffer pointed by event is not freed in case
ATH12K_FLAG_UNREGISTERING bit is set, this causes memory leak.

Add a goto skip instead of return, to ensure event and all the
list entries are freed properly.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 979a63f2e2ab..4beb9ef23d08 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2991,7 +2991,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 		spin_unlock(&qmi->event_lock);
 
 		if (test_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags))
-			return;
+			goto skip;
 
 		switch (event->type) {
 		case ATH12K_QMI_EVENT_SERVER_ARRIVE:
@@ -3032,6 +3032,7 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 			ath12k_warn(ab, "invalid event type: %d", event->type);
 			break;
 		}
+skip:
 		kfree(event);
 		spin_lock(&qmi->event_lock);
 	}

base-commit: 3fa9da4001890def44801dd56d5fbc134689be28
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
