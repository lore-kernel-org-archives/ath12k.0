Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CE3EB64DD
	for <ath12k@archiver.kernel.org>; Tue, 25 Jul 2023 23:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KuGhGAqc7589lajRqRB2Zk8wUTaS74OhG5IchE5ZsMI=; b=P0Dk4tAkrtaFfb
	FZc51Kbc1yFjldgeDOckrq7MqCbGvtFZsVMdVSO5aele+bvI3Fc1LSPG+nefstrWxDxGCyZWCAyaE
	MS65/AWFabaUHKsuWb/Dei178lQkqCszpOdMqt4u8utzVB0Q9NpKP91c24QQv74QaA6lEXWRtlZCj
	vbQsGf49iuMGAQOQChJ/UiF6CDkjOcBB1C/LwpE3vBZt4CWD0XPg0aKUjFjoz2k3Af4GUzJZ9Ipu8
	Y7rAA/3HUvyeyBSAENryJYLW0Btri8BrmQkhSGC2lCI5uu4a3/uebkVOLbPq+U6nQEHIcM1zGkBhv
	i6k7zW8MBnRFVBmMKzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qORid-008jff-1N
	for ath12k@archiver.kernel.org;
	Tue, 25 Jul 2023 23:45:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOQhy-008ejI-0r
	for ath12k@lists.infradead.org;
	Tue, 25 Jul 2023 22:40:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36PMQoeG020870;
	Tue, 25 Jul 2023 22:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=PFUbhwWNmxyiL7SbYzd0Vl2bo/toQY9AVNp04fCJHlQ=;
 b=dtPbt8cDqB/vwWwcvTN5JTeyHwZdxkhYOROX5tRyf3Gq8PTqn5iJg0wx38Ku4Y5QaudK
 VqzMYhE4gTmpbS0nrX6sO15goHrjzcJhEtDmIxZg/MKXjYKHnOsYH1VPRMl1INym/eGk
 FpeyOxq5srcHqjxOrYHTrXFdG3bf5fWS+AI+VkcJ09yZmx/nw3+mmfolZ2EZshlyW37g
 8uAqQ6gtDiUhKpPpT1UE4lSQI4wY6iLjNtBs7jVF0nFBzq2BEAvcdBwsp8dCeqGkIkR5
 Vqb4tTcpn4KC/BAhQhh3dMqZmBmPXXJ8aKR3Qs/xPmoN4gpkGrKMF2x1g9jiA1fK2u8g Gg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s2dauhfa2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:45 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36PMejxE022981
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jul 2023 22:40:45 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 25 Jul 2023 15:40:44 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v5 00/11] wifi: ath12k: (v5) EHT support
Date: Tue, 25 Jul 2023 15:40:23 -0700
Message-ID: <20230725224034.14045-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 44Oshj-ejWws08nkcut4YXKy8Z0fjM2o
X-Proofpoint-ORIG-GUID: 44Oshj-ejWws08nkcut4YXKy8Z0fjM2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_12,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 mlxscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307250193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230725_154046_308008_D9EDBA8F 
X-CRM114-Status: GOOD (  13.11  )
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

v5: Addressed comments v4 on patches #3, #4 and #6, changelog included
in the respective patches.
v4: Modified patch 3 to support WCN7850.
v3: Modified patches 6 and 9 to fix some issues,
changelog included in the respective patches.
v2: This version modifies only few commit descriptions,
changelog included in the respective patches.

Following list gives the details for each patch.
1-4: Propagation of EHT capabilities from target to userspace.
5: Addition of EHT phy modes.
6-9: EHT related additions in peer association.
10: Process the new WMI service ready ext2 event.
11: Preamble puncturing support.

Aloka Dixit (9):
  wifi: ath12k: rename HE capabilities setup/copy functions
  wifi: ath12k: move HE capabilities processing to a new function
  wifi: ath12k: WMI support to process EHT capabilities
  wifi: ath12k: propagate EHT capabilities to userspace
  wifi: ath12k: prepare EHT peer assoc parameters
  wifi: ath12k: add WMI support for EHT peer
  wifi: ath12k: peer assoc for 320 MHz
  wifi: ath12k: parse WMI service ready ext2 event
  wifi: ath12k: configure puncturing bitmap

Muna Sinada (1):
  wifi: ath12k: add EHT PHY modes

Pradeep Kumar Chitrapu (1):
  wifi: ath12k: add MLO header in peer association

 drivers/net/wireless/ath/ath12k/core.h |  24 ++
 drivers/net/wireless/ath/ath12k/mac.c  | 543 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h  |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 252 +++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 116 +++++-
 5 files changed, 827 insertions(+), 110 deletions(-)


base-commit: 9102ee8eaa6d29624ed2068396502ad8545f2ff0
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
