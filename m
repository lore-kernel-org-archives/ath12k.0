Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 012D3C4707C
	for <ath12k@archiver.kernel.org>; Fri, 12 Jan 2024 18:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUvmIGwkynFNBeAGTQIzjlReq48aS5AfQWBJlSHwD+8=; b=yULn4a1QkMEAbv6aqmlUy/+uyv
	DbYIQNZEKK4xzrBN7LxjWDq8+0mYLTFMn6E6meBFRNIq19OL3wd1ed49JU1bxT12/jRd2SOMGksSD
	gQhOg8Pk6BUMpFf0TzFpxBlcl3td6NTJKLtjddEQppzw33IQIU1Gdzq7/u/jIZoQ0dNnVgxB/wawi
	5iONdfbifQGOgAIMLFcENEBXcAInhs0DdPj8xMpMpokvOuOUC+h6VdQr96o5avvLr6u+X/VcAKTS7
	BBBb/hBTWejuCwHHLCZnj8lQHQls/h8aU/wIgIT3TUOfjc9JIfY9HYDe6wRYTSoWk9p20vRuxhnvh
	w1+VXkVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMF1-003bRm-1n
	for ath12k@archiver.kernel.org;
	Fri, 12 Jan 2024 18:26:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOMEy-003bQh-1x
	for ath12k@lists.infradead.org;
	Fri, 12 Jan 2024 18:26:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40CGSSIh005629;
	Fri, 12 Jan 2024 18:26:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YUvmIGwkynFNBeAGTQIzjlReq48aS5AfQWBJlSHwD+8=; b=lW
	aC2q4O5vgbP3MS1fD0vhmSGpWQpJlsy9tCQRYEn0EntRDckNEPipGtUCvIYBK0fC
	9WdPKAlMZlmHt3xdVXivsvoJk+sAB5Ym0J//U10w2Mw01WrA4NRRsee0qwHr8WRl
	FGE3nFDajNZEtyvOkHXbG21iu5LB16pFTPCAk/sXMWzwq9es7DR6hzHhsvXpXCGN
	YPwl5EMfrJSnWqQbTR38bnPXwj8LTJbrNkzGPW67Y2MQqIuW5dEaWtyDnh4pwBqF
	jILZl+lXrnia47xiR+XK1n8LVKXea+jH88Kpeg23huS9nhKln/cTW/kyYXPh2sjP
	XGYpV8IR8j8qN6DPnKKQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vk6ee8mdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:26:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40CIQlfb016841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Jan 2024 18:26:47 GMT
Received: from [10.110.16.29] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 12 Jan
 2024 10:26:46 -0800
Message-ID: <8c1bf2b1-48d9-4643-acd6-dd2168560ee6@quicinc.com>
Date: Fri, 12 Jan 2024 10:26:46 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/12] wifi: ath12k: support get_survey mac op for single
 wiphy
Content-Language: en-US
To: Sriram R <quic_srirrama@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240111045045.28377-1-quic_srirrama@quicinc.com>
 <20240111045045.28377-13-quic_srirrama@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240111045045.28377-13-quic_srirrama@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: IHgcGiQ5GenIqABoa8DFG1Jo3CJG8eOe
X-Proofpoint-GUID: IHgcGiQ5GenIqABoa8DFG1Jo3CJG8eOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=604 clxscore=1015 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401120144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_102648_647413_902518C7 
X-CRM114-Status: UNSURE (   8.92  )
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

On 1/10/2024 8:50 PM, Sriram R wrote:
> The radio for which the survey info needs to be collected
> depends on the channel idx which could be based on the band.
> Use the idx to identify the appropriate sband since multiple
> bands could be combined for single wiphy case.
> 
> Also use the channel idx and sband to identify the corresponding
> radio on which the survey results needs to be populated.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


