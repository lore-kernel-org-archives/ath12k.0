Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B58BCD128A
	for <ath12k@archiver.kernel.org>; Wed,  3 Apr 2024 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d5lIUhkPkZrQGh5RTSBkxbGqGWRelVvdvHuggsf0q30=; b=Txn7VMTfFUwvjxq26pELtrrB5q
	Z3QFwltqJV4/l75OmJ1mJsnq+chpSCVenNEqUakfOR9j/Rf8GF0qdG8atT23o2LmCs5Y+q4VTe+sD
	bIRmNZ7bdmEH2c81aeL5slfzLAb0ZasFg0I5luMWcyh6uSxzdqmOYCUbPleuv/PD6ZbfmKcQbSt1l
	0hDEVZsbXz17a/MvdnxEoYV01oyCZyXEQHeNQXN2JhgOJ6qSsufnbzjQwdXsWc924G6kPolp8xvjQ
	SB8pTmn+nxbIefkBSJmY/TyGajHlb2F8+HQbSyyjgA+nGaRSR1kpZpyTpLdQum5BMXjXFlRnDm+7v
	6onkhijw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs26F-0000000GaxF-1LX3
	for ath12k@archiver.kernel.org;
	Wed, 03 Apr 2024 15:00:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs265-0000000Gart-3tnq
	for ath12k@lists.infradead.org;
	Wed, 03 Apr 2024 15:00:19 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 433DmO85014117;
	Wed, 3 Apr 2024 15:00:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=d5lIUhkPkZrQGh5RTSBkxbGqGWRelVvdvHuggsf0q30=; b=ib
	bj7TPV1gMexe2aBEYXtWBCqtuBRYk5mqBu0/ZdGA9ZO+SSyleGV7OCREx3wwzId2
	n2qjbjaaIYI7jYr0yqyZAoGQrh47oO8gfFREO/5t9cuefmCudxizol2NPudR/tpv
	TBrG+92q3OC8dkM1TGzQesulYnuU84vsL9Mo2CkQD3EAF59FmorgGozyqbm0eEFP
	0EPjRHNztXsk4EkuHgiIABXcfnkIJaB6eduC8lDuE96529FSkQw62fOpSGQl8XCU
	vo162rnnS93wmy9xWpWPvD0FCyPOyg4H/79Y1Gy7Sfphc3d3k5apj1DZeg/DkMDx
	LbdoM+MwmJ+cpTLajqOg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x944e0x8m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Apr 2024 15:00:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 433F0CZi019846
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Apr 2024 15:00:12 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 3 Apr 2024
 08:00:12 -0700
Message-ID: <9dc8f48b-bc94-47ab-a283-773e5623f7e5@quicinc.com>
Date: Wed, 3 Apr 2024 08:00:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] [RESEND] wifi: ath12k: refactor the link capable
 flag
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Kalle Valo
	<kvalo@kernel.org>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20240403042056.1504209-1-quic_periyasa@quicinc.com>
 <87o7aq68a3.fsf@kernel.org>
 <9200cdc1-00ae-d3bb-1f3d-abb4ce993cf7@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <9200cdc1-00ae-d3bb-1f3d-abb4ce993cf7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P3_gPe0SFgQ6ny-Nkf_gdT1ThGx8DxaV
X-Proofpoint-GUID: P3_gPe0SFgQ6ny-Nkf_gdT1ThGx8DxaV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-03_15,2024-04-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxlogscore=725 clxscore=1015 suspectscore=0 mlxscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2404030102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_080018_125951_FA518FC0 
X-CRM114-Status: UNSURE (   9.40  )
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

On 4/3/2024 4:21 AM, Karthikeyan Periyasamy wrote:
> On 4/3/2024 4:08 PM, Kalle Valo wrote:
>> Why the resend? 
> 
> I missed the version log in the commit message.

In that case in the future, just reply to your cover letter and say you missed
including the versioning info, and put it in the reply.


