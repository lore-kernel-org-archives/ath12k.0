Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6584C021B2
	for <ath12k@archiver.kernel.org>; Thu, 20 Feb 2025 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0AoN9J0kuIuOV/ZPo1+2Be8EtAGksOa0fida19aIYeo=; b=dRZvZ7qMpRz/7w5KKhNWJYRSbi
	5G1/aEqq5i0JyoD7BXdNQs2PqEz1nvnjnUKmHyI/jDfOekOtIEi6vgfRZUHmugc9myhQghk6Om/9p
	cDqJwq7NhSLeLdUM/MT4yqDdiVcSSMEn8eqRAmjjOkQGL5aS1Yj2lI5n4qxLkKp3HGAzbqOPA3+gq
	1XSj4CQQmQEHruZeIn7tsys2Kacwjy+XLqIIIZ83smZJlpqGJkU4bo6Bo2mPwQbyrxnONmbYTFK9T
	WdnWlepPdGGnxUT5rP8Ei47SmECTxPfFfc6SXEhQKzKol6zSqfRBPCGaBJI1TyIr/Kt/uGc2PnA3r
	KO6Z9Pzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCNL-00000002dnm-2EY1
	for ath12k@archiver.kernel.org;
	Thu, 20 Feb 2025 19:38:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlCNJ-00000002dn1-2gUj
	for ath12k@lists.infradead.org;
	Thu, 20 Feb 2025 19:38:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51KJK7Ke017365
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 19:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0AoN9J0kuIuOV/ZPo1+2Be8EtAGksOa0fida19aIYeo=; b=kbHcZnTxhLq0z03x
	yyL8cJIVZiT9As/VrlEZrOTYBT5rjChkzNqNz88Hb8FvNgBUPdeu6kOhBwX/Sg42
	E5f/XzYY7y2XBCi/MHAllvcheQSAl1HL8/nCx7ZaIT52rHlvmK9bQRT/85DtQD5n
	6mF9HEdDtt9Znc1GMoNN1xi/6FSGhNKOG5LKNob6wRrnqiGuto/lcSRRlq6El6u4
	8f8P5rNUxWIKJenxEPnB5ao60U8Tn3T+QaNjfj/FtbYmLsmep/yCdR6V+zpKCOo6
	cFIlERDKsFoyxVJwsmp1dw4aqNtC4RJV9PvJt0WfKt+uefea7mmMbUgxbM52hobz
	Pq7k8A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3f8xc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 19:38:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fc1a70935fso2812716a91.1
        for <ath12k@lists.infradead.org>; Thu, 20 Feb 2025 11:38:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740080298; x=1740685098;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AoN9J0kuIuOV/ZPo1+2Be8EtAGksOa0fida19aIYeo=;
        b=Ped45SY/ZgsktPZOSa0FtIzhhZNHo+IhEHvRmclqU9I8wimb14ElJefSrriA2kOjO7
         d6U5yMo17LCDhWJa/GLgLEHqutyvwz6fI1fBDIMflXsyjVMtRgo2dSxzSUA7puk7k7GR
         2o98ZZNLwau2Ll3n30LURe6Y9BkNLO9e+nAhEFXGapz7fV93K5mPqNB1Eqp2xA2st8io
         kuH4cU3EFM5H0t3IdbcigirByB9prjabJjxAPhRdcIqogtrNG4lk75Z7tE8qgyaT5WME
         Lugscf6+VUuAgOFOwKk+w/NufJjzaGYm5tmA1jhFxAxdun2Z4ov54SdnF5NVSj0OLVu/
         shWw==
X-Forwarded-Encrypted: i=1; AJvYcCVLwboVNPCScCa0d0ekFNvc56JxNlV6eAcHScwNU7yq7hDx2VQ96gmxN14522UF98FpUiBmFWY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbQacHxhIOv+zHoc65Zc9fHxPrtepfsGU5UeXMuPlpVvciqP25
	tIMc6UU7A+CvPKx2RWxjm762CgLsnTfzPNjAAgIR7gNNbinud47LpcJ+HE3DElT0WIBJ6TFjIUe
	DlTeKwh/wCjW9xrUM/UMzmlEnOoOczMSNQKFRknTGoOG6x/hoOGA9EW1AYumHGjUWdsgH
X-Gm-Gg: ASbGnctYvQHzqJqPqj9cYjyWHoh3NeAxzFt0RTnKNcOinoVTDzw9kRRk7ugTaWhCGQc
	/y/3vwHSjGJ3ayD6W7qdEiO5UBXlq9+F0UJtMMxF2s56ropKtosNBN0GdQ9FgY4kst1CBUQazP0
	2vs5YLxuU8yLBs7R8FVZZRSVWzuVp5R+V+w3SoI/USEVaJ4GC6jrcDOfoUVhfB0jk/AGihC0vTb
	5ZG18H2SzuTfeTsnMaTyVmZuGDxA9WZe7bgFvDH3CTDauvK5TL+/0jCJqqWoxtJ2qq57Apdo/Ly
	G1XKYsCKP63PnBJnCFP0kxbpE9n6CI+pqptu6+opig==
X-Received: by 2002:a05:6a00:21cb:b0:730:9752:d034 with SMTP id d2e1a72fcca58-73426c8dc32mr181857b3a.1.1740080296897;
        Thu, 20 Feb 2025 11:38:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZm2Yu7G5eVKjrzJZWgkNOaHv76I2dubfx+gNozinPzrqpaGLN5qXhYqaV0mZ+TfLWhdDO1w==
X-Received: by 2002:a05:6a00:21cb:b0:730:9752:d034 with SMTP id d2e1a72fcca58-73426c8dc32mr181822b3a.1.1740080296420;
        Thu, 20 Feb 2025 11:38:16 -0800 (PST)
Received: from [10.81.24.74] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325ce41326sm11600669b3a.93.2025.02.20.11.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 11:38:16 -0800 (PST)
Message-ID: <9130e3da-1cc5-43ea-9153-47117d57caca@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 11:38:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rcu 1/9] rcu: Add lockdep_assert_in_rcu_read_lock() and
 friends
To: "Paul E. McKenney" <paulmck@kernel.org>, rcu@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@meta.com, rostedt@goodmis.org,
        Jens Axboe <axboe@kernel.dk>, ath12k@lists.infradead.org
References: <657595c8-e86c-4594-a5b1-3c64a8275607@paulmck-laptop>
 <20240604222355.2370768-1-paulmck@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20240604222355.2370768-1-paulmck@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Q2MRcCC5qispVbOUdBpV21P326S4YqyV
X-Proofpoint-GUID: Q2MRcCC5qispVbOUdBpV21P326S4YqyV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_08,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502200132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_113821_808568_D9108211 
X-CRM114-Status: GOOD (  13.97  )
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

On 6/4/24 15:23, Paul E. McKenney wrote:
> There is no direct RCU counterpart to lockdep_assert_irqs_disabled()
> and friends.  Although it is possible to construct them, it would
> be more convenient to have the following lockdep assertions:
> 
> lockdep_assert_in_rcu_read_lock()
> lockdep_assert_in_rcu_read_lock_bh()
> lockdep_assert_in_rcu_read_lock_sched()
> lockdep_assert_in_rcu_reader()
> 
> This commit therefore creates them.

I'm looking at some downstream code that is trying to become
upstream compliant, and currently that code uses:

	RCU_LOCKDEP_WARN(!rcu_read_lock_held(), "some message");

It seems like this would be a good use of one of these helper
functions, but I'm shocked to see that no upstream code is using
them yet.

Is there a reason to not use these helpers?

/jeff

