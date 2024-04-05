Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7521CCD11C2
	for <ath12k@archiver.kernel.org>; Fri,  5 Apr 2024 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fdkd0XHD89ZbnG/alY/Inj0QyEas9iRiB5CkNkJnE2g=; b=w/rUEDwySdxVWN8DveeLkrXP+s
	obYb4V5FzimpubS+ReqkpNi0QXxZMZWyeivXyA4AsIdLL8NUROI3I431u7/Mg8JcSfj6deBLGqlq+
	fhmzVJLtlM657MDjOpZxG2EuuGjntQ+aMDtKPa6dFXzYkLMN++dmCC/CGLtuJ6rlJv6+M/G/oyt+k
	s/VC06lJdETqxYmJaGH8H2MUk9/24Cb3qaVJdpu+bC4KR/589G4WADHPC5UE+DTCkhZDJfPnVIMjk
	LhszH7wAF3ifsAySphO3wy5jwkdzot+Hd66TAvOnfXffMiYdZ1XQoK8F/rl5ojh5qmdTFxzDxDazx
	FYElK0Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspVO-00000008geO-3iY1
	for ath12k@archiver.kernel.org;
	Fri, 05 Apr 2024 19:45:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rspVL-00000008gcp-0b4B
	for ath12k@lists.infradead.org;
	Fri, 05 Apr 2024 19:45:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 435Hvbef005830;
	Fri, 5 Apr 2024 19:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Fdkd0XH
	D89ZbnG/alY/Inj0QyEas9iRiB5CkNkJnE2g=; b=Ya4J4Phb9Go52CSzCE4INYL
	ZgU592d8mK1ZeITgUcyJkNwei5zBgLF+LP1pT2oZvcg/hLhmv75Zk6nCY2n22wHN
	3KM9vjyenuQ+edBjyGvxTF7ELB0YL2ZsN7KKkn6mGaT6l+Cn6jbI6ZtkEotpewXD
	aXU+HoDpOfUl9Cliqmc9nwQD2rxkE0A+8Px1xaT82FnaTt8KzNP1C/UkI8bai6n1
	EuIjUU+lVteZTBHgD5QIxgRvvUil1aCTXPH1JKkOjXXJpY8k8RuXtCeAUFCM3UvA
	kcyko40/XIihtVwUbfDEF4xWfXZC+5bruLA1fVMpawutO9rccMRwJ1HwrW7x8lQ=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xahb10yvm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 19:45:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 435JjXeD017827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 Apr 2024 19:45:33 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 5 Apr 2024 12:45:32 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v7 00/12] wifi: ath12k: Add single wiphy support
Date: Sat, 6 Apr 2024 01:15:07 +0530
Message-ID: <20240405194519.1337906-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dsg6HE939dYrbNyqS0p0FshmjrYi1MWm
X-Proofpoint-GUID: dsg6HE939dYrbNyqS0p0FshmjrYi1MWm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_21,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404050138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_124539_328829_81893D0C 
X-CRM114-Status: UNSURE (   9.92  )
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

From: Sriram R <quic_srirrama@quicinc.com>

With the introduction of Multi Link Operation (MLO) support in
IEEE802.11be, each EHT AP/non AP interface is capable of
operating with multiple radio links.

cfg80211/mac80211 expects drivers to abstract the communication
between such Multi Link HW and mac80211/cfg80211 since it depends
on different driver/HW implementation. Hence the single wiphy
abstraction with changes in datastructures were introduced in
"wifi: ath12k: Introduce hw abstraction"

This patchset extends the implementation to allow combination
of multiple underlying radios into a single composite hw/wiphy
for registration. Since now multiple radios are represented by
a single wiphy, changes are required in various mac ops that the
driver supports since the driver now needs to learn on how to tunnel
various mac ops properly to a specific radio.

This patchset covers the basic mac80211 ops for an interface bring up
and operation.

Note:
Monitor and hw reconfig support for Single Wiphy will be done in future
patchsets.

---
 v7:
 - Added get/put cache routines on PATCH 07/12

 v6:
 - Fixed print message typo in PATCH 05/12
 - Modified ath12k_mac_assign_vif_to_vdev() of PATCH 05/12 to
   not have multiple jump statements.
 - Modified PATCH 07/12 to have whole cache allocated dynamically &
   fixed cach flush in casewhere we reuese vdev created on scan.

 v5:
 - Addressed Jeff's comments
 - Made arvif config cache to be dynamic in PATCH 07/12

 v4:
 - Updated missing Signed-off details for patches.

 v3:
  - Rebased on ToT (added additional ar check in PATCH 08/12 for p2p)
  - Introduced iterator to loop through ars in an ah(for_each_ar())
  - Addressed comments on reverse xmas tree declaration style.

 v2:
  - Rebased on ToT and dependent patchset

Karthikeyan Periyasamy (1):
  wifi: ath12k: add multiple radio support in a single MAC HW
    un/register

Sriram R (11):
  wifi: ath12k: Modify add and remove chanctx ops for single wiphy
    support
  wifi: ath12k: modify ath12k mac start/stop ops for single wiphy
  wifi: ath12k: vdev statemachine changes for single wiphy
  wifi: ath12k: scan statemachine changes for single wiphy
  wifi: ath12k: fetch correct radio based on vdev status
  wifi: ath12k: Cache vdev configs before vdev create
  wifi: ath12k: Add additional checks for vif and sta iterators
  wifi: ath12k: modify regulatory support for single wiphy architecture
  wifi: ath12k: Modify set and get antenna mac ops for single wiphy
  wifi: ath12k: Modify rts threshold mac op for single wiphy
  wifi: ath12k: support get_survey mac op for single wiphy

 drivers/net/wireless/ath/ath12k/core.h |  38 +-
 drivers/net/wireless/ath/ath12k/hw.h   |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 942 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/p2p.c  |   3 +-
 drivers/net/wireless/ath/ath12k/p2p.h  |   1 +
 drivers/net/wireless/ath/ath12k/reg.c  |  55 +-
 6 files changed, 812 insertions(+), 228 deletions(-)


base-commit: 007c5443ab7bba338f81bf6ebc64375257c6af41
-- 
2.25.1


