Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16148C25B74
	for <ath12k@archiver.kernel.org>; Thu, 16 May 2024 13:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oA9S7trk95zZDn6Rxbq5a85hm5CGnq2wzcpTCTCQUO4=; b=o489RMx/RtdR3gKaKcJ3kYGUAu
	vNSt7Q4syv51P7793CSsZmpqXkfmeqgtu11UAach69EvAkEhy9CLYq3i8gzdl+4n4RmBrnpdiOpqx
	7tVt+903tD1fZnLlF49QQABXhY4/eSaQODdDY7rRdzuWA1OsHglHQkHa5AUaaMbgFP5srSWimzOJK
	fZdBy1r3pvY4O8iosB+m/x0EqcSBl7dGZZ3rI082M4cbR8MPx0xAViaSyIEziaxCwy+S9bmzcDmSR
	WwewZXzXmgsO5XmtbNvpAbEe4rGA0aT13t+QzZZfjQf0aMItJ6UrSQQZl3Nn1n2X08l+tnuxuPqqa
	KSxsvqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7apH-00000004wIN-3DPk
	for ath12k@archiver.kernel.org;
	Thu, 16 May 2024 13:07:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7apE-00000004wFJ-2QOc
	for ath12k@lists.infradead.org;
	Thu, 16 May 2024 13:07:14 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44G8X8F9021397;
	Thu, 16 May 2024 13:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=oA9S7trk95zZDn6Rxbq5a85hm5CGnq2wzcpTCTCQUO4=; b=iU
	dIWCMxJluOzBnb6W2II/l0Fe063OAeSQ/P4M12WEuDTgNq6q74nm7s64bws6Gys0
	E3nb+IpjQvgd/Ezay6+v1ikeXB3V+MDdh7syZX06L5iTpKwwb14SVtif0Q/Hiqdd
	1GSgjM9W3N40OKBdzkxDhE26PlegNTKMzPnaqWw7WPSwQ1i7zdmD8B8Bflrlylds
	uWwWroOV35cmhuo51XFYIys4vz68WI2DHlKFxuh+TMTfFl8K+CpM0KAV7/vSiN1m
	2IuubRf7wlzWCjA1JM/hD0KYAJRv+6S9gRQ9FpeWE3wxt12ayH7Nz8yb1X2rfvh4
	T2IUW6fSurLkFx/+gTwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y45vbdth4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:07:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44GD71aW011972
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 May 2024 13:07:01 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 16 May
 2024 06:07:00 -0700
Message-ID: <423cd28b-480c-4840-a6a4-94560aa56581@quicinc.com>
Date: Thu, 16 May 2024 06:06:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor Rx descriptor CMEM
 configuration
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240516000807.1704913-1-quic_periyasa@quicinc.com>
 <20240516000807.1704913-2-quic_periyasa@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240516000807.1704913-2-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xr4LmuYAgvNpTTsu9SCXUpB9pzJ9BKkG
X-Proofpoint-ORIG-GUID: xr4LmuYAgvNpTTsu9SCXUpB9pzJ9BKkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 mlxlogscore=535 phishscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405160092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_060712_927789_BDD4FBC6 
X-CRM114-Status: UNSURE (   8.09  )
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
> Currently, data path Rx descriptor placed in the CMEM memory respective
> to the Rx offset. This Rx descriptor CMEM placement is not meeting the
> requirements to support inter device MLO. In inter device MLO, multiple
> devices participate in a group. The device specific Rx descriptor buffers
> transmit to multiple device REO rings. To distinguish between device
> specific Rx descriptor buffers, the CMEM setup configuration need to
> choose a different placement based on the unique identifier (device index).
> 
> Below are the CMEM configuration placement representation:
> 
> Intra-Device MLO scenario:
> 
>         Device 0                                Device 1
> 
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Tx      |                         |     Tx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Rx      |                         |     Rx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
> 
> Inter-Device MLO scenario:
> 
>         Device 0                                Device 1
> 
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Tx      |                         |     Tx      |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |             |
>      |     Rx      |                         |   Reserved  |
>      |  Device 0   |                         |             |
>      |             |                         |             |
>      +-------------+                         +-------------+
>      |             |                         |     Rx      |
>      |   Reserved  |                         |   Device 1  |
>      |             |                         |             |
>      +-------------+                         +-------------+
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 HW2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


