Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C0F3C46CD2
	for <ath12k@archiver.kernel.org>; Tue,  9 Jan 2024 05:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZ85F/3YJNXg81MehkF7sUaQksu7chCLn9cKHAWfOrI=; b=lVsz5LrYSPs1ZU+QyHNpydeqqk
	cgZXKAPi9JyyzDa+GAZ1YxDqSEt2IXkQEkeeWJEWtMVl7IlUpVNBy5VshO3S4nOUFyc5s84jU5XD8
	tcxZa4mVps9XhKNWrvg0bElX9ls1YgjPeaNPDp2KpA+hpeIt+K82SScTiKmwfj8qkRS7+eUyyqbvJ
	BnPauzCUrXnW5kX6mrfy89p/e4y95GQ50eS/+pWj3EP//Bc5KbIv7c8MyNzSavVfpbXkyLStqM4bp
	LLmywYKVUNlqKgPqe7d3P+k8o+MaZM/eGv43/fMTO2cODNQ1qgAMdOLtXZ11FeIIhLQpV0TbNzUtv
	O68y6hSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rN4QL-006yiw-3D
	for ath12k@archiver.kernel.org;
	Tue, 09 Jan 2024 05:13:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rN4QI-006ygn-0H
	for ath12k@lists.infradead.org;
	Tue, 09 Jan 2024 05:13:11 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4093vRue013347;
	Tue, 9 Jan 2024 05:13:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=QZ85F/3
	YJNXg81MehkF7sUaQksu7chCLn9cKHAWfOrI=; b=j0bXqdePta4r6eBfvr4pphZ
	+8EBH+jXGEkI0ZuecCbep/F/4qTik5iMILvRJPvngkrklIwQaWjaQuoCk8whdVNE
	5ZGfilMpzWe6V/S7fL8gRHqxScMg05jsLbg3wh7Ne+YoIFnsQIAwZtooS57hZG6d
	lbMEOYqroX35WevH5JYUptdAFt90ruhpAKLoEnZbC+J0PtCEFkC0mQFR2P0Gm3Pm
	bbd6UkovHkN6iZ1DmVwCc5keFjZ6+kfwlV8p2zd3JWQkL2iFmZ4kA8xHYy6A6q90
	UKp1q713iSX5ko0Bn2T+NL2OLeqlMx+Uq62CjtweA/iDBFVat/aPPn01fbiT5Og=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vghkvhsst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 05:13:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4095D749006576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 05:13:07 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 8 Jan 2024 21:13:05 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Introduce hw abstraction
Date: Tue, 9 Jan 2024 10:42:50 +0530
Message-ID: <20240109051252.3325106-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Unhcw0rQwF-6-40WxVoigBGjn5XIz660
X-Proofpoint-GUID: Unhcw0rQwF-6-40WxVoigBGjn5XIz660
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxlogscore=327 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_211310_127730_10654EC4 
X-CRM114-Status: UNSURE (   8.45  )
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

To support multi link operation (MLO), need to move from the multi wiphy
model to a single wiphy model. However, the single wiphy model allows
multiple link/radio to be exposed by the same mac80211 hw. So introduce
a new container (ath12k_hw) structure. This approach improves scalability
for future multi link operation support.

Note:

This patchset sits on top of below patches
  wifi: ath12k: Refactor mac callback of config
  wifi: ath12k: Refactor mac callback of bss info changed
  wifi: ath12k: Refactor mac callback of conf tx
  wifi: ath12k: Refactor mac callback of start
  wifi: ath12k: Refactor mac callback of stop
  wifi: ath12k: Refactor mac callback of update vif offload
  wifi: ath12k: Refactor mac callback of configure filter
  wifi: ath12k: Refactor mac callback of ampdu action
  wifi: ath12k: Refactor mac callback of flush
  wifi: ath12k: Refactor start vdev delay function
  wifi: ath12k: Refactor the DP pdev pre alloc call sequence
  wifi: ath12k: Refactor the MAC allocation and destroy
  wifi: ath12k: Refactor MAC setup channel helper function
  wifi: ath12k: Refactor MAC un/register helper function

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor the mac80211 hw access from link/radio
  wifi: ath12k: Introduce the container for mac80211 hw

 drivers/net/wireless/ath/ath12k/core.c   | 108 +++--
 drivers/net/wireless/ath/ath12k/core.h   |  47 ++-
 drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 480 +++++++++++++++++------
 drivers/net/wireless/ath/ath12k/mac.h    |  14 +-
 drivers/net/wireless/ath/ath12k/reg.c    |   9 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  17 +-
 9 files changed, 510 insertions(+), 181 deletions(-)


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
prerequisite-patch-id: c2cebfe634adf505f1dd4fff4235dac6162c7da7
prerequisite-patch-id: cc11dc22588dbbd884ce44bcc4680ff0cc64b696
prerequisite-patch-id: 2eb8549471f3a66e200d82f6d3e902de2832a210
prerequisite-patch-id: 330f495e6871998fddc71c735e7fbfe5efc9c798
prerequisite-patch-id: 903acc7b989d5974623fdf4b9be901e2664dbef3
prerequisite-patch-id: 53378c45727417943331a0b98c5718b24a8e3577
prerequisite-patch-id: 9f1e02951355b889eddf23c24d063e9933008b2a
prerequisite-patch-id: 9b662f69fa076e61e089a15b5559c4ee913f94a8
prerequisite-patch-id: 4e079d284495ae939dc2173cae9e3fa082e607cb
prerequisite-patch-id: f81c109928533db71c84e64e102f5921db406f2d
prerequisite-patch-id: 70e3b0429286e17f26ea53369027a6f43a3653c3
prerequisite-patch-id: c2bebc5a0ea8cea79d6aec293096a168860bb48d
prerequisite-patch-id: e89f6abeea9771cb0832b8db13507a2b08f774ce
prerequisite-patch-id: c26a2ceec9261bec16474d1c8e3ff093d404b778
-- 
2.34.1


