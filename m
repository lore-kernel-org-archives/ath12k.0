Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F76EC47258
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 21:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKFRoyFdpL1ZkS24i3Mmdw1JWY+0mjzaQtfjURT0XNY=; b=BBrc37xifCErdrcr1khoY3Z936
	SJdY0FCeaTBO0UALy/829POe+jtYmyIlNaN4XAH3x/SVJmev7XE4xAv+JNyIyNlZeeYpb6f8xPDRC
	Ed7NQfi59T8X6Hbmd3+d6Isg9e+isyHWkodlFOPYq0v8vbZLfaum5mlskyJkiJXUv2+qIy/YW5/xa
	a3RDy1c/zlfbrlO8YzPDsL6Cqxi9TIj6tZlyKlh8euWZ7ekDexRAop+pDrq30L0WOz8Wzhb/pnCvp
	55sLgLxB9tc2cUIlqoUlGeqeWLFoozUIrnKyHIY5QAg1+s9NijZKKCefwmmqWoSSCCDM4siGOVuZ7
	Z+klzJuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHma-00000005QvA-381a
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 21:06:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVHmY-00000005Quf-1ZbZ
	for ath12k@lists.infradead.org;
	Wed, 31 Jan 2024 21:06:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VEmaqd030302;
	Wed, 31 Jan 2024 21:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=NKFRoyFdpL1ZkS24i3Mmdw1JWY+0mjzaQtfjURT0XNY=; b=nz
	CLlz7lhP3+ByHlSWe18qcqUzBHuLhg84rqEdRu1gO2WQ+WY0eUpiJ8RgBIryDOyA
	POEN0p3lWbzjzoiiAo0r70Z29L3PG8htJTuo8Lv3ch9qr0vAEkAknZPzTjF+RAtz
	/WNHJJMbGS09x41Cj2oXMrvwz4/XGZgzQF0jbUXLYCzxPiOM0i7Na1tUorvfoSDc
	E3rDImH83sZQfag3mA0kllngWGNLOc/tC1b1OrNaQIoNfNdR5vfUsLM4A9rEzKfv
	QBc0SylNxD516O2+DbgRyxwftVAp5Y3wZQMLUeb4YaGDnChzBfQBybyvwmUhvbNK
	iPVEjYILBbsv+ZH9X7SQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyq0ds6u3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VL64sH007497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 21:06:04 GMT
Received: from [10.110.47.232] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 31 Jan
 2024 13:06:04 -0800
Message-ID: <8a39295d-d30b-41c4-82f1-2eeab3565863@quicinc.com>
Date: Wed, 31 Jan 2024 13:06:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/13] wifi: ath12k: fix fetching MCBC flag for QCN9274
Content-Language: en-US
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240129065724.2310207-1-quic_rajkbhag@quicinc.com>
 <20240129065724.2310207-5-quic_rajkbhag@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240129065724.2310207-5-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: E18crAfyek__07v8PG24qOT1LT-54si9
X-Proofpoint-ORIG-GUID: E18crAfyek__07v8PG24qOT1LT-54si9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 mlxlogscore=963
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2401190000 definitions=main-2401310163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_130606_569843_50E169F0 
X-CRM114-Status: UNSURE (   8.80  )
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

On 1/28/2024 10:57 PM, Raj Kumar Bhagat wrote:
> In QCN9274, RX packet's multicast and broadcast(MCBC) flag is fetched
> from RX descriptor's msdu_end info5 member but it is not correct
> for QCN9274. Due to this with encryption, ARP request packet is wrongly
> marked as MCBC packet and it is sent to mac80211 without setting
> RX_FLAG_PN_VALIDATED & RX_FLAG_DECRYPTED flag. This results in packet
> getting dropped in mac80211. Hence ping initiated from station to AP
> fails.
> 
> Fix this by fetching correct MCBC flag in case of QCN9274.
> For QC9274 MCBC flag should be fetched from RX descriptor's mpdu_start
> info6 member.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 8f04852e90cb ("wifi: ath12k: Use msdu_end to check MCBC")
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


