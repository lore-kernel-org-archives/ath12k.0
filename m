Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B04CC282C6
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 22:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zJaw4OIUBfrnqvA+E2Qehpw/lV7Ut1ms1uOHsw0G2nI=; b=xAqciGgREeTeNmp2CvJOF/2OXL
	hrzI7ZALtdYQZthaLGXHNGrkqfb1P056YKQUSYDtMtaLEhRMDv8YvG3n1CMwnDDDzTlQyOV2CO02H
	UoS+0xky3aDW/7oKo3ZqCKDZGoAJA5Q7sJAHQOEN3G9Tz/dykCI2QNyNgdGEqqMv9QC/h1tBA0bUF
	u3bYi8hBxRhQZF1BlYGOHZh40A4C49nI15egtoTJdNhXy67DsZrUJuciD9lhshLJ/wY3E+pysQ61d
	WosAzqJ+FgTP1AoCxPGXeeEb/upzmeA4s4pIFkeTG2u+9ljGYn7vAsCEGRBdWqvBhV+m3evzOleGs
	HUjj25EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7v-00000002S9Y-0XKH
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 22:19:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7s-00000002S7T-2GtG
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 22:19:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523AGFDa029520;
	Mon, 3 Mar 2025 22:19:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zJaw4OIUBfrnqvA+E2Qehp
	w/lV7Ut1ms1uOHsw0G2nI=; b=ZFDst2oLu5GYeepVUnBBkK/tME7axLEYVelwy0
	LvNR+PNTjc/SeP5phxRosKg8lYvIgjNfqIq7vVjueqzsXQHuUAlH2LFCahcvWAJA
	acjQfGOXOO9q5SUVDnNhvaGjhiy/7t0vCs2PizaPf8G/RcxorzBcFXb8dHCmb78m
	7jOFxAvkZizDYUGHBmNchsfYBKLQSmhMuZZY8j4UQupr+v0cvkJqTKJzjlkv0q7p
	5Icc0V2jWhEyZ6A2s1u558mjnWUz4KGllvC23GnyDtiHNLpuzGwC6MIekIeb/vP7
	uBtp4bFpP3/Ho9/rrRzv8iqTfhhoKHEL8uTnV9kfaN9tXOsw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5p9cc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 22:19:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523MJ00d022637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 22:19:00 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 14:18:58 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v3 0/4] wifi: cfg80211: update EML capabilities of an ML Station
Date: Tue, 4 Mar 2025 03:48:39 +0530
Message-ID: <20250303221843.1809753-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: s2EhCdQVMwT7WZgh4WGGjiU2HhRJ-O6O
X-Proofpoint-GUID: s2EhCdQVMwT7WZgh4WGGjiU2HhRJ-O6O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=940 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_141904_726631_DCB7C6A6 
X-CRM114-Status: UNSURE (   9.99  )
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

When EMLSR is enabled for an ML association, the EML capabilities
advertised by the ML Station needs to be updated to drivers in order to
trigger EMLSR operation.
Add support to fetch EML capabilities advertised by ML station and
cache it in ieee80211_sta data structure so that drivers can use them
whenever required.

*v3:
   - Restricted eml_capability change, if STA is already in
     ASSOCIATED state
   - Added new PATCH (3/4) and defined helper functions to get
     EML delay and timeout values from eml capability
   - Used the helpers defined in PATCH 3/4 to fetch values in
     PATCH 4/4
*v2:
   - Added new flag eml_cap_present to indicate if EML attribute is
     present as part of new/set station command.

Ramasamy Kaliappan (3):
  wifi: cfg80211: Add support to get EMLSR capabilities of non-AP MLD
  wifi: mac80211: update ML STA with EML capabilities
  wifi: ath12k: update EMLSR capabilities of ML Station

Rameshkumar Sundaram (1):
  wifi: mac80211: Add helpers to fetch EMLSR delay and timeout values

 drivers/net/wireless/ath/ath12k/mac.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 21 +++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 include/linux/ieee80211.h             | 71 +++++++++++++++++++++++++++
 include/net/cfg80211.h                |  5 ++
 include/net/mac80211.h                |  2 +
 net/mac80211/cfg.c                    |  3 ++
 net/wireless/nl80211.c                | 15 +++++-
 8 files changed, 117 insertions(+), 2 deletions(-)


base-commit: e5328c14590d034dc586e56aaab88e966d06efa7
-- 
2.34.1


