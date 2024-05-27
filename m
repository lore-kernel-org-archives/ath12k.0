Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 436C7C25B78
	for <ath12k@archiver.kernel.org>; Mon, 27 May 2024 07:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y8NF87JfZso3zXbCR7u0zYAI6jLGxKAW6zc/ic8PYWs=; b=bJmqoSJED7YM+xwjNO7ke8ZdvE
	Gd3B2YxZQAC1F9giYI9zoY/z+7TTsvwZeYO46+4yoSplNh0fhB0Cnaf9ZMRAtcsg2VTVOzTFbQ2IS
	KxD8k5GUSVYaVmjEGHwDMe49hvK3VxjfLBbBeGdbv4JFcl5LbngzcVQekyvAxxU7Nwo90ktJ06880
	nKo9I4+IqZkNOlUswaOSsPZWcsYUyAXtAd/lUujI33t5wfncHUFo4B/CJ03tAbB7pz7Sor7SkNca6
	n2n8zsjxQfBDdhqtq3HL2eUzB6/TD4+dERNz6Z4fzedtdcbzFc6Jkvv57jsKwMQCzII8nnjMe9gdx
	zru278RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvI-0000000E5Ud-3uxs
	for ath12k@archiver.kernel.org;
	Mon, 27 May 2024 07:37:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBUvG-0000000E5TR-1jO9
	for ath12k@lists.infradead.org;
	Mon, 27 May 2024 07:37:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44QNstHd003394
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=y8NF87JfZso3zXbCR7u0zYAI6jLGxKAW6zc
	/ic8PYWs=; b=WtUq2syAxVm1ai5fMKiJcBSkjOTU/mYa8PNivRswLuY3s3AmVFq
	wtNB8PI3b15gvP25Ld8MO73SpBzTtOPsC2AeWvDRaIXK5kMdnNxZyw8rk7+klWsx
	vfsg9uzXi/6wUFbX/n+UvF9xyTuydbdqYOWlMvvV49QLNbsGkbU2fGGDyW+xma0H
	qyBnRDbjVcwc4v9nfGrsPUBxQxAlikPQDW3Bqb7ZVsKWEwni4sJfIyK3Dodh4ir4
	+7gf83r+Yi0wg3WpUTe+n9C3hSR1ePq8L2X0rgE3Ef7j+EDCYj5CLXxoRBWBBDoh
	Aj7X1P5KxkZ5KN1ei4yRd1+I0scHybWUJPg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2h2vxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44R7bS63017186
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3yb92k9as2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:28 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44R7bSDJ017181
	for <ath12k@lists.infradead.org>; Mon, 27 May 2024 07:37:28 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-hprem-blr.qualcomm.com [10.190.108.75])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 44R7bSql017180
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 07:37:28 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 4146166)
	id 36E7D4114B; Mon, 27 May 2024 13:07:27 +0530 (+0530)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH v6 0/8] wifi: ath12k: Introduce device group abstraction
Date: Mon, 27 May 2024 13:07:15 +0530
Message-Id: <20240527073723.2520319-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: O8V7sRU8rakDIICtt4F1DyY2WvYJr7N3
X-Proofpoint-ORIG-GUID: O8V7sRU8rakDIICtt4F1DyY2WvYJr7N3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=648 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405270061
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_003734_606885_156E86C8 
X-CRM114-Status: GOOD (  13.29  )
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

To support multi-link operation, multiple devices with different bands say
2 GHz or 5 GHz or 6 GHz can be combined together as a group and provide
an abstraction to mac80211.

Device group abstraction - when there are multiple devices that are
connected by any means of communication interface between them, then these
devices can be combined together as a single group using a group id to form
a group abstraction. In ath12k driver, this abstraction would be named as
ath12k_hw_group (ag).

Please find below illustration of device group abstraction with two
devices.

                 Grouping of multiple devices (in future)
+------------------------------------------------------------------------+
|  +-------------------------------------+       +-------------------+   |
|  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
|  |   | ar (2GHz) | | | | ar (5GHz) |   |       |   | ar (6GHz) |   |   |
|  |   +-----------+ | | +-----------+   |       |   +-----------+   |   |
|  |          ath12k_base (ab)           |       | ath12k_base (ab)  |   |
|  |         (Dual band device)          |       |                   |   |
|  +-------------------------------------+       +-------------------+   |
|                 ath12k_hw_group (ag) based on group id                 |
+------------------------------------------------------------------------+

Say for example, device 1 has two radios (2 GHz and 5 GHz band) and
device 2 has one radio (6 GHz).

In existing code -
        device 1 will have two hardware abstractions hw1 (2 GHz) and hw2
        (5 GHz) will be registered separately to mac80211 as phy0 and phy1
        respectively. Similarly, device 2 will register its hw (6GHz) as
        phy2 to mac80211.

In future, with multi-link abstraction

        combination 1 - Different group id for device1 and device 2
                Device 1 will create a single hardware abstraction hw1
                (2 GHz and  5 GHz) and will be registered to mac80211 as
                phy0. similarly, device 2 will register its hardware
                (6 GHz) to mac80211 as phy1.

        combination 2 - Same group id for device1 and device 2
                Both device details are combined together as a group, say
                group1, with single hardware abstraction of radios 2 GHz,
                5 GHz and 6 GHz band details and will be registered to
                mac80211 as phy0.

Add base infrastructure changes to add device grouping abstraction with
a single device.

This patch series brings the base code changes with following order:
        1. Refactor existing code which would facilitate in introducing
           device group abstraction.
        2. Create a device group abstraction during device probe.
        3. Start the device group only after QMI firmware ready event is
           received for all the devices that are combined in the group.
        4. Move the hardware abstractions (ath12k_hw - ah) from device
           (ath12k_base - ab) to device group abstraction (ag) as it would
           ease in having different combinations of group abstraction that
           can be registered to mac80211.
v6:
  - Addressed smatch error seen on "[PATCH v5 8/8] wifi: ath12k: move
    ath12k_hw from per soc to group"
  - Rebased to ToT
v5:
  - on "[PATCH 8/8] wifi: ath12k: move ath12k_hw from per soc to
    group", refactor the ath12k_mac_hw_allocate() api based on ag rather
    than ab and update hardware abstraction array size in ath12k_hw_group
    as ATH12K_GROUP_MAX_RADIO.
  - Rebased to ToT
v4:
  - Modified the cover letter
v3:
  - Removed depends-on tag of "wifi: ath12k: Refactor the hardware recovery
    procedures" as it is merged to ToT
  - Addressed the deadlock warning seen during rmmod.

v2:
 - Rebased to ToT

Karthikeyan Periyasamy (8):
  wifi: ath12k: Refactor core start api
  wifi: ath12k: Add helpers to get or set ath12k_hw
  wifi: ath12k: Add ath12k_get_num_hw api
  wifi: ath12k: Introduce QMI firmware ready flag
  wifi: ath12k: move ATH12K_FLAG_REGISTERED flag set to mac_register api
  wifi: ath12k: Introduce device group abstraction
  wifi: ath12k: refactor core start based on hardware group
  wifi: ath12k: move ath12k_hw from per device to group

 drivers/net/wireless/ath/ath12k/core.c | 431 +++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/core.h |  87 ++++-
 drivers/net/wireless/ath/ath12k/dp.c   |  19 +-
 drivers/net/wireless/ath/ath12k/dp.h   |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 117 ++++---
 drivers/net/wireless/ath/ath12k/mac.h  |   9 +-
 drivers/net/wireless/ath/ath12k/pci.c  |   2 +
 drivers/net/wireless/ath/ath12k/qmi.c  |  10 +-
 8 files changed, 544 insertions(+), 133 deletions(-)


base-commit: f8320064a28242448eeb9fece08abd865ea8a226
-- 
2.34.1


