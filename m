Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B8C25B4F
	for <ath12k@archiver.kernel.org>; Mon,  6 May 2024 17:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XHaBGGpLA6E2k8kzy+ANwzlVGVBSy9fteawDOaOtIcQ=; b=oX24zLk7Ave1okuB1Oc+vi/7kw
	JEGdc8UYY9NQXb7785sc9YKqH6WxU73F4/8+Z3XogMwhsfH/PYXHnzi+O/h80MyVmmcuJ0Pi4oyDe
	xCi4PE0SSAjn/h+mi4D/b1nrE1wFBbqZ7Xo5D1g1g0HL2BGBU4hdhiWFfoa2EyV1+J7COKHlya2K+
	y5XpzECdF2CBq4yGa4IcaTkAeie5eMkzme4FWpsO78b1ZUOxcgwpZ4ko62sNtZ1w3/si/Z+b5lDd1
	0FaA0b7oo63rSS7qqsJfM7oZZn9Yjmn4cYHq4V31dwFhj+E1g+OJ+USRSqJSrFvM7nNYUKmiWGH5y
	Ef0sZccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s41ic-00000008BQX-1lsx
	for ath12k@archiver.kernel.org;
	Mon, 06 May 2024 17:01:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s41iY-00000008BLg-3Fju
	for ath12k@lists.infradead.org;
	Mon, 06 May 2024 17:01:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446DTB1n019577;
	Mon, 6 May 2024 17:01:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=XHaBGGpLA6E2k8kzy+ANwzlVGVBSy9fteawDOaOtIcQ=; b=e9
	Im+YVv+gcIiYGwEZ/qHEDfF5e28z0Q649Flnhx4bt7Nk0tGnYsEO4cO5UeAa4s2L
	UHNRAQjSO0eCt65tse1PgKeDT1e7tmyQ5CwfJN62pVcDqs+oiIGEDComrz/ZI5TZ
	K6lokPWOcD8C8b5gZmYPVKU9Yuz/CckCwwCA4cOwc8DQQGN1dxFab2bNlBhQ9uvH
	0y7nejOmNKQM+/xHs8ydmiS90QcjafZhgROjl/ShSaamyhafIpjcUxPQjKbRer1u
	U2jD8+j941dKMplZnJ3Ko6dbYW+cjB37kovzQ6y0UEib8VcHntKEC6lzTl5c0fHn
	gZeigZUYfJeDPkQ1jgKQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxxj1gp7n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:01:31 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446H1UBH022986
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 17:01:30 GMT
Received: from [10.216.38.76] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 May 2024
 10:01:28 -0700
Message-ID: <01e690ab-6b41-f976-1e83-d3840ef5ff7c@quicinc.com>
Date: Mon, 6 May 2024 22:31:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0
Subject: Re: [PATCH] cfg80211: Allow pre-CAC for self-managed wiphy
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240429042723.2847389-1-quic_hprem@quicinc.com>
 <21cd883ea7d3a7735bbba2c85f5d9e5d5803b5d6.camel@sipsolutions.net>
From: Harshitha Prem <quic_hprem@quicinc.com>
In-Reply-To: <21cd883ea7d3a7735bbba2c85f5d9e5d5803b5d6.camel@sipsolutions.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ItnLHKfqgTyTfDdl7QCj2gXH_MVBNtOk
X-Proofpoint-ORIG-GUID: ItnLHKfqgTyTfDdl7QCj2gXH_MVBNtOk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_11,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 malwarescore=0 clxscore=1015 adultscore=0 mlxlogscore=809
 impostorscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405060120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_100134_998094_1B8B8833 
X-CRM114-Status: GOOD (  18.35  )
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



On 5/3/2024 1:56 PM, Johannes Berg wrote:
> On Mon, 2024-04-29 at 09:57 +0530, Harshitha Prem wrote:
>> Currently, to allow pre-CAC it requires both driver's regulatory domain
>> in wiphy and cfg80211 local regulatory domain to be same, along with the
>> region to be in ETSI.
> 
> Any idea why that is?
> 
>> But, for self-managed driver, some countries have mismatch between these
>> two regulatory domains and it would not allow for a pre-CAC. For example,
>> in ath12k driver (self-managed), country Sri Lanka (LK) is classified as
>> FCC domain as per cfg80211 local regulatory database but as per ath12k
>> driver it falls under ETSI domain then because of this mismatch, the
>> driver might not be able to do a pre-CAC.
>>
>> Hence, add changes to allow pre-CAC based on wiphy's regulatory setting
>> if it is a self-managed wiphy.
> 
> I don't see how that's really all that much more helpful than simply
> removing the restriction? But then why is the restriction there?
> 
> johannes

Hi Johannes,

Seems like, there can be a possibility to have two wiphy devices with 
two different regulatory domains to be present on a single system and 
for cfg80211 to respect it. In this case, a core central regulatory 
domain will consist of the intersection between the two wiphy's 
regulatory domains. Because of this mostly, in case of DFS, in cfg80211 
apis like reg_get_dfs_region() , there is a check to ensure like if both 
the core central regulatory and device's regulatory are same.

Drivers which are not self managed can have this restriction, just to 
ensure to allow precac only if both matches or May be should we relax 
this restriction?  but I am quite not sure on the impact. Will try to 
analyze on this.

Thanks,
Harshitha.

