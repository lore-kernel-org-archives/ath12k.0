Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC12ECA0EDC
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 16:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qYwhKepfUiuQWx5VxD2n5yHLqvEMme+QkYCnGzbfhhY=; b=q5FbiFNl9PAFoPCtE+7QqzgQWF
	09yP5P2wxijKbBXPw/CsC5Rqp85UM3IT4L7LR6CyEoTltf31IHa21NiszqMEbJPO7xQczuc19SaEX
	GRiUYtsC4/fapn9eMqGwSC+qoq8UDx4gkxb9/GM+fMcQb3orCoGRG0toYV7962IzkXxWNivxkbMmo
	2CxjN+qe3XocKTlk03f1+2fCRW9Y+Q72SIU3a3U6a2DO3qBOkEJpjYTrKLRE5VnKyUczGxQjO4jZT
	e6a3QsKnH0J56NVOq1tvsKr6AHvFRf7TWVgeaRZcD217AoRP+zbyDgqwiRkEYJJBGibcfMpvOUoXJ
	2wqpCyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrjl-0000000BK3R-0n3O;
	Tue, 12 Aug 2025 16:20:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uln0K-0000000Aaml-1azn
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 11:17:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CAvgZG032229
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=qYwhKepfUiuQ
	Wx5VxD2n5yHLqvEMme+QkYCnGzbfhhY=; b=LB/w2QH0EfX3z+YCQzrBj+2Mlyni
	2xlrtsMbZ0+wI26ZfhH1N1T0aXOtb53WGjWmH7iypO2xZ+AqMr8G9CNHxzBtmaF+
	2dr7DmaXCo/gvvOwm5RwZbFRmdQlvkmKEoni+Zy1aw9UAHgvtFtDvDAR6t6aN1GP
	yUYs4OFi4yH+8A06Il5JIM3J6pgqT3XY73jVyR3k6PO3nTcik4YW+41+4N41Xvbg
	T4Y98xOnqPzLs3RtG4Ynv96dvT8IVVjwIod3ki4fCvd7mcg2ZabWNTTyCyMqw4Pt
	e3fYLPX7Y8DTutw8MPN+jJM34lz/4gYKzNZXQHcr/DpB1sIR8E9YblFFPg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vjsay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 11:17:18 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b423aba05feso5056782a12.3
        for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 04:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754997437; x=1755602237;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYwhKepfUiuQWx5VxD2n5yHLqvEMme+QkYCnGzbfhhY=;
        b=CEGFcgzNMLdDmxpklXpoWcwrXuyCSosKvRw7UTTR8Ph2MWaV2ZQlWkamoMSTlxoNs8
         Yj55e/IQaR9W9nZm/+Gr7tWII+bxBKwXe9Ukeek6SfS8Aeydgx2XhAHvqHB+XXwivuYB
         wtUwzBRNyvXJZG5xBM5Rpdz5Aw5tIcD4hma0F7HnC0s9mBkDDjii+etcn4e5iiRvWRvv
         RzmX3qq4HlCk4DDjFoaSNQ1LPEPyRsN/h4azB5mjPVfIsMVYL1uFH21hm72Yki+iXUXM
         MROwGlQXJo8eILgXph5+NTdvFqaRlJIlpYo3UmaYmG0NleF1CTpHlb1UTH5a75LkmZLL
         nuyA==
X-Gm-Message-State: AOJu0YyXFLvBZ7MAvxvDIWPOXw9aSjLxRbWivJeUOcWzjqj9ZoHMWlc+
	4OiJ2S7wk4nh8dUSO1SMMMldkklPRsFEvt2O2G8zNMHoqG4AGba9o8aLAPHGGcr8irl6id7Sfof
	aFsoEMG/jX/q5+OGdOtiVHWVcKRuOBnaD7uQVrWERox0qprhJgwMbkaGQlYSoRFQyi+zC3O23
X-Gm-Gg: ASbGnctkD2IZxd2kRjZsltTtjlA7N1W6el+dNipWsvtnqWJnQivoskWAV0h9z+KTnRJ
	Gy6CSW4h/xeBh3752P85+ZOp6ELBs3mm+HhJ6yGzfasvKvzDW94I4hrOhYOA1LapnzPXv6flEre
	ywNyvhq62n1e3EK1aoawzuo6y+VsMWJRX+ZXPCvF7yqNn7DMemTH/6uRYKGB+U/COHj1soqEmza
	m+QNwnnE7fJd/mmOvZjA3nPIC7GM0fuyyqTFbuppGUWahmro1etxsc6nQuhL/9/eG5dSaoqqU4A
	Vg+4WgbY63a/xFx23JKYDtYozlcg8TifSw3ByE9o0Rs1tZFT5jXDr30ui8xb3F8XqbRoP2JHWEA
	xzQPVQWo=
X-Received: by 2002:a17:903:1b26:b0:240:99f7:6c10 with SMTP id d9443c01a7336-242c1ffb220mr275547875ad.1.1754997437123;
        Tue, 12 Aug 2025 04:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9YHYgdY2Hy4IBVsi1SF/S3HVYHnH3d3qLx3AKPjK8PHljTjJF/lpOTY8YdTxgLfZweDgoMw==
X-Received: by 2002:a17:903:1b26:b0:240:99f7:6c10 with SMTP id d9443c01a7336-242c1ffb220mr275547515ad.1.1754997436688;
        Tue, 12 Aug 2025 04:17:16 -0700 (PDT)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241d1f1ebc1sm296048935ad.67.2025.08.12.04.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 04:17:16 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 0/3] wifi: ath12k: Add support to handle inactivity STA kickout event
Date: Tue, 12 Aug 2025 16:47:05 +0530
Message-Id: <20250812111708.3686-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfXywApYH+A6G1r
 LFR03v88VaK9HHJ77l2Rw7XpDPg8uZQmYSBe1aun0jQtNdK/p1UIQTGXfjCn+Q1F5TG3ppWaCHK
 a5F1NOuLoAhZM4EAHPkFaWXHSvjICl0QFhxqJkEU1AIPHIYIBPhBeCU70s3ErL1AnzVLogW1eQe
 7vTZ5Z7sjkX5BPUNYXoaXLtbfp5LO10QBO4TEVeB//c2kkXPy8gcJhC1DOFZSuD/hI95sNPGxt/
 KvTe5G/5D1PlF3hiEOcloeTMsxOEL2SywGP/0lIBf3B39hlbk/mOILOu2s5sdkBWJ2JJe9KcLq0
 avWtCvjWkmdIxH/6hsdksQmcgSi9wC6hgiFMN2nKgkOqrTaIbK8n1Br1gJnsS8Q5+/epTSjgHZR
 QroSdIzM
X-Proofpoint-GUID: 9x_gOifG5kixlEtlCDnEgyaIAUZZo2xO
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689b22be cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=2OwXVqhp2XgA:10 a=aFusDkrkR4dZjGMLmIQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 9x_gOifG5kixlEtlCDnEgyaIAUZZo2xO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_06,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1011 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_041720_533687_BCD8E726 
X-CRM114-Status: GOOD (  10.19  )
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

In this patch series, enhance the WMI_PEER_STA_KICKOUT event by adding
support for reporting the kickout reason and RSSI value.
All reason codes are handled by reporting low ACKs, and will be leveraged
in the future.

Add support to handle the peer non-AP STA kickout event for the reason
inactivity.

Currently, the ath12k_mac_handle_beacon_miss() does not handle MLO non-AP
STA. Hence, add support to handle the MLO non-AP support.

Arulanbu Balusamy (1):
  wifi: ath12k: Add support to handle reason inactivity STA kickout
    event for QCN9274/IPQ5332

Maharaja Kennadyrajan (2):
  wifi: ath12k: enhance the WMI_PEER_STA_KICKOUT event with reasons and
    RSSI reporting
  wifi: ath12k: Extend beacon miss handling for MLO non-AP STA

 drivers/net/wireless/ath/ath12k/mac.c | 24 +++--------
 drivers/net/wireless/ath/ath12k/mac.h |  3 +-
 drivers/net/wireless/ath/ath12k/wmi.c | 60 ++++++++++++++++++++-------
 drivers/net/wireless/ath/ath12k/wmi.h | 15 +++++++
 4 files changed, 66 insertions(+), 36 deletions(-)


base-commit: d9104cec3e8fe4b458b74709853231385779001f
-- 
2.17.1


