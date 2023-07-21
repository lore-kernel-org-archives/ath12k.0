Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3F6C0015E
	for <ath12k@archiver.kernel.org>; Fri, 21 Jul 2023 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RkFgUHA5H6J9ZCsPzLEeswODsEqHD5IBdFIFxEF8tSM=; b=I3gsH80dVzoxsT
	8KWdipo9rNSQTlkJ8Sss2IrSYmfhGjkY7gmBA5fO2itD3cBDHIHTwKmLgRZ2sHqx2fJDlufdcBVNl
	iOmWCZDIQtnedWWR/h/DTCrXiPQ4iZBVOOK/UmMxNJBMdm7Nag3E6Iu64nsXk/BTO0WLs6jSXUQ37
	oXNsRoYCapvtTiC1Iq7ehNWnHDThyJ6CykKSxFahS85PMws9+Dw9Yz87IC/KALXZZ30yBRALP1lcs
	fwZ/9xqxgmoFs92AGqXYILRYKdq4t5yWiu0RTKEBolqoBDbB+7ORZfaBCBJzqzd6tMZBkMqxeErZz
	Gvn+S5ZQwekkDWleNd0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz6-00CdWU-0W
	for ath12k@archiver.kernel.org;
	Fri, 21 Jul 2023 02:35:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMfz0-00CdUB-1u
	for ath12k@lists.infradead.org;
	Fri, 21 Jul 2023 02:35:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36L0oxu7006767;
	Fri, 21 Jul 2023 02:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=xdB3HCkQK/4WR/kMTZeZ3SvbLyyXK0Lqg0JvsGOnMwU=;
 b=nW2wNNa6VSYHvrUZDz+jNZIxspiFb6+3xcxRfwUkkDhI9iFoQm2gpFqZQ4QZmtJ5NHDv
 z1+oM2epPVSu7ea+NXtToT4BaIK95nnJyLu7yvxlDv7/vSji5jLH6J6/KSVRsPZiqhPA
 AlIUxnZYySH3EL6HWebcWSYt6FeUgYAM70Loa3Z1kLdn1j0lf1A9RqUEDTBbaoFAOAmA
 dNvKmPGT0cDHkNWPK82epH8uV9XmvYG8T/p+xAfqDY8qsnhT5/Itu8P8OUgI4mI53vIx
 TiwOtpuaISsLipuWt2IgSkcFnxylAqk8NaaYqNYF+UniLnFIV81Md2s1ZGPD5C7PDvUl Hg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxxqv2mkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:01 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36L2Z0eB011455
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 02:35:00 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 20 Jul 2023 19:34:59 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [RFC 0/3] ath12k: Make suspend/resume work for WCN7850
Date: Fri, 21 Jul 2023 10:34:43 +0800
Message-ID: <20230721023446.3706-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T47WrBlhrsDAog_vz4Ndqh9N_OK9GbA0
X-Proofpoint-GUID: T47WrBlhrsDAog_vz4Ndqh9N_OK9GbA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-20_12,2023-07-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 mlxlogscore=402 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307210021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_193506_770944_13C3C9B9 
X-CRM114-Status: GOOD (  13.39  )
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

This patch set flushes all data and management packets before
suspend, so the 500ms delay workaround in ath12k_core_suspend
is not needed and removed.

Due to MHI bugs, at the moment we are not able to shutdown and
fully power off the device. As a workaround we put firmware to
WoW state to make sure no unexpected activities while host is
in suspend.

With all suspend/resume functionality implemented, we change
supports_suspend to true for WCN7850 to make it work.

Baochen Qiang (3):
  wifi: ath12k: Flush all packets before suspend
  wifi: ath12k: Put firmware to WoW state during suspend
  wifi: ath12k: Turn on suspend/resume switch for WCN7850

 drivers/net/wireless/ath/ath12k/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/core.c   |  31 ++++-
 drivers/net/wireless/ath/ath12k/core.h   |   4 +
 drivers/net/wireless/ath/ath12k/hw.c     |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c    |  44 ++++--
 drivers/net/wireless/ath/ath12k/mac.h    |   1 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 107 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    | 165 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c    |  74 ++++++++++
 drivers/net/wireless/ath/ath12k/wow.h    |  30 +++++
 10 files changed, 442 insertions(+), 17 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h


base-commit: b21fe5be53eb873c02e7479372726c8aeed171e3
-- 
2.25.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
