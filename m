Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE30C3DA4A
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 17:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DxmMiCR4V9GWFXtwsYVxLHIpH53tII8YeBVY76HLSb0=; b=G6G11Lh8WyS/+hRv4uNGd9Yx08
	IVLJIi5Fa8iJcttjUX9tw3HfPytll1hwtBSzUBfml1HiMJUdsNQzxvJAUUYYKkKZrRfxBEJG0eaT0
	8RfT0U7MyQt4BORlkUltNp0eW1QtkUXSbG5uYTj6sE6t5IFFda9MPDNzSv66tlISCdlYUmlcoRfvq
	t5gvfNCRv62YRoh9oAzI2vrUeR8wrgxdCDhHCGqu0umu0qFI7ROuWRsDmD9kKTyIuhHSVvVB9PIsV
	dgKH9/RVlfJUnKCW5Me7BJ7Y7kofzm5G0DEiWxXl8q4ThVh/Z1A+cnSN6Il2z1+JPRjUffxH3RUpb
	15b/YFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOLG-00000004U5C-04q4
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 17:02:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXOLB-00000004U4i-2clR
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 17:02:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46QCB4Qm013918;
	Fri, 26 Jul 2024 17:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxmMiCR4V9GWFXtwsYVxLHIpH53tII8YeBVY76HLSb0=; b=AzriHc0l37eAVoZt
	/WJuCClLUGlBNeq7tA2DgcDLmihYbJ7bCg2iGTyVB7BOjOOMZgso20TWJnnyOoSo
	D7YnQvCAQMKwd5E42FcFZjemq7RKJI8Do4SqaidjTuzUxmOZxduWQnkQfpFS9/qd
	No8rLJnFJInS+6zZB3UdHfjVdZ68B+9qltRh1a91pCKFLoy5EfOAVdEG4mmqdaDS
	6LLJ+fEG2WS1uHQn71E4qH2B4tqpCLfUdbo2eOAfopxZk15oRamZx58SbxPUmluw
	2FSZG2TgxUaKHZT0boMzugpCjmrp4gnI9fXzSRJWT7yInlJgRVFWn532CXvRfANy
	jLTSOA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40m1vq1yda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 17:02:46 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46QH2kFS028505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 17:02:46 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 26 Jul
 2024 10:02:45 -0700
Message-ID: <6c91dbbf-9205-4e1d-98f6-b5c25733936d@quicinc.com>
Date: Fri, 26 Jul 2024 10:02:44 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] wifi: ath12k: delete mon reap timer
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-12-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-12-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: X7niZY5529WEsoalRggpf_ngsbShtRdx
X-Proofpoint-ORIG-GUID: X7niZY5529WEsoalRggpf_ngsbShtRdx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-26_12,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=792 impostorscore=0 bulkscore=0 mlxscore=0
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407260114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_100249_815531_CE5039D1 
X-CRM114-Status: UNSURE (   7.70  )
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

On 7/25/2024 5:00 AM, kangyang wrote:
> From: Kang Yang <quic_kangyang@quicinc.com>
> 
> Currently mon reap timer is not used, and it is not needed anymore.
> 
> So remove related code.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


