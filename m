Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A3C3DA79
	for <ath12k@archiver.kernel.org>; Wed, 21 Dec 2022 10:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aF4auzkVVQLyOhGJfjTZQdAXgpSbXdJnlAB1QrIY8CA=; b=bF+pR2o1QM3nbt
	vNXG+5LnlVOErNtnOX9DkfwgATbJJsfugdjfjPwMil4f17RWXSgG6EaXgpc8UoENOeYLkvCVS2gXK
	IRJu40lBjmj+At5ooM4xNR/6eIFXX3bDUSY+HDjmEqseXeqpjak/uVJKt+c4DWWLBbJh50imA9wCM
	Jv1slK3xNAdp8tufnzEEcS2Gi43wk6cvZrMFbp6e+9Dpv+OW22yasAPrXv0Tzj42ol2n1OJNtJ/zg
	1biDcRt7f9vOXMaiKEPnuXMZ+Rw6I7FBgU30OjTZlxg7qOhqe6hHLVjzzlBY+KXaDuDFB/WbZKQ9m
	nyCIRklTVqYsbprKvIRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wnW-00Drtk-OM
	for ath12k@archiver.kernel.org; Wed, 21 Dec 2022 10:58:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wlp-00DqYZ-EP
	for ath12k@lists.infradead.org; Wed, 21 Dec 2022 10:56:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL5tnlK015096;
	Wed, 21 Dec 2022 10:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=cODI84NCLVHKyJSIgg8Tva1vufH5mWjNRTg4PBlHe6k=;
 b=k2e8TppGii2w0NppBbsC+MtYhS3lORJZkVLGKRSDkj0M9g7gY+Ys90ydhs4rSX2a65oS
 L2fC4Dwg3bpnG2m2CUYBu5JLNqGEt7WNl0sXwTb2tG6ZKc5SUcxoZCej4o65LysM/2mY
 /X69T2n83KNu5GxQJk0entbWBrBwhn8/UVov45s2zOceti01X/FBwh6IjAjZCFiqmjnQ
 cxPHyJo0snZU1//XPRv8asyRo3F+aC/NFqhEirCLm38i66jfccl5M3A33ZExarBiPgKP
 U1HFTApWJv2BoY3ojuxksHDN9CogS/+ZsAPlfazfKVwlD7tK4yD3PZnTUxb+//QS/Rbl Jw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mkkxcshgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:21 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLAuKgJ030123
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:20 GMT
Received: from tmariyap-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 02:56:18 -0800
From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
Subject: [PATCH 3/4] wifi: ath12k: dp_mon: Fix out of bounds clang warning
Date: Wed, 21 Dec 2022 16:25:28 +0530
Message-ID: <20221221105529.19345-4-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
References: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gkTBx6vFKtUfJSLUJiEzCwImPs9IZ8p1
X-Proofpoint-ORIG-GUID: gkTBx6vFKtUfJSLUJiEzCwImPs9IZ8p1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_05,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 malwarescore=0 suspectscore=0 mlxscore=0 mlxlogscore=697
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_025621_535900_2E47FFBE 
X-CRM114-Status: GOOD (  15.01  )
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

Fix below out-of-bounds access warning while processing ppdu end user
stats. The size of info array is 6 but storing 7 values, Fix this with
increasing info array size to 7.

Warning:
drivers/net/wireless/ath/ath12k/dp_mon.c:623:3: warning: array index 6 is past the end of the array (that has type 'u32[6]' (aka 'unsigned int[6]')) [-Warray-bounds]

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 7e9759807c88..f6f2e83f8f8e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -588,7 +588,7 @@ ath12k_dp_mon_rx_parse_status_tlv(struct ath12k_base *ab,
 				  u32 tlv_tag, u8 *tlv_data, u32 userid)
 {
 	struct hal_rx_mon_ppdu_info *ppdu_info = &pmon->mon_ppdu_info;
-	u32 info[6];
+	u32 info[7];
 
 	switch (tlv_tag) {
 	case HAL_RX_PPDU_START: {
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
