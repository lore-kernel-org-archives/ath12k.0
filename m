Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C1AC3DA7F
	for <ath12k@archiver.kernel.org>; Wed, 31 Jul 2024 16:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00tjIpiyLnqWxSkYft+WkprGEKeL90GzEW/ymr6DXy4=; b=pJuL7zf12SExdIKnlHHOrJ4eXq
	bpKTBGErIWGwl5NYQzubZ8tMCXOYu94dl+LNnW7Tg1fkghBmwuJ6qmsBqQPEb7FBABa0sQTrnndf8
	hxZPM45EA152VgTQz8Is29sJdmPFtXnU58MDK8bRUJukQ2w1HGlf/n2GfxzdbHu6/ZJvd6flNo3hn
	zpyN8fhWTWmpRKkAi4CgpP5Ac/7IGNmlyGQYxqmkcqPz7H7EUZrAiO+aTPz9zvO5tEUZkKCkyDGmA
	5NolrRZKkYRQElDN45X24dcWCZfvM1vFOO+e3sHFMNNwJyIny8viR4uiSr1nJBKXXUO7J1Crc4u0X
	23xyuhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBsW-00000001oqO-0lGq
	for ath12k@archiver.kernel.org;
	Wed, 31 Jul 2024 16:08:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZBsT-00000001opy-2dJQ
	for ath12k@lists.infradead.org;
	Wed, 31 Jul 2024 16:08:39 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46VBSJZI027544;
	Wed, 31 Jul 2024 16:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00tjIpiyLnqWxSkYft+WkprGEKeL90GzEW/ymr6DXy4=; b=H0r+o8/JeL2mlj+A
	5JnqlpYMcqMeyft0OMoFwieKKWnv2RMJM0717xV2HeAaVpRLGdcm1+Kluaoyr/O7
	JjtmHEN1oPkiMz1HmMY4Qjf2kYq6UgMq0b2ePe3aynldj+0RVBtoGLiYBpd2Vlws
	FrFQlauRQcv/3Cok2ar/7exDXXUNEYQ0U86pBVd5ULmYwoJB14b/QwJz3VUexogm
	mYPetj2F7OOGxaXFmcrqbrtSeYBR1IOlG13JfjzY2Js56ZnNpV0UrqsF177b0da8
	lsbWAT6xLV48rH4DLhaksEPYJ/Bz/vnUZ7769U4UbpBoHghn76WMte6My4dljIeS
	gKyJfg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40q232v12w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 16:08:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46VG8ZNZ005495
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 16:08:35 GMT
Received: from [10.111.177.34] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 09:08:34 -0700
Message-ID: <456b2407-81e7-43d5-ab31-61ca87e284cb@quicinc.com>
Date: Wed, 31 Jul 2024 09:08:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor
 ath12k_qmi_alloc_target_mem_chunk function
Content-Language: en-US
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
References: <20240730170910.3281816-1-quic_rajkbhag@quicinc.com>
 <20240730170910.3281816-2-quic_rajkbhag@quicinc.com>
 <4ed6f40e-f27a-4868-8670-c81d95a14a3d@quicinc.com>
In-Reply-To: <4ed6f40e-f27a-4868-8670-c81d95a14a3d@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GEP5-b-7mhvyDvCeunb5njynno0tDLRd
X-Proofpoint-ORIG-GUID: GEP5-b-7mhvyDvCeunb5njynno0tDLRd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-31_10,2024-07-31_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0
 mlxscore=0 mlxlogscore=708 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2407310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240731_090837_704322_CFA72752 
X-CRM114-Status: GOOD (  10.86  )
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

On 7/31/2024 8:45 AM, Jeff Johnson wrote:
> On 7/30/2024 10:09 AM, Raj Kumar Bhagat wrote:
>> +			ret = ath12k_qmi_alloc_chunk(ab, chunk);
> 
> seems like you need to test ret and return if non-zero here since currently if
> you get a bad ret in one loop but you continue and get a good ret on the
> remaining iterations then you'll end up returning success from this function.
> 
> In other words, your refactoring doesn't correct handle that the original
> "return -ENOMEM" would return from *this* function at this point

I see you handle this in patch 2, but that portion of patch 2 should be moved
to this patch


