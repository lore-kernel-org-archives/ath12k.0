Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EACAC3ABB2
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 18:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zixsDt6O/lSXZW+FRvUWVqt5pnoQYYegJZqcTFH/aM=; b=gSbazX2NUkMDJcjoRrY/LVzV6h
	wp6NdkFlaIE0ahCtLogC3D4vc4ETPw5D+hFGnqHPGk7OkArcS4wqaBpg3ol4On4FBpeNzAuZknAY5
	vBJRCIZoat4AmZfd3BzsgWfDOjdXwx3zhRpxBDRd6WHG1I2eKzWSfPyZh6hknWxsg3KfuNbZmb2LH
	fy6Pj/lFYz8cqAVDz7p4bQKwrQWB9Qmj82JJLnJTJRVlUCd17scBiVwoBZLzcknhrwy9hpNcayNYT
	CVNkSlg/llyhohsvmcrgh9M+LrEONXT8ChU09rvHtZa9qiCltCy3ntvRUyQiaT3b4tNY0xsOtjwTQ
	eo8cbm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKLKb-0000000DtwG-0bzm;
	Wed, 28 May 2025 18:16:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKLKY-0000000Dtvu-3DH0
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 18:16:48 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54SH5iit003397;
	Wed, 28 May 2025 18:16:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+zixsDt6O/lSXZW+FRvUWVqt5pnoQYYegJZqcTFH/aM=; b=A2kUjX2Q/zd2cBjT
	LNsu9TKX1fR/gbb00FetqpmMGSvUF02XIo9QKTS/Na7y6M39A3k64aiMzpcdgnsW
	T1UUhvWLM/gjaqTvgluDOEIl3o1GUJnwuqNGM+NzgOBXccTrPRl1+tE6lvFlwyVC
	8yyRFI7H3Ssh+bHS4szazQO2F13EgTcBHFkIN3e3G7MOSWzec9KVsAJg9HsiS+T7
	Zm66Z7dFRgZL3X+6v0ioFXv2mStvjGz5dce2FbSCliayEhk0p70r4v8K8ih2affx
	3ep7Yx7FQ/TuPswmkUOFpyFXm9lxyH4EUJbWLlMnOGjOYASkJAwwjAbLPTEpG04s
	r3FaEA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkvyqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 18:16:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54SIGhw8006627
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 18:16:43 GMT
Received: from [10.110.49.202] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 28 May
 2025 11:16:42 -0700
Message-ID: <b7d500e3-445e-455d-a74f-4ec3c7f3fde3@quicinc.com>
Date: Wed, 28 May 2025 11:16:42 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V13 8/9] wifi: ath12k: add support for 160 MHz bandwidth
To: Nicolas Escande <nico.escande@gmail.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20250418174818.3336510-1-quic_pradeepc@quicinc.com>
 <20250418174818.3336510-9-quic_pradeepc@quicinc.com>
 <DA08F3TG062A.151WKWWF5OPL0@gmail.com>
 <c21146ef-3cf6-4d8e-a32d-8479e4d96f3b@quicinc.com>
 <DA2JV34RZGAQ.24P9Y3C865UHN@gmail.com>
Content-Language: en-US
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
In-Reply-To: <DA2JV34RZGAQ.24P9Y3C865UHN@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nnLJJxhHB57sASbP49M5K_MuHFcH8aws
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDE1OSBTYWx0ZWRfX4TD2Gdj22lWA
 ETCyaKKdyRfhIjBJ8pXkF4LdCN+36csXM9GbnQ1bGQdGG9Bv+s3RVWNXiP5LNWY74teCa6ewpnn
 8b2USxRJZ4EHm+ljTVHyrMH2oPZUXq6zw+E6SALpNjID0np/b0SYu9N4KZlsl8S/sDJxqtHffys
 yuZMvNkqBU53/qQZ/5rNpRJQ+VcXa1I2inhp/PIlkjKYv/yFnJqnxp/RPfRzlh3YbVT1EK9JqwG
 oFiUInDe6an5eg87sL8OsfH/wN2rSvIhQzvBemLcekQ70z93ka56Vq9g1LkHr3hG2f/f4RliICZ
 QeekQsQ6x9+GwccE87LLc8GPS79nZGJ06W3wjav/zmcHxmhWoeDVzKBqQEUc8zT80C0hVHlcnPc
 oU2HSqyaQdZsxvWZkrfXPHO83otd1z3EQ8hwYkJx8Z99zongW3imD6sJwDumU6066+G+IMNr
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6837530b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=SvoT8jjy0BNg_UzYINgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: nnLJJxhHB57sASbP49M5K_MuHFcH8aws
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_09,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_111646_826798_6333DA3F 
X-CRM114-Status: GOOD (  17.60  )
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



On 5/22/2025 1:34 AM, Nicolas Escande wrote:
> On Wed May 21, 2025 at 11:38 PM CEST, Pradeep Kumar Chitrapu wrote:
> [...]
>> Thanks Nicolas,
>>
>> I believe IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ mean only
>> 80PLUS80 not both 160 and 80PLUS80 and STA must set
>> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ flags for indicating 160 MHz
>> support. Please correct me if my understanding is correct. However I
>> agree that we must allow STA to connect irrespective of which flag STA
>> sets as long as bandwidth is 160MHz. I see ath10k and ath11k also allows
>> this by setting default phymode of MODE_11AC_VHT160 for BW
>> ==IEEE80211_STA_RX_BW_160 case.
>> I will make this change in next revision.
>> Thanks
>> Pradeep
> 
> Hello Pradeep,
> 
> Well this is quite unclear for me maybe Johannes or someone more aware of the
> evolutions of the standard could shime in.
> 
>  From what I've gathered:
>    - the naming IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ implies both
>      which points it was the case when added
>    - and the original 802.11ac-2013 Table 8-183v states:
> 	Set to 0 if the STA does not support either 160 or 80+80 MHz.
> 	Set to 1 if the STA supports 160 MHz.
> 	Set to 2 if the STA supports 160 MHz and 80+80 MHz.
> 	The value 3 is reserved.
> 
> Things get complicated after:
>   - later versions like 802.11-2020 have deprecated value 2 in favor of the new
>     Extendeed NSS BW feature
>   - Table 9-272 still implies both 160 & 80+80
>   - Table 11-23 & Table 11-24 implies only 80+80 but both talk about the
>     'VHT Operation' Channel Width field and not the 'VHT Capabilities' Supported
>     Channel Width. And thoses had different values even in the first AC amendment
> 
> So it feels like when no Extended NSS BW Support is used (first gen AC devices),
> IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160_80PLUS80MHZ really means both 160 & 80+80
Thanks Nicolas for detailed response.
Request you to kindly review V14 series and let me know if it works?

Thanks
Pradeep

