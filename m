Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8B1C25B77
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 23:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig5V5BQs2PpkzOOIlwVTg7SFzIYBDf48K5nHT/ulhBI=; b=ZDAzLaZdEzS2NXAD2sF+T7LNGC
	FZMh+RnKIyA/2X/QT+k4Z4y/aLQBVJ4ms200fo95spf6fue+JO6VGkY5jbaVJFeYb6XYa/gU7HA0V
	GShaNCF1RKZAAe71kD8Cin/5f9vpxNSP9vv0POoIDzXxXM9muZ45hPR8fAk6db4wYuM/tjXPk/WyO
	BU6cVWynhELrZicnbWaEiqovllAja71CUiqphHHVlZTLYbMxGxH/Vwq+nervuTrW/O24fS7W0WGRr
	0URqDlgvqO09KVNl1wKQReRFVhoaHfZTMDOgy8MP9TQbgMAvc6OOikH7hN1OSkCCJXJKgjBCdkwKt
	AbbSSAXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cal-0000000FpYF-40Dm
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 23:38:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Cai-0000000FpXG-3q6m
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 23:38:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44KBlfnQ001074;
	Mon, 20 May 2024 23:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Ig5V5BQs2PpkzOOIlwVTg7SFzIYBDf48K5nHT/ulhBI=; b=KA
	aB1uTLKJeyUUJYZZM/sEVCHkznldO+FEOuYuIif4nAxyWonK3ecC5onUfNP5mGXO
	EQ9ASqj/sDsYYf1RdL8LzSBvPRz7YH9nUsNOWcMkdf/e9lmT8aqQOf6fsBvofKnI
	QH933SFK07zRsPqrcm8DrsSWfsQHiaMmzpyrNWL1jIbU5mhNehZzxzfnBgmQqhJP
	L/P1gU8249G3JA1d/EjcervlNq5GiRyAmabgehjz0w9dzGZmKHV5c/xa00PKQSWA
	5ExFHC7P4AuFgz3e4wI2VaYWkQW9h25eTHjGjg/36ewvu/hytod+BOw6l1hhNgAc
	JqFsxFiDinE0S9r0RSlg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n3w50js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44KNcoHN014478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 23:38:50 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 20 May
 2024 16:38:50 -0700
Message-ID: <d483cf66-433e-4414-b195-a7f4d54e6f0e@quicinc.com>
Date: Mon, 20 May 2024 16:38:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] wifi: ath12k: fix firmware crash during reo reinject
Content-Language: en-US
To: P Praneesh <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
 <20240520070045.631029-4-quic_ppranees@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240520070045.631029-4-quic_ppranees@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 6-r6UuHgobrl7c6NeV19hKnQesNxBKtv
X-Proofpoint-GUID: 6-r6UuHgobrl7c6NeV19hKnQesNxBKtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-20_13,2024-05-17_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 phishscore=0 clxscore=1015 mlxlogscore=754 suspectscore=0
 spamscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200188
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_163853_118540_2722A25C 
X-CRM114-Status: UNSURE (   8.77  )
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

On 5/20/2024 12:00 AM, P Praneesh wrote:
> When handling fragmented packets, the ath12k driver reassembles each
> fragment into a normal packet and then reinjects it into the HW ring.
> However, a firmware crash occurs during this reinjection process.
> The issue arises because the driver populates peer metadata in
> reo_ent_ring->queue_addr_lo, while the firmware expects the physical
> address obtained from the corresponding peer’s queue descriptor. Fix it
> by filling peer's queue descriptor's physical address in queue_addr_lo.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


