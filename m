Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D5DCD128A
	for <ath12k@archiver.kernel.org>; Wed, 10 Apr 2024 20:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfOT7YtHzjgJWZHk9MM3kzt1Jqu6u6VgN+9Nmrt0B8E=; b=sMj/s6uZMAig9iDQul5HAY7QRY
	Tf2mKswsOC/cPC/prFqZkRDBPaExlLs0Y5R3Gva5gORl0PMARp/mz5AauLQXYCMtPJjcRonu8dthf
	mMyapWn1bOi/7T9JrsMeUko0QVzztao+QI4r1jj6+TyrBlETUfD3voGEv3MbKMOdVfqZDp0921/zD
	LrGJ7Y2zMcb1qzWMnOxDDoBlOIrdssjSXpEgb82tDuouZJiB+3hRa4nePPhC/xmua/gTNbFyK6U7H
	IwiPr8CpKhM94dLkRNQQTrJaQr23vMXOnMmjDDsh2k1PD9Xlc8T+9wSlibMpnpzLb6bqe00MxreER
	Yd3k5GWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rueYb-00000008qnX-2g8C
	for ath12k@archiver.kernel.org;
	Wed, 10 Apr 2024 20:28:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rueYY-00000008qmE-2qfI
	for ath12k@lists.infradead.org;
	Wed, 10 Apr 2024 20:28:32 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43AJJLrM013899;
	Wed, 10 Apr 2024 20:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=OfOT7YtHzjgJWZHk9MM3kzt1Jqu6u6VgN+9Nmrt0B8E=; b=Nr
	1al54YYR7iYB2+58YeHXSKWL/qFzjwmHQOjFDzZTZMopCqPJkOsibLKwkiPiDlLt
	cuxi66Dk68mG6MgjoKfFDl5ord/pNHgjSRET5St/kfx0WHCkPBVug6nIvF9O6v00
	ybUHK2rbCWh+rW65l7N9dxwC5BkNqiYiWqV7rDgmEpeYbUluL1XHWGW/5gYWS71d
	SOiF7wBJIXmD8NVfmFNwhx2e8nyF6H8EC03drUFax4aX9TlO7uilkjEEq1TDy6Bj
	NOoduVlaVBVtbC22P2bDg/BKMptlyaJnggka+eSGC7Hcai6YafldbIpufyKzJqsH
	28mnrf5WCB6iTHfYIEMA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe0pw06nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:28:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43AKSOmt003164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 20:28:24 GMT
Received: from [10.110.37.144] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 10 Apr
 2024 13:28:24 -0700
Message-ID: <dff77529-3c1a-4d7d-8cfa-e0ae1820b1c5@quicinc.com>
Date: Wed, 10 Apr 2024 13:28:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: enable service flag for survey dump
 stats
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
References: <20240410085329.3649572-1-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240410085329.3649572-1-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wsBTnh6R4GBtLxFMeFuqHyXfRU8-QPWy
X-Proofpoint-ORIG-GUID: wsBTnh6R4GBtLxFMeFuqHyXfRU8-QPWy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_05,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=784 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404100149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_132830_758921_96780C5C 
X-CRM114-Status: GOOD (  10.18  )
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

On 4/10/2024 1:53 AM, Karthikeyan Kathirvel wrote:
> From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> 
> The survey dump statistics does not display channel RX and TX time
> properly because the survey flag is not enabled in the firmware service
> flag.
> 
> If firmware supports enable the service flag "bss_chan_info" in
> wmi_resource_config to fetch and print the stats for specific pdev.
> 
> Enabling WMI_RSRC_CFG_FLAG1_BSS_CHANNEL_INFO_64 does not have any impact
> on WCN7850 since this bit is not utilized by the WCN7850 firmware.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


