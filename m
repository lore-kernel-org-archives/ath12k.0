Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61F67C021B2
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K7rfm+etXdnbK/bhupbhOu+OTfhMZMjRNpbnrpPFumo=; b=Z8ly3ejyQtaL5CNU3kueEd//vs
	eq7n2G1lR825cAq5Lmt2JNhaFvpW7m1GNXnlujXetGN8cEbQomoxZUMl4UmIkToEBjBm3DZX4C9iR
	UmNFvA+ZSB+GfEJ9FbI0vdW7DXj5z934f0r613BFjJoJR67sfWzSyU6r64YMktvf7RdjgmEtGR8BL
	S3YKDrRuskG81H1DbgalURZ06dkP//eb1JC9dx/bUm6PG2YVwjdqN7N4UUqvCyTpuR+Mbm7XTfMmW
	wsFCuXNdQSqA45UiheocXwre0zKaCyvDqJX0fJ3+m7jAoC51J3al5XGr2ezrVQBx/r/6v/UUJBQRO
	5ibOIP6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGKi-00000003PNM-0bqp
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 23:51:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlGKf-00000003PME-2tAo
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 23:51:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KMWbCW011928
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 23:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7rfm+etXdnbK/bhupbhOu+OTfhMZMjRNpbnrpPFumo=; b=F9TzKXttQBcvVdpA
	4mqLXqt9q62BpW0D8bH/BkUCb06gQnnqs8r+FbdAUaSGPYZ10oFqdHoLlCp/aqqA
	khIkbz13slmNuKyjzaU1yM4+YlddOBXv5MpZzZVDNhWjaJuh6T5ydC++gtNxkUVn
	kTdQYlyRxEJ4KkL2WdOdno4LDiWx11+khimC9rxAQAMw1UEr7w3uSyxt8LCubts8
	uI1hBMLMKidDWA+foCOHjmKTgo2jLo2l0ek1Mntee3ucb5HKIYjwhVK15K9uKYZP
	ea5T1Kll2QOLXVC2gYFkfV92Sqr1+DeSSjjgCzE7MboIq/iixtlDOZ2RLLm/f09p
	zwtHtw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44x2xb9yp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 23:51:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2fce2954a10so1894278a91.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 15:51:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740095512; x=1740700312;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7rfm+etXdnbK/bhupbhOu+OTfhMZMjRNpbnrpPFumo=;
        b=LBbpbbo3MnqJo/59tbCFxD049pVJl9iuH7jaEwbEF9PgcF+b8A5gOxQjMwYU2LoIjM
         cJyq9809RxiXd7u4S2d36vqN2oe25teySYJC0k1tOc08U6S/aNDRsZ7JfMwV1G34TDxH
         /7SCKBhcS4b9GcJsHCSaxlgw0sup3F+6xp7l3aUkvPaVtF/WeWxFFIhivAwRTQa7sZ8c
         vFmKY6D+y5UHyWrG9FyW1FT7tYTMMgi+XpqNGeqLEF4sYwoJrKgR3n4KPzJTK+YeaBSQ
         MtzqUL8NE4MFVh+9LSw9BdnTVN4KT224M8i/uWnnj6/r/PntRz4iwVf49FQ4Rf9DHsp1
         14ig==
X-Forwarded-Encrypted: i=1; AJvYcCXob6PofDDsAKqTdj9yrY5gv4xTsa2akZeO97yoC1iEJ+X6ONoNpcMShv2CqQ8tfPRl7Fgdcik=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuZTUC8FYS5XAY7zAGqgJ6m2LEIxXsoKXQYNdMC0Ovjj05BpJG
	i8Eo7yvkXx9BeAa6rSQ2EizHbypJnLrGUzr/pOABcjsAKfbQsI2XPLB2yAJUKZ0+sc0KjUJPHYw
	hssoTa9bJsxGi/3Q5czZfbWa/rnEosThS1AA5PArWjdBkdig/VZ+vKWAqHWW/
X-Gm-Gg: ASbGnct5XkdGC5p/ecfykYdAK6E4+hTgtjo9N/VNRn1rpX0pc16lqJN3N3pFTJPuj/7
	417MhTLjy7xhN7jWwUr4Y9YXzfsqih4obiIFrpTHy3yC8r6LXPTeNK+af+pgAA7/W9IgR2vFl7f
	5lLHpLisERjGvrCehdIVMrtv1VSZZBrviX4IakrlHOBsHC2hicJ3gPpn/+EX3NskVN2fthilLNq
	ho+lZkzudfoZi4Lllb7dHTMTM10tBkb3czohyIccaCI6YJzkXVN30J5W7PhpcxrCs+QSeHuurNt
	VDrJcoQRV8z3UctYLZrnzOBfnC6Fw5is5hwdp9mzmFpCvnvQlhf/gLQf8ZSHohROnjaaaBvRHw=
	=
X-Received: by 2002:a17:90b:2e44:b0:2ea:77d9:6345 with SMTP id 98e67ed59e1d1-2fce87244f6mr885575a91.22.1740095511998;
        Thu, 20 Feb 2025 15:51:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHeRN2ESFgXnPd9OtGenw5lXipvYA29oO/tOIysMPDxjxWiyqAI15+Vg9TfM3kmmfB3zBrreQ==
X-Received: by 2002:a17:90b:2e44:b0:2ea:77d9:6345 with SMTP id 98e67ed59e1d1-2fce87244f6mr885554a91.22.1740095511638;
        Thu, 20 Feb 2025 15:51:51 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fcb8571586sm2111645a91.0.2025.02.20.15.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 15:51:51 -0800 (PST)
Message-ID: <ea5341a5-a5c6-4214-96c3-32d668ce3f11@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:51:50 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rcu 1/9] rcu: Add lockdep_assert_in_rcu_read_lock() and
 friends
To: paulmck@kernel.org
Cc: rcu@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
        rostedt@goodmis.org, Jens Axboe <axboe@kernel.dk>,
        ath12k@lists.infradead.org
References: <657595c8-e86c-4594-a5b1-3c64a8275607@paulmck-laptop>
 <20240604222355.2370768-1-paulmck@kernel.org>
 <9130e3da-1cc5-43ea-9153-47117d57caca@oss.qualcomm.com>
 <67063387-6ba9-47fe-b283-d6346da15d9a@paulmck-laptop>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <67063387-6ba9-47fe-b283-d6346da15d9a@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5EHOWBuORHnEN6ctIA-7eUCav8A9e4m2
X-Proofpoint-ORIG-GUID: 5EHOWBuORHnEN6ctIA-7eUCav8A9e4m2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxlogscore=957 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_155153_750516_762F43ED 
X-CRM114-Status: GOOD (  15.06  )
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

On 2/20/2025 2:04 PM, Paul E. McKenney wrote:
> On Thu, Feb 20, 2025 at 11:38:14AM -0800, Jeff Johnson wrote:
>> On 6/4/24 15:23, Paul E. McKenney wrote:
>>> There is no direct RCU counterpart to lockdep_assert_irqs_disabled()
>>> and friends.  Although it is possible to construct them, it would
>>> be more convenient to have the following lockdep assertions:
>>>
>>> lockdep_assert_in_rcu_read_lock()
>>> lockdep_assert_in_rcu_read_lock_bh()
>>> lockdep_assert_in_rcu_read_lock_sched()
>>> lockdep_assert_in_rcu_reader()
>>>
>>> This commit therefore creates them.
>>
>> I'm looking at some downstream code that is trying to become
>> upstream compliant, and currently that code uses:
>>
>> 	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "some message");
>>
>> It seems like this would be a good use of one of these helper
>> functions, but I'm shocked to see that no upstream code is using
>> them yet.
>>
>> Is there a reason to not use these helpers?
> 
> In cases where there is no additional useful information that can be
> placed in "some message", the new helpers should be just fine.

Thanks for the confirmation, Paul!

/jeff

