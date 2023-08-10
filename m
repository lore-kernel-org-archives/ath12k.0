Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40952C001B0
	for <ath12k@archiver.kernel.org>; Thu, 10 Aug 2023 08:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=azgzDU+NDPg68PS6xEEMbEz8/b266wmc62plYJd+qhs=; b=r+Xhh23AMGgKwN
	FkGJzcT3VFwetwWB0ppZ0zfE/LDCs6Mg2rmFwCsrLOd21v3xcfj9vGD6I5eXzE2xq/tcn0y+84c4N
	oICal4R15Zb4JTpPcpKWR27Z48KIDDBc56Tmz7JveB59qXTk1lWqaJBB5y5Dd9HUZWoJl1/98/lDp
	AzHlOuW75xqF78ovHFWQgEOGmYoQyh4HhkolvuJ2ZnoO1F3XVuKGt/YrhoM+vQ0wGORu1iA7XXlqC
	hVnHXip1SXG8Fp1tnAmaOzaTMOGtC+TWqUedCsHhxVdoa4YHALaggVeKK0pyb6tJxuIN2TQmJqVat
	OblR0M66CqR3xVZyjiyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0op-006qNZ-3A
	for ath12k@archiver.kernel.org;
	Thu, 10 Aug 2023 08:14:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0om-006qLk-2d
	for ath12k@lists.infradead.org;
	Thu, 10 Aug 2023 08:14:54 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37A55Eok031431;
	Thu, 10 Aug 2023 08:14:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=tdX0uGppUULsBxleRWSticHxr/dKu/KeYYQi2pz1Brk=;
 b=XAj/0kXX8pNSSO3ldf2mKP5lKuB4WCaqHo9znjIzrMjx2BAHaS1A8qSyDZ82Thz0ro8E
 C3o0sdNYDrtOE+yXlV0Ztk2x4g2t2pZI9U/ilBJQF4VmbFFF5TuRvc9IE2sHXMHagx4G
 uIqK6O/ELJwjfEGKfZJQxav+l2C66ponSvWOP0roO0TlehYYpjg/lqd9PEj7iRxZ2TNd
 jAYEOFRfUVdCD3c6n5nP3rstf4/pjKRKtiPAyM+EY/DYfuQyeemKYDtOim6KFJbw62Pu
 knN/ovIAqkwxpWnDF5dEmwNA7oEmyGcEJBlZcCNyJKY/82nAcRsrdBYP80Da8mKZoVAP 6A== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3scr39geyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 08:14:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37A8EleS002788
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Aug 2023 08:14:47 GMT
Received: from [10.231.195.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 10 Aug
 2023 01:14:46 -0700
Message-ID: <ca02c01f-6b53-edaf-321f-b9452558dbd3@quicinc.com>
Date: Thu, 10 Aug 2023 16:14:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] wifi: ath12k: Fix buffer overflow when scanning with
 extraie
Content-Language: en-US
To: Sven Eckelmann <sven@narfation.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230809081241.32765-1-quic_wgong@quicinc.com>
 <3206e181-f770-c599-87e1-364114b9746a@quicinc.com>
 <db119d06-7549-3be9-524f-327485d34da9@quicinc.com>
 <4161316.1IzOArtZ34@ripper>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <4161316.1IzOArtZ34@ripper>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f6xcLmL8TRRT3effa5Ou-q2hZaBXZSU0
X-Proofpoint-ORIG-GUID: f6xcLmL8TRRT3effa5Ou-q2hZaBXZSU0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-10_07,2023-08-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxlogscore=623 clxscore=1011 mlxscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308100069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_011452_971605_54801C8A 
X-CRM114-Status: GOOD (  17.95  )
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

On 8/10/2023 4:09 PM, Sven Eckelmann wrote:
> On Thursday, 10 August 2023 06:31:02 CEST Wen Gong wrote:
>> On 8/10/2023 2:16 AM, Jeff Johnson wrote:
>>> On 8/9/2023 10:31 AM, Jeff Johnson wrote:
>>>> On 8/9/2023 1:12 AM, Wen Gong wrote:
>> [...]
>>>> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>>> Wen, can you please add a Fixes: tag since based upon the discussion
>>> you actually observed a crash
>>>
>> Jeff, do you mean I should add the crash call stack or other thing in
>> this patch?
> I think a reference to the commit which is fixed should be added.
>
>> The crash is observed by Sven Eckelmann <sven@narfation.org>  on 07 Dec
>> 2021 here:
>> Subject: Re: [PATCH] ath11k: enable
>> IEEE80211_HW_SINGLE_SCAN_ON_ALL_BANDS for WCN6855
>> https://lore.kernel.org/linux-wireless/3267805.el9kkjlfUZ@ripper/
> This was for ath11k. See my patch for it in
> https://lore.kernel.org/r/20211207142913.1734635-1-sven@narfation.org
> So I doubt that it is ok to add the same backtrace for an ath12k commit.
>
> And if I compare both patches, it looks to me that you don't handle the
> params->extraie.len > 16 bit (see WMI_TLV_LEN) in ath12k.
>
> Kind regards,
> 	Sven

I added similar check here:
[v2] wifi: ath12k: add check max message length while scanning with extraie
https://patchwork.kernel.org/project/linux-wireless/patch/20230809081657.13858-1-quic_wgong@quicinc.com/


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
