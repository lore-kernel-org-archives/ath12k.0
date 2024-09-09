Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A0E1ECE579
	for <ath12k@archiver.kernel.org>; Mon,  9 Sep 2024 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A7QaaZrrEyCSWOUzDG1W4t46JElHBefqJS0I36xNoKA=; b=NRIbZoBnPfmG/EeGio9bl86nHK
	9u3+rSdpKpI4x1R73Kc+8ZPQk4SaWR5tKGOKWH8ZpfKL8DDNrBh0EyQGrx6Div+Sd+tT/9MljlsaM
	+zgbZ6Fsh9VKU6FQh53C8R3lK16acoYDj66q5Y2dwggVwtmz+OPKQl/5d7m5/vZgKZV8CkOEhv6Ti
	Vdrq8h0bl0cfZplSXkBrdmVlmJPhR3cdFg96hRsSzfN+KZXUxqV+Bk2B+yjuFGaR1xvDUEwdJW4HF
	W51Iyg6XEIkLNe4Am8CaA1O0+t8yz5q5LWCxiR8iycPMPFTf3HwPgRRKRzYy11ibVhemRyRINp9SN
	jnJk7Kcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sng4E-00000002POk-43mc
	for ath12k@archiver.kernel.org;
	Mon, 09 Sep 2024 15:12:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sng4B-00000002PNf-3eZi;
	Mon, 09 Sep 2024 15:12:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 489DRRC1024766;
	Mon, 9 Sep 2024 15:12:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A7QaaZrrEyCSWOUzDG1W4t
	46JElHBefqJS0I36xNoKA=; b=kKLesKZ73051ALJNzYuZoA3bre0Pb+bwvBKspy
	16LTdaoBxbOkYjMD+2KTTq/TTejqtdWi61bRYukuPfQukCdsFieZRAhUIHiZL0ce
	TX5loq/2dmd3iyFKj8r21Bt2rTd7SlQQsxeZ30203Ms+Qnu7kZoVc8+f/aaIC61X
	vNwEvnXKP2/9L6FEG8QAygSYwVZ12Z2u+WfCJm3P6woc6yvUXvQSnHBsFqkqZQcS
	RZLKMg977OACUEAcpOUsxNntaNPP9la1qvddb0JXEH91OF6bjv1zTWsshex0Fvxv
	VIrCONalwPpwhXwfP5JYFLtyMnxf4jYtKWLmWpi/0wZvo6tg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rb480-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Sep 2024 15:12:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 489FCLdn028693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Sep 2024 15:12:21 GMT
Received: from [10.111.181.163] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Sep 2024
 08:12:20 -0700
Message-ID: <13914e4d-92d4-4ccd-a7d5-86c5a17426e8@quicinc.com>
Date: Mon, 9 Sep 2024 08:12:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>
Subject: pull-request: ath-next-20240909
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5QM2Emhz1KwsWLxtp7a-Hz-PKffyJOfl
X-Proofpoint-ORIG-GUID: 5QM2Emhz1KwsWLxtp7a-Hz-PKffyJOfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=798 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409090120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_081236_062906_16B4CEDE 
X-CRM114-Status: UNSURE (   8.53  )
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

The following changes since commit ae98f5c9fd8ba84cd408b41faa77e65bf1b4cdfa:

  Merge tag 'ath-next-20240812' of git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath (2024-08-13 12:58:32 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-next-20240909

for you to fetch changes up to 02f454f9aa6255d99611d6a4e37edd08812878df:

  wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings (2024-09-05 19:20:21 +0300)

----------------------------------------------------------------
ath.git patches for v6.12

This is once again a fairly light pull request since ath12k is still
working on MLO-related changes, and the other drivers are mostly in
maintenance mode.

ath12k

* Fix a frame-larger-than warning seen with debug builds
* Fix flex-array-member-not-at-end warnings

ath11k

* Fix flex-array-member-not-at-end warnings

ath9k

* Fix a syzbot-reported issue on USB-based devices

----------------------------------------------------------------
Gustavo A. R. Silva (2):
      wifi: ath11k: Avoid -Wflex-array-member-not-at-end warnings
      wifi: ath12k: Avoid -Wflex-array-member-not-at-end warnings

Miaoqing Pan (1):
      wifi: ath12k: fix the stack frame size warning in ath12k_mac_op_hw_scan

Toke Høiland-Jørgensen (1):
      wifi: ath9k_htc: Use __skb_set_length() for resetting urb before resubmit

 drivers/net/wireless/ath/ath11k/core.h   |  8 ++++-
 drivers/net/wireless/ath/ath11k/dp.h     | 23 --------------
 drivers/net/wireless/ath/ath12k/core.h   |  8 ++++-
 drivers/net/wireless/ath/ath12k/dp.h     | 12 -------
 drivers/net/wireless/ath/ath12k/mac.c    | 54 ++++++++++++++++++--------------
 drivers/net/wireless/ath/ath9k/hif_usb.c |  6 ++--
 6 files changed, 46 insertions(+), 65 deletions(-)

