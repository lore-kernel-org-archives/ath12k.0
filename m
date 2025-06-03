Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCE4C5AE59
	for <ath12k@archiver.kernel.org>; Tue,  3 Jun 2025 06:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lrXGLpxbMpg9M848+0eqf0Z7DtxFtlAewM8dywzs/gQ=; b=aca0E3ze41LBX9IzUW/FklabqZ
	Z7ohwWnRDPDtk0lCYqR7XVPAJJbLwbuwDLZ4eC9qSvhWLswu6jwARovfAqzjB2INZoNl3S253DKH9
	+bvQAMAYC/PXH0of3cINGfJFWVNiIq/PYHePOW45cP+WAZRe1kOUJ0+UiqoqZv4aJA4mtXHzreQD1
	3ye7d4N4oehEXkqPYQWc7vjAVPxrm3Vt3396Vr6M8eBYe3120TOb2l5zB6IRPi5CGKEMTU9WbTHHl
	jFNn7CFmW2C5jkNzlfF8hjiRp3pjGAKQZU+5pNKPXdI2qUzoIl4mqLFObht5ZYUHUI5Aq9IV7mELp
	EEMqJbFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLFR-00000009yuk-2jZ9;
	Tue, 03 Jun 2025 06:35:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMLFO-00000009ytj-1yqT
	for ath12k@lists.infradead.org;
	Tue, 03 Jun 2025 06:35:43 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552HK2TU007769;
	Tue, 3 Jun 2025 06:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lrXGLpxbMpg9M848+0eqf0
	Z7DtxFtlAewM8dywzs/gQ=; b=HPqqPh7rrowbJTxkQBPR9k0FQ1fwoS+L9g/vrr
	YjzbK+rcr7yDY7319R80/8hreq2GTINEmR+0aZWsbqbVF7mqY/lOIN2rBwCi4N5p
	bueiH3MOHZws+LugSCcXJtIA8390Lk/fuTCuPf8o//NhOmlDG1i4Nqd4FvnOXY2G
	wU0C0F8z3StHR5+xdcQG0jjQbfLgIo3wkvKwSgdngUQ4qtW1h4rW43W7FB1lhgkC
	LYvLST0t9MrvDCMBirzfjehPDrqLiwNaIyZpxPAbn5bo4nb1RUOI1xdoHsVnAMo+
	0e4dFFo3ckQfQE6mGDCrBAnrePHml3OuEQSvWJbPae6/+szg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8yhjj3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Jun 2025 06:35:39 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5536Zcb3030859
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Jun 2025 06:35:38 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 2 Jun 2025 23:35:36 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Add memset and update default rate value in wmi tx completion
Date: Tue, 3 Jun 2025 12:05:12 +0530
Message-ID: <20250603063512.1887652-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA1NSBTYWx0ZWRfX3q6HNCJ/qgJN
 6KcvVdwFkcxd2lxPQzvkOdjrdAELCm004r++5i/KAXfTJBjDZoujGzrykXRwiS8Cvu97K1OJejW
 7gIlWfeNvfuIUf3EhoKlzSP0obD5fPE0yti6dXvUEzuYjNDjkSmjRmQb9Bf3CXUJPjU4RErcWc4
 jo9RDfOYtuhIKntr2m+GD4OPZrgmUKOHBrjXrB6YznsloOpkq3A9bA60lKWeXQBHGpBteW3SJPL
 e2SeTQ6RoAefdNJz1/dzknWsxyjZ9Y79euRaOc185/N0zc/HxZN5aA5jVp45o+MqKfdivrDqTBV
 tqqSBnh+ntvMFtpeX7OQoHfyxP22P82dXF9GJvFYJp54bTu/0xjkYLh4B4SZ2WF6OYBAoXquXzV
 4tjq3V0t1WcIkdRCvYQr2sU9Ysy7tuGprFwQFKvJTUbh5CXrIoNTexZ0tdG5H8cRtHOB/y31
X-Proofpoint-ORIG-GUID: 1GrK_f2ZYYLJjKZBdEl9w-dkSvOVjCrz
X-Proofpoint-GUID: 1GrK_f2ZYYLJjKZBdEl9w-dkSvOVjCrz
X-Authority-Analysis: v=2.4 cv=T/uMT+KQ c=1 sm=1 tr=0 ts=683e97bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=J6ZGN57qR9n7gPSFk8cA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506030055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_233542_632725_CF858B6D 
X-CRM114-Status: GOOD (  11.61  )
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

When both AP/STA and monitor interfaces are enabled, ieee80211_tx_status()
is invoked from two paths: the TX completion handler for data frames
and the WMI TX completion handler for management frames.
In the data path, the skb->cb is properly zeroed using memset, but in
the WMI path, this step is missing.

As a result, mac80211 encountered uninitialized (junk) values in
skb->cb when generating the radiotap header for monitor mode, leading
to invalid radiotap lengths.

Hence, explicitly zero the status field in the skb->cb using memset
in WMI TX completion path to ensure consistent and correct behavior
during WMI tx completion path.

Additionally, set info->status.rates[0].idx = -1 to indicate that
no valid rate information is available, avoiding misinterpretation of
garbage values.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 60e2444fe08c..3688a75b0a60 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -5606,6 +5606,11 @@ static int wmi_process_mgmt_tx_comp(struct ath12k *ar, u32 desc_id,
 	dma_unmap_single(ar->ab->dev, skb_cb->paddr, msdu->len, DMA_TO_DEVICE);
 
 	info = IEEE80211_SKB_CB(msdu);
+	memset(&info->status, 0, sizeof(info->status));
+
+	/* skip tx rate update from ieee80211_status*/
+	info->status.rates[0].idx = -1;
+
 	if ((!(info->flags & IEEE80211_TX_CTL_NO_ACK)) && !status)
 		info->flags |= IEEE80211_TX_STAT_ACK;
 

base-commit: f8bead2c1ef18efc47e495bc800aa7af740eda80
-- 
2.34.1


