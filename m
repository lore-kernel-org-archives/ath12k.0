Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6AC1C27C52
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 21:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yH0QXQi5wQVge/0F9LMvZsIKi/BiNXFunMlptnG7OJ8=; b=g4hd1doy6Bj9zF38wa2jHPm6q8
	tDDpRR8WQ8OcosybFAiMhcdDGL0Xm4nopmunAgLdJyL6lSs0CdHy+TLYSn7gb4Q5vXsT4e9NbIGjH
	/mqydYLqzbQZAkCN3jgQsia+++EFWDF00+CLz61sUgcad35T9ppazBc4tcpCWFjK7XKLqXf7OE0Uy
	mDuBRW7J4E6ahEjx9qW8l2VD1vXKmqb3VNRe8PTFaVw/ih1UU6Unk/B5fE4rCPE2Lz+xkvhf1TGt6
	7iuM9SXRLEizEArfTg11QFODqLw7WSz2saWiZIwlOu9q9v+DkCsUZZT7u8H2LYr/vfM29MXoIqWGw
	+M7JKegQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbGS-00000003m8F-29xv
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 21:00:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEbGP-00000003m5N-0eEM
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 21:00:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 454IHic6006279;
	Tue, 4 Jun 2024 21:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yH0QXQi5wQVge/0F9LMvZsIKi/BiNXFunMlptnG7OJ8=; b=Z/o1WKH2CRCnI+DW
	doKtGPAH+qpdpUQ48hLFLfKzqYWeCqw2f0s6dy5gm0lOW9xV36NiUEKcQWnKP90x
	L2EE8npZv5jJHBnhQTmtviggXlQK36jPuqMtRPqpTZ7NUb6+KtQvPDG2maZpADQC
	nYAjyicb/rc81GXgwMGNTgNraE5cn1fE6NVGeT35Ds9NaQSiLxI6jBYFk3IyHdSb
	qYHESB+LKqmVP8JW4AqZNEyw+A/VwVsFqmFeQ39bXb+/4Zrv8k+R3yHFtbWoPOAQ
	9n2datG9luDpnYqZngmm3CjiY5XIGOf041yb+/ABULYiMz3vAwTJKwGqpNdni4Ey
	z3y0Qg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yj8300ajt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 21:00:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 454KwBrM021122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 21:00:08 GMT
Received: from [10.48.241.109] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 4 Jun 2024
 13:58:10 -0700
Message-ID: <78c93382-a3fb-435f-92ac-fa15b0730704@quicinc.com>
Date: Tue, 4 Jun 2024 13:58:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: avoid unnecessary MSDU drop in the Rx error
 process
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240604062641.2956288-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240604062641.2956288-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8BwMm5jMKmWfXIUFHA3bVtCA9gER554R
X-Proofpoint-ORIG-GUID: 8BwMm5jMKmWfXIUFHA3bVtCA9gER554R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-04_11,2024-06-04_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=602 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405170001 definitions=main-2406040169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240604_140013_279375_82BA866C 
X-CRM114-Status: UNSURE (   7.78  )
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

On 6/3/2024 11:26 PM, Karthikeyan Periyasamy wrote:
> Currently, in the Rx error processing handler, once an MSDU drop is
> detected, the subsequent MSDUs get unintentionally dropped due to the
> previous drop flag being retained across all MSDU processing, leading
> to the discarding of valid MSDUs. To resolve this issue, the drop flag
> should be reset to false before processing each descriptor.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


