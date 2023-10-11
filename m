Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EB0CD98C7
	for <ath12k@archiver.kernel.org>; Wed, 11 Oct 2023 05:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r/xZd9BKVna2j/z3wzzDUyZEnkm2fCdqVFnR1E8kaB0=; b=jCGD53/Lbec2+H
	WXWNFn0/Lm+0orKnG+tqvY3+Bi3jC6HWSaNyJdPAPvxbvbu0MvmS8UQ3gn3j8q7BvtArUyn5RG+bT
	htVNxHglrlufRgtlpxq+zfCedJjLMQfdTKNonRS+uxlxJBbXmS9sjH3mZNWXQyWXMr28L+sexRphV
	4Uzc5JCqDIQqbsz9Gzh7fAGyhyA/0urLljhy3Dj/NRN5WSgTlWD0fxpEMb81YG7B2rzocYkHShhvN
	o9Yp1OFLcbjzynvNd3CYOlnn0WErIVolL3DPVS80BpVZUHzTo3fLrjfDPMhPBENQCBzo/JX2X7JX1
	29xCilrleSGasxke6X5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRKb-00EnWh-1f
	for ath12k@archiver.kernel.org;
	Wed, 11 Oct 2023 05:00:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqRKZ-00EnUW-0M
	for ath12k@lists.infradead.org;
	Wed, 11 Oct 2023 05:00:24 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B3iRjU024160;
	Wed, 11 Oct 2023 05:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=GJX3fHYAIyq5rxahShgwddeQ9Rp96eEBAU0kaVpTujc=;
 b=NbQVZTDnozCJ5zFkV/fRLCVarHlwlFKMeqM3jZ41ch5LG9jMCHQPIGuXcLIbFXceBBpz
 t3HxHqNb3SAHhZiAhumgMe8NpDDNIdaFOwPzzI4anJRd0QuwTAYsN5PBY9wo1E2w6k4F
 gLJBvEwl33PF5sM7SAedoYxZrZCECezyoNt1lJzzmb+E+UPfz1pprNydlEoJjzpbdaXM
 QsjEL0FJZmnMjJDsg+ihVk398qUWwK7Wai/xtOFM+warqnIbdgNOx4Y1QEJsmQQi7XVu
 hkweedUV6oND3e/EGe3qgebV+8h2sZ7RCKbOJDXTEbeK6VSxObAzbGnT9DgNPkKD9PmV IA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tmxjpjvm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:00:19 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39B50IK0025702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Oct 2023 05:00:18 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Tue, 10 Oct 2023 22:00:16 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v6 0/4] wifi: ath12k: implement some functionalities through reading ACPI Table
Date: Wed, 11 Oct 2023 01:00:00 -0400
Message-ID: <20231011050004.423413-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QAwEy8YKm2h9ALgNgavo_lzHsrV8AAjT
X-Proofpoint-ORIG-GUID: QAwEy8YKm2h9ALgNgavo_lzHsrV8AAjT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-10_19,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=635
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_220023_176071_2B93E46F 
X-CRM114-Status: GOOD (  13.58  )
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

Through reading ACPI table, implement Time-Average-SAR(TAS), BIOS SAR,
configuration of CCA threshold and band edge channel power functionalities.

v6:
1.remove code that is not called

v5:
1.rebase to the latest tag

v4:
1.revise commit log using imperative voice
2.delete guid_is_null()

v3:
1.remove unnecessary cpu_to_le32()
2.adjust the order of the macros
3.apply jeff's advice

v2:
1.put <linux/acpi.h> in the include guard

Lingbo Kong (4):
  wifi: ath12k: add TAS capability for WCN7850
  wifi: ath12k: add BIOS SAR capability for WCN7850
  wifi: ath12k: add adjust configuration of CCA threshold value for
    WCN7850
  wifi: ath12k: add set band edge channel power for WCN7850

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/acpi.c   | 358 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h   |  60 ++++
 drivers/net/wireless/ath/ath12k/core.c   |   6 +
 drivers/net/wireless/ath/ath12k/core.h   |  13 +
 drivers/net/wireless/ath/ath12k/hw.c     |  10 +
 drivers/net/wireless/ath/ath12k/hw.h     |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c    |   6 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 252 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  47 ++-
 10 files changed, 756 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h


base-commit: 1424328125660281e749480357c7eeda839c144e
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
