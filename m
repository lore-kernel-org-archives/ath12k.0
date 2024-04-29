Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A53CEC4345F
	for <ath12k@archiver.kernel.org>; Mon, 29 Apr 2024 11:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0BmmmKMcT64VV0Pe5dRqAPeOoBL9XXUfG7gjWqIL+W8=; b=RJVUEEANB/znTeQJ5C8Cf7PQ7V
	yrmF4rh5tfZhS3tsMXxccP+5P1pyjWsqg1vTj6WSlWfaWxI5TOQEe5YgrPHTZ9RiXlpj/xtvY7hag
	nA8oAufw558ey27xo869QKLpPAjWMajKA8EBSR5cp27k0cRiXhzi5TJ5b2Mt0jbSRt5WMiviUSoTK
	X3Z20fiHjWDcAcQ63XZ+D1lYXZrRYENRfWVTfWo/R/MDMglO9lELVPRhPFyjD93VZTAP6Pflf8OmA
	gzIRKtI+J8uoM+CditVYJLIJ+ftwly9eW8S2YJBlM1W4N2GWUkWLR580IRKLHyzZxlgfWBrwAcevM
	/q4U2B7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PW7-00000002WZB-0elB
	for ath12k@archiver.kernel.org;
	Mon, 29 Apr 2024 11:49:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1PVq-00000002WNH-0jHY
	for ath12k@lists.infradead.org;
	Mon, 29 Apr 2024 11:49:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43T63389009334;
	Mon, 29 Apr 2024 11:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=0BmmmKM
	cT64VV0Pe5dRqAPeOoBL9XXUfG7gjWqIL+W8=; b=kFEWrhYCV283NS5/w/XGP6V
	RhAZYDicI3guoYAViufd5CaDLoCyLuXdAqCKGEus6yd0RX6BljhjShyh2mlrLxQO
	gI/Hq2hy7YFOGdekmjipEYcW7PXzLM0Z91TZmkp+hxk90crFT3wI2WNFVBxLgrMh
	hWT2ey0rzdBc+0RyTi3ldu6eef7HlOqIASQ1KHA3mtTbGkwqBH38ye+TEIJ7QCn/
	v+rdGMUCitA5xRDbsy4B+wvAYB1X+d5rcebgB3Hj4DqPRTLuAQ8+WkGUaoh+4xIh
	SnrHQW2vsY49GQEmCtERyzJ1LszKNqECqW42CsdEfi8BL1FAnDvepjh3rqWqvrw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xt5xk8v80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:49:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43TBnX86010392
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Apr 2024 11:49:33 GMT
Received: from hu-kathirve-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 29 Apr 2024 04:49:31 -0700
From: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Kathirvel
	<quic_kathirve@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath12k: drop failed transmitted frames from metric calculation
Date: Mon, 29 Apr 2024 17:18:38 +0530
Message-ID: <20240429114841.413901-1-quic_kathirve@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: o8km_Cri60ngdL7LU_0fyxcfRUl3XXv3
X-Proofpoint-GUID: o8km_Cri60ngdL7LU_0fyxcfRUl3XXv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-29_08,2024-04-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=925
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404290074
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_044938_488176_570A75C6 
X-CRM114-Status: UNSURE (   6.50  )
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

- Use ieee80211_free_txskb() instead of dev_kfree_skb_any().
- Drop failed transmitted frames from mesh metric calculation to avoid
false link metric averaging.

Karthikeyan Kathirvel (1):
  wifi: ath12k: drop failed transmitted frames from metric calculation.

Sven Eckelmann (1):
  wifi: ath12k: Don't drop tx_status in failure case

 drivers/net/wireless/ath/ath12k/dp_tx.c    | 43 ++++++++++++++++------
 drivers/net/wireless/ath/ath12k/hal_desc.h | 22 ++++++++++-
 2 files changed, 52 insertions(+), 13 deletions(-)


base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.34.1


