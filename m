Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D840C3DA6E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 18:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGl3rx3YxwHR+uZdYdrAFqhoi6y++pKrpGsrumcuwbM=; b=brm0rr+dQjY4v8srRl8o23Cn0T
	a9JOK5rtJ/vNrHbQ6a79cyxnhTNwahyplWsa4J+28ANEfDSWZN6289AT45Gzo9oHraYx/UneBSzvK
	aVJloXQ9VCckrjdFMtBKxOF8ewCZShwVu9tM678Biu0lzk+83+NCUK4YTb/nE+hso4xllbuBfgb9r
	/OPqv6KJtF2wziNer530ZR4VUwIe5+qaWzIrmZcIvmL4xsRiuP8cVQXHViikmQtUtJFxAnx9jGQ22
	ql5rkEviR+NJW5rdwoBMIj1BBJ9AaPPyeSwNvPKdx5bxo2CC7SExobgU43Gu592oerx4g/kmVW81k
	nijqEtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtwz-005pQQ-0I
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 18:02:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMtww-005pPz-1n
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 18:02:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 408Ds9Tm002939;
	Mon, 8 Jan 2024 18:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=mGl3rx3YxwHR+uZdYdrAFqhoi6y++pKrpGsrumcuwbM=; b=Xh
	cM3WC9YnqWLC6zwzzZL1oHftPqixcV+Whb2hdqYEP++vNdKCUP+tUXB+t1FW9+ee
	WuhHK5EqJTzwii7mLHBI61ldAMkH2rSFfbzMNRfl+GXT+akmaWx050CQlgHlWSsy
	TemywKuv2Ejy+/DmjXPlh4H6xd2Zk2fKsaMvWa1c5jW6PJaW34iCRRGDJ0YYEoMN
	BSIClIcscCnRo19cmKl9TD+RirrAirAEoIecACYKn7hJwolDQm2V72vpRVlWFO8W
	ND5nIt/VNf8L4u8ZiyR7vaIS6YCjXnPs93C07nOrvT/ma2qaVBEZEDGZ+5ssYD8T
	Iob4kLlIqpRzSj8o1Npg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgfwjrwrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 18:02:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408I1x1Z029507
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 18:01:59 GMT
Received: from [10.110.42.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 10:01:58 -0800
Message-ID: <10105b2c-46ab-44c1-a022-644c9c50c218@quicinc.com>
Date: Mon, 8 Jan 2024 10:01:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] wifi: ath12k: add P2P IE in beacon template
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
 <20240108082552.7227-3-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240108082552.7227-3-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5FoohrSM9dXHUcqRm_4fsHxwCedlwr1h
X-Proofpoint-GUID: 5FoohrSM9dXHUcqRm_4fsHxwCedlwr1h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=794
 suspectscore=0 priorityscore=1501 mlxscore=0 malwarescore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_100210_599937_2E8C44C9 
X-CRM114-Status: UNSURE (   7.33  )
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

On 1/8/2024 12:25 AM, Kang Yang wrote:
> P2P Element is a necessary component of P2P protocol communication.
> It contains the Vendor Specific Information Element which includes
> the WFA OUI and an OUI Type indicating P2P.
> 
> Add P2P IE in beacon template, and implement WMI interface for it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 85 ++++++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath12k/wmi.c | 38 ++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.h |  8 +++

drivers/net/wireless/ath/ath12k/wmi.c
drivers/net/wireless/ath/ath12k/wmi.h
Qualcomm Innovation Center copyright missing 2024


