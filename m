Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14286C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 05:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=13j3o0wpKKEex9/Mpqwhfgs3weNPfKWZt/RNfDqxUCE=; b=rmRJ0rSTDwC6QubhgGgM3zhXAx
	5Dp1RFTbFRYml9NPhihY2W/Wu/5D4lCHb1p1CG/NuErvAINJ9P7sODjuR7wK9mpSNq7rzO6vES73P
	ED02YpOtDp2LHgtMA19oXM/O72JNs+fo0eA6UsLKh6pmi702nRyEUbRvh9AML1zd6ANyy/VkPozL7
	w7zD9tYWFo8yrGv6yMOTDNfPy5ZXs2Z2kuzXThyIrkT9kU0ubI7FnTfv8STFwKA2cV6adri3o2Ew4
	yI3JTlVBDxIEF5dFQ7gW0IJPAE3nWhybFhm8vv2ZjT4MY1r8t1vlBLZpgjOQbfnAhoxuHCAPhVxw4
	H1yA90gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLl-00000005BRF-2n2l
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 05:48:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1gLh-00000005BPE-31S0
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 05:48:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U49lIm022193;
	Tue, 30 Apr 2024 05:48:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=13j3o0w
	pKKEex9/Mpqwhfgs3weNPfKWZt/RNfDqxUCE=; b=mVklaYblJI47dtHgWdrtbsn
	x1SbMNc3DWoTZn8t28+DT9isZaWNf4BW4ax7rw9DqVuHLGE+38Iaip0QJ3kqaq/w
	dUnEH/9hSZ2Samt9B/u7aFa6DdUWodR3Ri38QYFc5wxvDIIkjKSuZUjZ4JDvJgf7
	Qo581nO/CO8vEW1+vyd2CdrOnCvCb+s3HHL7WIZNa/U3Db05+gYyZfHUly9HHwVt
	CqJaWZ0Q0rnUFJY4+pNNoNSL2qu8v3YpokEbUqIz9sS96/ZLjvnCtmMaDBT+JeHc
	DubiQvg6jCEhVH6lzvDX84RN16cgr5N3T6SaMMmlpI4afimHDoIRtdJjQZh9mZw=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtrep0cdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43U5mFJ4020623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 05:48:15 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 22:48:13 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Add multi device support for WBM idle ring buffer setup
Date: Tue, 30 Apr 2024 11:17:55 +0530
Message-ID: <20240430054759.722620-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ezlRTT8Qp8Hd37SBzJY81z88ixpO8_Fs
X-Proofpoint-ORIG-GUID: ezlRTT8Qp8Hd37SBzJY81z88ixpO8_Fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_02,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=674 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_224817_852618_4D7CB943 
X-CRM114-Status: UNSURE (   9.07  )
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

Refactor the WBM idle ring buffer setup to scalable for inter device
multi-link operation.

Note: This patchset rebased on top of below patch series
 [PATCH v2 0/8] wifi: ath12k: Introduce device group abstraction
 Link: https://lore.kernel.org/all/20240425055759.1181165-1-quic_hprem@quicinc.com/

Karthikeyan Periyasamy (4):
  wifi: ath12k: Replace "chip" with "device" in hal Rx return buffer
    manager
  wifi: ath12k: Refactor idle ring descriptor setup
  wifi: ath12k: use device index to advertise MLO parameter
  wifi: ath12k: add multi device support for WBM idle ring buffer setup

 drivers/net/wireless/ath/ath12k/core.c  | 10 +++++++++
 drivers/net/wireless/ath/ath12k/dp.c    | 27 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  5 +++--
 drivers/net/wireless/ath/ath12k/hal.c   |  5 +++--
 drivers/net/wireless/ath/ath12k/hal.h   | 21 ++++++++++---------
 drivers/net/wireless/ath/ath12k/qmi.c   |  4 ++--
 7 files changed, 54 insertions(+), 19 deletions(-)


base-commit: 861928281f22a08e3d258ebcfe7159d729ec07d4
prerequisite-patch-id: 4bc84a4f5b10ebc28db60c5167abdaf343a1619d
prerequisite-patch-id: ea87d2f46dbd5e7c82d5df02934906e219aa8388
prerequisite-patch-id: e08d8632dcde9e891d37b538832b4ecfed140d9e
prerequisite-patch-id: bc2c9455c9175c27b8b68f6f41d468b258007478
prerequisite-patch-id: 00966c65589af8a50078fea94630cbe355f0dacf
prerequisite-patch-id: 4bd8ce903cd89ae536109922f65f128ed1d4307c
prerequisite-patch-id: 54fe8eb540a77804c8befeb695b61756c133b56f
prerequisite-patch-id: 06244ca08d9bed3834dc5315470a19d096d749ee
prerequisite-patch-id: 8e7575808b1c498d81b606777153e0e2d4ee99bd
prerequisite-patch-id: 1baa4ce64b2054e82e117cfbe29f85870def37c7
prerequisite-patch-id: 733cb4a1e0d02079820d8306a3da88fe2d35b06c
-- 
2.34.1


