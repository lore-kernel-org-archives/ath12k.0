Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59C1FD6C285
	for <ath12k@archiver.kernel.org>; Tue, 19 Nov 2024 18:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OA7MrYZlCaav4NenyipKox8rxFNAojc9AIoQx95kSxI=; b=0MVuc1kKsdFM0Qfw4j+E+RVS2V
	muuLR79SQOhb4yIiMbDTgJepqLw3RxJGtDvxHmzr2fBZ+iru+F9Izh3jsO0dEo8Y7ZwPglWZt5S/D
	uLfg7BK9kSBFkOGYBj+92tMNZwwUuz1NPqzsjut2EbHkW/ok/0ka0KgiUM4e2q4nzz7UgMVFPXaxr
	PJv8LfNglTkFUvj78FzKmdgu2S2Y1UUpoKcyl2+Da0isEB+Gcwk0UO3kYkh1nyqFdxd47dTJ4fpVo
	tKiEblBw3jJWBuMU/iXsyX2SJuZz7gMtNi14oTF2+pIYPANf3+rJ5kUBnuzkyJVqIKlb20xe8DOZ1
	KN4rxIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSnF-0000000DMJX-0ZHY
	for ath12k@archiver.kernel.org;
	Tue, 19 Nov 2024 18:17:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDSnB-0000000DMIk-3UB7
	for ath12k@lists.infradead.org;
	Tue, 19 Nov 2024 18:17:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AJICtQu027393;
	Tue, 19 Nov 2024 18:17:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OA7MrYZlCaav4NenyipKox8rxFNAojc9AIoQx95kSxI=; b=of0VzLVVAORsAYX2
	c0redQBP1enn7UByQbrk6noJL4hAoPJxwYd/GOnoxJCMijTlsRJm5Przokwf9xlj
	qfZd9zZhTt6KpNvCRJddpc/o9/05BF4zCnpG8sZvZ3Bt2v7U41lrNKt1PQVfLqzw
	U7kDVHSnSPoDt/OQqEpxDRgw70NjSDa7QH24blPI8ElCF+MqWSnlq+HbrdCJ2xzc
	7Bo9dMZqMDuOJLV6nMfbhqZKRQsLVjfpdJlKoqNLavnaWhD2q9B+aWH1TF70qHdh
	vueOhFFtPbJXg7ugj81j7rsT/KtiNjfWnB5P9bW7qDuWRPpuW3MNbAWadreua1xJ
	qoi2aw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y6ugn4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 18:17:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJIHVAP018488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 18:17:31 GMT
Received: from [10.111.176.82] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 19 Nov
 2024 10:17:30 -0800
Message-ID: <d8bb8bd5-c353-4a2b-b22b-5b24ba423e10@quicinc.com>
Date: Tue, 19 Nov 2024 10:17:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix endianness issue in struct
 hal_tlv_64_hdr
To: P Praneesh <quic_ppranees@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20241119164516.756478-1-quic_ppranees@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <20241119164516.756478-1-quic_ppranees@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3FDQpSSGsHhyeGHr3i6s3S0ILxNxxoFY
X-Proofpoint-GUID: 3FDQpSSGsHhyeGHr3i6s3S0ILxNxxoFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 mlxscore=0 malwarescore=0 mlxlogscore=904
 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411190136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_101737_874650_C3A7BF34 
X-CRM114-Status: UNSURE (   9.19  )
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

On 11/19/2024 8:45 AM, P Praneesh wrote:
> struct hal_tlv_64_hdr has a 64-bit member that should be in little-endian
> format, but the current definition uses host byte order. Fix this by
> changing the definition and updating the corresponding helper functions
> used for the byte order conversion.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


