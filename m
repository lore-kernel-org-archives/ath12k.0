Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F870C04FF8
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emkPsx2y12iJ/Tg1jkWRUCH5IJCTRHxED6abW8xC1ro=; b=qq2BFGKKgjvEwEtVoPKz/G0KOp
	E7gkNkkJochEAsmJGQ+Ti6t3R6GxetSI0HKyGGlSic/wiX+m11LW+JuuiBkT2kYGWYPd48Ynm2CgN
	bFYgbVZlzydAyRqlSIkim64ExwXiDMr9rQQTsExdAE87kufx9Anti9NavGXUxjMJkvy8iyOoO4W6K
	hR9EebxNtQlZ5xp4UotWCjIH0t50IqcHpn/Fmky6AgQhNZmtGnCr9IV8q3SPtmqoytVjR3dBuc2t5
	DmXX+mNp0GvxYOZmOrEE6ZRDw/c8RNEJJs++0HmKBVkS8KKH4LAOe8K2VQ9HqJzqCbxSRVpM788Zy
	+oHTB3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3h-0000000FV30-3O5H
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3d-0000000FV0Z-2iw9
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C0coT6022676;
	Fri, 12 Apr 2024 06:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=emkPsx2y12iJ/Tg1jkWRUCH5IJCTRHxED6abW8xC1ro=; b=e4
	fFjf37LVbBVnj+ShPZ7EMz/gazQZt76HbOZJZWPtP+UOWSdveCGLgn0DDi2wH9o2
	GAFdlh8zAX8HByUbWx/Ac1voHM9iYMvNg2eQRJRz7KzJ9vEOgX8ogD1VYUAnsxNP
	IVsoUv3RtD6dYjwYRplhXcuqnXaojcwf9sADm5K+aZusBjJSgrXqYSlJr64goPS6
	jXLl0jRlsqfhi4rU2vz8vf8XcXoavDgNinIDkaZgEA+Ihu1RpMS+lNPz8mVWCxP9
	0+wG9rdVyTjQJu8NhBwo/I7QRH7KM5WodNutO6Eyv+pkPzFhFU9G8npAfd9Q293y
	7PWzMlkLGyuyOVy+RU6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xeskt0n7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66eMI006978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:40 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:39 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 03/10] wifi: ath12k: do not dump SRNG statistics during resume
Date: Fri, 12 Apr 2024 14:06:13 +0800
Message-ID: <20240412060620.27519-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240412060620.27519-1-quic_bqiang@quicinc.com>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nl8_XC1ywEY4u5qJHwaUEI2gydEfs18o
X-Proofpoint-ORIG-GUID: nl8_XC1ywEY4u5qJHwaUEI2gydEfs18o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 mlxlogscore=838 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230641_740545_F7F896CE 
X-CRM114-Status: GOOD (  12.85  )
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

Both the firmware reset feature and the power management
suspend/resume feature share common power-down and power-up
functionality. One aspect of the power-up functionality is
the handling of the ATH12K_QMI_EVENT_FW_INIT_DONE event.
When this event is received, a call is made to
ath12k_hal_dump_srng_stats(), with the purpose to collect
information that may be useful in debugging the cause of a
firmware reset.

Unfortunately, since this functionality is shared between
both the firmware reset path and the power management
resume path, the kernel log is flooded with messages during
resume. Since these messages are not useful during resume,
and in fact can be confusing and can increase the time it
takes to resume, update the logic to only call
ath12k_hal_dump_srng_stats() during firmware reset.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index db8ba5fec2ae..59113ff90727 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -3263,7 +3263,8 @@ static void ath12k_qmi_driver_event_work(struct work_struct *work)
 		case ATH12K_QMI_EVENT_FW_READY:
 			clear_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags);
 			if (test_bit(ATH12K_FLAG_REGISTERED, &ab->dev_flags)) {
-				ath12k_hal_dump_srng_stats(ab);
+				if (ab->is_reset)
+					ath12k_hal_dump_srng_stats(ab);
 				queue_work(ab->workqueue, &ab->restart_work);
 				break;
 			}
-- 
2.25.1


