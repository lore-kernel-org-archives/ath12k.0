Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF45EC3271E
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 01:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=an0sXTMVA9jWXrLpMESC85lYfvi/ou6DPhEplUkKcG0=; b=tSTUnB9LmcKL93sEWwwRNsWsQ9
	0JDFvitK2FQnQXpxwNaIWnWTsVgPvw7IrWo+4KVIPSjbR6fN2U4+mnb0v/kpdEJ6NtAKJtkiiBgs1
	5kOL0KtZ8bEN2N7WiI74XrAKskMY9i6jcJEzC53YQOSltyNn1kl1CvB6t98r4KJvteSUhHHiEXY4e
	qLiUFuHprSSEK3jxrJu4Rfo8JMyhFAHoi0CwfmHxLrp5q/01HaMUhUJdQw57Vnfit9oxayjYcYR/L
	WOJNzncf6v5f2qMYRPl0y+jlnsJ/DC2zhgKHA4OC20HkHVlKJgw4TPh26k0CJ7Xs89a2sBANTFY1d
	9KB7hWYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR06h-00000005aUa-3DyG
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 01:57:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR06f-00000005aTx-0O21
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 01:57:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4690iABb030806;
	Tue, 9 Jul 2024 01:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	an0sXTMVA9jWXrLpMESC85lYfvi/ou6DPhEplUkKcG0=; b=RFDYdqU6MWYOfkaP
	BnJgYhUO2eJpBcOwERkE6aqoWqkHlC/N4wxn/9GWn+PhJoEIHXmsFqzT4BDyPC8t
	Gr4fuV4C8W7tL/jwQ+GJKlm/mL348zkuOvAg4TMwi7iWNUhptSi5OhICSRWppn5I
	u/+7rZ0UDWZYukQyygTuDuEJbgtmCJB/BnhZtxUKG1SRqgHaSms+woss6C5SAaBJ
	uHVs2CBZDk7bjVxGekrpNtuWgjQaT4txfKatJ7UkWlF2I3MLCIaxvBXKISXztRT/
	2x7WCDhJkjqiw9hQTuwLpvcuagLfW2NxkV6vmrRC0VQhQRA/ZvgCeCp45tsh1GCN
	Qd9MUQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmn63f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 01:57:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4691vJTm008843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 01:57:19 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 8 Jul 2024
 18:57:18 -0700
Message-ID: <917565ee-732a-4df0-a717-a71fbb34fd79@quicinc.com>
Date: Mon, 8 Jul 2024 18:57:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Arnd Bergmann <arnd@arndb.de>
CC: <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <87y16bbvgb.fsf@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87y16bbvgb.fsf@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QPvxc6PF47SfpOq1tB-Xl-63uvr-1YP0
X-Proofpoint-ORIG-GUID: QPvxc6PF47SfpOq1tB-Xl-63uvr-1YP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-08_15,2024-07-08_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090012
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_185725_171607_F3C870A9 
X-CRM114-Status: GOOD (  13.60  )
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

On 7/8/2024 11:16 AM, Kalle Valo wrote:
> Hi Arnd,
> 
> I installed GCC 14.1 from:
> 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/files/bin/x86_64/14.1.0/
> 
> But I have a problem that a kernel compiled with that compiler fails to
> boot on my x86 NUC test box. I don't see any errors, just black screen
> and I assume after that the kernel either crashes or reboots and goes to
> back to the GRUB menu. This loop seems to continue forever. GCC 13.2 and
> older from crosstool work just fine.

I had held off moving to 14.1 due to Kalle's issue as well as one other
internally-reported issue, but since a few others said they didn't have
issues, I thought I'd try it out for my laptop build in case it is just a
NUC-related issue.

And what I'm seeing after reboot and selecting the new image from GRUB is:
Loading Linux 6.10-rc6-wt-ath+ ...
Loading initial ramdisk ...

and that's it. It sits there with that on the display.

We tend to enable a lot of debug config options, so I'm wondering if one of
them is contributing to the issue? Guess I'll turn off a bunch of those
options and try again.

/jeff


