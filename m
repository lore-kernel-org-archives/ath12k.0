Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAF6C021B3
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 18:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMFEkd+cYZgRaPOdXQcI2vNcH06Vl6UBqI6ZYLo77XY=; b=4cFwH+8JCAm7alRXTR/T2PihLF
	/wr5/3DwyaBuvGkV09ONHCGKOYmHkVdXDIj9KtyTv6VRcHmsYBExTLcF3OwPUUtQMSIyt0N+alwJs
	i0P6Kis0VWWlgyHGAKBj63wTBQ0rzmtgAXI9U4hek8mBrhbyr6Fp2g/26c1qPFS1MQD1Vsk8K0nSq
	HOny77k/DPg+xO5doNh/PeFYnAJCtZlKBioS2b1C2A5UBIVI+NUAlLbnqTlFzZ7yi+mKSrxX9Ullz
	dHfKrpCLezluF3nmkicyXU2xfSBuQERYBzEEdDqmEoRH/C9qAnfU4Fr6yWVcN3sypDAWvobeYeSrh
	Q6FJQGvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXpH-00000006XiZ-3X7G
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 18:32:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlXkW-00000006X0M-2ZHc
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 18:27:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LDmP82012182
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 18:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iMFEkd+cYZgRaPOdXQcI2vNcH06Vl6UBqI6ZYLo77XY=; b=ZeFuqcCfbbPp0Eqs
	NkIqI+sGw2oE+7C63K/dv75c7WCowb5QaYEQQqWJe5h6G8NBw5z95Pv/kS6k6bzU
	caRHWD3M0Frhj+9YZAw3TfDB5RxWx0gcRA81RZpnm610Z4oh3M2fOp1DtS0sWuEm
	OraFullDrB9clQpkkb4dWv0a3kpnePUy6VZuHBFnyqkAgBFcoICzB27b5hZ76O3s
	ByQagzvCfR3mpOFveNqxqX8R7BFKz2vqZQA2+iTsfFOaP8S6UK7k6sRrXMX2eCDW
	qPbRDULE7ql4yWtx7Q3/yCVE0sxspjMksJAp6e1tEIxsIAU1I9V5ATarsbhTyLHH
	lghusg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy1tye5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 18:27:44 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-220bf94cb40so35297615ad.0
        for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 10:27:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740162463; x=1740767263;
        h=content-transfer-encoding:in-reply-to:cc:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iMFEkd+cYZgRaPOdXQcI2vNcH06Vl6UBqI6ZYLo77XY=;
        b=dArHU8C+fECASJ1T3FNUkhJ8F318yms/377kxaI27SLG3cG6BGaAxScIqOMyoLFFok
         6Rl+lyVPVZgOL8qR6nJ6/lNrBpvH2x3/Ydz+OBl/55Kd3X0VwBxaneIfS+lFB1lonzPB
         /T+yAhvug/c+qp6QCfUQmrFaI75uxkbDbkH/OZlt4V4/619SwlKqIOtrswV77gOTFmWf
         s+i/v27qPxlzJ4GG5ojAU8gOk8YMZsuzmQHVhUtusUzmbJhTYuAQ+d4HPby7jlJSnHyM
         G/BJD6n6ApW9cqnigZsx9pfF4rleaYtYZmjM8fstjntWNn83cDE9NAF2WC/jD5BV2NwB
         nFdw==
X-Gm-Message-State: AOJu0YyxubYM8x2AhQStLG9Esl3G/y5E0egiCfLVEiLNI2Q/Te45K7Aa
	0EsbPwphPChaj/YdZR6KNDyeX+zwlyWDXI/aRrsu/X/LXFv7ET1sJF1EwGtUE3gBwMGuunq+OuP
	w1JegXMi0W9OyEGBkyFUvFA3iNTipWa3Rw1y1oLeixPedPTeBPrcYeu4U1fcj
X-Gm-Gg: ASbGnctyvEETmxPatpM1VyUglEmlnIeULNgWopRq+51Vk+N37iwZwJ+HQFnViJt4TKp
	4x9YYMDdnWyZiF0lK26I268LoJYolA9w0aYzSutRdqfRYpu/6bJzoNfuOdrX6zNuwDZrL7ub6Lo
	FdfMEBfT6SBxluW8ICXGpmcJaydkTeJKUawnsO7UsjbBWkxkasypseM1hm8w2QNxkW7ynYg7OJE
	pPG/vvNx5bidU2kWJ5AkWyYrL0OkQ+Vly3ehLoFB10Z0rGzZTYWB/cRl1013J+sLYb6DUF+oMWU
	F/71+33jrEMoxHMLpN2AoUuqM1OK9gKqvFaA7kP0Y655bx4dClWPFnMVZsapqWh3o0W8vgJiK32
	MQwR2SSOA
X-Received: by 2002:a17:902:d50b:b0:220:fe24:7910 with SMTP id d9443c01a7336-2219ff4e74emr71196475ad.15.1740162463061;
        Fri, 21 Feb 2025 10:27:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHqT0lhdlf9xUs5u4H9+hR1MDcGNjhy1drF8rRGCFmhOjcsTVDF/mRwDk9hIOl4FkKbEbM5zg==
X-Received: by 2002:a17:902:d50b:b0:220:fe24:7910 with SMTP id d9443c01a7336-2219ff4e74emr71196075ad.15.1740162462656;
        Fri, 21 Feb 2025 10:27:42 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d537ca99sm139294875ad.106.2025.02.21.10.27.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 10:27:42 -0800 (PST)
Message-ID: <7c7498fd-ede6-407b-b583-e9b8caf56bda@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:27:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: please use tree tags in patches
To: Johannes Berg <johannes@sipsolutions.net>, linux-wireless@vger.kernel.org
References: <ec3a3d891acfe5ed8763271a1df4151d75daf25f.camel@sipsolutions.net>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
Cc: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <ec3a3d891acfe5ed8763271a1df4151d75daf25f.camel@sipsolutions.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: aSPob8AtGhR9uMvGpHpGZZJU938I1ZJ5
X-Proofpoint-ORIG-GUID: aSPob8AtGhR9uMvGpHpGZZJU938I1ZJ5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 clxscore=1015
 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 suspectscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_102744_674639_2060778B 
X-CRM114-Status: GOOD (  19.11  )
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

On 2/21/2025 4:17 AM, Johannes Berg wrote:
> Hi,
> 
> I couldn't (yet?) figure out how to make the nipa bot stuff run
> properly, so please start using
> 
>   [PATCH wireless] wifi: xyz
> 
> or
> 
>   [PATCH wireless-next] wifi: xyz
> 
> for the subject line. This way the automation can pick it up, see e.g.
> 
> https://patchwork.kernel.org/project/linux-wireless/list/?series=936374
> 
> I'll need to fix some username stuff etc.
> 
> I likely also need to add more trees to it - please reply with your
> subject tags, trees and branches to use, e.g.
> 
> wireless: main
> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git/
> 
> wireless-next: main
> https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-next.git/
> 
> but perhaps we want to have
> 
> rtw-next: rtw-next
> https://github.com/pkshih/rtw
> 
> or so? Not sure if you maintain a fixes branch there too?
> 
> 
> Anyway, good luck to me, and please don't try to attack it ;-) I spent
> all day setting it up, and haven't pulled out everything yet.

First of all, thank you for adding any automation which improves the lives of
the maintainers. Aditya has been working on that for the ath.git tree as well.

ath.git contains both ath-current and ath-next branches in the same tree:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath-current
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/log/?h=ath-next

So we can use:
	[PATCH ath] for current (this branch gets little use)
	[PATCH ath-next] for next
if that helps your automation.

And for Qualcomm contributions we've been asking the developers to always
supply a base: hash to also denote the basis of a patchset.

/jeff

