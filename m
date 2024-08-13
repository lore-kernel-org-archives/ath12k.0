Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEEBC52D7B
	for <ath12k@archiver.kernel.org>; Tue, 13 Aug 2024 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnjoxmDNnS/g/R1mmW3EOuYnSW6m/VaI+AVp5ndjqBI=; b=ivT/SIVPTay+oI5rhAMViZ1x95
	tTyjaRHvs8kpvX9pCi5QQU16Y0tDdVzLzGWVOQSv6DFt0CvAdvQa20aD5gcOKPuSH+V1/GQJBqaaP
	5R9hyshDl6hr6ydP591Mm/MGAhojRCAT1VImnHA59uuHd4RFQ/WUlG3C0l1pwG6FZOTfE/kcBbHSW
	CEJuj0UDXgah1gD7ZI0XwnjpV/OuehfDoh7W0Y+5E4HOGqbtlXT2ZEozcYZZUmKxBHffrzimg54uJ
	Weidkv5mc1QGlUqH/ikYSbf0fZRd9otz60TTx4xhJ5MYfpxLqLrjNZ6zq15/RF1yYfOvRFO927Fo2
	nFFhex5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduvS-00000004Rty-3ZP0
	for ath12k@archiver.kernel.org;
	Tue, 13 Aug 2024 17:03:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sduvQ-00000004Rsq-0LoG
	for ath12k@lists.infradead.org;
	Tue, 13 Aug 2024 17:03:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DDOD8d011796;
	Tue, 13 Aug 2024 17:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnjoxmDNnS/g/R1mmW3EOuYnSW6m/VaI+AVp5ndjqBI=; b=K2Q6gNjtRVKj6pAi
	zucw7OrcLM6mmjuAAnyAGAfXVG8ub+QZDtgnSKEOAPIi28yYRGeQDrRGbu6N82Ib
	T8t5sQIZGFCVqXv7rCf+BaggBEljqMfvwr46EsCfBzCVb7r1KdQn3s0aWogHRnuF
	oZpOLvvd1tnUYexPuMuVdfADP2Ba7KF2NMTuFwKggCHdBPk8lnIofHkG5QmX2H3C
	tZuYcGYnfYuVnuaJs9dDVRQorVtfL6NFC5ZmU/p93+sfMSn5F6BTe9ZtQjYA0szY
	cPoS8l5vUYVfVYpLZjrmynqas65gnq3m0zjIjGLcrPyd3Cl/ssbZK8pg5hH6TuVI
	v9LNsw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4108bc0rvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 17:03:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47DH39NW024666
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 17:03:09 GMT
Received: from [10.111.178.117] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 13 Aug
 2024 10:03:09 -0700
Message-ID: <217ee6e8-38e4-41e5-aaa2-cedfa631f2d8@quicinc.com>
Date: Tue, 13 Aug 2024 10:03:08 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] wifi: ath12k: Adjust the timing to access ACPI
 table
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240809025055.6495-1-quic_lingbok@quicinc.com>
 <20240809025055.6495-4-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240809025055.6495-4-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8m5YULcxZocZFfVtm9u6FGOZp9IXyO_u
X-Proofpoint-GUID: 8m5YULcxZocZFfVtm9u6FGOZp9IXyO_u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_07,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=819 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_100312_280605_C0D83CE1 
X-CRM114-Status: UNSURE (   9.36  )
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

On 8/8/2024 7:50 PM, Lingbo Kong wrote:
> Currently, the timing for accessing the ACPI table is inappropriate.
> 
> Due to special ACPI requirements, the ACPI table must be obtained before
> downloading the board data file. Therefore, adjust the timing for accessing
> the ACPI table accordingly.
> 
> This patch will not affect QCN9274, because only WCN7850 supports ACPI.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
> ---
> v2:
> no change
again you should have carried this forward
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


