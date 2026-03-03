Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F428EC0495
	for <ath12k@archiver.kernel.org>; Tue,  3 Mar 2026 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcvmD29bQdL3AHE+sXiV2TXNwct4RnmCX84SiYx0Q+A=; b=AuALcd9X1ikRu7iN3auR8Sb0yq
	Ot2FN+zxe4YbbMMu6RJups9G77YFI1DNJN4oVLfnpNiyllpKd5JxAMlrYCe1giiXPbtb7FimBPmPp
	41WI166nQv+NjXyCkNkRpomm43pEwxPwUZqQ96Lke5tPL1zx5IkMx/Wkk+RpNF66nAv8ZavNgd5tD
	7jFmm0GE/axEWX/RRsksa9HBLYKBaiu2zN+rRal5dR7UpdE92aGAXsQBoYm4PWJpBcAI3//kT1Hxw
	A7C1g8kXX6cJvPsSCdp1Cy4Isbb8jipooVnRLLr3t5vd6vEqHH11sxNrqB0reUMz5lGGQ35WPS4JI
	KlHfO2ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMjO-0000000EwVa-0oad;
	Tue, 03 Mar 2026 10:11:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxMjL-0000000EwUQ-1Ngl
	for ath12k@lists.infradead.org;
	Tue, 03 Mar 2026 10:11:56 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6239mgFZ2307433
	for <ath12k@lists.infradead.org>; Tue, 3 Mar 2026 10:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hcvmD29bQdL3AHE+sXiV2TXNwct4RnmCX84SiYx0Q+A=; b=DxxDk4IhZOMCcXUR
	bNlN+3dp0Ug7N+fM/0LxpwVa4FZ1pOyHAfSGq+SENk+V6bJJu+kXuMQ3C/bfALyG
	wnnXcWs3gyjT6i3hqGWpFUbBpOEyfy3aMi9yaY1qvLrMgQs6k4xpRvrIpMdyFiOI
	dJQxi5dTLrax6/e0xhBeRwkbAUmI3ykWnjb6d3bVpg6saX8cOm1tMeTNADqleocf
	Bocriuuumi34XuRlpgTpzJMx6RDblimyruXFbUNS+hHADZjywrP7tJjeL7iHKKrc
	YIpgEUovzXbRo/04uuZnn+YpP6jy3y6m5XboLb+XUUqWvuOsENZz4jRGpdsP5aIP
	sAY4wQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cnvtu86hr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 10:11:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae61939fa5so12016985ad.0
        for <ath12k@lists.infradead.org>; Tue, 03 Mar 2026 02:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772532713; x=1773137513; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hcvmD29bQdL3AHE+sXiV2TXNwct4RnmCX84SiYx0Q+A=;
        b=WpAOvvtUSVhBZRy8kZPKvrBGsDlZ6Owzj21W/9uw78+oPpxXYQss71RjrE8jcZu5vv
         GAydMuNmczBkOpsGVELCDVOK8lnaFrAKvv6bLMbcDU7hlb3bG0Y7xQPj/p4GF6bVQQp9
         UYwYcqYQCxVUzTlhXuIUw1Ed8JLObVwdECPPkiQuItOz8Vk3TV3L8rx4qjN9LB5tRev8
         Cg6451yrE7gFdfwMUmmafI7I9AULiUjzxC2Iu14vJR2XXrMdUcub/zpIQnl8Ik+nd+bh
         BeBXNhYwcFg7MYxbI4MkemBJbBCDsDGVKox+dbLOuPyWZaIFN4Gh1ZiZubVY3oxeVKno
         faEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772532713; x=1773137513;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hcvmD29bQdL3AHE+sXiV2TXNwct4RnmCX84SiYx0Q+A=;
        b=H0KSp4vqg9+tZPklRIo/0oCQENDYYBCHbhLFevfEjSrWuzxhVo1fTUKVz4oIs+rMvi
         /KPHSCgKZk1PRMLvDtxsasS4CuH1OKHBNJzQJKb10Aq3We381Kq1NCtJP7MEsWaKC9O4
         TeM3qRy5+i8D64+ykhPV8Hds6VsHAo1GBLzfjMDw9iSmM4dZssYaIXnavwdsBJJ0vBkv
         /lDg4XMXWr87SO7kipvvvNLQye5th1XqaTPav6t6NxWMxxu98kKl5nQEP4AF8x6l1Sor
         PS3/w7xDtAdG8jbvpqZZ4EpVDm4s9cvG+FXfLd23uLNymxvgAsen6Ybbm21xfWV6B6E8
         OREw==
X-Forwarded-Encrypted: i=1; AJvYcCUkVAd8CBnpoiX2qT7pqS9RfvAOrfQ6WopysR4HrZnu1liMiFBFXpf5znR9+C5IxbXp4gAFJKs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxP8eQdQrkVqw60atSBWc/jXp9/h9vkQy7b+yCca7ArC8OI7qxQ
	2x8bsZGj22gsfbepUre8koE3od1+j26jjLBEIqk1tPCv0M28Ok6s6fJ2xXGCzILgVvWti+lB7UA
	HfKsDwi0PpIHlJ3e8FLCGm17q7AhbXHKHF5o+GieNP3L0+IaHuTy6qSAHgXJK34cc
X-Gm-Gg: ATEYQzz8054L87TLw5duoKUH5Lvxwo4YGqBm55RaT0ubwJMvDd64L2jvHYyv8JYJ8nY
	vWQa6piVhDO7uYnCvOEzcDKhmEYlxYRLVVJ3AympLR1XJM29hmdB1vAEBL9PbzvEe3caMuGOe29
	MiEFcuppzLnY4kRMw5bJ0NYEq5ICSmxFYDgmyIjYUaUR9hePyGWJw1on2dae5BdIywb8jQSuK7B
	3u6evRNsTC2D1n9Wf2AQNrJRD+vgu5Wylu+JrfeOqJd0BnBo1A3Auehjf552+o6ky7vVvTfctct
	iaQRTXkcIm/3wBGl/MmfLQDrxmdi48vJbYW0oK9XycUMq/iK20L7Dubb4eN0LD9E1Hawvrw2p3v
	txjrdF8fnya3mhtBYN11It/mf6AQsUgph77mWKhcLpJkR804hqHM/ZDPn4t1okx4=
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr176767855ad.50.1772532713416;
        Tue, 03 Mar 2026 02:11:53 -0800 (PST)
X-Received: by 2002:a17:902:d508:b0:2a0:d33d:a8f0 with SMTP id d9443c01a7336-2ae2e4d0a96mr176767545ad.50.1772532712883;
        Tue, 03 Mar 2026 02:11:52 -0800 (PST)
Received: from [10.152.199.53] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739d4d93dsm15372721b3a.3.2026.03.03.02.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Mar 2026 02:11:52 -0800 (PST)
Message-ID: <c8af5ae3-f754-465b-a897-48b0c99367f7@oss.qualcomm.com>
Date: Tue, 3 Mar 2026 15:41:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v4 1/2] wifi: UHR: define DPS/DBE/P-EDCA
 elements and fix size parsing
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260217054731.3667600-1-karthikeyan.kathirvel@oss.qualcomm.com>
 <20260217054731.3667600-2-karthikeyan.kathirvel@oss.qualcomm.com>
 <c71a84fe19a632ccd748d0f1fded1a8b1277e0b1.camel@sipsolutions.net>
 <b2b284785c462961f4801e783e1421c0c9bba398.camel@sipsolutions.net>
Content-Language: en-US
From: Karthikeyan Kathirvel <karthikeyan.kathirvel@oss.qualcomm.com>
In-Reply-To: <b2b284785c462961f4801e783e1421c0c9bba398.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ekjjJjKYSDe4KCsczAo23Xa9muLsd7I0
X-Proofpoint-ORIG-GUID: ekjjJjKYSDe4KCsczAo23Xa9muLsd7I0
X-Authority-Analysis: v=2.4 cv=A75h/qWG c=1 sm=1 tr=0 ts=69a6b3ea cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=UspniTRYGAPcDlIwxWEA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA3NyBTYWx0ZWRfX1MgZDt5VgM+M
 XZm9D/a5VH/FJqVFQqD4KQ8OXlwZ35ZRfcc/700iKRMxKLMcW210cIi2q2wFTSkY20pFSHulRHt
 De7UKpbxFWuj25fcDZwfejKcBZVf+L2Gdehz4ZqLampFyKGG6ZB/VXYcV4f/+KkE40hXRBLvbI/
 NuuvlKBXli8Q1qgiJmcjvJYve8P3++a7/JlafAMlr4h54TG9YZyzf6nqGrnbdDrabeNgoE4Xj+9
 LC+L5LECWT6TJJ0a9Y7vFsxioQSpjWpOkvWsSVb2adopguWvqKuJmXNCWTo8q91iA0nQbqXJ9eZ
 MTM0LOzB6Y6udJwuVNEduGVpu9powWC7GxcYd90ECbViLLbm7WUyEtJO0wVYMLzQZ7ERQGTUglO
 Bu3fO3j5Q2GV969uqAbhL2O4qjaGQYh/R/lwSrSdzTsdlIJr20Ul0OycjRgtRs6cVm+BRzz0trd
 8cSa2a/iwz4yTQBpTjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_021155_492159_F0E002AA 
X-CRM114-Status: GOOD (  11.64  )
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



On 2/24/2026 11:08 PM, Johannes Berg wrote:
> On Tue, 2026-02-24 at 17:42 +0100, Johannes Berg wrote:
>> Oh, another thing
>>
>>> + * @dbe_params:
>>> + *	B0-B2 - DBE Bandwidth field is set to indicate
>>> + *	expanded bandwidth for DBE mode
>>> + *	Value 0 is reserved.
>>> + *	Set to 1 to indicate 40 MHz DBE bandwidth.
>>> + *	Set to 2 to indicate 80 MHz DBE bandwidth.
>>> + *	Set to 3 to indicate 160 MHz DBE bandwidth.
>>> + *	Set to 4 to indicate 320-1 MHz DBE bandwidth.
>>> + *	Set to 5 to indicate 320-2 MHz DBE bandwidth.
>>> + *	Values 6 to 7 are reserved.
>>> + *	B3 - DBE Disabled Subchannel Bitmap Present.
>>
>> Seems we should have an enum for the possible bandwidth values?
> 
> How about this?
> 
> enum ieee80211_uhr_dbe_oper_bw {
>          IEEE80211_UHR_DBE_OPER_BW_40    = 1,
>          IEEE80211_UHR_DBE_OPER_BW_80    = 2,
>          IEEE80211_UHR_DBE_OPER_BW_160   = 3,
>          IEEE80211_UHR_DBE_OPER_BW_320_1 = 4,
>          IEEE80211_UHR_DBE_OPER_BW_32_2  = 5,
> };
> 
> 
> johannes

Sure will add like this.

