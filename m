Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09296C27C4F
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 03:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECIsG8AncEKWI7bypJ/0x0Kywyt4sB2Jj9/dj5Ywd4w=; b=vpVaRKRUfdGBSVJqaTcfvd9aJO
	6pAncHen9xRM8vgztGk3WLAfUamDvdNfKfa82I1TBYDOrCdZjLR6db3HxALXKWVxvBgZd6A9AP38I
	QysoeHMVdBFaC12sQSo5f8whYJrGFiZpewETjEcv7JxT004JJd8IoXtZPnyYaKrAQ8YPeADQnVYa9
	HUGRocWveO2UniDwM9JRmI7hqG8PIothSVgXigsi0JxBDyvMaJ1gdxIjonApBrL5TVIMNIRIbG3+M
	JR1H1vRPoA4dSVR6i7QJyQswN419GmtFMF89DFt7BmSCb+tcfAQ91kFldfRbPdtga8UXhHrO6UwDP
	6sgjMLKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruU-00000007EDo-0cB5
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 03:11:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruQ-00000007ECv-3O6x
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 03:10:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45B2wjHY008531;
	Tue, 11 Jun 2024 03:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ECIsG8AncEKWI7bypJ/0x0
	Kywyt4sB2Jj9/dj5Ywd4w=; b=MuB6A/O1YArrm4bZmALro1B70vpXtRjGXDtot5
	31xDn6qNbVq57oyoJmk+/L1dMkEc5bIDIyNbquCec/lwQa8lN+J+sFZa5ZVUrb0b
	wGGbs76Gx3zDuPFcoFxtg8MOI/pn9DLCJfIV8YtiqSyaoQ2sxDDtLfG4pablWeO1
	JMKSIsU/EtkpKBhvg1AV7jHqs8ldMxvvpamENxUjd3UIhfgz2VP1YBpaT0Iu6mqU
	rS4VFD1KdtlXahKWC4b2wBTIqpLYWzSMTjlA42x69VF9ClzexLziMDvdMEsD6Now
	JRs5ejAk6JRd7RUKGWbBfA5Ag7aVcBql9LaGPs2lrVWI7geA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ype9100jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B3AZ4S013729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:35 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 20:10:34 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Fix the smatch error
Date: Tue, 11 Jun 2024 08:40:15 +0530
Message-ID: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nRak0mx027rWXt5hmCij8Tf5ydB7sPIa
X-Proofpoint-ORIG-GUID: nRak0mx027rWXt5hmCij8Tf5ydB7sPIa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=592 impostorscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406110024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_201055_073545_8B170604 
X-CRM114-Status: UNSURE (   7.98  )
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

This patch series fix the Smatch error in
ath12k_mac_op_get_survey() and ath12k_peer_assoc_h_he().

Aaradhana Sahu (2):
  wifi: ath12k: fix NULL pointer access in ath12k_mac_op_get_survey()
  wifi: ath12k: fix uninitialize symbol error on
    ath12k_peer_assoc_h_he()

 drivers/net/wireless/ath/ath12k/mac.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)


base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
-- 
2.34.1


