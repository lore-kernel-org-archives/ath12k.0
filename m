Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FC1C369D5
	for <ath12k@archiver.kernel.org>; Mon, 28 Apr 2025 17:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wh8AXznfAaDShm6du/256XBfIvd+khiuSNyA5+h88Po=; b=J1VLLPFKnAuwrIbmHadp6Q3C6Y
	nQuHbQYj4qlD80dnAW2H6NVYIVdYXF8uuUT2QMwn/O/7VqQLBpS1ZlMx5XPRWNKBVy1aRt8I6zChW
	jAz9rRq8XURTVqVuJ2wyeS3M8CSFVkDp3gf2Xnf/cPCmOu5gcAbPAwTYA/tokvWwX7xe8XbpxNVkT
	2ILW14FfwyMys1wZvhjEiHnyV4i3QZWnGb7GeeEE/aDhBKBVbsaANI0T8T/bqG3AcZrSaveZXzoQE
	pxUeitYtq+OSQVh0oNDZqcbRatWT3mEEqI/2/m/7IYN/hlYV26x3pi7QkdxeZhhsv6enT4YHnDQXp
	pBqllSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9SMn-000000076V0-427D;
	Mon, 28 Apr 2025 17:34:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9S3h-000000073tK-35gk
	for ath12k@bombadil.infradead.org;
	Mon, 28 Apr 2025 17:14:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:CC:To:From:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wh8AXznfAaDShm6du/256XBfIvd+khiuSNyA5+h88Po=; b=EF0y0kM0SxBv3M4TxK20b0Y6I4
	eTsw9hM+Z3rdPPId2Hn3XMxKRCgeSdmrFjp0NKWOIOy5+4iRc5eCxRgdLpsUJsiktGKcXqUcIDg0E
	CX5CD0VC0/iNIPrKN4Oioz8oJzfLzJvAlKDiW9Kci0UDgWboow3uOAZKUeiqdUWRBCw1P73dIZyX6
	gRP9RWZFsGpO0iRVHgxPvnyF2itIN/EIp0bPbIbKBNb9PoXzAqCWSf0yUhPzlcbDNEzHWk+NTKvNM
	g0mtFgmbx/mdNylpd47TzGFKqW1aRs1AITn52pf9o7MxFwCprI7unypp8yfJx5Qk25pPKotJ9n9av
	cPb1TpUA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9S3d-0000000CuL6-2RlO
	for ath12k@lists.infradead.org;
	Mon, 28 Apr 2025 17:14:20 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAA2tD015854;
	Mon, 28 Apr 2025 17:14:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wh8AXznfAaDShm6du/256XBfIvd+khiuSNyA5+h88Po=; b=OLRj/8BdhLGYKa01
	N0OAc5eaCWBrqqYfwyTuc/nOFykjF457qW2hFXiZTb3HIpPUMpBZLKe+4Exy34W/
	qhC41ysP3V5eUN0Xp3YvKhQUYs6ZKzH48MY2RSsK/iZzYByj+vpOgKNxRg2Q+WWx
	Xm23xNTOmNRiNslxXOb83rRH+8Z1BjDBKe6CXM/R99ejX4tpP7M0+V40KeM1pj0y
	2fvFFedrEbE8K+sTrn/aKIRaUMK4/I+Se9MPFeU2NXXi8PmY4YkGzN9CG5XoKqvx
	vSVdfUvYeIkQJvpZNcAWCw6p+MF174uDNLpCpEYzPPl9nXQO9g/XURC46NJhsMkp
	w7H1wg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468pg99wt9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:14:12 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53SHEBUc002911
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 17:14:11 GMT
Received: from [10.50.3.121] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 10:14:09 -0700
Message-ID: <0772aa2e-d4df-4647-88d3-06c3726b0680@quicinc.com>
Date: Mon, 28 Apr 2025 22:44:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v6 00/11] wifi: cfg80211/mac80211: add
 support to handle per link statistics of multi-link station
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        "ath12k@lists.infradead.org"
	<ath12k@lists.infradead.org>
References: <20250415042030.1246187-1-quic_sarishar@quicinc.com>
 <07c00e98-5280-4563-854f-5c7a457578d0@oss.qualcomm.com>
 <07f6395a-8bc1-491d-a90b-3fc50b8478c7@quicinc.com>
Content-Language: en-US
In-Reply-To: <07f6395a-8bc1-491d-a90b-3fc50b8478c7@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=ZpvtK87G c=1 sm=1 tr=0 ts=680fb764 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=eIXec_biSmsyT1gLdVUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: tqPef9PWqMlhRJOpKWDd6qlYSsyy0iDO
X-Proofpoint-GUID: tqPef9PWqMlhRJOpKWDd6qlYSsyy0iDO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEzOSBTYWx0ZWRfXy4r6xWi3D3T+ krFrOP1uvUpxW28AZFOu5xDeRRL9D4EcdsjC2bmHQCQGAznvkbUNqE0ZG94Zph0jNGS7cKUF8nX pBlCiU/kctZcrZ7URHvIdkNsxH/mhRnOoJuXW8O/RoqDR2VUOaeO0/SsptZnA8VxNnLvew/68VD
 mUq6p3Yqnee6CAFZMFkyRoE3BTQMYkVUwD6kTUe1gaw1m49WLOBhQ9pxacmV4MZ8rr5Dchtw2DD DeWMpdnBC8E9niwZJH4i9A5mAsukNjSIgl4EqMcRjMWJID4klhvtAOiPfTDC4ufTVTwgBoKXdG5 KF6s3EXLPNUUB2eHgrkXT9Y5iBlsWj/LBr2syqt6KcygoZ5XJFJYSHYXGGZBaqfr2vEjwXnh5XG
 loKIDKEbidsXblky4zh69aSgqQC1A4tD9Y+sPpgUSNHI0MzKR+u0aOenkpdmyyLFtYunHkoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=616 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_181418_036412_C12F4A1D 
X-CRM114-Status: GOOD (  12.86  )
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

On 4/28/2025 10:52 AM, Sarika Sharma wrote:
> On 4/25/2025 9:16 PM, Jeff Johnson wrote:
>> Just a couple of generic points:
>>
>> The last ath/ath-next pull request was processed. You need to rebase 
>> since
>> this series no longer applies cleanly to wireless-next/main.
>>
>> When you post v7, please include all parties affected by this series, 
>> either
>> by using scripts/get_maintainer.pl or by using b4. There are a 
>> multitude of
>> driver-specific lists and maintainers have not been directly notified 
>> of this
>> series.
>>
>> Since ath/ath-next matches wireless-next/main, and since this series has
>> co-dependent changes, I am freezing ath/ath-next. I'll continue to 
>> accumulate
>> patches in ath/pending.
>>
>> My hope is that all of the issues in this series can be resolved, and 
>> that
>> Johannes will be able to apply the entire series to wireless-next/ 
>> main. After
>> that, I'll fast-forward ath/ath-next to pick up the changes, and then 
>> I'll
>> start applying the accumulated ath/pending patches.
>>
>> But I'll only hold off for a couple of weeks since I want to issue 
>> another
>> pull request in time for the v6.16 merge window.
>>
>> /jeff
> 
> Sure Jeff, let me sent new version with rebase and include all parties 
> affected by this series.
> 

I am waiting for a clarification on one query from Johannes
on V6 on
"[wireless-next,v6,04/11] wifi: cfg80211: reorg sinfo structure elements
for MLO".
will share the V7 with rebase, once I get clarification.

