Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7136EC77B60
	for <ath12k@archiver.kernel.org>; Thu, 27 Apr 2023 01:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOrGqURE5Y/Wpsbj9gUzrVr2xh2xUKE1x6K69xDsZB8=; b=OByjpaA6PxaXq7
	bSzqRQfs0LwEuQH4do9MIo2m66SVARXeGRUHehKN72CinSiKnvynKc9iKimxWvUo8m1hRznH+/4l5
	aZZHBzezf0bQIaaBjdN5659hUPagNGpfjtWP5ZBq8beuPByy9Nz7x9jYULESLGgQhkOd+Bd8t3DLu
	iDo1Rm+z/9W88dNgNSkUXVYKejXcWTETlpuZTV1tZJ2dhKqNqLx2gZ0HhNA7WPM4wbgq1xiicn7dF
	yCOBIjTEUWvOiDSZTh++2bOcjAK7yWnP5tcxRrGrsogDkoKGL/G5IUIKG5Lhu5kd5jwEhy9rjvTmS
	VoDe/XA0pddxlNElW+3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prqTg-005DCl-1b
	for ath12k@archiver.kernel.org;
	Thu, 27 Apr 2023 01:31:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prqTd-005DCN-0v
	for ath12k@lists.infradead.org;
	Thu, 27 Apr 2023 01:31:18 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QNwS2W018088;
	Thu, 27 Apr 2023 01:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=spfbNfwmiL3qg7k8mINHhVDrbQKuteH3oLy9EIuNsHw=;
 b=ITrS99XDxvezNhs0NctLOTUTLHPHVY+VSeClaXYy8UmXpSCs9lyi9fZZ7jPrcDLk+m9k
 PT0xB7ETRF+Ocs8Tv4Rkt9wemMcL6wbCKJEwIyhguUYODBd45WnfksAPARfT4UnC/Wsz
 XyVb4bmqIDO2kzw+K0ky5P9u+BHxhjEe4zXGZ2smaijHlfo6AbAEvAOYaSmgcoHm6GWy
 dpMMeWtpgN2m0J3k3PtTWlw7nZMTjprEZoi5DzboHVFr1YOQkE1wISZREBX794/kQDh1
 jvDFn/a3CVysWFRdLli85FZB0HlXJhrlDTcZc0JbCb5m4I2c5N2AzGdf5SRBqzIXjUr7 PA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q7dh2g6gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Apr 2023 01:31:14 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33R1VBdT015040
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Apr 2023 01:31:11 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 26 Apr 2023 18:30:37 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH] wifi: ath12k: Use msdu_end to check MCBC
Date: Thu, 27 Apr 2023 09:30:21 +0800
Message-ID: <20230427013021.29792-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Rpu3Jamhwdgros-R5vyRRiSG0HzVyGW2
X-Proofpoint-GUID: Rpu3Jamhwdgros-R5vyRRiSG0HzVyGW2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_01,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 spamscore=0 adultscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 mlxlogscore=833 mlxscore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_183117_345602_2660703D 
X-CRM114-Status: GOOD (  15.00  )
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

We are seeing a very low TCP throughput testing with some specific
tools. This is because for sub-frames of an AMSDU, MCBC flag in
mpdu_start may be not valid, and as a result those frames would be
dropped by kernel.

Change to get it from msdu_end.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/hal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/hal.c b/drivers/net/wireless/ath/ath12k/hal.c
index 0ec53afe9915..980ec2024b37 100644
--- a/drivers/net/wireless/ath/ath12k/hal.c
+++ b/drivers/net/wireless/ath/ath12k/hal.c
@@ -889,8 +889,8 @@ static u8 *ath12k_hw_wcn7850_rx_desc_mpdu_start_addr2(struct hal_rx_desc *desc)
 
 static bool ath12k_hw_wcn7850_rx_desc_is_mcbc(struct hal_rx_desc *desc)
 {
-	return __le32_to_cpu(desc->u.wcn7850.mpdu_start.info6) &
-	       RX_MPDU_START_INFO6_MCAST_BCAST;
+	return __le32_to_cpu(desc->u.wcn7850.msdu_end.info5) &
+	       RX_MSDU_END_INFO5_DA_IS_MCBC;
 }
 
 static void ath12k_hw_wcn7850_rx_desc_get_dot11_hdr(struct hal_rx_desc *desc,

base-commit: d276b90ff7f9c51e1f2f8826b7cbb3dff20a4b66
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
