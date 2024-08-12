Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2570C52D7C
	for <ath12k@archiver.kernel.org>; Mon, 12 Aug 2024 15:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:CC:To:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GvMLIUxd1sWR5SI1wQrmBcATK5sUWrvbdeu4Db5BmhQ=; b=okVV/6NqENlmTs/N/sOdRHTuf9
	fsd8Cntp3/qDgd6ujmTi2yBePSUfnVxcc0OilXEaQe4h+MsaGNhZv8lIR91RvI5Hgp3MIXgrlB9wc
	D4/mmIOJdegou1HFo1i11d8UzWx5NFSVqiQxio0ae8FHZeFkFWUwlQUVxIb4q5Ilyaljy2bjBET/X
	jXuJRFNFBpnYZkeGo0EANutYmowyvqirI1vG0Qh9Fzc5Gn/4dN+WjsbPZDa2933nbaaCAQkFYWqBY
	NUP8CivVfoAcNJO1LgELP8vY+aNMxQiokSi0ZMDV/xlQrMkmtjRywEZiwmEl374+slg+NvuqT0oDr
	mjXfJ1VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWe8-00000000geX-1yKW
	for ath12k@archiver.kernel.org;
	Mon, 12 Aug 2024 15:07:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdWe3-00000000gdO-24Cr;
	Mon, 12 Aug 2024 15:07:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47CDSTT2001043;
	Mon, 12 Aug 2024 15:07:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GvMLIUxd1sWR5SI1wQrmBc
	ATK5sUWrvbdeu4Db5BmhQ=; b=EE4PL0PyKCR+C1zTJ7wC6vvZDVNW+PzrOgagKW
	Ld+CsWHRqkRFyCmnG/Rc4TfgGaN5Pw7mRdNArtNEl4Dht4sEVJkxQv9di/45v8QX
	g/dSkuBkJDikF5dDgKxW8awWEcFGWCkN1BulSwWMYwl3lA9CCIj6Kx9pd0nKopyE
	5r4Tpk5rQVd8DJ+pyJyrh0QEU073dmNmf1SVUchVdRvVIJCO0WC00d9f5cM2qbF8
	MbQ+nxtkG7kJ6B4MHThRkTb2dLaOaX9vUaz2Drjg8WqzuO9yhBnxno6hql6y+zRB
	9CwVcN/fmFhT9o03tXrYI5oepPsLFPmQKRSYd+dinxMqurOg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40x3et4g57-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 15:07:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47CF7ZIC022449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Aug 2024 15:07:35 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 12 Aug
 2024 08:07:34 -0700
Message-ID: <7c3b295d-3d5e-40ee-ac33-c92669f29d51@quicinc.com>
Date: Mon, 12 Aug 2024 08:07:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <linux-wireless@vger.kernel.org>
CC: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath12k@lists.infradead.org>, <quic_jjohnson@quicinc.com>,
        <quic_kvalo@quicinc.com>
Subject: pull-request: ath-current-20240812
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9weQVwKyogkPxWi5uiLK3LvEWgaKtSJ7
X-Proofpoint-ORIG-GUID: 9weQVwKyogkPxWi5uiLK3LvEWgaKtSJ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-12_04,2024-08-12_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 clxscore=1011 mlxlogscore=580
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408120112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_080739_748593_94A6D034 
X-CRM114-Status: UNSURE (   8.67  )
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

The following changes since commit de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed:

  Linux 6.11-rc2 (2024-08-04 13:50:53 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git
tags/ath-current-20240812

for you to fetch changes up to 38055789d15155109b41602ad719d770af507030:

  wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850
(2024-08-05 12:28:07 +0300)

----------------------------------------------------------------
ath.git patch for v6.11

We have a single patch for the next 6.11-rc which introduces a
workaround to ath12k which addresses a WCN7850 hardware issue that
prevents proper operation with unaligned transmit buffers.

----------------------------------------------------------------
Baochen Qiang (1):
      wifi: ath12k: use 128 bytes aligned iova in transmit path for WCN7850

 drivers/net/wireless/ath/ath12k/dp_tx.c | 72 +++++++++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/hw.c    |  6 +++
 drivers/net/wireless/ath/ath12k/hw.h    |  4 ++
 drivers/net/wireless/ath/ath12k/mac.c   |  1 +
 4 files changed, 83 insertions(+)

