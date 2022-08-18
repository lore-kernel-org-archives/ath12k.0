Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0ACC00140
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 22:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jyRrbe7+1T27qzQlqzRXZBYKITmKNweRCZncoF2H164=; b=GYe+uguTWDH9cQ
	S7LGaSVmjId1aqoY0IIS9Da6fOGn+v0nDY6RWmPpb1W/bRkfqp3gCb5i6DUrG+UJ0CiEghb/zYFlW
	wbb3aQzma1k4KG3AT6SJmtQD+HK6Y2+JlG9IrLvZnQBIvsVIIss/Gm6u+m2dLILWzebTZmWbAPG9c
	HB2eqsGp++6i1UFmIHN9pTOwt6ypcxsyg9ingBY5aHWNSxq7VzDUosaNI+XEknveonpjMH2WGN/uG
	3x3GkuHm5pszKgc7tdWD8DXkFAFTA6iplyN6lrXPtQ4Hch5o1PMwat/F482dVLKD0EOBgiD87TD/8
	UJH503PwGalTRtVt+kzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOo1u-00AbZ2-6n
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 22:30:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOo1r-00AbXw-5l
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 22:30:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27IKT1Gh012337;
	Thu, 18 Aug 2022 22:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=rlYquebpyfnILooHX42NM0yVr1TmhP9B1ienRXfadPM=;
 b=ZR9zwp4DP5U7wao84lnaA+VqajOzGpLKOp1xrir3VdUwlTEPaz3B6t+6E5/aryAgHlGi
 pCL/aMttHdjDB0CeRKg9izXtFlKOYNw6tESX8ufAiTGewyG2WcvPRy5UuZSrMsaBUC6I
 fYeja7L/9gloUv0IIvIsiZkdads7goDY+a47R+yCd8AtiyI0cemzbmtHq/1N1U89b6oz
 1KcOdThBaYQdvq51i3qILnfJx0Jmo7b0NjZKTarrdMeTaW3vv6EDJrRNueJmvmSx2Lcb
 GuaAzP2Mc0g4dzuR2yBtwxsNZt1nIRUjjjN+k4raCSDNzNlHRAHqh16CqdLDSpiglvi6 oA== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j1ve4g76q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 22:30:16 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IMUF4i032135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 22:30:15 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 15:30:14 -0700
Message-ID: <9038589b-f2e6-18e5-29f2-f88f19d34a68@quicinc.com>
Date: Thu, 18 Aug 2022 15:30:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 30/50] wifi: ath12k: add hw.h
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-31-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-31-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zvjatfN8O_D6NcWEKP3RWanUr4XYUA9j
X-Proofpoint-ORIG-GUID: zvjatfN8O_D6NcWEKP3RWanUr4XYUA9j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=987 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_153019_582599_52BC9FA2 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/hw.h | 284 +++++++++++++++++++++++++++++++++++

snip

> +struct ath12k_hw_params {

snip

> +
> +	struct mhi_controller_config *mhi_config;

imo based upon mhi.c review this should be const

rest snipped

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
