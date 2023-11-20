Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE3FC54E76
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 23:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=14pb1Mz5vqmHmrhNwVRroTV4uMqBwnQCna40FACN+Fg=; b=nHHrJtHguX2flP
	beTZJEe+PdLuw02Dy0KaQhTmbwGIL3llqhkXqcj177gp7LAa7E+vGCwzZzID903PFTXKXbJDKYxAu
	+A5/GSHMlgvm0FJOfAvcuOJu2trkUSryh4GK/Tkn1Q7+/tNNYiJLY3oW1pzWdzCFX63JfkTGAOtLa
	qoZN0a7bhC9QMQLmXem+AdUXPBBmWCIqZY0jA0ywB3QYBlzLHuo7RQM45xfegTiXVpVx2r/vSq1Rs
	DGbXds+PKViu0wzHsUKnR+XJ+/11Ql76ckTgMac4QeK/2SvnURE4dooUa4k0eY8zT3x/DOf8+rLTu
	59Rj9O5LK6dOT/tZZssQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EA8-00FBrp-17
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 23:58:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5E9y-00FBg7-37
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 23:58:42 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKNr0Hx020224;
	Mon, 20 Nov 2023 23:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=ZXj/gw0tFQrBQIUMkbJeBTKkb9iY11+VM1rEQSWq38w=;
 b=BqeFgW/rUzQSmofZS8mdMA0Izr7cznoeOGGb/eINUkbY8p1F7EKbF/4PJBMrDebSS1iy
 QZFQTRv6HH1VKEm0rgnJLsm8lUgUuMAr/MywWHiIHyyhKdvedI3khsUuBfa5Y7IZJTDz
 GdqDBq2QI1/jD2f5rVO6Ea/dasjTzgvvGdlxYMEpQ4Q69NEyZoieV0Weqi20i56BYhM8
 tgmcP2IT8l5djAMkFw59y0q6fY1rWfuTVmrjJhkEERnlNOOAdt8S9o9Vfjb2Cy6jUt4d
 17w9qmbPKZVdHHj4RmbgxYV3u8cCYtKWbMWVPQn2nmkIJiv8egFk0K0e9Aabamb+Hv9e dQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug2axaa64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 23:58:29 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKNwS3R029491
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 23:58:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 20 Nov 2023 15:58:26 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Optimize the mac80211 hw data access
Date: Tue, 21 Nov 2023 05:28:10 +0530
Message-ID: <20231120235812.2602198-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dv9A6BP4Eh2DIb7-dsCkAgsozt9l5ZI0
X-Proofpoint-ORIG-GUID: dv9A6BP4Eh2DIb7-dsCkAgsozt9l5ZI0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=16 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=16 suspectscore=0 phishscore=0
 mlxlogscore=72 impostorscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 mlxscore=16 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311200176
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_155835_269701_263C9A51 
X-CRM114-Status: GOOD (  10.11  )
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

Optimize the mac80211 hw data access expression statements by avoid
the unnecessary access and repeated access statements.

Karthikeyan Periyasamy (2):
  wifi: ath12k: Optimize the mac80211 hw data access
  wifi: ath12k: avoid repeated hw access from ar

 drivers/net/wireless/ath/ath12k/mac.c | 172 +++++++++++++-------------
 drivers/net/wireless/ath/ath12k/reg.c |  19 +--
 drivers/net/wireless/ath/ath12k/reg.h |   2 +-
 3 files changed, 100 insertions(+), 93 deletions(-)


base-commit: e9e36ed2ffc1bc4ab439d992af01269f50815dde
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
