Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9ACF34B0
	for <ath12k@archiver.kernel.org>; Thu,  3 Oct 2024 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Sfs91aRY7YF9hae0J7b41CutS2jWrxTYVg/PaxEf2Y=; b=VkOruCI3iv0fqjFcMfbIyaWBT4
	J4EQHPalQPCsw3nUGQuOsljpnRlp+CvP3cm65Jqoc5/YKiDe+rE3UZwFv60uwvHsvDu9r28IZHMTL
	KSuci1HFYANW4EN0vkOB82mPmy88UOE5O25+rcWiDijJjf38gV894elZ8e4m/+5um8iwK1DoDBgKa
	jpFYXMCG37oYM+DMqWxTlf77zTxACtTwMHdmxDiBoQ7p8r/V4wzmaSDoJBE5gUS1ElHRXK2hGM2H3
	eIM04CQxJpLC18IcofSTDfU1hf/s9MmnzvdwTFKYvckiNmvsSVRf1nAihDCf8IiWwg/LFlgZ4vj4D
	mpnPCIKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swNHJ-00000009UCy-0kSK
	for ath12k@archiver.kernel.org;
	Thu, 03 Oct 2024 14:58:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swNGC-00000009Tz0-0X0D
	for ath12k@lists.infradead.org;
	Thu, 03 Oct 2024 14:58:03 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4939P1IG026154;
	Thu, 3 Oct 2024 14:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Sfs91aRY7YF9hae0J7b41CutS2jWrxTYVg/PaxEf2Y=; b=GyNnxFv2G3tuFaxw
	Ns5XLU+vsXZ0qZd5Sa0kRNf/QlaQea4IntF4FHpB0xc5uMtY8Lq3WIYg2WE+O4im
	ajA8bkpiSotP9twpzJBj2kqpOtm1nKM6CU+W2mpkOpooV0wqiKordB2JfbGBd84j
	It3OCUKrJFSxVlNxJ6MZSvvy4+1oUiEjqRsvmoYMGbiu6aKeXrttLQCcD0E2rQEE
	UYWkMYdbNg6vqfOBSYb0qGLyhQxoacZaL0igLea+eN466RG1Q5t8yqTTAQckk6kS
	uJlyy6kKR9w2EhRm2VHttVdBQEJcQjBGvw6hQfqEKCvY/L56VzTo8RPSv3aMzaVn
	s0gjjQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41x9vuepg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Oct 2024 14:56:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 493EuoNS008804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Oct 2024 14:56:50 GMT
Received: from [10.111.183.136] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 3 Oct 2024
 07:56:50 -0700
Message-ID: <1f1e74a7-3ab6-4a92-84a1-ee157b7cd11f@quicinc.com>
Date: Thu, 3 Oct 2024 07:56:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH] wifi: ath12k: Modify print_array_to_buf() to support
 arrays with 1-based semantics
To: Roopni Devanathan <quic_rdevanat@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
Content-Language: en-US
In-Reply-To: <20240730035154.3723773-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nLVq6cjk-qUfyimIBOrSjqZQV9bx8VKK
X-Proofpoint-ORIG-GUID: nLVq6cjk-qUfyimIBOrSjqZQV9bx8VKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=693
 lowpriorityscore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2410030108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241003_075656_317815_F949F7BA 
X-CRM114-Status: GOOD (  13.48  )
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

On 7/29/2024 8:51 PM, Roopni Devanathan wrote:
> The API print_array_to_buf() currently supports printing
> arrays with 0 indexing. In some cases, a few arrays need
> to be printed with 1-based indexing, i.e., array should be
> printed, starting with 1.
> 
> Add a new version of print_array_to_buf(), named
> print_array_to_buf_v2(), which implements the functionality
> of print_array_to_buf(), but with an extra variable,
> pointing to the index starting with which the array should
> be printed. Modify print_array_to_buf() to call
> print_array_to_buf_v2() with 0 as the starting index.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>

I'm in the process of pulling in this change and the dependent debugfs
patches, but was never quite happy with the naming of the new function.
Discussed with Kalle and suggest the new function be called something like
print_array_to_buf_index() so that the new name has some semantic guidance to
how it is different.

Can you update this patch and the dependent ones to use this name?

/jeff


