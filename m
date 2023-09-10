Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F21EC8748
	for <ath12k@archiver.kernel.org>; Sun, 10 Sep 2023 08:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cMqLYNegbGfoHq5bSiANG3F1ClH76wMqwvGGJtcuM+o=; b=I4xfI8mn653L+0
	nCGjQDctuM39b1yA6DIFG9zOdaFv9rjDFyzg1tzoCqnDwbuP/ODcgmRNanqWphFdfujb/WJEE+Gv7
	cYDcG2lZ0pN5ReAaJRo+yQVFE59axvGt534Xi4nUrSOR7PEozzIIMIypXtL9l0g5b0M3FYRub0GUO
	uUBOKdoTwr2a6VD+W0Zz8kff5kl3wYhN+hej+O1a51h4NIN51Xy+8HGBkW/W8epu8hT36kvG8JRhY
	HKOpSB4TiV5loq5aS4R52EX9wF4tS5QRCd6TKHoQFoMLIm9uB3lFJfGUPDsLqsmmyZU/3dkefcif2
	79IiUW42gOMosHzjfsNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFnx-00GHRe-2l
	for ath12k@archiver.kernel.org;
	Sun, 10 Sep 2023 08:28:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfFnu-00GHQr-1B
	for ath12k@lists.infradead.org;
	Sun, 10 Sep 2023 08:28:27 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38A8QtEN029456;
	Sun, 10 Sep 2023 08:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=SJu6xWRLmRKtH+eWKqYLUH8qK3tbM3UBoz/ZYGCv9fA=;
 b=grhel92YSJusy+2JFSa0vpKDjRxvs5aHzdjU7ONSo9b7SL3FbHf+DAkXWaA4nRLwrpcW
 B65Hp+wla/+F0SvL+dF1HuYLgEfz1rmLJMWr2TK/dzpke//rD79HQ0+i8Ua5+RlKc1+N
 gkFcXFuso6ijjNP0aevzNps7YYpAO3gcajvdRSw4ijKqBXZPkzSo4pEBIa3BXlAu6aEC
 CLM8r4wE13Fb6rzHwyGwFgeM6WebcuZvwLwXbui+lMFpuaXdCBLs9MUJzeZr9zcaqnhr
 eLm69ewRzBjFgKsx/GcPfQ84s6uRD2Oo0Zf/rT1ZR0M/ex0vNr4Blm8RGopCPIlrUaan lw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0hfqhgvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Sep 2023 08:28:24 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38A8SNJI006827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 10 Sep 2023 08:28:23 GMT
Received: from lingbok-HP-EliteBook-8460p.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sun, 10 Sep 2023 01:28:21 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v4 0/4] wifi: ath12k: implement some functionalities through reading ACPI Table
Date: Sun, 10 Sep 2023 16:27:58 +0800
Message-ID: <20230910082802.9198-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xzd4-ntkT7x37FPwCazEI8CmFDD0IrXZ
X-Proofpoint-GUID: Xzd4-ntkT7x37FPwCazEI8CmFDD0IrXZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-10_03,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 mlxlogscore=636 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309100073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_012826_431463_6CF49ED3 
X-CRM114-Status: GOOD (  13.72  )
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
 drivers/net/wireless/ath/ath12k/acpi.c   | 365 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h   |  60 ++++
 drivers/net/wireless/ath/ath12k/core.c   |   6 +
 drivers/net/wireless/ath/ath12k/core.h   |  13 +
 drivers/net/wireless/ath/ath12k/hw.c     |  10 +
 drivers/net/wireless/ath/ath12k/hw.h     |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c    |   6 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 252 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  47 ++-
 10 files changed, 763 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h


base-commit: 1b5b69a51bb4909844e4003920af09ca1cc6bb0e
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
