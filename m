Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A95C3DA49
	for <ath12k@archiver.kernel.org>; Fri, 26 Jul 2024 00:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k+2b7wiYBMjr05cP6wk4nbh8sb3TK8ZRFr8KtWUIUlk=; b=DeDxaPLkbzA+kSgPavl4EuWo74
	FW5dm+NQN+tSocoBVk6sdKC9ccRSSrRM/fLrnco6e5cwtZbc9Yu+VpuNmhrcGA0kuIihAgWWkGr22
	PO1ZQJ6sBGtvwLj321wsRiiXRX1JXszoZiRREWdui/qXLDef8qcX+74vmxNL4Tf+uBlenVNxlKAKR
	yuCiaSbSQUYaEZ5mWTh9hUueSluJc6T2eW51eyL5vbLvmt83OdhfLRC4bclkazwsTIzVeriOIyq9j
	57Duw61BGCp+DfSB9R95QCazJbkqsgGvlqx6+RxARGCe9FgEobFOV9zoMBIkWTlh2489B1NbqvOho
	OnrTNX/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8Yw-00000002U98-3ZRC
	for ath12k@archiver.kernel.org;
	Fri, 26 Jul 2024 00:11:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sX8Yu-00000002U8N-244H
	for ath12k@lists.infradead.org;
	Fri, 26 Jul 2024 00:11:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46PCA1vF014872;
	Fri, 26 Jul 2024 00:11:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k+2b7wiYBMjr05cP6wk4nbh8sb3TK8ZRFr8KtWUIUlk=; b=ZdTHmNYt9pnlu5GJ
	R8CGcSSk+IeYZoObf0mPTYzt7qg4uF9m9V993SBJW8Jd20jVsTgORYIZC8J1/fZI
	en22rBJ3J0jLFDFtYJqflFR1onRA8tF2OuyiGPwCTqsUy0/7ghd27ZkAKLwCyzFo
	aTRaJw0+SmKMgu9wLJJjJr97kVBqjgGketxs1cgVKmvOh+VLfTazKFFz/sBhy2g0
	OV8xT+ZEkhvkfHJT4ss4pdEheb8ZGJqLDyeBRoPRwXFl8YcQudkQMK2xWziC50j0
	wNtV82EGnHYzBwnxa6yvBQn+vw7DZk8eyglfxrP+Hbu9L6r2TpF3wnKPg+NOu0+j
	KMxvwQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40k40ym722-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:11:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46Q0BslW007070
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Jul 2024 00:11:54 GMT
Received: from [10.111.176.158] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Jul
 2024 17:11:53 -0700
Message-ID: <29464106-c531-43d5-aa1e-d525991444af@quicinc.com>
Date: Thu, 25 Jul 2024 17:11:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] wifi: ath12k: remove unused variable
 monitor_present
Content-Language: en-US
To: kangyang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
 <20240725120035.493-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240725120035.493-2-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DRvU4zKfa43QfYia6DHXAQssS3NNfweA
X-Proofpoint-ORIG-GUID: DRvU4zKfa43QfYia6DHXAQssS3NNfweA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_26,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 mlxlogscore=741
 spamscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2407250164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_171156_691639_7E3CA0C0 
X-CRM114-Status: UNSURE (   6.31  )
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
> Variable monitor_present is never used. So delete it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



