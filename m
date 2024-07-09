Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA1FC2BD09
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 15:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h4WiPsIBrKbfAq1y/4pUmCzgG21sEIf+l6gOtFB40m4=; b=o5qg4sLD+mpOVORCAXckeF4OFE
	4gowj+3YxfRWqET0QirJu51/4FiqhG024OnBcGV7q31EqoyUbY2AK4iQXt+yqwb2mZhSy9JHLi5Vx
	PX+8KE6NdwPoSAZW+0PZ7SKpXlZLDc89WxCnli5mGMoXVOuj76u73iwuPi7+kh30kkdbGfJVZlZ+E
	xgCm7eW7nRDMYxWMaXY8ftDbeCV/Jh5V3+n7ll7gG03dXyBN8555VBhP+sYbrtF9wffBgvYFpVt8H
	Dy5M7aquXb2QA9A55oSWa3YJ+QRras0tEgkNJzBmgCpQA/QaIAY5FdmyONc0X6BwOLBjqh5aTrCPC
	T4sMT0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCmd-00000007kIN-1Kr0
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 15:29:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRCma-00000007kG6-1GTs
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 15:29:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 469BQtI7013428;
	Tue, 9 Jul 2024 15:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h4WiPsIBrKbfAq1y/4pUmCzgG21sEIf+l6gOtFB40m4=; b=YVqycvS2KhXvN9Fd
	KWCtCoM9TKmQrgF0/qxk3DysQUPg6uFQ4hi3nA8+53ARcN2+AMOXZuFHrpFuPxLg
	iVzrgrrFMlH4kYiGguHD3mCc257MjTU8Oi5PAXntaN+hAw9PxIr8mrspC8uilKfd
	PZ4a/w8S2yNT3GIToDiFxDjdZW8zk70euZqn/Zxw0Lzckl8E7aSlSvqnnRHugJi4
	koBwABwQUWcKZwgfJCoZUFfqe4tZC4ZU3/52V8hCkWU7/XTI+moJKvddi1sz1kB5
	ODfoY9RqUnkbDZdVGIZiT+h7TPhFzt72N/FmqMXgwCYRvnGn32psC9IIA5oApoA9
	Ur7F5Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wmmpyrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 15:29:27 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469FTQK4002573
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 15:29:26 GMT
Received: from [10.48.245.228] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 9 Jul 2024
 08:29:25 -0700
Message-ID: <0e0150ca-fdfa-40cb-ad7f-6ac695b702e4@quicinc.com>
Date: Tue, 9 Jul 2024 08:29:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: crosstool: x86 kernel compiled with GCC 14.1 fails to boot
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Kalle Valo <kvalo@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>
References: <87y16bbvgb.fsf@kernel.org>
 <917565ee-732a-4df0-a717-a71fbb34fd79@quicinc.com>
 <837cd2e4-d231-411a-8af4-64b950c4066a@quicinc.com>
 <c9b23ee3-6790-404d-80a3-4ca196327546@app.fastmail.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <c9b23ee3-6790-404d-80a3-4ca196327546@app.fastmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nkkXVyJJJxOzvMf2KM35TbI_eu5ePiEl
X-Proofpoint-ORIG-GUID: nkkXVyJJJxOzvMf2KM35TbI_eu5ePiEl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_04,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407090101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_082932_384475_A5376219 
X-CRM114-Status: GOOD (  13.62  )
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

On 7/8/2024 10:44 PM, Arnd Bergmann wrote:
> On Tue, Jul 9, 2024, at 05:55, Jeff Johnson wrote:
>> On 7/8/2024 6:57 PM, Jeff Johnson wrote:
>>> We tend to enable a lot of debug config options, so I'm wondering if one of
>>> them is contributing to the issue? Guess I'll turn off a bunch of those
>>> options and try again.
>>
>> OK, with a bunch of debug turned off my image boots.
>>
>> Now to find the culprit.
>>
>> Current diff between original config and working config:
> 
> Nice! I've tried the reverse now, turning on the options
> you have turned off on top of my defconfig. This version
> still works for me, booting with a plain
> 'qemu-system-x86_64 -kernel arch/x86_64/boot/bzImage'
> and building with my arm64-to-x86 cross compiler.

I picked my favorite to begin with, enabling KASAN (which in turn enabled a
few others). The resulting kernel did not boot for me (just saw a black screen
after the GRUB menu). Diff between working and non-working config is below.

I then downloaded and built the config you supplied. With that I have the same
behavior as my original config, the display is frozen with:
Loading initial ramdisk ...


[jjohnson:laptop 1966] diff .config.old .config
19a20
> CONFIG_CONSTRUCTORS=y
326a328
> CONFIG_GENERIC_CSUM=y
334a337
> CONFIG_KASAN_SHADOW_OFFSET=0xdffffc0000000000
856d858
< CONFIG_VMAP_STACK=y
10935a10938,10940
> CONFIG_STACKDEPOT=y
> CONFIG_STACKDEPOT_ALWAYS_INIT=y
> CONFIG_STACKDEPOT_MAX_FRAMES=64
11033d11037
< # CONFIG_KCSAN is not set
11049c11053,11054
< # CONFIG_SLUB_DEBUG is not set
---
> CONFIG_SLUB_DEBUG=y
> # CONFIG_SLUB_DEBUG_ON is not set
11080c11085,11093
< # CONFIG_KASAN is not set
---
> CONFIG_KASAN=y
> CONFIG_CC_HAS_KASAN_MEMINTRINSIC_PREFIX=y
> CONFIG_KASAN_GENERIC=y
> # CONFIG_KASAN_OUTLINE is not set
> CONFIG_KASAN_INLINE=y
> CONFIG_KASAN_STACK=y
> # CONFIG_KASAN_VMALLOC is not set
> # CONFIG_KASAN_MODULE_TEST is not set
> # CONFIG_KASAN_EXTRA_INFO is not set
11300d11312
< # CONFIG_UNWINDER_GUESS is not set


