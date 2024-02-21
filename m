Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258A3C48BEB
	for <ath12k@archiver.kernel.org>; Wed, 21 Feb 2024 16:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9x7Uwhdmnd48TDUfR/CdE7qrVONSVhDZQKKQRCQd8E=; b=H01Hq0m7yBV9+2icVVXkxOFZW4
	T/MN74BYXr3Vye4y0pORFwBl3QkZDoAgxlYFJvsaruBSNd+V4TUwNMYujDGre9dK3jsK2Whp7btFh
	ZbMJihkGT6NPfCmvLW7gSFm0rk4NqZugDrSBwu/UBLwqRvkzvHSXSlOVx+hKyO0J9QaKUMxnU7NtO
	5q3bt1vQYVKlsnGvL8oLruB53nZ01PZn1cXLb3RwNzf7zEAYjVD3w+26yxg/mJMH8LTPGvgLxEzwN
	qYAuVOWhZwGvOqFx936qWT6g4W8+8FF6uEuaoMbPI+WqjTNddrI2x51sI58fQoXkDomVu6jAgcN4I
	xYoOFfeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpIE-00000001gFg-3aZc
	for ath12k@archiver.kernel.org;
	Wed, 21 Feb 2024 16:17:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcpIB-00000001gEr-3u5f
	for ath12k@lists.infradead.org;
	Wed, 21 Feb 2024 16:17:57 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41LCTQn9023911;
	Wed, 21 Feb 2024 16:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=E9x7Uwhdmnd48TDUfR/CdE7qrVONSVhDZQKKQRCQd8E=; b=hG
	EmeeAdw9P2yHpwqtLv7o/jcUmKH7TE6A+EWeF+GvZGdb00/TxYm6heccr5iKS4mi
	AUZzoKOTmwcrPeE1FcgC1Z447Seecctn0KDnD0jFh3GXJib9B3UBFu1H7b6tnmTm
	uG12KSpoa9GeHsJrrQK2hr0lSiGq34lgcyrYcaid/LL0UQA1z8mfkN9wHHqty4ZA
	GwBPSIwsgCdk5hsk/I2ksh+9LPR7SrecNM5KRnIb2A5aP/g2+fiImiDCkaW6Kkhv
	1PCaDC4unJvnu7FImti80CqZQwxudJelTGhesDj8AhB66oFdqihDjxuV+fGYdSj7
	h4Qz0CxM5KRWy77kt/aQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wd21s2fgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:17:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41LGHsX0017171
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Feb 2024 16:17:54 GMT
Received: from [10.110.34.22] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 21 Feb
 2024 08:17:54 -0800
Message-ID: <cdec81ec-0ae1-4bb2-90f4-25a4a4c2b54d@quicinc.com>
Date: Wed, 21 Feb 2024 08:17:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: report signal for iw dev xxx station dump
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240219111417.1185-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240219111417.1185-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yFgbsa2aWVR9MsVkvyiFeUwAd61bmIKU
X-Proofpoint-GUID: yFgbsa2aWVR9MsVkvyiFeUwAd61bmIKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-21_03,2024-02-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 mlxscore=0 suspectscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=925 malwarescore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_081756_017505_DDB3ECA9 
X-CRM114-Status: UNSURE (   7.40  )
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

On 2/19/2024 3:14 AM, Lingbo Kong wrote:
> The signal of "iw dev xxx station dump" always show 0 dBm. This is because
> currently signal is only set in ath12k_mgmt_rx_event function, and not set
> for rx data packet. So, change to get signal from firmware and report to
> mac80211.
> 
> After that, "iw dev xxx station dump" show the correct signal such as:
> signal: -50 dBm
> signal: -49 dBm
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


