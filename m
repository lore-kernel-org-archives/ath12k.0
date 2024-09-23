Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244CCCF9C6E
	for <ath12k@archiver.kernel.org>; Mon, 23 Sep 2024 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtNRlmbviwP8o4k0dvGhwCzoZWzFrX7wowByBQILtxQ=; b=dZ3Oh+wRfVo6v0zm55A503sF4U
	SlgRdDHqtvuHRKjOQGgGLcYvnUVWZ5376PvI14GVEFIdrJy+oLv2uzeq6PpyJDt0sF8D517gLLCi1
	CwBRE1jgL5wyBgxaoztjhT0dcKHU+fBaEO4AcXP8Suk5dWQFs1IPPBy9xrAeDj/sBmSM5/+7NK/GJ
	Wi+zk3m74GBMYb/NaLSbfv5buSjtvQtsMb1FzOqkFBsmMYGHVbxnBPadGeh8sPBcq4MO9FvIpW0FM
	ZbznVK9DHsdYXds8IYbvCii4JL63Tb27lsgG1MV7+zvrwWRmbEiASjowGSnrQ5faXz2hC7IquxL71
	W0LIG5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sshA0-0000000H44W-3do4
	for ath12k@archiver.kernel.org;
	Mon, 23 Sep 2024 11:23:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssh9x-0000000H447-2fo4
	for ath12k@lists.infradead.org;
	Mon, 23 Sep 2024 11:23:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48N0qAIN014296;
	Mon, 23 Sep 2024 11:23:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtNRlmbviwP8o4k0dvGhwCzoZWzFrX7wowByBQILtxQ=; b=J7iMDqVX9qpNxJtd
	ojY6zdoowfW7KIUnauju3mh9NmuokVN637QeB6vcdjSK7uJw+opUhCmY1lFFCexm
	O66+OWdlZ5kEuB4s8YVz5yxRXI6mB1I/oWNhhDYibeRLGLmFaHrmHTvk42FrzC9x
	3kcYWWtQvXYwvsed5RJTUXJF5+7151bBxK+hL+pL+9f5FV5RL8RVB7Ys2EYZSNi6
	YphUlTuW53X7G0bfgCO0p0G7oyXDrLilqMbVYQ3oel4/rrhOSVkn59BP9kFBkow0
	1yLOHS1wUKfRsqbYb274yck7yn3wtIvKHLPfZPyUcRkj2ewu4ZDQfbM+8apOIaPY
	+TgiQg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snfgvt26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 11:23:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NBN9xl006990
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Sep 2024 11:23:09 GMT
Received: from [10.151.40.197] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 23 Sep
 2024 04:23:07 -0700
Message-ID: <38ff45d4-0114-c9a5-72ea-3330f16e1ed7@quicinc.com>
Date: Mon, 23 Sep 2024 16:53:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [ath:ath12k-mlo] BUILD SUCCESS
 71a66ca2c46d815d17e234a10726ca6c94af5272
Content-Language: en-US
To: kernel test robot <lkp@intel.com>, Kalle Valo <quic_kvalo@quicinc.com>
CC: Jeff Johnson <jjohnson@kernel.org>, <ath12k@lists.infradead.org>
References: <202409221856.8mu802Fi-lkp@intel.com>
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
In-Reply-To: <202409221856.8mu802Fi-lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: WLw7yva2YdWdrDL1HHmu3o_uK6vaz6or
X-Proofpoint-GUID: WLw7yva2YdWdrDL1HHmu3o_uK6vaz6or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 mlxscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 mlxlogscore=570
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_042317_909897_AD4D977C 
X-CRM114-Status: UNSURE (   6.38  )
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



On 9/22/2024 4:29 PM, kernel test robot wrote:
> tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
> branch HEAD: 71a66ca2c46d815d17e234a10726ca6c94af5272  wifi: ath12k: pass link ID during MLO while delivering skb
> 
> Unverified Warning (likely false positive, kindly check if interested):
> 
>      net/wireless/core.c:719 wiphy_verify_combinations() error: uninitialized symbol 'ret'.
> 
> Warning ids grouped by kconfigs:
> 
> recent_errors
> `-- x86_64-randconfig-161-20240922
>      `-- net-wireless-core.c-wiphy_verify_combinations()-error:uninitialized-symbol-ret-.
> 

It is a false positive warning.

The 'ret' is initialized in both if {} else {} condition statement. So 
there is no such scenario to have 'ret' as uninitialized.


-- 
Karthikeyan Periyasamy
--
கார்த்திகேயன் பெரியசாமி

