Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B2D6C021A1
	for <ath12k@archiver.kernel.org>; Wed, 12 Feb 2025 11:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:In-Reply-To:
	Subject:CC:To:From:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UoR3IOvD4H/L0pB5U7reZrodqFkzHr3+pdOLxK7N4EA=; b=ExZIGQKWSlb5+QsA3qJSVtke+P
	moa1QY8W+2fm30X9p6N3Af/9lf+Amb/7lWRAhCz+DN4/ettN7+PfOLKw8nTV5b7oNJu2S4Esvp+Hp
	XF+ymb3dqIKuEiSRTfbReuD5cJMTQJX1zG9wHscVDGBid7fwlD/8r410RSEWrImZF04VGVGwm47ae
	DGXC2NU9LOfHDTwFlVhYoERFcJWkZFIaozVCNoMkossjcMCCUrk1BWUsiKAQQ0XaRDUZS9yisZjRs
	5fjvXROaLSjh7MEH0VGhPPtCpb7X0W8Hac85a04O2ibMauI6iK1F9VXc8mrBX4TuRL4SoHzueVYI8
	tOeKH0xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAmD-000000079Gy-3gf2
	for ath12k@archiver.kernel.org;
	Wed, 12 Feb 2025 11:19:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiAmB-000000079Fv-1Att
	for ath12k@lists.infradead.org;
	Wed, 12 Feb 2025 11:19:32 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51C95PYa026413;
	Wed, 12 Feb 2025 11:19:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:subject:to; s=qcppdkim1; bh=UoR3IOvD4H/
	L0pB5U7reZrodqFkzHr3+pdOLxK7N4EA=; b=MSzLRe81pvP04mIVKx6u/Hn7PMe
	Tx5deO5eT6GxQnanIVYln5LQ20OUOqlNZRNVW+Zeq4pJ0pifDxSG7zu70W4CAjmm
	FBBzev4VurV/YQS+M0nv8FyCbyGZUKJ/Z8Bcmvk+Dvh5K84OhL3RFztymS4z5Fvz
	BDlSoPBBuQRNflwMnq9wRvMoVcW4imSmrUfbZEKV/HTCK/UDMG3haaYOggzemehx
	dw+T9PCovMzPxOwzb5oCLF1FlUs53cDMrOrHwVcoVZRBE+AXfWWezcSSEk7aYoPd
	ZC3XtcnuvOLEEhKj7I9w+GyttD+xx9S2UIpQ+dUAGw7HTRqUikaX4hycuHA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j5bhg6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:19:29 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51CBJTJ0004318
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Feb 2025 11:19:29 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 03:19:27 -0800
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: <ath_bot_tesseract@quicinc.com>
To: <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v10 3/4] wifi: ath12k: use correct WMI command to set country code for WCN7850
In-Reply-To: <20250212063200.1631-4-quic_kangyang@quicinc.com>
Message-ID: <051390c4-0da2-488b-82ae-61fca543b4ee@nalasex01c.na.qualcomm.com>
Date: Wed, 12 Feb 2025 03:19:27 -0800
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: _XAK54e0QmXoLhr62m20Wzlfn3ioSqnF
X-Proofpoint-GUID: _XAK54e0QmXoLhr62m20Wzlfn3ioSqnF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_03,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=514 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_031931_427760_417C8F65 
X-CRM114-Status: UNSURE (   6.95  )
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

Hi Kang Yang,

A total of 1 issue(s) found in this patch. Please see below report -

Error 0: INADVISABLE_WORD_USAGE
Prefer 'firmware' over 'fw'.


- Tesseract
-- 
Deet-doot-dot, I'm a bot.

This report is generated by a bot. It may contain errors. User discretion advised.
Powered by KITE.

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
http://go/ath10k
http://go/ath11k
http://go/ath12k

