Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1866C3DA6E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 18:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YU3didum3UBOOLyO8tJPrPFE5gi+WNpSx8aWIWV5psQ=; b=QdTv8l5o/j8ZtvBSCxtxUasPs1
	twOmAR+lLIFp3fkFQzfmnpdjj0i3rLE3hX35C2oBVDFzgfGjox74nrsuG//K6fXhstFBTcYsyfQUS
	YqHBCPQA+gRn2J1dbnbx0Gg2a2IZt/QCMcBPfT/10E/39/BSy9g2kEsGls3mNcfOi0bC2LqjSYhqy
	/Y18LMXOlkseEdHwM0sxwDNwG8XOhOsZIaLBjSE3g1UMpgbYY4cVkOt3KQy7qxZUsgmLCWdw8kWD0
	TWxAdLJPy0JRDfLAErbCgWnH/X+bF65kNADoTUjaT4kqFH4ByV9d69leBP5aTaunXYioDjhUIyv47
	NFq+zEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMu51-005qWA-1T
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 18:10:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMu4y-005qVY-0p
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 18:10:29 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4089qBQe005802;
	Mon, 8 Jan 2024 18:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=YU3didum3UBOOLyO8tJPrPFE5gi+WNpSx8aWIWV5psQ=; b=Bs
	2dLzYYAefpfexgfgVVo0RB9ZCH3T3mzD2hn0BTamKNwqfIcxD2eyUEv5jJh8Azmv
	Uf45eFnz0QuD9A2ovigKOQgeWzgmGsdJvkuWkjPkCy8gRBm5xW/HYFLH4IhXH8yq
	4ORfkUyfNXcv2rl6yf94JfIebBbAT5lVnUgfSgv8A9UAb5ITYXOQbaaIoTDUjE8b
	e0SIR8FBXL2MkNhGlqMLXoXa8zNBCsEA8eJvlFf6eo7FWEUVUnY//BvT2wb8EtRG
	T+t1/KHhynewryWFF3aI8c8EU7Q6QHWtbLIyGRAUTbkbqhNucMbhjPH1VFgpFU7e
	dsks84epUZQ3EgHUAZpA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vgbu2hfsu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 18:10:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 408IAQs6024511
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 18:10:27 GMT
Received: from [10.110.42.177] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 10:10:26 -0800
Message-ID: <6c3ceb12-5154-4bc1-8cae-e8a05e7bd9e5@quicinc.com>
Date: Mon, 8 Jan 2024 10:10:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] wifi: ath12k: implement remain on channel for P2P
 mode
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
 <20240108082552.7227-5-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240108082552.7227-5-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: L_Fc5KXwPQgCBrHIv6LW7qHO6o0EyuN6
X-Proofpoint-ORIG-GUID: L_Fc5KXwPQgCBrHIv6LW7qHO6o0EyuN6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 clxscore=1015 mlxlogscore=624 impostorscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401080154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_101028_294515_91A36EAF 
X-CRM114-Status: UNSURE (   7.04  )
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
> Implement remain on channel for p2p mode in ath12k_ops:
>         ath12k_mac_op_remain_on_channel
>         ath12k_mac_op_cancel_remain_on_channel
> 
> P2P device can trigger ROC scan. Then keep listening or sending management
> frames on particular channels.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/core.c |   1 +
Qualcomm Innovation Center copyright missing 2024

>  drivers/net/wireless/ath/ath12k/mac.c  | 113 +++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c  |   4 +
>  3 files changed, 118 insertions(+)


