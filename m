Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888E1C83F33
	for <ath12k@archiver.kernel.org>; Tue,  5 Sep 2023 02:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2I7Q03L+eINB+BSflg224QwVbRb2Ykehqq+EAxubF1I=; b=PnYL7sLivhZTg+
	8HqKEaCNVZUrcsYzEP5jhgndL7U588HEzdMwkaZGRKvFz/J3VnOABhts7gFzvF6wRE55AmSCjNvwW
	XePNvsZVMfDX/EnLnlAsPiNhDu4VXKuTE4PyHbNJOMP9x9dZzcnuIbjecRhvB9ZEheRs3iiJwIpI2
	cTjo0nJ0V1u3A4TwGNadBn62C30oF5Av26ZLp5cf9i/Y6T12pCLIetbN8cG4HSdUlzwiyZooEn14+
	XTPyF8XaJlikZuRhIyV2m+M0aYACEnsYly4RyZq8UTZIytlbrx2XVK0AAwmYlOqlwQog49qPgPTBj
	gmbuqeJc0jAaNs4ylPCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdM8A-0057Dv-0X
	for ath12k@archiver.kernel.org;
	Tue, 05 Sep 2023 02:49:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdM87-0057CY-0Z
	for ath12k@lists.infradead.org;
	Tue, 05 Sep 2023 02:49:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3852cthN015634;
	Tue, 5 Sep 2023 02:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=BlYZhb3/x6RRjj8vpg+hnY/lia7kF8GXhwQmu7xaw3A=;
 b=hQKtBOD2GWmf7hNnIJY1+pi0f7tkvmpLIL/EVrjstAxKP9JNDMHeIOJTJwd4Tq44/E/6
 qystDK1Mo4imvaCXuDrxpaYHNy2GnCymLQ1AFT93sogIl67q0/Qn+HmgoYKouY4Ex550
 Ho+0BRmIrZHYO5nrXK9WcK1d5b6aABxQu5YiKgjjyRVmcheOzAssLO2VSWF9ytoCb/r4
 elBh7c1LcuBPD/VkwVn5ozjIwPclJP+hXsIuO2zp5eSV6H4CcYyoZWktCjbjVi5X113O
 27XsiQvkjG4hWnarPqOSgfBkSH4hKJfJOzApKrQhA3JQ7gvEiRvr1FALhgNlca2XvDMN gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sweb51afp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Sep 2023 02:49:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3852nNL3030599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Sep 2023 02:49:23 GMT
Received: from lingbok-HP-EliteBook-8460p.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 4 Sep 2023 19:49:22 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: implement some functionalities through reading ACPI Table
Date: Tue, 5 Sep 2023 10:49:00 +0800
Message-ID: <20230905024904.3882-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7snSh6PO_4vGF8XIv4olqO5rSwQI9XP7
X-Proofpoint-GUID: 7snSh6PO_4vGF8XIv4olqO5rSwQI9XP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-05_01,2023-08-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 clxscore=1011
 mlxlogscore=631 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309050022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_194927_356308_CB56F1EA 
X-CRM114-Status: GOOD (  13.13  )
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

Lingbo Kong (4):
  wifi: ath12k: add TAS capability for WCN7850
  wifi: ath12k: add BIOS SAR capability for WCN7850
  wifi: ath12k: adjust configuration of CCA threshold value
  wifi: ath12k: add band edge channel power for WCN7850

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/acpi.c   | 365 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h   |  55 ++++
 drivers/net/wireless/ath/ath12k/core.c   |   6 +
 drivers/net/wireless/ath/ath12k/core.h   |  13 +
 drivers/net/wireless/ath/ath12k/hw.c     |  10 +
 drivers/net/wireless/ath/ath12k/hw.h     |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c    |   6 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 258 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  47 ++-
 10 files changed, 764 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h


base-commit: 4d4739971f44150b3dcb75f188a1a3cbc22889a3
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
