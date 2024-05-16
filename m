Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B4FC25B78
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vKNw4NoSgQn4imrfCjwhfio5dGu/2psYleBjAgLsiUE=; b=E2KZMnM15JpGXiOlLWNMMqPawj
	z8qMVNDGZACDNRuRL5K1D4pjRLssyGo2RTxxCcKdot1U+9sqSBPJIiGdYOirjfV2qT/uxOUQci3pw
	luyN0FIO+IllWISFI0gq5w5e1KebKLXQRazCL0mmckixVMXPWVBBtV+JZ5aeIt0Jcq+xIx6tM5u5u
	1TIwKddZrbK97EsJy/ZSUjkYgwV9XiKOxtRTr2n1nu7FsJKF4wknySq+u19RCsM+miV6l6zn/ZZpg
	e/fMRfUO5Rlzkj7nC3DvaUj5We8lTvIL82V7EKavGTo0ETbIAV+at4xhd8WEeqWsWRty2LBbACme3
	f0kldVvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7apI-00000004wIm-0mtC
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 13:07:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7apE-00000004wFh-2QJV
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 13:07:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8X8FA021397;
	Thu, 16 May 2024 13:07:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=vKNw4NoSgQn4imrfCjwhfio5dGu/2psYleBjAgLsiUE=; b=Mx
	Gu/sg4mvEaVEB9/M69ol2+Nl/AfYE0wKhlYt5iHtJQ/GJkv791lDycV0CNlgq3bB
	yPUW68m7r0lqsj8b51ssqnOn1jCr7YoquS3kt/5WLfLbCC4Bqeo7doTKcemQ0seL
	OTrEb4TrISO5iI9OErGuzg/OamwvQM3nsWtiLMxZTRljWEoDl27ihZckZ2wnYOnw
	NlCebtTmE6r9FDfiaUKfLdmx+k+LdrY28ze3S4h35GgmfbbttVkZTknXQRI1M5FE
	wkHnFVzUvbYo9/m+CrXNZ0igoQun0PcpUyoim1RKIK/WY6hEdSiA2AIFgr7gzGhD
	G7IBdwL1iw/K2OvWJu0w==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbdth9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:07:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GD73OF028490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:07:03 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 06:07:03 -0700
Message-ID: <99aa5279-79d8-4e18-960e-0515c2a1b70a@quicinc.com>
Date: Thu, 16 May 2024 06:07:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: improve the rx descriptor error
 information
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
 <20240516000807.1704913-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240516000807.1704913-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2i1EYPI8YmKj_QJ5ZpEz3NC97SZpIHbc
X-Proofpoint-ORIG-GUID: 2i1EYPI8YmKj_QJ5ZpEz3NC97SZpIHbc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=17 lowpriorityscore=0
 clxscore=1015 mlxscore=17 suspectscore=0 spamscore=17 malwarescore=0
 adultscore=0 mlxlogscore=67 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_060712_807444_29D736ED 
X-CRM114-Status: UNSURE (   6.09  )
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

On 5/15/2024 5:08 PM, Karthikeyan Periyasamy wrote:
> The ath12k_dp_get_rx_desc() failure log currently contains the same
> information across multiple Rx data paths and lacks sufficient detail for
> debugging purposes. To address this, change the ath12k_dp_get_rx_desc()
> failure log to include cookie information along with Rx path details.
> This will provide more specific data for debugging purposes.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


