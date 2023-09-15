Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E89EE6433
	for <ath12k@archiver.kernel.org>; Fri, 15 Sep 2023 08:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLsLtYXLo7p3QZbo4dptfGNeQlLt4+HXRJ8OeqcnY4w=; b=e1C3p1D6i/cigj
	Cj8Zee30+KNBAkRQKs+jV4X+mLn9pvf4NcMbDBAp1Hj/mHStOe4tq/m+1dIvHKcKoiw2JreVXMJ80
	NKXab5muIqW1TaX0GPA1lDHz2xL9ouyDwBSTZdFWqdU8KvgPY6RvbjqOzBpESIGIydR1fFgngtMZS
	7rkJ6yk+7sVU6Ebg4KwcM/sWQw/UYrxv0FaC1b7s4wl8NWGCyCqdRcD2G49wltknX55pjtf+xyaaJ
	DbPLoqyDrkUe8fLfq70yEyjgK3qZEQ9NPUmgE6eF990nOGcbCFVLpJZB7USOeX5ez97DbSwdtrUsT
	2v1tzR+NGGyM5682p3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3vf-00A6pV-0I
	for ath12k@archiver.kernel.org;
	Fri, 15 Sep 2023 08:11:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh3vb-00A6p2-2V
	for ath12k@lists.infradead.org;
	Fri, 15 Sep 2023 08:11:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38F7nV4f006696;
	Fri, 15 Sep 2023 08:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=lm+neKL92MNlp8Cl0UtHhTwvNZwu5/uptBOf0Uts3mA=;
 b=OwdPlyVOLcAyinv9x/4r7IxBO1DPoYS74EMoD6xrAsSMAqfqAKhSLjuto+jTfyjG0PXq
 +zVkaUeIMm3PnOD8BsGu1v+1byc1wbyGzU+VgYdHjcb7oRbDJ7k55AGg+foQsU8mBrjR
 6PZmsoGlfpqFYPaHq9HbhwmU9NAmICRTpi/IREuNZp1YoQBdedLX4YRhngJBBEangKHI
 1jA4j/bkZOoS/qV2bKFWckSQouhTSg/JUXQp3MxB5xDz024Vqi1BKveFyXGal76/1TJX
 pdmvsriiKEC1WneaI8d4fkb2GwGClY2SHPzFCFFG7OeaRGfC7FZizkMNtJA+ktQclFlj Ig== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t4g3gre9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:11:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38F8BaC3004554
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 Sep 2023 08:11:36 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 15 Sep
 2023 01:11:35 -0700
Message-ID: <d23b617e-5ca0-e721-0c2a-fcca8942efef@quicinc.com>
Date: Fri, 15 Sep 2023 16:11:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/3] wifi: mac80211: add support to allow driver to
 generate local link address for station
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230906103458.24092-1-quic_wgong@quicinc.com>
 <20230906103458.24092-2-quic_wgong@quicinc.com>
 <cd762f33b1c15566237c85f1e265ee8a00006f5c.camel@sipsolutions.net>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <cd762f33b1c15566237c85f1e265ee8a00006f5c.camel@sipsolutions.net>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fj56FaH3fHiOiXc9NZlUeBlc3nOk8cm-
X-Proofpoint-ORIG-GUID: fj56FaH3fHiOiXc9NZlUeBlc3nOk8cm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_05,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 mlxlogscore=548 phishscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_011151_930506_1B37C9AF 
X-CRM114-Status: GOOD (  16.70  )
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

On 9/13/2023 4:55 PM, Johannes Berg wrote:
> On Wed, 2023-09-06 at 06:34 -0400, Wen Gong wrote:
[...]
> Maybe after all this explanation, all we need is a flag "reuse MLD
> address for assoc link"?

yes. It is similar as I said before here:

https://lore.kernel.org/linux-wireless/b9c6d022-12c3-a696-c4b9-cb14a6d30a45@quicinc.com/

>
>
>> +		ret = drv_generate_link_addr(sdata->local, sdata,
>> +					     link_id, link->conf->addr);
>> +		if (ret)
>> +			eth_random_addr(link->conf->addr);
> should probably refactor this into a separate function though.
OK.
>
> I'm also not sure how the driver even knows that a link it's being asked
> to get the address for *is* the assoc link? Do you want to rely on that
> being the first address handed out?
Current I used (vif->valid_links==0) check for assoc link. When
drv_generate_link_addr() called for the assoc link, vif->valid_links
is 0, and it is not 0 for other links.
>
> johannes
>

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
