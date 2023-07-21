Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BD8CEB64DA
	for <ath12k@archiver.kernel.org>; Fri, 21 Jul 2023 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JupXJNKqHJ0VU/TQX2nilnQ/y1h/0mzpz9BYUYej7n4=; b=4HkHF+s/TCNSCe
	FsiUnB+YtGt/eB+mJvghPG6ZHyIUqf44WWI9s52WzWMv+JQQgaAxTI3ia0jTCJtAbvSXjRZfC18Ng
	Q+OyzOka4t3QHr2hpEsZIvmHmgqkXsW/A9x4bCptqku5GBiX5FgwSOGv/htj+VER00DiYey9Vcdr+
	74RmQB+9yQ1H2A/r1PjDiP3qzbBQUzBJbtqj1f0iZUsjj9s4HlinPksudBiGb+RcCYqsvf2QOgtM4
	pIn5noJFVVldVf5QLDtybgHOkhUnnjouitTKqdBb+TH6IDA4vYf+HDPT+U1Ai6ciZzyvHTaWqGhgM
	+tW3Zt95bNChf/m9Uz8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz5-00CdW2-2m
	for ath12k@archiver.kernel.org;
	Fri, 21 Jul 2023 02:35:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz0-00CdUt-20
	for ath12k@lists.infradead.org;
	Fri, 21 Jul 2023 02:35:08 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L1mi48011932;
	Fri, 21 Jul 2023 02:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=4UJBjrb/tMVmQ+KW0G7h9Cb38raqN9h+/coW/5SBaXU=;
 b=cH/qDBw4Sqi2SqITDQgV4JHoH678IgAMGMRTQtTnKHLh5R9nybvzS6SD10wR/Ifs5Hjy
 NXIhAl1A7/DahhXZBUIb3AP6elfZDDy0NBO4KkfS3aptqqDxoxVV4dI2SR4lDALmVFR9
 24pqH5QRkiMzT5/try5x81cQxLN/YdjX8fyYnCfq/3lDBDy9OKdsLhKt0z3O71ISV84p
 Y4lurHtwNZ6MW2XiGXxjPXY8XftFbVM7r8k6Xmfr10v+mErCISJQLCnWoczET/jjJaS7
 0KJUWWSrQ/7L7UbwrExm6arbkJWNU6JHO3F3djEuwm5Br2kia9QE5aAiNBQ3frqds4+M jQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxpyquc3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L2Z4KM003117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:04 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 19:35:03 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [RFC 3/3] wifi: ath12k: Turn on suspend/resume switch for WCN7850
Date: Fri, 21 Jul 2023 10:34:46 +0800
Message-ID: <20230721023446.3706-4-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230721023446.3706-1-quic_bqiang@quicinc.com>
References: <20230721023446.3706-1-quic_bqiang@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rn7mAvglvhvxHBn-OyNhAS94AGi0X3Ok
X-Proofpoint-ORIG-GUID: rn7mAvglvhvxHBn-OyNhAS94AGi0X3Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=828 malwarescore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307210021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_193506_771726_72F17B8A 
X-CRM114-Status: GOOD (  16.56  )
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

Now suspend/resume functionality is implemented, so change
supports_suspend to true to make it work for WCN7850.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/hw.c b/drivers/net/wireless/ath/ath12k/hw.c
index 5991cc91cd00..e7d1bff4d636 100644
--- a/drivers/net/wireless/ath/ath12k/hw.c
+++ b/drivers/net/wireless/ath/ath12k/hw.c
@@ -947,7 +947,7 @@ static const struct ath12k_hw_params ath12k_hw_params[] = {
 
 		.idle_ps = true,
 		.download_calib = false,
-		.supports_suspend = false,
+		.supports_suspend = true,
 		.tcl_ring_retry = false,
 		.reoq_lut_support = false,
 		.supports_shadow_regs = true,
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
