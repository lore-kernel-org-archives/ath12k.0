Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E655DC4332F
	for <ath12k@archiver.kernel.org>; Sat, 11 Nov 2023 04:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9RfH/4e2n1XrR3CzGWEsOcFpvfNmp1yPXzuIhUwzkWQ=; b=zpJ9BrPo9rk8Gr
	LlF6jH/a9plssxHJOimLJz+y1e6sqYPN+G39+M+g8o2Id7WAQoBasY8Jm8son6KYweNeIMHRxdBET
	hmsoVKAVa+mdKAN8GzGtGhe8n0aEfknp1DUPsNaeDF1C5B13dQuR2MwznDINWMSPi3d26zQiyYJWk
	CD9TN02ucYbjgoH1VAUNvKWOFdoB6x2/MI5T5ir4PJCnuIocr9B0JmhJXfBsAZSMbOEPcNcpOgKE6
	PYXfdy0W92ByNCQ1aveWGZ4Kn7A9QPsy/cW7a25FpZ7u4TERsOCW5R1sor4kr4qvvk4RpU09iE/QT
	Yh35Cv/kiO2KAu6UuhMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fmn-00A1gU-0r
	for ath12k@archiver.kernel.org;
	Sat, 11 Nov 2023 04:39:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1fmk-00A1ef-0d
	for ath12k@lists.infradead.org;
	Sat, 11 Nov 2023 04:39:55 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AB4dqhR014398;
	Sat, 11 Nov 2023 04:39:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=NF1psM1ph7nkvGvJobxjjWwwmINSyvaEpcj/51y76ns=;
 b=cgqt6tOVS+3Zpp/yAYDCaP4deAqch+7v/ar8jQvFC0x3wN0vHzpk/feHlYAKPI1a7sQo
 5kvPi9Vq2THLsSXVQVEYDSx92UPn+cgqobafxZqATXkIAfS6UTGUnUazEr4p7j2dCOAi
 qAYk1EFKl+X+A7oYze2iod/zVc+ESGkRANvM7QMDi5PWJeIm/UkZzeaH/jYSKxazwGdd
 AERDi6m/LOQ/Jpi0S6H64E7ehy+uRztL3a5IR9qDMvUEhLfJ6ovIs+2Lrn/AYJmLi3Q6
 PKJb4Hc8TwmgaAstAZM7fYbWUpwgtdoKxFI/bl5dbVoY+Q2x0q+iVUn7z5yE7jK2r+ab 5w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ua2cnr101-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:39:52 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AB4dpdK004696
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 11 Nov 2023 04:39:51 GMT
Received: from periyasa-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Fri, 10 Nov 2023 20:39:49 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/4] ath12k: Refactor Rxdma replenish arguments
Date: Sat, 11 Nov 2023 10:09:30 +0530
Message-ID: <20231111043934.20485-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bYDVgwaat5owJgR5cxM0-7QdECHDJhGl
X-Proofpoint-ORIG-GUID: bYDVgwaat5owJgR5cxM0-7QdECHDJhGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-11_01,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=3 adultscore=0 spamscore=3
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=156 bulkscore=0 clxscore=1015 mlxscore=3
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311110036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231110_203954_263847_4CC38196 
X-CRM114-Status: GOOD (  10.09  )
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

Avoid the explicit arguments of Rxdma replenish to optimize the per packet
rx data path CPU cycles. Also refactor the Rxdma ring structure.

Karthikeyan Periyasamy (4):
  wifi: ath12k: avoid explicit mac id argument in Rxdma replenish
  wifi: ath12k: avoid explicit RBM id argument in Rxdma replenish
  wifi: ath12k: avoid explicit HW conversion argument in Rxdma replenish
  wifi: ath12k: refactor DP Rxdma ring structure

v2:
  - Changed the copyright year

 drivers/net/wireless/ath/ath12k/dp.c     |   6 +-
 drivers/net/wireless/ath/ath12k/dp.h     |  13 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |  12 +-
 drivers/net/wireless/ath/ath12k/dp_mon.h |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 145 ++++++++++-------------
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   8 +-
 6 files changed, 82 insertions(+), 106 deletions(-)


base-commit: 553d0057523dc1d6935160613f1fbf9bb8db88f6
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
