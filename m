Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F671C4707C
	for <ath12k@archiver.kernel.org>; Fri,  5 Jan 2024 19:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qk88lsgGU+VdIkidCS8MgwDxZmq2Ur3sWpm/pws8VH4=; b=Q8FV/ZCt5GgUZokHVF6kz7KW/C
	PADiWi0XWggzwFp407ehAugXhS21VEPhGA08by3kibCy8yjljNp/zt71xreT/mgSoL/Tv4gLqIa1p
	1SYV83fK61GvlzXQYdsR8u5AR52PYtwlJaxDzcj5zNrzD8DOfc/+Jl8Hp1/fgpZlbtUMUye9s7qdX
	OC+/9nKFLtvQMgt6WogHn3mf6Y4qaAzVBnHExEHMKw9p4ccIZjBI/HZYbYiS7kURr8oxeykb+7VBD
	Sb8vrpJVsVkqk4IxnNyaY4RZ7n/e7zABSYjEfCt77E9JlqTzejM9HXlAsh6+DGLEZw4HkHVtKKAcK
	6B4cIxzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJs-0008jB-00
	for ath12k@archiver.kernel.org;
	Fri, 05 Jan 2024 19:57:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLqJm-0008dO-1K
	for ath12k@lists.infradead.org;
	Fri, 05 Jan 2024 19:57:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 405FRNNg019371;
	Fri, 5 Jan 2024 19:57:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=qk88lsg
	GU+VdIkidCS8MgwDxZmq2Ur3sWpm/pws8VH4=; b=k0yw+mwpDg43nHKWN1Jh1Gt
	yMt3ekJU17OUVUsZtwGaxRGHbqgaZCXD7x3IsBSy4E0a8OCON5AYodkTZb949GhR
	TYxvC1bV3vBZ9MgudspfF/6cdvU3FBwqAUr9HM0DXdQ7DO4Xq9Vuz3J/6+vuul41
	jzJl7qAquHcnm62HwpN702xcuoWdnTyQ43kvCFjGoXCLs2xy5Lcpp553Bi3OTHjK
	e6tjz4tnoW6UGAHEbUfCzif4jPWvMplGkI9w7ADzU6BOkRncoLRc7OUk+DqU9SBL
	MmTM0mc64Kt4BQe1vBJ2CL7aru5TJ/e5zubuWfRLpqd79M9zlpXHsgS9U0zJ0Fg=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vemdt8sew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jan 2024 19:57:12 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 405Juwpu032149
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Jan 2024 19:56:58 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 5 Jan 2024 11:56:56 -0800
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH v2 00/12] wifi: ath12k: QCN9274 dualmac bring up
Date: Sat, 6 Jan 2024 01:26:27 +0530
Message-ID: <20240105195639.3217739-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7gjCcW1wm9WWPhxyswNE-G_HLtsgXpg9
X-Proofpoint-ORIG-GUID: 7gjCcW1wm9WWPhxyswNE-G_HLtsgXpg9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 mlxlogscore=326 lowpriorityscore=0 phishscore=0
 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401050161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_115722_498884_CF1FDF7F 
X-CRM114-Status: UNSURE (   8.88  )
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

QCN9274 Ath12k chipset can support single-mac or dualmac architecture.
Currently, Ath12k driver supports only the single-mac QCN9274
architecture.

Hence, add support for dualmac QCN9274 chipset.

Depends-On: wifi: ath12k: add firmware-2.bin support

Aaradhana Sahu (1):
  wifi: ath12k: fix firmware assert during insmod in memory segment mode

Ganesh Babu Jothiram (1):
  wifi: ath12k: Read board id to support split-PHY QCN9274

Harshitha Prem (1):
  wifi: ath12k: add support for peer meta data version

Karthikeyan Kathirvel (1):
  wifi: ath12k: subscribe required word mask from rx tlv

Karthikeyan Periyasamy (1):
  wifi: ath12k: add MAC id support in WBM error path

P Praneesh (2):
  wifi: ath12k: Add logic to write QRTR node id to scratch
  wifi: ath12k: fix PCI read and write

Raj Kumar Bhagat (3):
  wifi: ath12k: fix fetching MCBC flag for QCN9274
  wifi: ath12k: split hal_ops to support RX TLVs word mask compaction
  wifi: ath12k: remove hal_desc_sz from hw params

Sowmiya Sree Elavalagan (1):
  wifi: ath12k: fetch correct pdev id from WMI_SERVICE_READY_EXT_EVENTID

Sriram R (1):
  wifi: ath12k: indicate NON MBSSID vdev by default during vdev start

---
v2:
- dropped patch [1/13] - wifi: ath12k: Update enum wmi_direct_buffer_module
  not required with FW version being used.
- defined enum wmi_vdev_mbssid_flags at proper place.
- implemented hal_ops to retrieve the corresponding compact ops.
---

 drivers/net/wireless/ath/ath12k/core.c    |  29 ++
 drivers/net/wireless/ath/ath12k/core.h    |   7 +
 drivers/net/wireless/ath/ath12k/dp.c      |  25 +-
 drivers/net/wireless/ath/ath12k/dp.h      |  17 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c  |   7 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   | 161 +++++----
 drivers/net/wireless/ath/ath12k/dp_tx.c   |  22 +-
 drivers/net/wireless/ath/ath12k/fw.c      |   7 +
 drivers/net/wireless/ath/ath12k/fw.h      |   6 +
 drivers/net/wireless/ath/ath12k/hal.c     | 415 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal.h     |  20 +-
 drivers/net/wireless/ath/ath12k/hw.c      |  10 +-
 drivers/net/wireless/ath/ath12k/hw.h      |  30 +-
 drivers/net/wireless/ath/ath12k/mac.c     |  14 +-
 drivers/net/wireless/ath/ath12k/mhi.c     |  49 ++-
 drivers/net/wireless/ath/ath12k/pci.c     |  84 +++--
 drivers/net/wireless/ath/ath12k/pci.h     |   6 +-
 drivers/net/wireless/ath/ath12k/qmi.h     |   3 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h | 116 +++++-
 drivers/net/wireless/ath/ath12k/wmi.c     |  33 +-
 drivers/net/wireless/ath/ath12k/wmi.h     |  58 ++-
 21 files changed, 943 insertions(+), 176 deletions(-)

-- 
2.34.1


