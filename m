Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B539C83F1A
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 19:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4uJWuwaN1IaLIIUw7T3J37Yd0Y7a6HEarJ4jcO9Xlzc=; b=16GhU9lp/PPtf1NcV4EZkt8Ztq
	zM8mLsxOZi8gGydlqUCF9pVrOWHMv5hdRLMBDuEhgSRWpI+EHmldx7Sceq4Hu0LtK5q1bgwcXyl+A
	GveOhjLjghnK2lQcokQoUKJF8DGL51tZSn465J79VRTp6hWIxF8EvGcw9iUX2h2mUSPcKd4dUoc40
	hgaNXIqIpaf82sohw9lliQvb0Q6thIHzwlWCkfhdfU8xbO7Z/tGCSRUggQDxLnho+4/9daGeCIQdZ
	5pU0nNpBVolJ8YMU7ss9FvdZ+S/LOSF3MQUunf+QNEs1rKQwE6k0Z1lD/M3qAXoxp5LgMeEiTj9Rs
	PQc+vkoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucUKZ-0000000B1HN-3VUw;
	Thu, 17 Jul 2025 19:31:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucU7B-0000000AzFs-2iJH
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 19:18:00 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCNN94032408
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:17:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4uJWuwaN1IaLIIUw7T3J37Yd0Y7a6HEarJ4jcO9Xlzc=; b=ncTU2kJtFotGJ31t
	kIzgJxpFWEtb91eY4Clx6TQvDu3GnMXNgk7EMwkq72rr6bcnXN6zb+tvi7h1aqdn
	osT4KEGV5HlueyDEnv6CnNqzvMmPGJhaWjcfAw3AYcc9OtHOPKrib6Y6/4hxgM/i
	fjLKO9ao22uEcybVtLyh61ynhdJTJS9XpSBmqNwLBvyn4HwCPWZDr/3mqs3ztk8z
	0+k0eBHJG2ZXcro7/zwrhJgqYxSteqYdFjWfeCxCA3kODS9WvwHTyYOXmgRXJMfP
	bnEVsirTShFjeU01QqvTNX06F57dhY4C55BJBq1++ZaTlL5CTg3+QJemK/PBwb6M
	sLpfbw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug3893dh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 19:17:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2363bb41664so10418295ad.0
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 12:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752779874; x=1753384674;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uJWuwaN1IaLIIUw7T3J37Yd0Y7a6HEarJ4jcO9Xlzc=;
        b=VnMIff5zjrRDZRbCK4GOazZbu2ecCW/+ELiu3YcwyWDOnBrxRCBq0SH4tlhsctHBu1
         HotvA3iMg6OlG+5Ridc1mUCN1F377qp0XDDoeuWWMMoZwUNI2Tcx+8rTlTSCpvTTp4Kb
         2/Qc+xu48VRbglat4CNy0Hioinpfovgg4C4K6CD/2z2wqp1QI/pHiIiBXvNiOc1j8cwz
         kXkIudAxzEDWQ2csyxVSsDjFwKLuI2K3RUk02nORoOA9Q5L0oux5WHxG1+XOwz5YXykp
         nnXbH3ykuY4/YvBiph8I5+Alk1znjyagIG2QKpm/PEF1HQaPOwGeXI/la5xMrcPuO5Ns
         s6ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5vWMTG1ZO9fvlxi7CNKBb53fxLOrWvvTw0He//piVIw82RN3oJHcfccqRHj82CslL41rbqGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmUKAudmi5cP3LWeyz/MCYRauQQKGayikGKGo1cn6ekX5vMZDO
	L2MAr0MiHHuD++V/HYxTRQZEaIH6H8qZo1J0HRVKsv4k2HcDPjTuYotkN1Dsehi6JN1NHUGRcwD
	PoXoqjAH32w1hzQ4SaRq74BxQgE2T1ibJguTNKnEpyVgk3BY28gxg/sWmCbAhpqyCDWca6kJg
X-Gm-Gg: ASbGnctyAufDo1+5CafApWGZMvJSaUDNHhara+QdBGca7rOx9Ncd1hOEmtzVH4+IFbK
	qKHbdEB9VhevVu12487FwmSuwlEQ7EwfpXtffazqYbM/HAlDGustzi0nvThb5xYq/4rvLZbnRY1
	vwY8jXTknAgmjT+B6z2d94y0yfcWmWJMVNMMdIcfCmlBJYhtOQl8Hm56kEuNdahv8TARgmPnrUA
	ElCejwyn3iUwhCxjfJtTFbopNi6oyHeQ2mRDSePOO1ClqU1DulM5U3+NJY5P3I/w8fq0q/F8ant
	fjdJ+Vpvxmu0SacipEiFFkjZ7h+80E+6n9+n7qZFpwiO4RCBg2wwyp/NWFGACUrhsLBqvXmEI66
	AFzibh+Z4186F6Cd4lYsr/CDMZK7TiuYC
X-Received: by 2002:a17:903:278c:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23e2f6da4c2mr48772885ad.11.1752779873585;
        Thu, 17 Jul 2025 12:17:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuNoQczB5IQKlU6siCZe1+Zz9I6QEdOCpCVaugCs+MMAIeAdOa80iqgQseH1oB3KYUChXTiA==
X-Received: by 2002:a17:903:278c:b0:215:b1e3:c051 with SMTP id d9443c01a7336-23e2f6da4c2mr48772565ad.11.1752779873060;
        Thu, 17 Jul 2025 12:17:53 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b60e9c0sm184525ad.55.2025.07.17.12.17.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 12:17:52 -0700 (PDT)
Message-ID: <047cc072-ed79-48cb-8869-fe72a5d7703c@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 12:17:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: WCN7850: DFS broken since 176f3009ae598d0523b2
To: Mihai Moldovan <ionic@ionic.de>, ath12k@lists.infradead.org
References: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <485f4924-3bed-41eb-8ca1-5d1ccb615ce3@ionic.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE3MSBTYWx0ZWRfXx19YXbs6pRc4
 NXVO0mnTNDKT/odRahoad5XMaJMVmrKyAdIdPsqJ1TGY6g2ConavRbHwZN8LNBq5xmJNdVu3Ab+
 muQel35aZbgBbBB8r/ZeIXzfalQDOAYIIMvQ6HxDbLvBxPB3R4yf9yHBJ4Onbc1P9UUuX6z1YN6
 KQwA4HltxOsiWt3Omkonwq4A3Ej+EKwo066bck5gyUgkTlKnpyx0G0ttnEaDuNvtuG1kSLGcosL
 XtMmlyFH+MqbPBc5C0dlA1BwGPiZkVSbnbS6P6uX8kXE/lzrGO/B3lb4RWH7Pyda7P3DlEI5HiS
 UjHAFJ22Op2IWzFnROXnwGfOvHYz1UvEsIWH0idJVPNlrJtzV//e/OiOJnHCopzgVeUQKUdRT9L
 mnLhlwRhEDwrLT/lEsmWNQs8unmII689+SOWAN3ZYjNdE4EFdspQLLN5Ry1OgZIdcxGWkimY
X-Proofpoint-GUID: __zVrn5nxMdQafqwQXcaHuJ90b6wBMFK
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68794c63 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8
 a=VwQbUJbxAAAA:8 a=NcPmVzIFaDIWLVLsTNUA:9 a=QEXdDO2ut3YA:10 a=eNH5niYpQkIA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: __zVrn5nxMdQafqwQXcaHuJ90b6wBMFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_121757_805786_7A882C12 
X-CRM114-Status: GOOD (  18.25  )
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

On 7/17/2025 12:05 PM, Mihai Moldovan wrote:
> Hi
> 
> 
> In 176f3009ae598d0523b267db319fe16f69577231[0], radar detect widths were removed 
> for single pdev devices, fully disabling DFS on WCN7850.
> 
> I do understand that running DFS on two channels simultaneously is (currently?) 
> not supported, but this effectively breaks operations on all DFS channels, even 
> though only one is being used.
> 
> 
> I've tried re-enabling the radar detect widths, but that only lead to an 
> ieee80211 subsystem error (which I haven't further debugged) and made the card 
> unusable because booting it up failed, which required a full power shutdown of 
> the machine to reset it from this broken state (literally disconnecting power 
> physically for a few moments).
> 
> Setting num_different_channels to 1 for single pdev devices and re-enabling the 
> radar detect widths works to re-enable DFS, but naturally that disables MLO.
> 
> I'm probably fine with not having MLO capabilities (at least currently), but 
> having to modify the source code to get DFS support back certainly isn't ideal.
> 
> Are there any plans to fix DFS support for single pdev devices?
> 
> 
> Mihai
> 
> [0] 
> https://patch.msgid.link/20250409-ath12k-wcn7850-mlo-support-v2-9-3801132ca2c3@quicinc.com

Can you please open a ticket in Bugzilla so this can be tracked?

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/bugreport.html

