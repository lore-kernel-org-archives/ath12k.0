Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A37C369BA
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 16:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l83jpIgWgbmM7T+Eo6No0DTf92PiLzgeTgePXXKMc/4=; b=WxqxZIu9WR0PHQWr9euTH6u2r6
	KAF3y+Jl+qsOBqvfsSksyDejyE0CUH525AAH0UQ1U9jH1bxCgBpa0YkNCiQJtkiZATefPWF8bULw4
	K8QBDm9A68eaibKx6ufPgCivCHXKPz8MKI3ehrNKu5vksG1OAX5/8+ZGwbyfQSs4954W5TGTI6i2F
	+Cq8iw0OdxVzOfpAPb2tRlAHntwBFzAavH6Tb2wgIOEGZDlF5XJ1xS8Ad2h5UeBuT4g/ocCiRwltg
	ojrwAvCheHiG0YZFIRYGrtxzlC1H24iHqeJGoUUWmGU/s6E3Hu9FuJFRCNFYP4Ioawygcbv2BPydc
	9HrrFzvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55qS-0000000AIlP-1N2a;
	Wed, 16 Apr 2025 16:42:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55JS-0000000ABmk-3hO3
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 16:08:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G9mgRw022343;
	Wed, 16 Apr 2025 16:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l83jpIgWgbmM7T+Eo6No0DTf92PiLzgeTgePXXKMc/4=; b=pcsntWITGV0k6fvh
	NoLtP30aiiaVEcUrBdezjAuryEQJx0/0sZiBLG1kbCtvbTDVCsE0m11lfHB/qdUI
	HelSPdczhEXzK1Ncr0JWAYTNAhb9kzg8oEygOMyhEkWNU11k1Z0GuaQ82SgmtKwW
	eNiiC13+qoL2yYYVDy30KEFYRUodKJa1zq7o+10ZXaAJj5RYsXMM+Q/bV3lXB4QQ
	ESmOC7olDt/dkTWaVJQClHHCaaMGNvwKbY+zeAp2AHZkPHDNrBpNnuaoqiHAI+mP
	Dwprp9bQk6g7UvxjU5/YizpVNn5HrdzmJN1GIcBFNz6aMfRUH8mFvikUoZADlivr
	IPWOOQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9c2br-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:08:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53GG8WRf026219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 16:08:32 GMT
Received: from [10.216.43.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Apr
 2025 09:08:29 -0700
Message-ID: <cbfb1ba2-c025-07cf-ca2c-cb6357289fbc@quicinc.com>
Date: Wed, 16 Apr 2025 21:38:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: Fix frequency range in driver
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Rajat Soni
	<quic_rajson@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aditya Kumar Singh
	<aditya.kumar.singh@oss.qualcomm.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-3-quic_rajson@quicinc.com>
 <e789aa3d-ab12-ed19-0d58-012004e365d1@oss.qualcomm.com>
 <fa96e5b4-09b4-4f94-afd1-5e6eb850e8c9@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <fa96e5b4-09b4-4f94-afd1-5e6eb850e8c9@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GuV9i3VlBR3GuDKLHSqVEdp7O1QaqxLr
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67ffd601 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=svNGIkkX7FCknuvVeM8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: GuV9i3VlBR3GuDKLHSqVEdp7O1QaqxLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_06,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=727
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_090835_053385_68ED2014 
X-CRM114-Status: UNSURE (   8.22  )
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



On 4/16/2025 8:12 PM, Jeff Johnson wrote:
> On 4/15/2025 9:09 PM, Vasanthakumar Thiagarajan wrote:
>> You may need to rebase the series
>>
>> Applying: wifi: ath12k: Add helper function ath12k_mac_update_freq_range()
>> Applying: wifi: ath12k: Fix frequency range in driver
>> error: patch failed: drivers/net/wireless/ath/ath12k/core.h:1122
>> error: drivers/net/wireless/ath/ath12k/core.h: patch does not apply
>> Patch failed at 0002 wifi: ath12k: Fix frequency range in driver
> 
> It applied to my 'pending' branch with:
> b4 am --prep-3way ...
> git am -3 ...
> 

Ok. I was trying them on main branch. I'll use pending branch for such checks. Thanks.

