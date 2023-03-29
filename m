Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DDDFC74A5B
	for <ath12k@archiver.kernel.org>; Wed, 29 Mar 2023 23:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jKLM7vJtRUW/zbGKJWQr8iLIHCsemVMjDNe3mLYqeEo=; b=oYRxmkDTAM9FSh
	pGuUdHtlli6OZrLVbPx6zfYAb7NJCe6C4VJ3yWPsInRVuSXB3vczEc4gk289Zb3H1Aw6DaEX5u0c1
	FVEJifhR9iJDLFFhzvN/GeCrhHl9me4iYn0C/mwZjzWZZ9uNn1I5webQJ+bRjJnIDlhPj1nFgEpoj
	w6OvroDilkJjYu6rK8a+KQlJKpGdwdsuPWR6zv09d40FE81tR7uOtv1mxb01L/AKH5Hc9JFGycn3L
	TmbC2RXQ5a4QUKm6yW7odTRl7jyXracb+RW4xVSJFykOOIw3FrEum6xCGP+kVoyVdrGMEUuLhTBy1
	wfwHS6r0/VD4lOVe2Y4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phexW-0021w8-2m
	for ath12k@archiver.kernel.org;
	Wed, 29 Mar 2023 23:12:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phexT-0021vA-36
	for ath12k@lists.infradead.org;
	Wed, 29 Mar 2023 23:12:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32THU2qE005487;
	Wed, 29 Mar 2023 23:11:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=RYPAU6ANILW/CzikItkl+7Nb5owRDYBVCaM86zZMZfE=;
 b=M8STbDI3Ys4gQui/65Zhv9Hk7qhVhkzpWrKsrQVMGT3KvTBWXJDMPo+ujEULYxWh/A7t
 O6VmZeOa9MGLxgpy4nZZWeoSsL7Uz1z4HeqURVwdsb+TSCnSPeoNxezfSWgY+hkBxsFB
 dRYOutzdNRv7Nm5sjpDc4wGEDF5V4U4W5eV34IlZ9MTlEYoXgpg8Prab1Ql/ye88HcUz
 6IwQcByEKGlcMkyt5EhCpRogHfCg2APFQlNOTyypIitiV8DmrPR4rBCwglz1QBSmKAux
 i5LRVub71GTkTedLblbklahk4zXTJ7N97PG7RO97XNf6IV2W56QBXXJoreVZNYBaHbK+ aQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pmgpm2bmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:11:58 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32TNBvBH027600
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Mar 2023 23:11:57 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Wed, 29 Mar 2023 16:11:57 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH 00/11] wifi: ath12k: EHT support
Date: Wed, 29 Mar 2023 16:11:34 -0700
Message-ID: <20230329231145.20171-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: mcXIab2M80XXcx92lXKz3T-VSr22kWj-
X-Proofpoint-ORIG-GUID: mcXIab2M80XXcx92lXKz3T-VSr22kWj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-29_14,2023-03-28_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=876 phishscore=0
 adultscore=0 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2303290173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_161200_117103_635FFB1A 
X-CRM114-Status: GOOD (  12.41  )
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

Add EHT support in ath12k.

The patches are as follows:
Patches 1 - 4: Propagation of EHT capabilities from target to userspace.
               Patches 1, 2 refactor the existing code to make EHT
	       additions easier.
Patch 5: Addition of EHT phy modes.
Patches 6 - 9: EHT related additions in peer association.
Patch 10: Process the new WMI service ready ext2 event.
Patch 11: Preamble puncturing support.

Aloka Dixit (9):
  wifi: ath12k: rename HE capabilities setup/copy functions
  wifi: ath12k: move HE capabilities processing to a new function
  wifi: ath12k: process EHT capabilities from target
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

 drivers/net/wireless/ath/ath12k/core.h |   9 +
 drivers/net/wireless/ath/ath12k/mac.c  | 555 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/mac.h  |   2 +-
 drivers/net/wireless/ath/ath12k/wmi.c  | 218 +++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h  | 116 +++++-
 5 files changed, 790 insertions(+), 110 deletions(-)


base-commit: bea046575a2e6d7d1cf63cc7ab032647a3585de5
-- 
2.39.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
