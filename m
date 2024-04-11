Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42D1CD128A
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 10:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cDtv9qYVMxl8IwPb6k8ZEepqu1zXt9mdPFqSSbLv6Ac=; b=HingN0YVfjiq3XJbL0pPbPmgOW
	g13lqKJmuuJQV2aQliqDYSFAIaYtckJiLIOjUoFV4wY/DUBfJx5pmiqqeP1fehQMTu1D7uNHzyfEc
	UVOM4M0nDrbmo2V33HNdqyfDgnkC5EsaLMv2DWkp5zr5NgloeBiR3VRaBa8OX+UGbw18+Lh4xmoO5
	Mmmj/7wHZmx4pNqo1kFrD9NL73L4945UXjmiPqKP8TrVhRHZKYyvgBn3DnYUsm2D1hXlj3ujDi1h5
	BY1xXUEc3+yHjaOXxNciY+9nYytq8zJej1LDDjkRLeHEwlc68lNSu2Bx0nRLcnv6RyMHBEWhDU/sV
	MhlFH+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurLm-0000000BSCr-2C29
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 10:08:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rurLj-0000000BSAE-0kKi
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 10:08:08 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B9qZG4026637;
	Thu, 11 Apr 2024 10:07:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cDtv9qYVMxl8IwPb6k8ZEepqu1zXt9mdPFqSSbLv6Ac=; b=fc
	GtqHobV6ggDYxM8YOje0V8nOGEfNpmt65fFFuwr6jpDEqxObjkRTC3swGLjwg5kx
	OBtpQ0mQOOaNG3wujszrMsquFCR6eqhKTgV901WTB3YjXgn7iFTKXsoYwN2/zSsm
	pzycGvwRrywph1NG3P9Io2Skq+qH6mdU38xppaawaUBe0azQKAIGF5FGzX+6Gw0h
	OcZbVu/3U9PlWfdh6lhZmU8eaMRNMK9bK6cd762GUFZR7i0tG9FkPjARA5UTPHs8
	P9SeixCJX3C1iq8wbJPzH8oQ/qSAFUtlq2+2rWw8jKQ1TMj6R7NezZTl8qbSPnW0
	/4/AstOaOz/g74h+8owA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe5eht69w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:07:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BA7rMY021454
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 10:07:53 GMT
Received: from [10.50.27.137] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 03:07:51 -0700
Message-ID: <6ac588c2-6206-c12e-e741-cbc507365bc3@quicinc.com>
Date: Thu, 11 Apr 2024 15:37:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 4/4] wifi: ath12k: Refactor data path cmem init
To: Kalle Valo <kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
References: <20240409151415.1226109-1-quic_periyasa@quicinc.com>
 <20240409151415.1226109-5-quic_periyasa@quicinc.com>
 <877ch4z0z1.fsf@kernel.org>
Content-Language: en-US
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <877ch4z0z1.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: OMs-6ovHevZaOgmEAwbU4yT8OInh7Z4v
X-Proofpoint-ORIG-GUID: OMs-6ovHevZaOgmEAwbU4yT8OInh7Z4v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxlogscore=984 spamscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404110072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_030807_544777_380CD691 
X-CRM114-Status: GOOD (  12.02  )
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



On 4/11/2024 3:15 PM, Kalle Valo wrote:
> Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:
> 
>> Move the data path Tx and Rx descriptor primary page table CMEM
>> configuration into a helper function. This will make the code more
>> scalable for configuring partner device in support of multi-device MLO.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>
>> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
>> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> 
> [...]
> 
>> +static void ath12k_dp_cmem_init(struct ath12k_base *ab,
>> +				struct ath12k_dp *dp,
>> +				enum ath12k_dp_desc_type type)
>> +{
>> +	u32 cmem_base;
>> +	int i, start, end;
>> +
>> +	cmem_base = ab->qmi.dev_mem[ATH12K_QMI_DEVMEM_CMEM_INDEX].start;
>> +
>> +	switch (type) {
>> +	case ATH12K_DP_TX_DESC:
>> +		start = ATH12K_TX_SPT_PAGE_OFFSET;
>> +		end = start + ATH12K_NUM_TX_SPT_PAGES;
>> +		break;
>> +	case ATH12K_DP_RX_DESC:
>> +		start = ATH12K_RX_SPT_PAGE_OFFSET;
>> +		end = start + ATH12K_NUM_RX_SPT_PAGES;
>> +		break;
>> +	default:
>> +		ath12k_err(ab, "invalid descriptor type %d in cmem init\n", type);
>> +		return;
>> +	}
>> +
>> +	/* Write to PPT in CMEM */
>> +	for (i = start; i < end; i++)
>> +		ath12k_hif_write32(ab, cmem_base + ATH12K_PPT_ADDR_OFFSET(i),
>> +				   dp->spt_info[i].paddr >> ATH12K_SPT_4K_ALIGN_OFFSET);
>> +}
> 
> Here's a good example why I don't like functions returning void. How do
> we handle the errors in this case?
> 

sure, will handle the error case in the caller.

-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

