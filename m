Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082BBC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z/2FNSJEDjSJpiIJJXuVWE9xSOlRJ4Xyd8X01guB3Eo=; b=4EWFR2FabJUAFoDmT7+IAx/kAs
	rk5/EgUw9pF2ibyQ7DAHmRejTgFSlBEDjWbfnrC15R3X/s5odCMu8HEKfuhzOV3M9VFlL0oiupn7e
	+zsS3KtNDAOKWchEs4oHVp2lPmF1d8vs6JCZzvs0bjkCtt3D8yh/Cszw8IudnXWxKFVh7wNLx+gFJ
	vbPe1DdI/W3vZnkhEG0GXmUsTSqA5xeAILZagO6Scr8jsNczXrtoCE3o8lUMCIVn5dJ9ZBL0PVok7
	KHFpzKncD25e0QrLsBk8EcAQHTx5t5LBNQJiLDg3uOgj5vuzdKGu1qQAn+/tW6U20ulYKErePX7G2
	XrG6/beQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UDl-0000000627Z-2cPq
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 17:39:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5UDi-0000000626o-0RTW
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 17:39:47 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44AE4ngv014161;
	Fri, 10 May 2024 17:39:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=Z/2FNSJEDjSJpiIJJXuVWE9xSOlRJ4Xyd8X01guB3Eo=; b=Ts
	5C3jAY/XuZtwlqGnKoYMA+3eLzK4c8YHhxK6FxEq9rMgEpQWvjzdXooG1oJDJBZD
	FPYOaxOJNp9mTbT2mHa0zTl6VV2K+ywxSL0kaRchyV3kMUxpwj5OqKIwpm8WXh42
	FhAfls6bI1x5wLUmMsaq7acIRaxNpWSjfHTT4Es3ZDpRXxwpSkVs7qjdULJN0a1M
	J5D9ltgBEiEZ2cxgF3nkt9tWUqJFm5XrM+bV5AVowRh/LpDbauVXw1CNpzMnEneu
	jCwChv+SH4db4O3A7VACFfa/4EPqmvgE9LqlQNzK/R1hbQrVqbH4gIGCWMMb3oBJ
	XPDAtbH4H/soAbuSjODw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w2a4k1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:39:45 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44AHdjPe015769
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 17:39:45 GMT
Received: from [10.110.100.57] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 10 May
 2024 10:39:44 -0700
Message-ID: <55635ee8-1915-40ce-8c13-3337b9f40a21@quicinc.com>
Date: Fri, 10 May 2024 10:39:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] wifi: ath12k: add WoW net-detect functionality
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240510064748.369452-1-quic_bqiang@quicinc.com>
 <20240510064748.369452-4-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240510064748.369452-4-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NI7ZMKPQTWnjfTYs1dOzLl1oTyf4QeWZ
X-Proofpoint-ORIG-GUID: NI7ZMKPQTWnjfTYs1dOzLl1oTyf4QeWZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_12,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405100127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_103946_191519_2331AEBB 
X-CRM114-Status: GOOD (  10.11  )
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

On 5/9/2024 11:47 PM, Baochen Qiang wrote:
> Implement net-detect feature by setting flag
> WIPHY_WOWLAN_NET_DETECT if firmware supports this
> feature. Driver sets the related PNO configuration
> to firmware before entering WoW and firmware then
> scans periodically and wakes up host if a specific
> SSID is found.
> 
> Note that firmware crashes if we enable it for both
> P2P vdev and station vdev simultaneously because
> firmware can only support one vdev at a time. Since
> there is rare scenario for a P2P vdev to do net-detect,
> skip it for P2P vdevs.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


