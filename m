Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD07AC25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/12YApeDp+kDKnV0XEs7980x0VyQwKes3OhmC3PisJg=; b=bPAWpzF5trAwyIBP0aLz4DA2/m
	cciu+WCU42qSTcqRJB8Jr+jTRZUHrXI5Be24HKZZ7dkpl9DcnCH/U8aWcF+F+8rEaXbrU8oVY/PM5
	JlSYJJ3fCCQF5Oq4KIRHpCra+WGpmmYcWqRtte2xToBsvAb+FhJtjgHxWIaVawypNyvsY0pP2GTVB
	GxYVCbsLcnEsExutF+0I0voQ7x1YMAsPyWxqzKIGXJdyjTXjjwz7vV6ItaHxfLeJ7rC5ugD+/ePZp
	tT7VDCacSLFdxgQjxUuj1GS5V0MshuGJYV9JWei53F2cadkrBfqeLb5s31HAdZPa5i0pcv5lMHNGT
	GwQXmEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMNs-00000004yk8-1Fvn
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 16:42:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCMNp-00000004yjX-1jk3
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 16:42:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44T9JHY9000950;
	Wed, 29 May 2024 16:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/12YApeDp+kDKnV0XEs7980x0VyQwKes3OhmC3PisJg=; b=jvf/NLzDZg6lliLd
	uyxTSKF/4+gK3ESEo4+GhfFKtgqHwXllFbl+cMptGD4DymWeI2wrsGpuT/NHqvcN
	jJPL4d41rqRe/9iTIxF1QIHQ+T91EaWPKzHiVTdISzt5wMCiI4KmjH+TNSx3dLsZ
	IfqPESxG1cH8xKUKXsPl/KCNnbv1vjJiMklhGQQYRqs0aKGAinDDSuI73FYAizCI
	Iw5Tnq2I793ZHSbLZuCKo1nk/WIN8qd3lJ2Ypv7wUw4iyUCDJxCuZiReZ439k5WW
	RhdzuKZ/7BB027MZC4l+aSWKGHzAsytaVt/65tUlvirXlUhyix7WqRpqHYG0Arfk
	9g+AzA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2pskq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:42:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TGgZtB001659
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 16:42:35 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 09:42:34 -0700
Message-ID: <decaf472-bfbf-41f2-b745-e8646d0c1812@quicinc.com>
Date: Wed, 29 May 2024 09:42:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: add hw_link_id in ath12k_pdev
Content-Language: en-US
To: Harshitha Prem <quic_hprem@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240529054955.4105240-1-quic_hprem@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240529054955.4105240-1-quic_hprem@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2oY57XwSnQ3k6U3ecTsAk9nxj8fgcomC
X-Proofpoint-ORIG-GUID: 2oY57XwSnQ3k6U3ecTsAk9nxj8fgcomC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_13,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_094237_643737_338F7744 
X-CRM114-Status: GOOD (  11.42  )
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

On 5/28/2024 10:49 PM, Harshitha Prem wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently, hw_link_id is sent in WMI service ready event but it
> is not parsed anywhere.
> 
> But, in future, for multi-link operation, this parameter would be
> needed by many WMI commands such as WMI beacon template
> (WMI_BCN_TMPL_CMDID), WMI vdev start for Multi-link virtual AP
> interfaces (WMI_VDEV_START_REQUEST_CMDID), WMI peer assoc command
> (WMI_PEER_ASSOC_CMDID) for Multi-link peer and so on.
> 
> Hence, add changes to parse and store the hw_link_id received in
> WMI service ready event in ath12k_pdev structure.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


