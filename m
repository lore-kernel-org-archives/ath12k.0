Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D9FC47DA9
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3jNSHEbHDuB8mX0lfnbxG1riGiObzzJD/w3kWjmhqi0=; b=INToji25oyndmd7OxMW/ErboNQ
	gvGxqcNJiQ1jBOdhs/vMhzbqeLMpgMdlLzJnzFwGiXkq5CfJBT592mzADEp5ocDQnaUuiX3EGdeOI
	MlstdeWEoCuPIGOoyg5GyJPVkEn0x+cq6q+MMhKd6CN0wIjTve5MwIDIBLNZ+6N+BheLFhtkxTHie
	KSYYoCeqRFRDQ2qPzzX2bcIYWQ49c45DBavk+xb9jC7l3idjmEadQiEocsv9nSZX8k9Gezxhl7XGM
	AMpFFi8pHgNelpFOFLBJjsCeDYr7W8W6KpNxsqUIeklSUw6Hyrr40bTdjBRasSc9Re+Yaq2a1tZTG
	8zvb3M3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ8ZO-0001BP-0a
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 16:15:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ8ZK-0001AC-1K
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 16:15:12 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40H6ruSu008994;
	Wed, 17 Jan 2024 16:15:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=3jNSHEb
	HDuB8mX0lfnbxG1riGiObzzJD/w3kWjmhqi0=; b=fHYyFIeGPGY8bmVNLLRrRne
	m4w+QuRkYzv6UtRirda6D0qXtzuwv55xDjaC4JRUOUEF9vGo6Vn0+jQkS7xNK7+z
	dzcDbD0rQCRafkHBZGhpBun8/CzEDnVmWzJHTkDY/g4Tmg50+8ZppjZkkUUkPDBu
	oAQbSlQbYtWy8RFb2ca1kK7MHcIQo/lN+LHFj///DncXZEMlmQPGoso2SqW7e/tr
	37gvJw9gH/EKrsCpMfXRmSsluxSD68LPATtpvvD2fU6F75yjLg1zdv6U+/DL1WX3
	RpYiL+wTILghEgreLC2pkaViNPkWjsR1eoO7sxZoPUQ5dGfko+MJUBSrBRuBQxA=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vpa1es63v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 16:15:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40HGF7sO009856
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Jan 2024 16:15:07 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 17 Jan 2024 08:15:06 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath12k: Introduce hw abstraction
Date: Wed, 17 Jan 2024 21:44:49 +0530
Message-ID: <20240117161451.3385227-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0ffJanL2cLcTlwcKCMgB2qQBDffgIjv8
X-Proofpoint-ORIG-GUID: 0ffJanL2cLcTlwcKCMgB2qQBDffgIjv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-17_10,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 adultscore=0 mlxlogscore=329 clxscore=1015 phishscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401170117
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_081510_621738_39A91C29 
X-CRM114-Status: UNSURE (   7.82  )
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


