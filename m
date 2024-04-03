Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B8A9CD1288
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 04:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=c1Wh6AOWWSzunrNd2urSVns1955bw5YYsBFPeWuJIZ4=; b=aEWc303C2P5ca+OmDxvzgKPmGp
	3I9MZ2MPMebggr6dOCnnaz+4LG46n8tuR25dWTKVAinVoRryIElKvdZ6rKqYFI7it4p+bRSxLMpzc
	XkJrf9SMLP8k1vPN6UDBmyXSh4vLYqXr3a1tViliXz//7OfP5OWmhVvo4NHfpo+DNVQZwOooD21ST
	0AKFBZ7Yp0SP6gMPKRBnthAxFKL+8Vm0g2TxMsIz8KipyORWKy+7frvOLOQKCIWHEV+WH3DNEL4ve
	D2uQ4btithAuQwS067/pabe0qs5mMcyiaKcKKfTY7kvxZyUCpP5paw7U0KyDmwSK2Yuge/0nTxsMS
	Dz9V3Mhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs7g-0000000DvaN-378E
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 04:21:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrs7d-0000000DvYw-3zG3
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 04:21:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4334DDi8006345;
	Wed, 3 Apr 2024 04:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=c1Wh6AO
	WWSzunrNd2urSVns1955bw5YYsBFPeWuJIZ4=; b=IAn5eJ+7iMPdqtW1HYEvL4J
	cXw2rhSXetGVXGaAn+3HfsgodJ46GNBwbj4N5DwMXfxMGI2YksFkL0O1g3DOvhR1
	nSCaZt/782Iz3jNlTmZy7rB6QKh9Ejbe4uDD119nONd9b+D6YxzYustEU9POuK2P
	c+kwcKYF1JdF+8tJKGZe/MP0qVUP4kebovkDH63XNAMdoemEOrEJ6sWYvkuHywTr
	B4oBRoQhLwZo14UthjAu0tQGQr/DBq73N5gysk1zyJwB1MS6t/a/kb9Riaw2ct02
	EHFrq2liqUj6q9/G6UOeRLjh0ipBFI5dk+XbUi61dIlsZmFWBqnaIJrQLUfv5Pw=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x8ua70fkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 04:21:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4334LAT2012246
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 04:21:10 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 2 Apr 2024 21:21:08 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/2] [RESEND] wifi: ath12k: refactor the link capable flag
Date: Wed, 3 Apr 2024 09:50:54 +0530
Message-ID: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3-nu7XYufsnDyaWW5JhyVlgBKaLoiZoo
X-Proofpoint-GUID: 3-nu7XYufsnDyaWW5JhyVlgBKaLoiZoo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_03,2024-04-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=705 priorityscore=1501
 clxscore=1015 adultscore=0 suspectscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2404030027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_212114_022811_7B13036C 
X-CRM114-Status: UNSURE (   8.62  )
X-CRM114-Notice: Please train this message.
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

extend the link capable flag to accommodate inter-device capability.

v2:
 - Rename the terminology from chip to device

Karthikeyan Periyasamy (2):
  wifi: ath12k: extend the link capable flag
  wifi: ath12k: fix link capable flags

 drivers/net/wireless/ath/ath12k/core.c |  2 +-
 drivers/net/wireless/ath/ath12k/core.h | 23 ++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/mhi.c  |  2 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |  4 +++-
 4 files changed, 25 insertions(+), 6 deletions(-)


base-commit: fe7e1b830cf3c0272aa4eaf367c4c7b29c169c3d
-- 
2.34.1


