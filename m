Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFA4C4345F
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 17:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKD1iZb6pj0NGWFcHL6EDvAPMvG35Pd8GV5knQMFkNg=; b=vVMwjfIG6u64QfMAYHGNRrMwyd
	jnb9Av2DJ4PvgttwMjNZ4ne5JlUYfsk1CYeeG1WtF2f3mK3QUwiD7DPW/5YUGgnjkO47i46u8zksh
	snIXzPHmpTuW8FmsDni1fCA02hSuhz9JkShLxycKSFeDVWvimQyFpKx6GsJkNJWjSEM69RvE1qzmj
	VQ42lbKME2A2quQaqNRPWLGGRI+Rc1Ha9mm7CEQYLZiwOCbKQKY6sg5ONKEEL9Bkq/e4+/16edRA3
	1PTWq2EL25DsDaIGT53IEOa9ntyBQpkibXcBshV2BaRByZ1gTQHi6ze4lINCnj6Q9fPhiQBhy+4Wa
	bF8MXuRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rcF-00000007Uo8-1TMB
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 17:50:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1rcC-00000007Una-32Ni
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 17:50:06 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43U5raBU022930;
	Tue, 30 Apr 2024 17:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=yKD1iZb6pj0NGWFcHL6EDvAPMvG35Pd8GV5knQMFkNg=; b=pi
	jcxnuYFkCa00EoZ9z4FX/zoawvcGS1yMnoYblfhczZiWGI0DUpXxkYrgNMAcYbmy
	hdHZo6kSYsKrYnkpQb9yIGp/Z5rIzz8U6c5d6J4Li7w7F5Q7h1HjyFi0ePomLk8L
	yQ2iNkIpjL3+k6hzRoLVFCUEv6uzEp26B2othvKAlYYGUIvVfnWAdWpDPUwG/RGY
	QXkUgbkZApxN0euWaofQGimlqw7B3nlsAZf+Aw3JkiycHGzF1bquWmTe189Ir+oE
	vLu3kG9+qsrnG0f5wqgknZHY0/aSNcGJzUt6lqEWTQnW9e4FErxJGlu++FTFLHCW
	1AkFvWE/fhjFmTcxwfCA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xttw3hr7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 17:50:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UHo2gM012900
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 17:50:02 GMT
Received: from [10.110.13.147] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 30 Apr
 2024 10:50:01 -0700
Message-ID: <8a7823bb-dcee-4ddb-93e0-077371408014@quicinc.com>
Date: Tue, 30 Apr 2024 10:50:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] wifi: ath12k: drop failed transmitted frames from
 metric calculation.
Content-Language: en-US
To: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240430074313.885807-1-quic_kathirve@quicinc.com>
 <20240430074313.885807-3-quic_kathirve@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240430074313.885807-3-quic_kathirve@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: G-RqNz_jmsdSXQAwY2Fn4a0U9pxik0Zl
X-Proofpoint-ORIG-GUID: G-RqNz_jmsdSXQAwY2Fn4a0U9pxik0Zl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_10,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_105004_938663_382DB40A 
X-CRM114-Status: GOOD (  12.91  )
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

On 4/30/2024 12:43 AM, Karthikeyan Kathirvel wrote:
> In mesh node traffic, internal firmware-transmitted failures are
> reported as transmitted failures in mesh metric calculation, leading
> to the breakage of the mesh link.
> 
> Fix the issue by dropping the internal firmware-transmitted failures
> before updating the TX completion status to mac80211, in order to
> prevent false failure averaging in mesh metric calculation.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Karthikeyan Kathirvel <quic_kathirve@quicinc.com>
With one caveat noted below,
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>

[...]
> diff --git a/drivers/net/wireless/ath/ath12k/hal_desc.h b/drivers/net/wireless/ath/ath12k/hal_desc.h
> index 63340256d3f6..71e8c8a091ae 100644
> --- a/drivers/net/wireless/ath/ath12k/hal_desc.h
> +++ b/drivers/net/wireless/ath/ath12k/hal_desc.h
> @@ -1,7 +1,7 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2021 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2021-2022 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved.

should be 2021-2022, 2024 per current guidance

Kalle can probably fix this in the pending branch


