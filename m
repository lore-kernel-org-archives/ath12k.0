Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E72C04FFE
	for <ath12k@archiver.kernel.org>; Wed,  8 May 2024 20:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6umCKlz8QXrWrUgmeJKBy51fG0HofSZLDLKhMe9MMA=; b=sRXWSPC+5nGNuIE1YXZG/KJ0w3
	+JLqtfcXoJP/dD0Hzz6ZgdOOBheSCC8iN7RRSgOJIsUmxZyiWU4NmsHxRKnMgwujWt0M5lIsTKgME
	6prrM08Adb056q7GhTlkycPyT5d/4/tideIaMafJzHCPrGr3uwrvCysUUSUOl50IFxBq7CZcr/Fkv
	s+TC+G6YmHjnzqg0Kr3cWBGCkOtPuesGtJMAHXowIubR/5iAX8oOvj9UwBUBzIVNR31DoM3FWzdg7
	fPHyhhE3TkGSHsrUiFl1E1mRraunaozYfhFBXxeHAziFH+HQ+RZHemo8JWJ9FUZJH01rfzReW24mO
	8/oQF6+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuy-0000000GtQn-3FWq
	for ath12k@archiver.kernel.org;
	Wed, 08 May 2024 20:29:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4nuv-0000000GtNg-2byF
	for ath12k@lists.infradead.org;
	Wed, 08 May 2024 20:29:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 448CXBW8005908;
	Wed, 8 May 2024 20:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=N6umCKl
	z8QXrWrUgmeJKBy51fG0HofSZLDLKhMe9MMA=; b=X0r2oDQbyfv/xUCyd3lwEku
	4p1mNlQFv8qGqHPMAYN8E8fKllam9tgkNZnrOJ9Pd5Ie+ga8ij5t9z56qbbaNzZG
	GoNPbJUTgqVKE0TM1DuGdbutcoaq59i/Qe82OqwwUi/zmiPRpYwTgh3hZi/vN8k0
	FbAZWl03kNloxeegmkUTMzKEuHzX6wiERhHECE2rS0balIkLeFeRwDcRRNaw/Y9F
	4flEIERJQgWUGZ2Aqkl2aT6yCd+tF+tZctaiSKhZ++Jp1hqp6Qr5zeFbr1aVMw5i
	bHI6WsfWebrA3dPvjo+Z6E8TQ93Ebrv3IHRuwKwbdT+IqeIwqGsziUeU6DoFcEw=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y09geh25n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 May 2024 20:29:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 448KTM8I007881
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 8 May 2024 20:29:22 GMT
Received: from alokad-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 8 May 2024 13:29:22 -0700
From: Aloka Dixit <quic_alokad@quicinc.com>
To: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
CC: Aloka Dixit <quic_alokad@quicinc.com>
Subject: [PATCH v2 0/9] wifi: ath12k: MBSSID and EMA AP support
Date: Wed, 8 May 2024 13:29:03 -0700
Message-ID: <20240508202912.11902-1-quic_alokad@quicinc.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 98Cd6-4mhXEh4XvEhfsDeM9_9qOe0BZj
X-Proofpoint-ORIG-GUID: 98Cd6-4mhXEh4XvEhfsDeM9_9qOe0BZj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-08_09,2024-05-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 mlxlogscore=920 impostorscore=0 clxscore=1015 adultscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405080151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_132933_708076_E5E1FCE6 
X-CRM114-Status: UNSURE (   7.76  )
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

Add support for multiple BSSID (MBSSID) and enhanced multi-BSSID
advertisements (EMA) features in AP mode. Set extended capabilities,
WMI resource configurations to advertise the driver support to
userspace and to firmware. Configure each MBSSID profile by sending
BSSID index, total BSS count to firmware. Retrieve and propagate
MBSSID/EMA beacon templates to firmware. Set the arvif security
parameters for non-transmitting profiles.

v2: Rebased v1 patches, no functional change.

Aloka Dixit (9):
  wifi: ath12k: advertise driver capabilities for MBSSID and EMA
  wifi: ath12k: configure MBSSID params in vdev create/start
  wifi: ath12k: rename MBSSID fields in wmi_vdev_up_cmd
  wifi: ath12k: create a structure for WMI vdev up parameters
  wifi: ath12k: configure MBSSID parameters in AP mode
  wifi: ath12k: refactor arvif security parameter configuration
  wifi: ath12k: add MBSSID beacon support
  wifi: ath12k: add EMA beacon support
  wifi: ath12k: skip sending vdev down for channel switch

 drivers/net/wireless/ath/ath12k/hw.h  |   1 +
 drivers/net/wireless/ath/ath12k/mac.c | 324 +++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/wmi.c |  40 +++-
 drivers/net/wireless/ath/ath12k/wmi.h |  46 +++-
 4 files changed, 345 insertions(+), 66 deletions(-)


base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
-- 
2.39.0


