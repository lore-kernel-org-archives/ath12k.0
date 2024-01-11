Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4094FC47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 04:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6FErVX5W/bUm/MFm/7oAeQOzrBCMaMPj+fJTtWpP9ZE=; b=qm52pDzmgh3bw75pEaUCuKB6ma
	8H9H2LsPcE0nEJV84Vxj4crHdn27jqMY0A0lOkfw/FRhYt0O58H0rH6C0N/kTjmLF573JXkc7JWzT
	HoyPwLs7rGjTmlvdyyQbsjQVloScXNXYdZNlqux/xiSot6bnVECqFqggHt+n9Mc9MsDcWwGE/HZgx
	TD0kgape9FaEmVm8knHAkFQVcPh+kDpVaXWAMxDWgCZivFPI/lks9tLhAOe8AE08ZkDA/Y8GCu1In
	wIAIIIFwBiDCGw87JC5DEOXpLWKlgYard53Ogf5t0tfPabQFNwoFz783NOS55LQlTvOizXclbxfqi
	3EFMO1FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2P-00FrDT-2M
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 04:51:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNn2M-00FrB2-08
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 04:51:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40B40F1m026249;
	Thu, 11 Jan 2024 04:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type; s=
	qcppdkim1; bh=6FErVX5W/bUm/MFm/7oAeQOzrBCMaMPj+fJTtWpP9ZE=; b=Eo
	T+3U8dLsa8zSUHWKtvjMaNHtSaD3tM0XtJ2JW5KDiWCoU0P7ANe7pJXd/RSb1Ksi
	1nVdHVIXAcIdTUbBujBW9eMaGlt7ePonFIpvybnbHXGZyDkxJHsfsdb+VyOqcKjq
	g6JpdupE97uq97Q3vpI7R7Cwtw28wEC+pWk3PdtPoXoOatvtD0R3nwdhbsLUovIE
	PIP3ElogMwxrPOcv9FqHknaNgemRESC7wlHyVffYtF2PHeGRJSibiNmJ1EZbWahD
	Q4msghhu4Ia/5gD+1YA0+Hwk4CSed2WCdRSL0cQR6LxSP/bO76yRJTZWjw0MFuB2
	x55/WNAo2oaSMNDrvY4g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vhvwx1nks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40B4pJTc017245
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 04:51:19 GMT
Received: from srirrama-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 10 Jan 2024 20:51:17 -0800
From: Sriram R <quic_srirrama@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH 00/12] wifi: ath12k: Add single wiphy support
Date: Thu, 11 Jan 2024 10:20:33 +0530
Message-ID: <20240111045045.28377-1-quic_srirrama@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: qnM-VZMhey66zJ3ycxBSd1Sh8FK1EXX6
X-Proofpoint-ORIG-GUID: qnM-VZMhey66zJ3ycxBSd1Sh8FK1EXX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 mlxlogscore=642 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401110035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_205126_098301_1224C3F9 
X-CRM114-Status: GOOD (  10.01  )
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

This patchset covers the basic mac80211 ops for an interface bringup
and operation.

Note:
In addition to sanity on single radio QCN9274 and WCN7850
the single wiphy changes are tested over "wifi: ath12k: QCN9274 dualmac bring up"
where multiple radios in the dualmac SoC are combined and tested.

Monitor and hw reconfig support for Single Wiphy will be done in future
patchsets.

This patchset is dependent on "[PATCH 0/2] wifi: ath12k: Introduce hw abstraction"

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

 drivers/net/wireless/ath/ath12k/core.h |   40 +-
 drivers/net/wireless/ath/ath12k/hw.h   |    3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 1014 +++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/reg.c  |   62 +-
 4 files changed, 886 insertions(+), 233 deletions(-)

-- 
2.17.1


