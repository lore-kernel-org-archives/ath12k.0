Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB9CC04FFE
	for <ath12k@archiver.kernel.org>; Tue, 14 May 2024 14:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9TVr8WF8f64mUjwTGcREmUEzVhnHI6tAsqIWHFL1frU=; b=NPUkjbamABdqTvh3E1ICZn90/Z
	TT2WATa49gqp5HttQYhqcCu3tD74e0Qydm+lz5i1eunXlHCc/kYGd+Uak9oY1algum74guG+koFnb
	9m2+QwZZs/MMVjsd2KWUaZhe6pPtFYG4kHsEJPy85Qzkc3dF5KbIUMqdxXJAmx8d2EK7WCpWtyi4Z
	pDvUPFgoH/aprFYvHsnTRZbxYIcPHs6NhPz63+mdYn+6JYb0wsKCyxLy3nrLsrTbl6+fcMcqwNZ2C
	Mh9Gri5NOxey1PG6ae1eE4IJATtiSoNxlQstlmTw04OfN/LYbeZL+xmzeQ+qcA+7ZY2VB60dLbgKT
	NPRDGsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6svq-0000000G9Xl-0Edn
	for ath12k@archiver.kernel.org;
	Tue, 14 May 2024 14:15:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6svn-0000000G9XD-1yeA
	for ath12k@lists.infradead.org;
	Tue, 14 May 2024 14:15:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44E7v3dl003261;
	Tue, 14 May 2024 14:15:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=9TVr8WF8f64mUjwTGcREmUEzVhnHI6tAsqIWHFL1frU=; b=Rl
	cb3pBTl1oXZ95NdV6CwNPH+fySVlQLvMamGHznfPUl9ceEQG6A/Fw8XMlKgU5fe4
	BCG4p6tz+EOilI8EpQ+FeZfAvdhfJHM8oUW3wfKRjDY3FdsuQ2w3kmR5ajG/mezB
	NiHMB/PGmfBpmmiEn0NNckpdi0f8Vf3n7Vb7jp106fKMbIbq5S+qGm6peLrbIcAr
	0bF1bIAJGBACD48bEaUT0EJZDx048LXvf13sJYYhpFtmuQkJhRbE0u/jqUY3E2zp
	L3Z/RjvZH5+BU3qYhyPvJvA77WBiHZVaZdRc+dwYV/Lz3Br2zoXInmHy2aXKueEJ
	STo0LhB5o3u+Ck4APYpQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y3j28k3w5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 14:15:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44EEF1RP014665
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 May 2024 14:15:01 GMT
Received: from [10.110.0.4] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 07:15:00 -0700
Message-ID: <df076b8c-dcb7-47b4-bf2b-b56def3464d1@quicinc.com>
Date: Tue, 14 May 2024 07:14:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: use correct MAX_RADIOS
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240514063412.3483723-1-quic_periyasa@quicinc.com>
 <20240514063412.3483723-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240514063412.3483723-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bX8_iBHu_UKMtf5_m_4eyX3iKqzl5JoH
X-Proofpoint-GUID: bX8_iBHu_UKMtf5_m_4eyX3iKqzl5JoH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_07,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxscore=0 clxscore=1015 priorityscore=1501 mlxlogscore=710
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_071503_669628_EEC4F40D 
X-CRM114-Status: UNSURE (   8.95  )
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

On 5/13/2024 11:34 PM, Karthikeyan Periyasamy wrote:
> The current value of the MAX_RADIOS definition is 3. This is incorrect
> because no device supports more than 2 radios.
> 
> An incorrect MAX_RADIOS value can lead to:
>  - unnecessary memory allocation for pdev related entities.
>  - invalid pdev id validation.
>  - Misconceptions for code readers.
> 
> Therefore, modify the MAX_RADIOS definition as 2.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


