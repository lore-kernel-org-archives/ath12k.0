Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9FCCFA45F
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 19:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5pk3Gb9ZZ+iJpGPYIKUJqzg7WHsdPaCPYzNB59ezTU=; b=L84Tn8A6byD1wsCTm+OGNYkOY5
	RQxgzBlhVWYh6QtxjkPSz0q5TdBuWzrupDuB4DyHJ0GFpYCNEy555p08JCvec4q63QRTR9UR3oy0Z
	LU6almvVKhPJ2WcWU2D/Xk7J8xlax5Or3aN/RWwzXgMyLHrghgpdPEht8DoguPp9Yb1e4QDuE+aP0
	u64BYQTw3or9qcPOy7pgraYkNMr47AGWzZ2xe3DYhz8SdCgROO8fVBmhtX7G6WIrpS1ucyFPopUio
	bmm9CcBm1PnXvN27QE9hDoJ0GzfgEy5CKdup0x4z1x57BPV1Lvt3vNxnntsHs2Odn+4Q1h3qYRoPH
	OUeCp/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gw9-0000000FetN-32H1
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 19:22:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fTL-0000000FQeb-2ZcR
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 17:48:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9SnZA025432;
	Wed, 23 Oct 2024 17:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5pk3Gb9ZZ+iJpGPYIKUJqzg7WHsdPaCPYzNB59ezTU=; b=WpqrTccqTH4zQllH
	e8dRxoxsYs2raYE+prPJbwuiy23D5OQkS/iEb1Y4BW1dJyKeNlFbFi/3i1YEJ5Qp
	l2ukApiLwL1wu3skAn7023dcZMoA5YIMnVz+erTRogTkpaWapjl0blblwIUgdBhl
	vZKdJpgobsdLjJPQQryFwrdXMep19hyBudKY1JV6OZykkkBv41z4z4/tKzsqlAhU
	tmK68ziErffX0NH1eMnMjgJwmmVlh4s6XzvJJtODsekdLzsQcb7RSs6zr5a3uS3v
	XAptje1Sq1hr5Qls21XG+mTx80PFvK+oEMQKN2liYKKrlJmOTOMOKVKhsyIATFPS
	0iKisQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41u2dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:48:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NHmarG006296
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 17:48:36 GMT
Received: from [10.48.242.6] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 23 Oct
 2024 10:48:36 -0700
Message-ID: <78aff701-7670-46c2-a947-ff39f5cba23d@quicinc.com>
Date: Wed, 23 Oct 2024 10:48:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] wifi: ath12k: Add new features to ACPI
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241023024551.18966-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241023024551.18966-1-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: spkpqbtQsmee3giDA8q7gTN2pWbfWXsV
X-Proofpoint-ORIG-GUID: spkpqbtQsmee3giDA8q7gTN2pWbfWXsV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 clxscore=1015 mlxscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_104839_805460_A8EA47DA 
X-CRM114-Status: GOOD (  13.32  )
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

On 10/22/2024 7:45 PM, Lingbo Kong wrote:
> By reading ACPI tables, implement a method to obtain the ACPI functions
> Bitmap, enable or disable specific features based on ACPI Bitflags and
> download board data files based on ACPI board data filename extensions.
> 
> v3:
> 1.change some function name.
> 
> v2:
> 1.support functions for cases where CONFIG_ACPI is disabled
> 
> Lingbo Kong (4):
>   wifi: ath12k: Add support for obtaining the buffer type ACPI function
>     bitmap
>   wifi: ath12k: Add Support for enabling or disabling specific features
>     based on ACPI bitflag
>   wifi: ath12k: Adjust the timing to access ACPI table
>   wifi: ath12k: Add support for reading variant from ACPI to download
>     board data file
> 
>  drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
>  drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
>  drivers/net/wireless/ath/ath12k/core.c |   8 +-
>  drivers/net/wireless/ath/ath12k/core.h |   7 +
>  drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
>  drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
>  6 files changed, 217 insertions(+), 48 deletions(-)
> 
> 
> base-commit: cd8aa3af7491a1f7a5b81e53dbe62a38433c2d4b

FYI this series does not apply cleanly on top of the MLO branch and hence it
will be deferred until the MLO branch has merged.

/jeff

