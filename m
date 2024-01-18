Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07800C47258
	for <ath12k@archiver.kernel.org>; Thu, 18 Jan 2024 01:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cF8r4mDc78o5m4S2Td8i1eIbLHuelBPWcR6tMD1JcFc=; b=xUT5fenM7t/wQv9hdoXlKwQEEl
	SJk/r67C3EeP+CJlAX1Fr0pErmDdnssETzRr+kwrklMT4TSIlOiUREs/fgLYEDHtLg78EV78lAQ+5
	8l365myMR77akVzl8idw+OaOVwusoBhBZljHOPeW83fKPoy4hnGFd0nDNJd8mJHpD4yhQv6hpH/VG
	QvesRogRsVFMU4+r2prOSjAARjVPXIlyuAZwYDZVSlq3zAK2TcdAmSDxinCZfTErV2pz784B/q8Gw
	eBTnYJvAcnv7FhKVbIO9w6VbWMFWm5BNME2//W8gGEOUf+MIZPjr+bo0Ty93KpqcvVfMkqQ4sJPOY
	4ljeN7Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQGou-001F4P-0R
	for ath12k@archiver.kernel.org;
	Thu, 18 Jan 2024 01:03:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQGoq-001F3E-3D
	for ath12k@lists.infradead.org;
	Thu, 18 Jan 2024 01:03:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40I12ZOn027144;
	Thu, 18 Jan 2024 01:03:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=cF8r4mD
	c78o5m4S2Td8i1eIbLHuelBPWcR6tMD1JcFc=; b=b6swsY6HcEACSfi1x6BajYe
	x81DuHfV8NFv/6FQDtUwal9x/DZvHIhgpzGQkzgPU72agwFlYKYa6zUEEUv0HGe9
	X6YaIRlmmgJw6GDhYfHgeGme6ILH8KGXqHYE920q7dh8PYHbivWxSysQafb/ajri
	8wN+D3V47fmvGWe5b2gHtiCNurCAugUgKBy/7CKipWbtFSDy0+IjqiWFv/s3oF1a
	c84gHiCrMkx1TzCzC/0hjZXtlZKRzyG8l/sZ7cx7p/wYQi1oAHlIiq2JLr8N+rjS
	8E9GGMafB7uaPS0Gxaf6DzW3nlSiTtuQnoS7OGHUCR1pcGZi81bofoVB5l8BlFA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vp6p3tjua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 01:03:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40I13aTG014354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 01:03:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 17:03:35 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v4 0/2] wifi: ath12k: Introduce hw abstraction
Date: Thu, 18 Jan 2024 06:33:18 +0530
Message-ID: <20240118010320.3918136-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -rfV8sUPipyvEJbl2tNp18YZ6Xw4cywa
X-Proofpoint-ORIG-GUID: -rfV8sUPipyvEJbl2tNp18YZ6Xw4cywa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_14,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 impostorscore=0
 adultscore=0 mlxlogscore=285 lowpriorityscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401180005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_170345_121977_E60335AD 
X-CRM114-Status: UNSURE (   8.01  )
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

v4:
 - fixed the ath12k-check warning
v3:
 - Removed (struct ath12k_hw::conf_mutex) as per kalle comment
 - Rebased on master branch
v2:
 - Rebased on pending branch as per jeff comments

Karthikeyan Periyasamy (2):
  wifi: ath12k: Refactor the mac80211 hw access from link/radio
  wifi: ath12k: Introduce the container for mac80211 hw

 drivers/net/wireless/ath/ath12k/core.c   |  18 +-
 drivers/net/wireless/ath/ath12k/core.h   |  42 ++-
 drivers/net/wireless/ath/ath12k/dp_mon.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   6 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 460 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h    |   4 +-
 drivers/net/wireless/ath/ath12k/reg.c    |   9 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  17 +-
 9 files changed, 391 insertions(+), 175 deletions(-)


base-commit: 03a67f8046dadb966950a0a6acbac2839cddfeb1
-- 
2.34.1


