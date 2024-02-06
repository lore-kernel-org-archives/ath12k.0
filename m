Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A208C4829C
	for <ath12k@archiver.kernel.org>; Tue,  6 Feb 2024 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bl7DJUBCmxHyqE1YURLVMxqoG8rrIpTmnmFABIjppEg=; b=q8lxwoGcOMmrS1U2iTctCot+PT
	6S/8mrIZJduhBidYDgp4e3V4RyYBLan766XvPvFpXvVQ7+VW3lgFijMTxnygt6kyON5PpjGsvLDK2
	jGrn2gBpv1iGcOUxM5bd9qbM76V0b0GkRdVHY6nOGh6egxj92GM3UuZFXVdYCwD3wYBWnI0Pu0I0U
	aD2YB+q8VBGnCoZoDd05rFQ1RMM4gyKqJ2aYbAgQB5t7dX5DMyd5yjqcSb3HtKJb397l7y0YzBP+7
	vXcOB8JbMnSYiewOUDnCt4YpFUTWtEwhsfTdY3sUKEf1dJeBl93o+MAfTcIbZBBHaLNQ+8YUCLNQE
	ribPFcfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXIj0-0000000734r-3ZgS
	for ath12k@archiver.kernel.org;
	Tue, 06 Feb 2024 10:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeG-00000006g6b-0QfM
	for ath12k@bombadil.infradead.org;
	Tue, 06 Feb 2024 09:21:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bl7DJUBCmxHyqE1YURLVMxqoG8rrIpTmnmFABIjppEg=; b=UPsLH7kDdJ2GxM74xBklaXbI1S
	C7ZXHw01eKcNi0JwZIMFvlAOIKKjY9f1KvYN+gR5DtGvNb3BodZRjUp8dHJoce+bny4P8fmD4Qxmc
	X9LscaTDbU07/c3TsRqvzdDR3G98x2gpui/GnDR3xYGY8Pyb9aJbzV1SUhmwHDYLednccEWtaMoag
	0Ahp71zRxj9E2nJ/VY9XFikzBSEJ7h/t43hOHP6HXnjuohY0Gia1dYHriq9HUIf1wL75RNHOOGPTi
	PZcow4rCX3F6fwt+TTEjyQ3sb3aVnLXE8M/NYqnhR6+yRSTFDPSEEPRC4ZfjZWu/+UJcAGC37jn52
	XxAD/zcg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXHeB-0000000CQum-3lOa
	for ath12k@lists.infradead.org;
	Tue, 06 Feb 2024 09:21:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4165YHEb001034;
	Tue, 6 Feb 2024 09:21:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=bl7DJUB
	CmxHyqE1YURLVMxqoG8rrIpTmnmFABIjppEg=; b=KD+mTHqNv6iVJpThG0Ddg4W
	01DQCmmEV+3v1VbNfQesbPOWYHJboVFRhfrBisVJDNdicsVV1vdWchS13hfcFu+7
	qrd8fXoMEACmcHXKS8iDLC1noVzeNqSUAxC73gmQv66rL9g09DMaq/JBQQw9jtVs
	ickRvoOXE5zu3gMS5qwGZRhj8fcVMO1//1oeTLFearx14VHLQZKXXduARfDJU6I0
	cuPB5bQuktZIW7XfOd0+b6lI4sOdrFiR38eiWwl6N3/HJmJJ0IbYQMXj8I0MgBaW
	tKdYD2NAVKGPMylh4Cpv9UTv060Egjd5ClY1pza50YbDYvBeJgEOAFAVJlEi93w=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w399es20r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Feb 2024 09:21:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4169LZ8e020750
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 6 Feb 2024 09:21:35 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 6 Feb 2024 01:21:34 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v2 00/12] wifi: ath12k: Add single wiphy support
Date: Tue, 6 Feb 2024 14:49:42 +0530
Message-ID: <20240206091954.4144454-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fA9W5gjzpkHqHo1CoiAMrmjCqikW014W
X-Proofpoint-ORIG-GUID: fA9W5gjzpkHqHo1CoiAMrmjCqikW014W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-06_02,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=591
 adultscore=0 spamscore=0 clxscore=1011 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402060064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_092145_105219_2A77C13B 
X-CRM114-Status: GOOD (  10.13  )
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

This patchset covers the basic mac80211 ops for an interface bringup
and operation.

Note:
Monitor and hw reconfig support for Single Wiphy will be done in future
patchsets.

This patchset is dependent on "[0/3] wifi: ath12k: Refactor the hardware recovery procedures"

---
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

 drivers/net/wireless/ath/ath12k/core.h |  35 +-
 drivers/net/wireless/ath/ath12k/hw.h   |   1 +
 drivers/net/wireless/ath/ath12k/mac.c  | 969 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/reg.c  |  60 +-
 4 files changed, 836 insertions(+), 229 deletions(-)

-- 
2.25.1


