Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 727F4E7719C
	for <ath12k@archiver.kernel.org>; Fri, 10 Jan 2025 11:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AZ7jsM5Kny757mI8InCm6ngjtSDDFlNTWEDCvZ4FGNM=; b=XDYCCFKu2BICqMKxS02CwTIBJs
	ZTyoCFl3VzMz4beSSF+N7Srhrp4aX4bQMaXeXV8f1GII3FzVTeHXmMvSBoZe1R6uLhyChJwJ9mUYB
	zsszJJGJgxjwXowNhau04jLNcmmVJYuaBadE+6ARm6A2kVBdNDpsWJibKi4Oa5221iKO6RyIoLJLA
	OjUWpd9hYRd57l29++PLUg4TKSSef5LbvyVS84xCWBi+OfD5Do8KvpuKN8nY5dVxIIfG5ZqzZ94Vi
	RtE3hu37xeej5UJKBExItaeyLB665w/nTZIwhMuZnl5u5/gSXCctTi73/+6ShzuHsFmR79q/8ewgl
	aGdqhApg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2q-0000000F5Ou-0ud6
	for ath12k@archiver.kernel.org;
	Fri, 10 Jan 2025 11:19:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWD2o-0000000F5N2-1oaU
	for ath12k@lists.infradead.org;
	Fri, 10 Jan 2025 11:19:15 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50ABEn1x029616;
	Fri, 10 Jan 2025 11:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZ7jsM5Kny757mI8InCm6ngjtSDDFlNTWEDCvZ4FGNM=; b=VYA08N6MC2a0ykf4
	+OlCVJATOhEczeiRtokn6Hhw21/tkPRicSjzi/6qtyMQY9H9Dtup810GPGlLUmfZ
	fBbUOIfEmiZYIp12QftnYf1wKvitmK4fUSF236zjQj26a7JOkK3NsTFd9ue/+nAI
	HVUZxDPEyQvy6qM84kFlODhvRDKJF+GAk9oumSAyIdg7V/5k/UOIxv3/OZ6xTGfb
	qCqKiVWKNg3HIftXKvEHQ0B8IbJ+RBB4M88/O1DdcyQH2+j6cTKXgxXq/S+SxiWV
	ewL5g3NSLKCeMIh2SY8wvkEfCLTXgdrMYBibjvOC2zY4o8/OJUBrTwG4k/WQXZ7M
	Kdsfdw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4432gq009b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 11:19:13 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50ABJCPv019680
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 11:19:12 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 10 Jan 2025 03:19:10 -0800
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH v8 5/5] wifi: ath12k: Disable MLO in Factory Test Mode
Date: Fri, 10 Jan 2025 16:48:45 +0530
Message-ID: <20250110111845.2920741-6-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
References: <20250110111845.2920741-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JYMaa-xkmtQLws725UxPomO5NA1ZtWMn
X-Proofpoint-ORIG-GUID: JYMaa-xkmtQLws725UxPomO5NA1ZtWMn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=702 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501100088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_031914_603514_32317C0A 
X-CRM114-Status: GOOD (  12.14  )
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

Factory test mode(FTM) is supported only in non-MLO(multi-link operation)
mode. Therefore, disable MLO when driver boots in FTM mode.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index d0cf82ca6dae..d23e7299962b 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1610,6 +1610,9 @@ static struct ath12k_hw_group *ath12k_core_hw_group_assign(struct ath12k_base *a
 
 	lockdep_assert_held(&ath12k_hw_group_mutex);
 
+	if (ath12k_ftm_mode)
+		goto invalid_group;
+
 	/* The grouping of multiple devices will be done based on device tree file.
 	 * The platforms that do not have any valid group information would have
 	 * each device to be part of its own invalid group.
@@ -1797,6 +1800,9 @@ void ath12k_core_hw_group_set_mlo_capable(struct ath12k_hw_group *ag)
 	struct ath12k_base *ab;
 	int i;
 
+	if (ath12k_ftm_mode)
+		return;
+
 	lockdep_assert_held(&ag->mutex);
 
 	/* If more than one devices are grouped, then inter MLO
-- 
2.34.1


