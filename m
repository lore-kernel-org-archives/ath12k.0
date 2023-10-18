Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65871CDB47E
	for <ath12k@archiver.kernel.org>; Wed, 18 Oct 2023 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S97l401apnOYHBrgDT8wow1tud+z9X9mTrtVbAMBglQ=; b=IohmV9VzwRA6p4
	Ob+ENqQfAIrtQTxBeQXsHTKhh6oVrkVPDM6GkrDYpRuk5ZnfaXFJbN7B+i6t8zA0sO6gTEgbdEmaS
	fL/a363eAPGDxGaIyID9A3xxE+Sb8IToLlsK7unanptdYgu8WOdrX49VErKibbzv0Z5Ab5Nfdyfqt
	xLXXR6UZcsZxqMSx5If9z1pk6C/WEKB4Ulok26tLuq8w/y6rIB4IotuxCy636qqCdD/DIZRBLd++M
	9nnbUqNh/45fnOIMIozHO/sIsLXjLzbDZ0p6DlwZFDscUDCMPVeJRSVxl5MhPVpNLBK0OYIoWHyHZ
	nmibMpnVsYYexumc+k4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8VH-00F3NZ-0V
	for ath12k@archiver.kernel.org;
	Wed, 18 Oct 2023 15:30:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8VD-00F3LP-2g
	for ath12k@lists.infradead.org;
	Wed, 18 Oct 2023 15:30:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39IFJeCZ018197;
	Wed, 18 Oct 2023 15:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=OdNuxyO6elS7DV3bJ3NKsmQhot8BHJL7528qcLwee8U=;
 b=SSboG6pt0Un0gXpdvac/XBWh8cxtuz15lDo9jDRnKak+CxaKY5/tGe0ArpT8SeKepL0S
 AMnbBtUCu2ocCp9xNKliSOSW+O8RDHAlRg9iEPrdER6F/IppcLc+0NbT2FMDvsXM6VJN
 w16zuRbrGyqJ0kUZDQtnra9zv/syuJXkyohZCi2q7ob3DGcioevGCQa6m8o3LPiN0KzC
 kUJq+n9SO8MD3KyKCM+UK2Lhxj2IJP9bj2HeohpI0tQRlQ4fE698eOtQ2aTkT32xF3Um
 KnTFCmgBi9GYeeySGkhk3emyZg7PEB38wR1P8l3+a7OyTtPTLu67zcjgLp4sH+YQJHoA 5g== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tt5v81j1p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 15:30:25 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 39IFUOqg014978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Oct 2023 15:30:24 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Wed, 18 Oct 2023 08:30:22 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: rename the variable naming convention
Date: Wed, 18 Oct 2023 21:00:06 +0530
Message-ID: <20231018153008.29820-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: o3KAnvxqOSbpuvTymmTBQZHRUn4xzv0X
X-Proofpoint-ORIG-GUID: o3KAnvxqOSbpuvTymmTBQZHRUn4xzv0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-18_13,2023-10-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=607 lowpriorityscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxscore=0 clxscore=1011 bulkscore=0 priorityscore=1501
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310180124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_083032_013853_F44DE164 
X-CRM114-Status: GOOD (  10.97  )
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

Currently, the identifier sc is used to represent an instance of SoC
structure. But in ath12k ab is refer to the SoC data structure.
So rename the variable name.

Karthikeyan Periyasamy (2):
  wifi: ath12k: rename the wmi_sc naming convention to wmi_ab
  wifi: ath12k: rename the sc naming convention to ab

 drivers/net/wireless/ath/ath12k/hif.h | 18 +++++++++---------
 drivers/net/wireless/ath/ath12k/pci.c |  4 ++--
 drivers/net/wireless/ath/ath12k/wmi.c | 22 +++++++++++-----------
 3 files changed, 22 insertions(+), 22 deletions(-)


base-commit: 91bc2f15a1b8c38ddbc1ea400dcd4bbd3639d22b
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
