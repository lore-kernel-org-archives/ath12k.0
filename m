Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 448C4CD1292
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cu6TfpV3LGmSpWe/02IYz4JZBgwrLH77ippkYJyJhr0=; b=ON0hMrdbuN1SBeHtYALjpazJVX
	iQtC9mB0WSY1XzdHAbw8gz+boFagAuxdfOxdWVsMYec6ApjGY5UkNTq2WQXpKe1HMmp6S0u4sNvjh
	ZCGnamZkd9xdzXpEMqHT3JeQENDl8DpQDODes/ZINkiy3f7FzeEG7at2aAhlV7wWCc5kaYvcJn32F
	tKXtArKpMFVoHwMqH3TfcVQI8qTT7YGZnpLHQmCR9zmUCnwH4Q8iX+eG4FwHu+Wqo4BrhLAenMfHV
	kdeqs/zVZVQHoJonGp/RD94LMLFq4Wucx24qUTyI8hpAuY0E9kPiNmnMPtv5ZfITKFa2Ta4NvINDM
	fGy8uiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxJ3-0000000H0K5-3lge
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 22:17:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtxIy-0000000H0HO-0BRG
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 22:17:36 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 438L8Qdd030388;
	Mon, 8 Apr 2024 22:17:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cu6TfpV3LGmSpWe/02IYz4JZBgwrLH77ippkYJyJhr0=; b=IX
	M85LuNg8j/BRLglbr0Vnv35iXy2cLU+dG/QslBM7aF3EYIPXefwGa43RgZJq7JuJ
	/xH/rOQdH9tjktEoXuo/+/elN1ifQbN8+3fKJ0jQ1UmiU6J7Iu/iYbZE7hB0TGWf
	uGUAvcjAxyelutkLzcO+yqWg5Di/pQi96loeMwAefCYpSBtjSALf9duwuypQCiqM
	MbLqPhGEzVsB08JEHA8ofE/VBNU/T2jvBABJp06K+50BH4Upzxb68ICcihfKXXIt
	rR/603ksqQqiZd2h4vjqJPF+huUMyCoNx2kPlEO5F+Iefomg8UZAy6bJp6NCjint
	D4f0RMmGZWg+eUQJou2g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xcbg01y1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 22:17:31 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438MHUAc027184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 22:17:30 GMT
Received: from [10.110.80.194] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Apr 2024
 15:17:30 -0700
Message-ID: <0e47e2a8-67a0-4002-b42f-374a8c301f50@quicinc.com>
Date: Mon, 8 Apr 2024 15:17:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath12k: Refactor data path cmem init
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240408040547.837639-1-quic_periyasa@quicinc.com>
 <20240408040547.837639-5-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240408040547.837639-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: V7c1_9YnfB9sAj9Uj9LkEwWOXDu4-mub
X-Proofpoint-ORIG-GUID: V7c1_9YnfB9sAj9Uj9LkEwWOXDu4-mub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_17,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0
 mlxlogscore=687 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_151732_818523_766F6CEF 
X-CRM114-Status: UNSURE (   5.93  )
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

On 4/7/2024 9:05 PM, Karthikeyan Periyasamy wrote:
> Move the data path Tx and Rx descriptor primary page table CMEM
> configuration into a helper function. This will make the code more
> scalable for configuring partner device in support of multi-device MLO.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


